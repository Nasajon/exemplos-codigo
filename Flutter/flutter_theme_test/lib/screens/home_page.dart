import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../themes/theme_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final themeSwitch = ThemeController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Test'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Switch(
              activeColor: Color.fromARGB(255, 255, 205, 0),
              inactiveThumbColor: Color.fromARGB(255, 0, 69, 155),
              dragStartBehavior: DragStartBehavior.start,
              value: themeSwitch.isAnaTheme,
              onChanged: (value) {
                themeSwitch.switchTheme();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            'Teste Tabela',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                          height: 50,
                          width: 100,
                          padding: EdgeInsets.fromLTRB(0, 16.0, 0, 16.0),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: [
                              DataColumn(label: Text('Nome')),
                              DataColumn(label: Text('Email')),
                              DataColumn(label: Text('Equipe')),
                            ],
                            rows: [
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
                              DataRow(cells: [
                                DataCell(Text('David')),
                                DataCell(Text('davidalmeida@nasajon.com.br')),
                                DataCell(Text('Materiais')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Carlos')),
                                DataCell(
                                    Text('carlosbenevides@nasajon.com.br')),
                                DataCell(Text('Materiais')),
                              ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              leading: CircleAvatar(child: Icon(Icons.person)),
                              title: Text('Matheus Mariano'),
                              subtitle: Text('Arquitetura'),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              leading: CircleAvatar(child: Icon(Icons.person)),
                              title: Text('Sérgio Silva'),
                              subtitle: Text('Arquitetura'),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              leading: CircleAvatar(child: Icon(Icons.person)),
                              title: Text('Wallace Pinho'),
                              subtitle: Text('Arquitetura'),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              leading: CircleAvatar(child: Icon(Icons.person)),
                              title: Text('David Almeida'),
                              subtitle: Text('Materiais'),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              leading: CircleAvatar(child: Icon(Icons.person)),
                              title: Text('Carlos Benevides'),
                              subtitle: Text('Materiais'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
