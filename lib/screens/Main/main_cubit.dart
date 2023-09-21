import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/models/manufacturer.dart';
import 'package:test_app/screens/Main/main_state.dart';
import 'package:dio/dio.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState(isLoading: true));

  final Dio dio = Dio();

  final String apiUrl =
      "https://vpic.nhtsa.dot.gov/api/vehicles/GetAllManufacturers?format=json";

  Future<void> fetchManufaturers() async {
    final stableState = state;
    try {
      emit(state.copyWith(isLoading: true));
      final response = await dio.get(apiUrl);
      final List<Manufacturer> data =
          (response.data['Results'] as List<dynamic>)
              .map((item) => Manufacturer.fromJson(item))
              .toList();
      emit(state.copyWith(data: data));
      emit(state.copyWith(isLoading: false));
    } catch (error) {
      emit(state.copyWith(error: error.toString()));
      emit(stableState.copyWith(isLoading: false));
    }
  }
}
