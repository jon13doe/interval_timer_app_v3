import 'package:flutter/material.dart';

import 'custom_dialog.dart';

class MenuRow extends StatelessWidget {
  final String title;
  final List<String> listElements;

  const MenuRow({
    super.key,
    required this.title,
    required this.listElements,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.8 * kToolbarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          SizedBox(
            width: 0.2 * MediaQuery.of(context).size.width,
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialog(
                      title: title,
                      listElements: listElements,
                    );
                  },
                );
              },
              child: const Text('Beep'),
            ),
          ),
        ],
      ),
    );
  }
}
