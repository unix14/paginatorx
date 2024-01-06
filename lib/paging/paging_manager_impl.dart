import 'package:paginatorx/algorithms/addition_paginator.dart';
import 'package:paginatorx/algorithms/sectioned_paginator.dart';
import 'package:paginatorx/paging/paging_manager.dart';

enum PagingAlgorithmType {
  /// Brings each time different section of the list, in size of pageSize
  Sections,
  /// Brings the additional data to the list, so it can be used as a vertical scroll pagination. in size of pageSize * (currentPage + 1)
  Additive
}

class PagingManagerImpl extends PagingManager with SectionedPaginator, AdditionPaginator {

  @override
  List data = [];

  @override
  int pageSize;

  @override
  int currentPage;

  PagingAlgorithmType algorithmType;

  PagingManagerImpl({
    /// The data we want to paginate
    this.data,
    /// Default page size for each page
    this.pageSize = 10,
    /// Can be used as an initial page
    this.currentPage = 0,
    /// The algorithm to show different types of paginated results.
    this.algorithmType = PagingAlgorithmType.Sections
  }): super(data: data, pageSize: pageSize, currentPage: currentPage);

  @override
  List loadPage({int pageIndex = 0}) {
    var paginatedList = [];
    switch(algorithmType) {
      case PagingAlgorithmType.Sections: {
        paginatedList = getSection(data, pageIndex, pageSize);
        break;
      }
      case PagingAlgorithmType.Additive: {
        paginatedList = getAddition(data, pageIndex, pageSize);
        break;
      }
    }
    currentPage = pageIndex;
    return paginatedList;
  }
}