import 'package:componentes_de_para/components/list_item.dart';
import 'package:componentes_de_para/inputs/employees.dart';
import 'package:componentes_de_para/inputs/employees_labels.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownMenuListTile extends StatelessWidget {
  const DropdownMenuListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dropValue = ValueNotifier({});
    final dropOptions = employees;

    return ValueListenableBuilder(
      valueListenable: dropValue,
      builder: (BuildContext context, Map<dynamic, dynamic> value, _) {
        return Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: DropdownButtonFormField2<dynamic>(
                buttonHeight: 90,
                itemHeight: 100,
                offset: const Offset(0, -20),
                decoration: InputDecoration(
                  label: Text('Colaborador'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                isExpanded: true,
                value: (value.isEmpty) ? null : value,
                onChanged: (choice) => dropValue.value = choice,
                items: dropOptions
                    .map((op) => DropdownMenuItem(
                          value: op,
                          child: NsjListItem(
                            labels: employeesLabels,
                            rows: op,
                            title: 'nome',
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
