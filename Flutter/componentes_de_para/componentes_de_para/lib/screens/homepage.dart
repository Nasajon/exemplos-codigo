import 'package:componentes_de_para/components/data_table.dart';
import 'package:componentes_de_para/components/dropdown_menu_listTile.dart';
import 'package:componentes_de_para/components/dropdown_menu_string.dart';
import 'package:componentes_de_para/components/list.dart';
import 'package:componentes_de_para/inputs/employees.dart';
import 'package:componentes_de_para/inputs/employees_labels.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownMenuListTile(),
            DropdownMenuString(),
            NsjDataTable(),
            NsjList(
              list: employees,
              title: 'nome',
              labels: employeesLabels,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
