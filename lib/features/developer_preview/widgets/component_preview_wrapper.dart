import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

/// ComponentPreviewWrapper provides controls to test components in different configurations.
class ComponentPreviewWrapper extends StatefulWidget {
  const ComponentPreviewWrapper({
    super.key,
    required this.component,
    required this.name,
  });

  final Widget component;
  final String name;

  @override
  State<ComponentPreviewWrapper> createState() => _ComponentPreviewWrapperState();
}

class _ComponentPreviewWrapperState extends State<ComponentPreviewWrapper> {
  bool _isDarkMode = false;
  double _textScale = 1.0;
  bool _isTablet = false;
  bool _isRTL = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Preview: ${widget.name}'),
          actions: [
            IconButton(
              icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: () => setState(() => _isDarkMode = !_isDarkMode),
              tooltip: 'Toggle Theme',
            ),
          ],
        ),
        body: Column(
          children: [
            _buildControls(),
            const Divider(),
            Expanded(
              child: Center(
                child: Directionality(
                  textDirection: _isRTL ? TextDirection.rtl : TextDirection.ltr,
                  child: MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaler: TextScaler.linear(_textScale),
                    ),
                    child: _buildDeviceFrame(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControls() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          FilterChip(
            label: const Text('Tablet'),
            selected: _isTablet,
            onSelected: (v) => setState(() => _isTablet = v),
          ),
          const SizedBox(width: 8),
          FilterChip(
            label: const Text('RTL'),
            selected: _isRTL,
            onSelected: (v) => setState(() => _isRTL = v),
          ),
          const SizedBox(width: 16),
          const Text('Text Scale:'),
          Slider(
            value: _textScale,
            min: 0.5,
            max: 2.0,
            onChanged: (v) => setState(() => _textScale = v),
          ),
          Text(_textScale.toStringAsFixed(1)),
        ],
      ),
    );
  }

  Widget _buildDeviceFrame() {
    final size = _isTablet ? const Size(768, 1024) : const Size(375, 812);
    
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: widget.component,
    );
  }
}
