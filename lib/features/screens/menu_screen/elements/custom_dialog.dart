import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final List<String> listElements;

  const CustomDialog({
    super.key,
    required this.title,
    required this.listElements,
  });

  @override
  Widget build(BuildContext context) {
    bool selectedValue = false;

    return Dialog(
      insetPadding: const EdgeInsets.all(50),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        childCount: listElements.length, (context, index) {
                      return Container(
                        color: Colors.blue[50],
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              listElements[index],
                            ),
                            Radio(
                              value: 1,
                              groupValue: selectedValue,
                              onChanged: (value) {
                                selectedValue = !selectedValue;
                              },
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Try'),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
