import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../design_system/design_system.dart';

/// UIService provides methods for showing common UI elements like SnackBars and Dialogs.
class UIService {
  UIService(this._ref);
  final Ref _ref;

  /// Shows a SnackBar.
  void showSnackBar({
    required BuildContext context,
    required String message,
    SnackBarType type = SnackBarType.info,
  }) {
    final color = _getSnackBarColor(type);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SoteriaRadius.s),
        ),
      ),
    );
  }

  Color _getSnackBarColor(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return SoteriaColors.success;
      case SnackBarType.error:
        return SoteriaColors.error;
      case SnackBarType.warning:
        return SoteriaColors.warning;
      case SnackBarType.info:
        return SoteriaColors.primaryLight;
    }
  }

  /// Shows a confirmation dialog.
  Future<bool?> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String message,
    String confirmLabel = 'Confirm',
    String cancelLabel = 'Cancel',
    bool isDangerous = false,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancelLabel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: isDangerous
                ? ElevatedButton.styleFrom(
                    backgroundColor: SoteriaColors.error,
                    foregroundColor: Colors.white,
                  )
                : null,
            child: Text(confirmLabel),
          ),
        ],
      ),
    );
  }

  /// Shows a global loading overlay.
  void showLoadingOverlay(BuildContext context) {
    _ref.read(loadingOverlayProvider.notifier).toggle(true);
  }

  /// Hides the global loading overlay.
  void hideLoadingOverlay() {
    _ref.read(loadingOverlayProvider.notifier).toggle(false);
  }
}

/// Defines the visual types for [SnackBar].
enum SnackBarType { success, error, warning, info }

/// Provider for the [UIService].
final uiServiceProvider = Provider<UIService>((ref) {
  return UIService(ref);
});

/// State provider to control the global loading overlay.
final loadingOverlayProvider = NotifierProvider<LoadingOverlayNotifier, bool>(
  LoadingOverlayNotifier.new,
);

class LoadingOverlayNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void toggle(bool value) => state = value;
}
