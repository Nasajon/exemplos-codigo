import 'package:componentes_de_para/components/list_item_row.dart';
import 'package:flutter/material.dart';

class NsjList extends StatelessWidget {
  NsjList(
      {Key? key,
      required this.list,
      required this.title,
      required this.labels,
      required this.onTap})
      : super(key: key);

  final String title;
  final List<Map<String, dynamic>> list;
  final Map<String, String> labels;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (BuildContext context, index) {
          final Map<String, dynamic> rows = list.elementAt(index);
          final String copyTitle = setTitle(title, rows);
          final Map<String, dynamic> copyRows =
              removeTitle(title, Map.of(list.elementAt(index)));
          final Map<String, dynamic> copyLabels =
              removeTitle(title, Map.of(labels));

          return SizedBox(
            child: ListTile(
              hoverColor: Color.fromARGB(255, 241, 246, 253),
              onTap: onTap,
              leading: CircleAvatar(
                child: ClipRRect(
                  child: Text(rows.values.elementAt(0).substring(0, 1)),
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
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
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
