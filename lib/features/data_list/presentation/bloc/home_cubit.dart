import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:palm_task/core/utils/use_cases/use_case.dart';
import 'package:palm_task/features/data_list/domain/entities/data_entity.dart';
import 'package:palm_task/features/data_list/domain/use_cases/data_list_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final DataListUseCase dataListUseCase;

  HomeCubit(this.dataListUseCase) : super(HomeInitial());

  void getDataList() async {
    emit(HomeLoading());
    final response = await dataListUseCase(NoParams());
    response.fold(
      (l) {
        emit(HomeError(l.message ?? ''));
      },
      (r) {
        emit(HomeDataLoaded(dataList: r));
      },
    );
  }
}
