import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/screens/Detail/detail_screen.dart';
import 'package:test_app/screens/Main/main_cubit.dart';
import 'package:test_app/screens/Main/main_state.dart';
import 'package:test_app/widgets/manufacturer_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final screenCubit = MainCubit();

  @override
  void initState() {
    screenCubit.fetchManufaturers();
    super.initState();
  }

  Function onSelectItem =
      (BuildContext context, String makeName, String commonName) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              DetailScreen(makeName: makeName, commonName: commonName)),
    );
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocConsumer<MainCubit, MainState>(
          bloc: screenCubit,
          listener: (BuildContext context, MainState state) {
            if (state.error != null) {
              const Center(child: Text('Error'));
            }
          },
          builder: (BuildContext context, MainState state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return listItem(state, onSelectItem);
          },
        ),
      ),
    );
  }
}
