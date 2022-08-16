import 'package:flutter/material.dart';

class NsjListItemRow extends StatelessWidget {
  NsjListItemRow({
    Key? key,
    required this.itemTitle,
    required this.itemContent,
  }) : super(key: key);

  final String itemTitle;
  final String itemContent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(children: [
        Text(
          itemTitle,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Color.fromARGB(153, 0, 0, 0)),
        ),
        Text(":"),
        Text(" "),
        Expanded(
          child: Text(
            itemContent,
            style: TextStyle(color: Color.fromARGB(153, 0, 0, 0)),
          ),
        )
      ]),
    );
  }
}
