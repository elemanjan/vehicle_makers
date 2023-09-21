import 'package:test_app/screens/Main/main_state.dart';
import 'package:flutter/material.dart';

Widget listItem(MainState state, Function onPress) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: state.data?.length,
      itemBuilder: (BuildContext context, int index) {
        final item = state.data?[index];
        return InkWell(
          onTap: () => onPress(context, item!.name, item.commonName),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(item?.id.toString() ?? '')],
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item?.name ?? '', overflow: TextOverflow.ellipsis),
                      Text(item?.country ?? '',
                          style: const TextStyle(
                            color: Colors.black54,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
