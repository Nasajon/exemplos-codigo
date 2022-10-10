import 'package:clean_dart_github_search/app/search/domain/entities/result.dart';
import 'package:clean_dart_github_search/app/search/domain/errors/erros.dart';
import 'package:clean_dart_github_search/app/search/presenter/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'search_bloc.dart';
import 'states/search_state.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ModularState<SearchPage, SearchBloc> {
  Widget _buildList(List<Result> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, index) {
        var item = list.elementAt(index);
        return Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(item, list),
                    ),
                  );
                },
                trailing: Icon(Icons.chevron_right),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(item.imagem),
                ),
                title: Text(item.nome),
                subtitle: Text('${item.cargo}\n${item.setor}'),
              ),
              Divider(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildError(Failure error) {
    if (error is EmptyList) {
      return Center(
        child: Text('Nada encontrado'),
      );
    } else if (error is ErrorSearch) {
      return Center(
        child: Text('Erro no github'),
      );
    } else {
      return Center(
        child: Text('Erro interno'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Image.asset('../images/ana_logo.png'),
        backgroundColor: Color.fromARGB(255, 38, 92, 192),
        onPressed: () {},
      ),
      appBar: AppBar(
        leadingWidth: 24,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Busca de colaboradores",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 800,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 32, right: 16, left: 16, bottom: 32),
                child: TextField(
                  onChanged: controller.add,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 38, 20, 132),
                    ),
                    border: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                    ),
                    hintText: "Pesquisar por nome ou palavra chave...",
                  ),
                ),
              ),
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  bloc: controller,
                  builder: (context, snapshot) {
                    SearchState state = controller.state;

                    if (state is ErrorState) {
                      return _buildError(state.error);
                    }

                    if (state is LoadingState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is SuccessState) {
                      return _buildList(state.list);
                    } else {
                      return Container();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
