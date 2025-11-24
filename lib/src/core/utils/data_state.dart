sealed class DataState<T> {
  final T? data;
  final String? error;

  const DataState({this.data, this.error});
}

final class Success<T> extends DataState<T> {
  const Success({required T data}) : super(data: data);
}

final class Failure<T> extends DataState<T> {
  const Failure({required String error}) : super(error: error);
}
