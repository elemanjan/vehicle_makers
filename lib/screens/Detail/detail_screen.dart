import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/screens/Detail/detail_cubit.dart';
import 'package:test_app/screens/Detail/detail_state.dart';
import 'package:test_app/widgets/manufacturer_details.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, this.makeName, this.commonName})
      : super(key: key);

  final String? makeName;
  final String? commonName;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final screenCubit = DetailCubit();

  @override
  void initState() {
    if (widget.makeName != null) {
      screenCubit.fetchMakeModels(widget.commonName ?? 'tesla');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manufacturer detail screen'),
      ),
      body: SafeArea(
        child: BlocConsumer<DetailCubit, DetailState>(
          bloc: screenCubit,
          listener: (BuildContext context, DetailState state) {
            if (state.error != null) {}
          },
          builder: (BuildContext context, DetailState state) {
            if (state.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                children: [
                  Text(
                    widget.makeName ?? '',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Expanded(child: detailItem(state)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
