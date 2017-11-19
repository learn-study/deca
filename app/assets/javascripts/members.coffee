$ ->
  $("#infinity .page").infinitescroll
    loading: {
      img: ""
      msgText: "@@@@@@@@@@@@@@"
      finishedMsg: ""
    }
    animate: true
    navSelector: "nav.pagination"
    nextSelector: "nav.pagination a[rel=next]"
    itemSelector: "tr.member"
