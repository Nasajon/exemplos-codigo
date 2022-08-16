import 'package:flutter/material.dart';
import 'list_item_row.dart';

class NsjListItem extends StatefulWidget {
  NsjListItem(
      {Key? key,
      required this.rows,
      required this.title,
      required this.labels,
      this.onTap})
      : super(key: key);

  final String title;
  final Map<String, dynamic> rows;
  final Map<String, String> labels;
  VoidCallback? onTap;

  @override
  State<NsjListItem> createState() => _NsjListItemState();
}

class _NsjListItemState extends State<NsjListItem> {
  @override
  Widget build(BuildContext context) {
    String copyTitle = setTitle(widget.title, widget.rows);
    final Map<String, dynamic> copyRows =
        removeTitle(widget.title, Map.of(widget.rows));
    final Map<String, dynamic> copyLabels =
        removeTitle(widget.title, Map.of(widget.labels));

    return SizedBox(
      child: ListTile(
        hoverColor: const Color.fromARGB(255, 241, 246, 253),
        onTap: widget.onTap,
        leading: CircleAvatar(
          child: ClipRRect(
            child: Text(widget.rows.values.elementAt(0).substring(0, 1)),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
          child: Text(
            copyTitle,
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 75, 75, 75),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: ListView.builder(
          shrinkWrap: true,
          itemCount: setItemContentLength(copyRows),
          itemBuilder: (BuildContext context, int index) {
            final String keys = copyLabels.values.elementAt(index);
            final String values = copyRows.values.elementAt(index);
            return NsjListItemRow(
              itemTitle: keys,
              itemContent: values,
            );
          },
        ),
      ),
    );
  }

  setItemContentLength(Map<String, dynamic> map) =>
      map.length < 3 ? map.length : 3;

  setTitle(String key, Map<String, dynamic> map) {
    for (final title in map.entries) {
      if (title.key.contains(key)) return title.value;
    }
  }

  removeTitle(String key, Map<String, dynamic> map) {
    if (map.keys.contains(key)) {
      map.remove(key);
      return map;
    }
  }
}
