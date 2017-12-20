$ ->
  $("#members .page").infiniteScroll
    loading: {
      img:     "http://www.mytreedb.com/uploads/mytreedb/loader/ajax_loader_blue_48.gif"
      msgText: "ロード中..."
    }
    path: "ul.pagination a[rel=next]"
    append: "tr.member"
    history: false

