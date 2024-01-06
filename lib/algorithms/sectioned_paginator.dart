

mixin SectionedPaginator {

  List<dynamic> getSection(List data, int pageIndex, int pageSize) {
    var startIndex = pageIndex * pageSize;
    var endIndex = startIndex + pageSize;
    var paginatedList = data.getRange(startIndex, endIndex);
    return paginatedList;
  }


}