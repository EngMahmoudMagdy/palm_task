part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}

final class HomeDataLoaded extends HomeState {
  final List<DataEntity> dataList;

  HomeDataLoaded({required this.dataList});
}
