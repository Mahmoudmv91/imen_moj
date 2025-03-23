abstract class DataState {}

class DataSuccess<T> extends DataState {
  T? data;

  DataSuccess({
    required this.data,
  });
}

class DataFailed extends DataState {
  String? errorMessage;

  DataFailed({
    this.errorMessage,
  });
}
