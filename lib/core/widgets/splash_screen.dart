import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../design_system/design_system.dart';
import '../constants/app_constants.dart';
import 'animations/soteria_glow.dart';
import 'animations/soteria_staggered_fade.dart';

/// A premium, animated splash screen that establishes the Soteria brand identity.
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Staggered Animations
  late Animation<double> _bgOpacity;
  late Animation<double> _logoScale;
  late Animation<double> _nameOpacity;
  late Animation<double> _taglineOpacity;
  late Animation<double> _versionOpacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
    );

    _setupAnimationTimeline();
    
    // Set system status bar to transparent for the immersive feel
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));

    _controller.forward();
  }

  void _setupAnimationTimeline() {
    // 0.0s - 0.8s: Background fades in
    _bgOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.2, curve: Curves.easeIn),
      ),
    );

    // 0.5s - 1.5s: Logo scale and entry
    _logoScale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.14, 0.42, curve: SoteriaAnimations.bounce),
      ),
    );

    // 2.3s - 3.0s: App Name fades upward
    _nameOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.65, 0.85, curve: Curves.easeOut),
      ),
    );

    // 2.8s - 3.5s: Tagline appears
    _taglineOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.8, 1.0, curve: Curves.easeOut),
      ),
    );

    // 3.0s - 3.5s: Version appears at the bottom
    _versionOpacity = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.85, 1.0, curve: Curves.easeIn),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? SoteriaColors.backgroundDark : SoteriaColors.backgroundLight,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
        child: FadeTransition(
          opacity: _bgOpacity,
          child: Stack(
            children: [
              // Subtle background decoration (optional)
              _buildBackgroundDecoration(theme),
              
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Animated Logo
                    ScaleTransition(
                      scale: _logoScale,
                      child: SoteriaGlow(
                        enabled: _controller.value > 0.5,
                        color: theme.primaryColor,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: theme.primaryColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: theme.primaryColor.withValues(alpha: 0.2),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.shield_outlined,
                            size: 64,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: SoteriaSpacing.s40),
                    
                    // App Name
                    SoteriaStaggeredFade(
                      animation: _nameOpacity,
                      child: Text(
                        AppConstants.appName.toUpperCase(),
                        style: theme.textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 8.0,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: SoteriaSpacing.s12),
                    
                    // Tagline
                    SoteriaStaggeredFade(
                      animation: _taglineOpacity,
                      offset: 10,
                      child: Text(
                        'MASTER THE ARENA, SCHOLAR',
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Version at the bottom
              Positioned(
                bottom: SoteriaSpacing.s40,
                left: 0,
                right: 0,
                child: FadeTransition(
                  opacity: _versionOpacity,
                  child: Center(
                    child: Text(
                      'v${AppConstants.appVersion}',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundDecoration(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1.5,
          colors: [
            theme.primaryColor.withValues(alpha: 0.05),
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}
