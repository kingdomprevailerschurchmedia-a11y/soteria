import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'deep_link_controller.g.dart';

@Riverpod(keepAlive: true)
class DeepLinkController extends _$DeepLinkController {
  @override
  Uri? build() => null;

  void setPendingLink(Uri uri) {
    state = uri;
  }

  void clearPendingLink() {
    state = null;
  }
}
