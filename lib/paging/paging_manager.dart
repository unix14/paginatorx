

abstract class PagingManager {

  List data;

  int pageSize;

  int currentPage;

  PagingManager({
    /// The data we want to paginate
    this.data,
    /// Default page size for each page
    this.pageSize = 10,
    /// Can be used as an initial page
    this.currentPage = 0
  });

  List<dynamic> loadPage({int pageIndex = 0});

  List<dynamic> loadPrevPage() {
    var nextPage = currentPage;
    if(nextPage > 0) {
      nextPage = (nextPage - 1);
    }
    if(nextPage < 0) {
      return [];
    }
    return loadPage(pageIndex: nextPage);
  }

  List<dynamic> loadNextPage() {
    var nextPage = currentPage;
    if(nextPage > 0) {
      nextPage = (nextPage + 1);
    }
    if(nextPage >= data.length) {
      return [];
    }
    return loadPage(pageIndex: nextPage);
  }

}