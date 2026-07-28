import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/design_system.dart';
import '../../application/preview_settings_notifier.dart';

/// A wrapper that provides real-time controls to test components in different environments.
class PreviewWrapper extends ConsumerWidget {
  const PreviewWrapper({
    super.key,
    required this.child,
    required this.title,
  });

  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(previewSettingsProvider);
    final notifier = ref.read(previewSettingsProvider.notifier);

    return Theme(
      data: settings.isDarkMode ? SoteriaTheme.dark : SoteriaTheme.light,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
              icon: Icon(settings.isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: notifier.toggleDarkMode,
              tooltip: 'Toggle Theme',
            ),
          ],
        ),
        body: Column(
          children: [
            _buildToolbar(context, settings, notifier),
            const Divider(height: 1),
            Expanded(
              child: Container(
                color: settings.isDarkMode ? Colors.black26 : Colors.grey.shade100,
                child: Center(
                  child: _buildDeviceFrame(context, settings),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolbar(
    BuildContext context, 
    PreviewSettings settings, 
    PreviewSettingsNotifier notifier
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: SoteriaSpacing.s16, 
        vertical: SoteriaSpacing.s8
      ),
      child: Row(
        children: [
          _buildDeviceDropdown(settings, notifier),
          const SizedBox(width: SoteriaSpacing.s16),
          _ToolbarAction(
            label: 'Landscape',
            isSelected: settings.isLandscape,
            onTap: notifier.toggleOrientation,
            icon: Icons.screen_rotation,
          ),
          const SizedBox(width: SoteriaSpacing.s8),
          _ToolbarAction(
            label: 'RTL',
            isSelected: settings.isRTL,
            onTap: notifier.toggleRTL,
            icon: Icons.format_textdirection_r_to_l,
          ),
          const SizedBox(width: SoteriaSpacing.s16),
          const Text('Text:'),
          Slider(
            value: settings.textScale,
            min: 0.5,
            max: 2.0,
            onChanged: notifier.setTextScale,
          ),
          Text('${settings.textScale.toStringAsFixed(1)}x'),
        ],
      ),
    );
  }

  Widget _buildDeviceDropdown(PreviewSettings settings, PreviewSettingsNotifier notifier) {
    return DropdownButton<PreviewDevice>(
      value: settings.device,
      onChanged: (v) => v != null ? notifier.setDevice(v) : null,
      items: PreviewDevice.values.map((d) {
        return DropdownMenuItem(value: d, child: Text(d.label));
      }).toList(),
    );
  }

  Widget _buildDeviceFrame(BuildContext context, PreviewSettings settings) {
    Size size = settings.device.size;
    if (settings.isLandscape) {
      size = Size(size.height, size.width);
    }

    return AnimatedContainer(
      duration: SoteriaAnimations.medium,
      curve: SoteriaAnimations.standard,
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(SoteriaRadius.m),
        boxShadow: SoteriaShadows.high,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(SoteriaRadius.m),
        child: Directionality(
          textDirection: settings.isRTL ? TextDirection.rtl : TextDirection.ltr,
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              size: size,
              textScaler: TextScaler.linear(settings.textScale),
              platformBrightness: settings.isDarkMode ? Brightness.dark : Brightness.light,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class _ToolbarAction extends StatelessWidget {
  const _ToolbarAction({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.icon,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      avatar: Icon(icon, size: 16),
      selected: isSelected,
      onSelected: (_) => onTap(),
    );
  }
}
