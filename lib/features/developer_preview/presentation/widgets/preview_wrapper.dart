import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/design_system.dart';
import '../../application/preview_settings_notifier.dart';
import '../../application/screenshot_service.dart';

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
      data: SoteriaTheme.dark,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
              icon: const Icon(Icons.camera_alt_outlined),
              onPressed: () => ScreenshotService().captureAndSave(context, title.replaceAll(' ', '_')),
              tooltip: 'Export Screenshot',
            ),
            IconButton(
              icon: Icon(settings.showInspector ? Icons.inspect_mirror : Icons.architecture_rounded),
              onPressed: notifier.toggleInspector,
              tooltip: 'Toggle Design Inspector',
            ),
          ],
        ),
        body: Column(
          children: [
            _buildToolbar(context, settings, notifier),
            const Divider(height: 1),
            if (settings.showInspector) _buildInspectorControls(context, settings, notifier),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    color: Colors.black26,
                    child: Center(
                      child: RepaintBoundary(
                        key: ScreenshotService.boundaryKey,
                        child: _buildDeviceFrame(context, settings),
                      ),
                    ),
                  ),
                  if (settings.showInspector) _buildFloatingInspectorInfo(context, settings),
                ],
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
          const SizedBox(width: SoteriaSpacing.s8),
          _ToolbarAction(
            label: 'Bounds',
            isSelected: settings.showLayoutBounds,
            onTap: notifier.toggleLayoutBounds,
            icon: Icons.grid_3x3,
          ),
          const SizedBox(width: SoteriaSpacing.s8),
          _ToolbarAction(
            label: 'Semantics',
            isSelected: settings.showSemantics,
            onTap: notifier.toggleSemantics,
            icon: Icons.accessibility_new,
          ),
          const SizedBox(width: SoteriaSpacing.s16),
          const Text('Text:'),
          Slider(
            value: settings.textScale,
            min: 1.0,
            max: 2.0,
            divisions: 10,
            onChanged: notifier.setTextScale,
          ),
          Text('${(settings.textScale * 100).toInt()}%'),
        ],
      ),
    );
  }

  Widget _buildInspectorControls(
    BuildContext context,
    PreviewSettings settings,
    PreviewSettingsNotifier notifier
  ) {
    return Container(
      padding: const EdgeInsets.all(SoteriaSpacing.s16),
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(flex: 1, child: Text('Radius Scale')),
              Expanded(
                flex: 3,
                child: Slider(
                  value: settings.borderRadiusScale,
                  min: 0.0,
                  max: 2.0,
                  onChanged: notifier.setBorderRadiusScale,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Expanded(flex: 1, child: Text('Spacing Scale')),
              Expanded(
                flex: 3,
                child: Slider(
                  value: settings.spacingScale,
                  min: 0.5,
                  max: 2.0,
                  onChanged: notifier.setSpacingScale,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingInspectorInfo(BuildContext context, PreviewSettings settings) {
    return Positioned(
      bottom: 16,
      right: 16,
      child: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Inspector Info', style: TextStyle(fontWeight: FontWeight.bold)),
              const Divider(),
              Text('Tokens: SoteriaRadius.m * ${settings.borderRadiusScale.toStringAsFixed(1)}'),
              Text('Spacing: SoteriaSpacing.s16 * ${settings.spacingScale.toStringAsFixed(1)}'),
            ],
          ),
        ),
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

    Widget content = child;

    if (settings.showSemantics) {
      content = ShowSemanticsDebugger(child: content);
    }

    if (settings.showLayoutBounds) {
      content = debugPaintSizeEnabled
        ? content
        : _LayoutBoundsOverlay(child: content);
    }

    return AnimatedContainer(
      duration: SoteriaAnimations.medium,
      curve: SoteriaAnimations.standard,
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: SoteriaColors.backgroundDark,
        borderRadius: BorderRadius.circular(SoteriaRadius.m),
        boxShadow: SoteriaShadows.high,
        border: Border.all(color: Colors.white10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(SoteriaRadius.m),
        child: Directionality(
          textDirection: settings.isRTL ? TextDirection.rtl : TextDirection.ltr,
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              size: size,
              textScaler: TextScaler.linear(settings.textScale),
              platformBrightness: Brightness.dark,
              accessibleNavigation: settings.showSemantics,
            ),
            child: content,
          ),
        ),
      ),
    );
  }
}

class _LayoutBoundsOverlay extends StatelessWidget {
  const _LayoutBoundsOverlay({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // In a real implementation, we would use a CustomPainter or similar
    // to draw bounds, but for this preview we'll wrap with a simple border
    // as a placeholder for the requested debug feature.
    return Stack(
      children: [
        child,
        IgnorePointer(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue.withOpacity(0.5), width: 1),
            ),
          ),
        ),
      ],
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
      avatar: Icon(icon, size: 16, color: isSelected ? Colors.white : null),
      selected: isSelected,
      onSelected: (_) => onTap(),
    );
  }
}
