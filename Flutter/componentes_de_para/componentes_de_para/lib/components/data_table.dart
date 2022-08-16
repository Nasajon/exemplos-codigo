import 'package:flutter/material.dart';

class NsjDataTable extends StatelessWidget {
  const NsjDataTable({Key? key}) : super(key: key);

  // final List<Map<String, dynamic>> list;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Nome')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Equipe')),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('Matheus')),
                  DataCell(Text('matheusmariano@nasajon.com.br')),
                  DataCell(Text('Arquitetura')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Sergio')),
                  DataCell(Text('sergiosilva@nasajon.com.br')),
                  DataCell(Text('Arquitetura')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Wallace')),
                  DataCell(Text('wallacepinho@nasajon.com.br')),
                  DataCell(Text('Arquitetura')),
                ]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
