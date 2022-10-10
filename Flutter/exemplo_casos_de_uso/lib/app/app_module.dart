import 'package:clean_dart_github_search/app/search/external/mock/mock_search_datasource.dart';
import 'package:clean_dart_github_search/app/search/presenter/search_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:clean_dart_github_search/app/app_widget.dart';

import 'search/domain/usecases/search_by_text.dart';

import 'search/infra/repositories/search_repository_impl.dart';
import 'search/presenter/search_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        $SearchByTextImpl,
        $SearchRepositoryImpl,
        $MockitoSearchDatasource,
        $SearchBloc,
        Bind((i) => Dio()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => SearchPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
