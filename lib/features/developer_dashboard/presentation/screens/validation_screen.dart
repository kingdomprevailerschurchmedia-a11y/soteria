import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/navigation/soteria_scaffold.dart';
import '../../../../core/utils/quality/quality_checker.dart';

class ValidationDashboardScreen extends StatelessWidget {
  const ValidationDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final violations = QualityChecker.violations;

    return SoteriaScaffold(
      appBar: AppBar(
        title: const Text('Quality Validation'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep_outlined),
            onPressed: QualityChecker.clear,
            tooltip: 'Clear Violations',
          ),
        ],
      ),
      body: violations.isEmpty
          ? _buildPerfectState(context)
          : ListView.separated(
              padding: const EdgeInsets.all(SoteriaSpacing.s16),
              itemCount: violations.length,
              separatorBuilder: (context, index) => const SizedBox(height: SoteriaSpacing.s8),
              itemBuilder: (context, index) {
                return Card(
                  color: SoteriaColors.error.withValues(alpha: 0.05),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: SoteriaColors.error, width: 0.5),
                    borderRadius: BorderRadius.circular(SoteriaRadius.m),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.warning_amber_rounded, color: SoteriaColors.error),
                    title: Text(
                      violations[index],
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
    );
  }

  Widget _buildPerfectState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.check_circle_outline_rounded, size: 80, color: Colors.green),
          const SizedBox(height: 24),
          Text(
            'NO VIOLATIONS',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const Text(
            'The Foundation is secure and compliant.',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
