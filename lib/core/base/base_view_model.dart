import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseViewModel extends StateNotifier<AsyncValue<void>> {
  BaseViewModel() : super(const AsyncValue.data(null));

  void setLoading() {
    state = const AsyncValue.loading();
  }

  void setSuccess() {
    state = const AsyncValue.data(null);
  }

  void setError(Object error, StackTrace stackTrace) {
    state = AsyncValue.error(error, stackTrace);
  }

  Future<void> executeAsync(Future<void> Function() operation) async {
    try {
      setLoading();
      await operation();
      setSuccess();
    } catch (error, stackTrace) {
      setError(error, stackTrace);
    }
  }
}
