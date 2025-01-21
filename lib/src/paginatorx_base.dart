// TODO: Put public facing types in this file.

import 'package:paginatorx/data/stub_data.dart';
import 'package:paginatorx/paging/paging_manager.dart';
import 'package:paginatorx/paging/paging_manager_impl.dart';

class PaginatorxBase {

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

    // bring data into the widget




    print('end');
  }



}
