import 'package:test_app/screens/Detail/detail_state.dart';
import 'package:flutter/material.dart';

Widget detailItem(DetailState state) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: state.makeModels?.length,
      itemBuilder: (BuildContext context, int index) {
        final item = state.makeModels?[index];
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(item?.name ?? ''),
          ),
        );
      });
}
