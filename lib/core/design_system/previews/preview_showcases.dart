import 'package:flutter/material.dart';
import '../design_system.dart';
import '../backgrounds/soteria_background.dart';

/// Showcase for all Background Presets (Section 2).
class BackgroundShowcase extends StatefulWidget {
  const BackgroundShowcase({super.key});

  @override
  State<BackgroundShowcase> createState() => _BackgroundShowcaseState();
}

class _BackgroundShowcaseState extends State<BackgroundShowcase> {
  SoteriaBackgroundType _selectedType = SoteriaBackgroundType.defaultType;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Full-screen render of the background
        SoteriaBackground(type: _selectedType),

        // Control Overlay
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(SoteriaSpacing.s16),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(SoteriaRadius.l)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'BACKGROUND PRESETS',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: SoteriaSpacing.s16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: SoteriaBackgroundType.values.map((type) {
                    final isSelected = _selectedType == type;
                    return ChoiceChip(
                      label: Text(type.name.toUpperCase()),
                      selected: isSelected,
                      onSelected: (v) => v ? setState(() => _selectedType = type) : null,
                    );
                  }).toList(),
                ),
                const SizedBox(height: SoteriaSpacing.s16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Showcase for Ambient Lighting (Section 3).
class AmbientLightingShowcase extends StatefulWidget {
  const AmbientLightingShowcase({super.key});

  @override
  State<AmbientLightingShowcase> createState() => _AmbientLightingShowcaseState();
}

class _AmbientLightingShowcaseState extends State<AmbientLightingShowcase> {
  double _opacity = 0.5;
  double _blur = 80.0;
  Color _color = SoteriaColors.primary;
  Alignment _position = Alignment.topRight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: SoteriaColors.backgroundDark),

        // Live Preview of Glow
        AnimatedAlign(
          duration: const Duration(milliseconds: 500),
          alignment: _position,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _color.withOpacity(_opacity),
              boxShadow: [
                BoxShadow(
                  color: _color.withOpacity(_opacity),
                  blurRadius: _blur,
                  spreadRadius: _blur / 2,
                ),
              ],
            ),
          ),
        ),

        // Controls
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(SoteriaSpacing.s16),
            color: Colors.black.withOpacity(0.8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildSlider('Opacity', _opacity, (v) => setState(() => _opacity = v)),
                _buildSlider('Blur Radius', _blur, (v) => setState(() => _blur = v), min: 10, max: 200),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _colorButton('Purple', SoteriaColors.xpPurple),
                    _colorButton('Indigo', Colors.indigo),
                    _colorButton('Gold', SoteriaColors.coinGold),
                  ],
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [
                    _posButton('Top Left', Alignment.topLeft),
                    _posButton('Top Right', Alignment.topRight),
                    _posButton('Center', Alignment.center),
                    _posButton('Bottom Left', Alignment.bottomLeft),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSlider(String label, double value, ValueChanged<double> onChanged, {double min = 0, double max = 1}) {
    return Row(
      children: [
        SizedBox(width: 100, child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 12))),
        Expanded(child: Slider(value: value, min: min, max: max, onChanged: onChanged)),
      ],
    );
  }

  Widget _colorButton(String label, Color color) {
    return GestureDetector(
      onTap: () => setState(() => _color = color),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: color.withOpacity(0.3),
          border: Border.all(color: _color == color ? Colors.white : Colors.transparent),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 10)),
      ),
    );
  }

  Widget _posButton(String label, Alignment pos) {
    return OutlinedButton(
      onPressed: () => setState(() => _position = pos),
      style: OutlinedButton.styleFrom(
        foregroundColor: _position == pos ? Colors.white : Colors.grey,
        side: BorderSide(color: _position == pos ? Colors.white : Colors.grey),
      ),
      child: Text(label, style: const TextStyle(fontSize: 10)),
    );
  }
}
