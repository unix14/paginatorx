

mixin AdditionPaginator {

  List<dynamic>? getAddition(List data, int pageIndex, int pageSize) {
    var startIndex = 0;
    var endIndex = startIndex + pageSize;
    var paginatedList = data.getRange(startIndex, endIndex);
    return paginatedList.toList();
  }


}