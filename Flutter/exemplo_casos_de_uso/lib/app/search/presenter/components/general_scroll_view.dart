import 'dart:math';

import 'package:anchor_scroll_controller/anchor_scroll_controller.dart';
import 'package:clean_dart_github_search/app/search/domain/entities/result.dart';
import 'package:clean_dart_github_search/app/search/presenter/components/card_data.dart';
import 'package:flutter/material.dart';

class GeneralScrollViewWidget extends StatefulWidget {
  const GeneralScrollViewWidget(this.item, this.list);
  final Result item;
  final List<Result> list;

  @override
  State<StatefulWidget> createState() {
    return _GeneralScrollViewWidgetState();
  }
}

class _GeneralScrollViewWidgetState extends State<GeneralScrollViewWidget> {
  late final AnchorScrollController _scrollController;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    _scrollController = AnchorScrollController(
      onIndexChanged: (index, userScroll) {
        if (userScroll) {
          _tabController?.animateTo(index);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final int length = 5;
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 32, right: 32),
              controller: _scrollController,
              itemCount: length,
              itemBuilder: (context, index) {
                return AnchorItemWrapper(
                  index: index,
                  controller: _scrollController,
                  child: Container(
                    alignment: Alignment.center,
                    child: CardData('Dados Pessoais', widget.item),
                  ),
                );
              },
            ),
          ),
          Card(
            color: Color.fromARGB(255, 246, 246, 246),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Container(
              width: 300,
              child: RotatedBox(
                quarterTurns: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DefaultTabController(
                    length: length,
                    child: Builder(builder: (context) {
                      _tabController = DefaultTabController.of(context);
                      return TabBar(
                          isScrollable: true,
                          tabs: List.generate(
                              length,
                              (index) => RotatedBox(
                                    quarterTurns: 3,
                                    child: Container(
                                      height: 52,
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          'Dados Pessoais',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                          labelPadding: EdgeInsets.symmetric(horizontal: 5),
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: BoxDecoration(
                            color: Color.fromARGB(255, 229, 236, 245),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          onTap: (index) {
                            _scrollController.scrollToIndex(index: index);
                          });
                    }),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
