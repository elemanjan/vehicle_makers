import 'package:test_app/models/make_models.dart';

class DetailState {
  final bool isLoading;
  final String? error;
  final List<MakeModels>? makeModels;

  const DetailState({this.isLoading = false, this.error, this.makeModels});

  DetailState copyWith(
      {bool? isLoading, String? error, List<MakeModels>? makeModels}) {
    return DetailState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        makeModels: makeModels ?? this.makeModels);
  }
}
