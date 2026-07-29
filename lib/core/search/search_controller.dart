import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'search_state.dart';

part 'search_controller.g.dart';

@Riverpod(keepAlive: true)
class SearchController extends _$SearchController {
  @override
  SearchState build() => const SearchState();

  void updateQuery(String query) {
    state = state.copyWith(query: query, isLoading: query.isNotEmpty);
    // Mock results logic
    if (query.isNotEmpty) {
      Future.delayed(const Duration(milliseconds: 300), () {
        state = state.copyWith(isLoading: false, results: []); // Mock data injection
      });
    }
  }

  void setOverlayVisible(bool visible) {
    state = state.copyWith(isOverlayVisible: visible);
  }
  
  void addToHistory(String query) {
    final history = List<String>.from(state.history)..insert(0, query);
    state = state.copyWith(history: history.take(10).toList());
  }
}
