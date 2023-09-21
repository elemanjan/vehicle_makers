import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/models/make_models.dart';
import 'package:test_app/screens/Detail/detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(DetailState(isLoading: true));

  Future<void> fetchMakeModels(String commonName) async {
    final stableState = state;
    final Dio dio = Dio();
    final apiUrl =
        'https://vpic.nhtsa.dot.gov/api/vehicles/GetModelsForMake/${commonName}?format=json';
    try {
      emit(state.copyWith(isLoading: true));
      final response = await dio.get(apiUrl);
      final List<MakeModels> data = (response.data['Results'] as List<dynamic>)
          .map((item) => MakeModels.fromJson(item))
          .toList();
      emit(state.copyWith(makeModels: data));
      emit(state.copyWith(isLoading: false));
    } catch (error) {
      print('errrrr $error');
      emit(state.copyWith(error: error.toString()));
      emit(stableState.copyWith(isLoading: false));
    }
  }
}
