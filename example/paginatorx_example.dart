import 'package:flutter/material.dart';
import 'package:paginatorx/data/stub_data.dart';
import 'package:paginatorx/paging/paging_manager.dart';
import 'package:paginatorx/paging/paging_manager_impl.dart';

void main() {
  print('start');
  var stubData = StubData.generateData();
  PagingManager pagingManager = PagingManagerImpl(data: stubData,);


  // Initial page loading
  var data = pagingManager.loadPage();

  //on next page clicked
  data = pagingManager.loadNextPage();

  //on prev page clicked
  data = pagingManager.loadPrevPage();

  // bring data into any widget
  Container(
    child: ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(data[index].toString()),
        );
      },
    ),
  );

  print('end');
}
