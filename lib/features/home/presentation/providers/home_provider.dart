import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/models/result.dart';
import '../../domain/entities/home_dashboard.dart';
import '../../domain/repositories/home_repository.dart';
import '../../data/repositories/home_repository_impl.dart';

part 'home_provider.g.dart';

@riverpod
HomeRepository homeRepository(Ref ref) {
  return MockHomeRepository();
}

@riverpod
class HomeState extends _$HomeState {
  @override
  Result<HomeDashboard> build() {
    _fetch();
    return const Loading();
  }

  Future<void> _fetch() async {
    final repo = ref.read(homeRepositoryProvider);
    state = await repo.getDashboardData();
  }

  Future<void> refresh() async {
    state = const Loading();
    await _fetch();
  }
}
