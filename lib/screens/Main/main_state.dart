import 'package:test_app/models/manufacturer.dart';

class MainState {
  final bool isLoading;
  final String? error;
  final List<Manufacturer>? data;

  const MainState({this.isLoading = false, this.error, this.data});

  MainState copyWith(
      {bool? isLoading, String? error, List<Manufacturer>? data}) {
    return MainState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        data: data ?? this.data);
  }
}
