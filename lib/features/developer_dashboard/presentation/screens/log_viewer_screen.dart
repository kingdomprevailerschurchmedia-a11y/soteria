import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/navigation/soteria_scaffold.dart';
import '../../../../core/logging/log_level.dart';
import '../../../../core/logging/logger_provider.dart';
import '../../application/dashboard_providers.dart';

/// A searchable and filterable viewer for internal application logs.
class LogViewerScreen extends ConsumerStatefulWidget {
  const LogViewerScreen({super.key});

  @override
  ConsumerState<LogViewerScreen> createState() => _LogViewerScreenState();
}

class _LogViewerScreenState extends ConsumerState<LogViewerScreen> {
  final _searchController = TextEditingController();
  String _filter = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logs = ref.watch(debugLogsProvider);
    final filteredLogs = logs.where((log) {
      final msg = log.message.toLowerCase();
      final tag = log.tag?.toLowerCase() ?? '';
      final category = log.category?.toLowerCase() ?? '';
      final query = _filter.toLowerCase();
      
      return msg.contains(query) || tag.contains(query) || category.contains(query);
    }).toList().reversed.toList();

    return SoteriaScaffold(
      appBar: AppBar(
        title: const Text('Log Viewer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep_outlined),
            onPressed: () {
              ref.read(loggerProvider).clear();
              setState(() {});
            },
            tooltip: 'Clear Logs',
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Padding(
            padding: const EdgeInsets.all(SoteriaSpacing.s16),
            child: SearchBar(
              controller: _searchController,
              hintText: 'Search message, tag, or category...',
              leading: const Icon(SoteriaIcons.search),
              onChanged: (v) => setState(() => _filter = v),
            ),
          ),
        ),
      ),
      body: filteredLogs.isEmpty
          ? const Center(child: Text('No logs found matching your criteria.'))
          : ListView.separated(
              padding: const EdgeInsets.all(SoteriaSpacing.s16),
              itemCount: filteredLogs.length,
              separatorBuilder: (context, index) => const SizedBox(height: SoteriaSpacing.s8),
              itemBuilder: (context, index) {
                final log = filteredLogs[index];
                final time = DateFormat('HH:mm:ss').format(log.timestamp);

                return Card(
                  margin: EdgeInsets.zero,
                  child: ExpansionTile(
                    dense: true,
                    leading: _buildLevelBadge(log.severity),
                    title: Text(
                      log.message,
                      style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                    ),
                    subtitle: Text(
                      '$time ${log.tag != null ? '[${log.tag}]' : ''}',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.grey),
                    ),
                    children: [
                      if (log.error != null)
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            'Error: ${log.error}',
                            style: const TextStyle(color: SoteriaColors.error, fontSize: 11),
                          ),
                        ),
                      if (log.stackTrace != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            log.stackTrace.toString(),
                            style: const TextStyle(fontFamily: 'monospace', fontSize: 10, color: Colors.grey),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  Widget _buildLevelBadge(LogSeverity severity) {
    Color color;
    switch (severity) {
      case LogSeverity.error:
      case LogSeverity.critical:
        color = SoteriaColors.error;
        break;
      case LogSeverity.warning:
        color = SoteriaColors.warning;
        break;
      case LogSeverity.info:
        color = Colors.green;
        break;
      case LogSeverity.debug:
        color = Colors.blue;
        break;
    }

    return Container(
      width: 4,
      height: 24,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}

// --- Previews ---

@Preview(name: 'Dev - Log Viewer')
Widget logViewerPreview() {
  return const ProviderScope(
    child: MaterialApp(
      home: LogViewerScreen(),
    ),
  );
}
