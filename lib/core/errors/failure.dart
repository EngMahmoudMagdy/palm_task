import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  abstract final int? errorCode;
  abstract final String? message;
}

class ServerFailure extends Failure {
  @override
  final int? errorCode;
  @override
  final String? message;

  ServerFailure({required this.errorCode, required this.message});

  @override
  List<Object?> get props => [errorCode, message];
}
