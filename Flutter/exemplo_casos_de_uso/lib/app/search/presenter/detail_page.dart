import 'package:clean_dart_github_search/app/search/domain/entities/result.dart';

import 'package:clean_dart_github_search/app/search/presenter/components/card_data.dart';
import 'package:clean_dart_github_search/app/search/presenter/components/general_scroll_view.dart';
import 'package:clean_dart_github_search/app/search/presenter/states/search_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen(this.item, this.list);

  final Result item;
  final List<Result> list;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final DadosGeraisKey = GlobalKey();

  final OutrosDadosGEraisKey = GlobalKey();

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Image.asset('../images/ana_logo.png'),
          backgroundColor: Color.fromARGB(255, 38, 92, 192),
        ),
        appBar: AppBar(
          leadingWidth: 24,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.white,
          toolbarHeight: 140,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.attach_file),
              color: Colors.black,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.calendar_today),
                color: Colors.black),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
                color: Colors.black),
          ],
          title: Text(
            'Detalhes do Colaborador',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 16),
                    child: Row(
                      children: [
                        Container(
                          width: 300,
                          padding: EdgeInsets.all(16),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(widget.item.imagem),
                            ),
                            title: Text(widget.item.nome),
                            subtitle: Text(
                                '${widget.item.cargo}\n${widget.item.setor}'),
                          ),
                        ),
                        Container(
                          width: 600,
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Text(
                                        widget.item.feriasdisponiveis
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      'Dias de férias\ndisponíveis',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Text(
                                        widget.item.feriasvencidas.toString(),
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text('Dias de férias\nvencidas',
                                        style: TextStyle(fontSize: 12)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Text(
                                        widget.item.solicitacoespendentes
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text('Solicitações\npendentes',
                                        style: TextStyle(fontSize: 12)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Salário',
                                        style: TextStyle(fontSize: 12)),
                                    Text(
                                        NumberFormat('R\$ #,###,##')
                                            .format(widget.item.salario),
                                        style: TextStyle(fontSize: 14)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Ultima Promoção',
                                        style: TextStyle(fontSize: 12)),
                                    Text(
                                        DateFormat("dd/MM/yyyy").format(
                                            DateTime.tryParse(widget
                                                .item.ultimapromocao
                                                .toString())!),
                                        style: TextStyle(fontSize: 14)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 16),
                      width: 929,
                      alignment: Alignment.center,
                      child: DefaultTabController(
                        length: 5,
                        child: TabBar(
                          indicatorWeight: 0.1,
                          indicatorColor: Colors.white,
                          unselectedLabelColor:
                              Color.fromARGB(175, 62, 92, 188),
                          unselectedLabelStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                          labelColor: Color.fromARGB(255, 62, 92, 188),
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          labelPadding: EdgeInsets.all(2),
                          tabs: [
                            Text(
                              'Resumo',
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Solicitações',
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Ficha Cadastral',
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Registros',
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Contrato',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: GeneralScrollViewWidget(widget.item, widget.list));
  }
}
