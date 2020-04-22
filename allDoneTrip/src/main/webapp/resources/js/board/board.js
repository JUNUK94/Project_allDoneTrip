console.log("Reply Module........");

var replyService = (function () {
  function add(reply, callback, error) {
    console.log("add reply...............");

    $.ajax({
      type: "post",
      url: "/replies/new",
      data: JSON.stringify(reply),
      contentType: "application/json; charset=utf-8",
      success: function (result, status, xhr) {
        if (callback) {
          callback(result);
        }
      },
      error: function (xhr, status, er) {
        if (error) {
          error(er);
        }
      },
    });
  }

  // function getList(param, callback, error) {
  //
  // var bno = param.bno;
  // var page = param.page || 1;
  //
  // $.getJSON("/replies/pages/" + bno + "/" + page + ".json",
  // function(data) {
  // if (callback) {
  // callback(data);
  // }
  // }).fail(function(xhr, status, err) {
  // if (error) {
  // error();
  // }
  // });
  // }

  function getBoardList(param, callback, error) {
    var page = param.page || 1;

    $.getJSON("/community/" + page + ".json", function (data) {
      if (callback) {
        // callback(data); // 댓글 목록만 가져오는 경우
        callback(data.boardCnt, data.list); // 댓글 숫자와 목록을 가져오는 경우
      }
    }).fail(function (xhr, status, err) {
      if (error) {
        error();
      }
    });
  }

  function remove(rno, callback, error) {
    $.ajax({
      type: "delete",
      url: "/replies/" + rno,
      success: function (deleteResult, status, xhr) {
        if (callback) {
          callback(deleteResult);
        }
      },
      error: function (xhr, status, er) {
        if (error) {
          error(er);
        }
      },
    });
  }

  function update(reply, callback, error) {
    console.log("RNO: " + reply.rno);

    $.ajax({
      type: "put",
      url: "/replies/" + reply.rno,
      data: JSON.stringify(reply),
      contentType: "application/json; charset=utf-8",
      success: function (result, status, xhr) {
        if (callback) {
          callback(result);
        }
      },
      error: function (xhr, status, er) {
        if (error) {
          error(er);
        }
      },
    });
  }

  function get(rno, callback, error) {
    $.get("/replies/" + rno + ".json", function (result) {
      if (callback) {
        callback(result);
      }
    }).fail(function (xhr, status, err) {
      if (error) {
        error();
      }
    });
  }

  function displayTime(timeValue) {
    var today = new Date();

    var gap = today.getTime() - timeValue;

    var dateObj = new Date(timeValue);
    var str = "";

    if (gap < 1000 * 60 * 60 * 24) {
      var hh = dateObj.getHours();
      var mi = dateObj.getMinutes();
      var ss = dateObj.getSeconds();

      return [
        (hh > 9 ? "" : "0") + hh,
        ":",
        (mi > 9 ? "" : "0") + mi,
        ":",
        (ss > 9 ? "" : "0") + ss,
      ].join("");
    } else {
      var yy = dateObj.getFullYear();
      var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
      var dd = dateObj.getDate();

      return [
        yy,
        "/",
        (mm > 9 ? "" : "0") + mm,
        "/",
        (dd > 9 ? "" : "0") + dd,
      ].join("");
    }
  }
  return {
    add: add,
    get: get,
    getList: getList,
    remove: remove,
    update: update,
    displayTime: displayTime,
  };
})();

$(document).ready(function () {
  var actionForm = $("#actionForm");
  $(".paginate_button a").on("click", function (e) {
    e.preventDefault();
    console.log("click");
    actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    actionForm.submit();
  });
  $(".move").on("click", function (e) {
    e.preventDefault();
    actionForm.append(
      "<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>"
    );
    actionForm.attr("action", "/community/view");
    actionForm.submit();
  });

  $(".boardListBtn").click(function () {
    let btnNum = $(".boardListBtn").text();
    console.log(btnNum);

    // $.ajax({
    // 	url:
    // })
  });
  let bnoValue = '<c:out value="${board.bno}"/>';
  let boardTB = $(".boardTB");
  showList(1);
  function showList(page) {
    console.log("show list " + page);
    replyService.getList(
      {
        bno: bnoValue,
        page: page || 1,
      },
      function (replyCnt, list) {
        console.log("replyCnt: " + replyCnt);
        console.log("list: " + list);
        console.log(list);
        if (page == -1) {
          pageNum = Math.ceil(replyCnt / 10.0);
          showList(pageNum);
          return;
        }
        var str = "";
        if (list == null || list.length == 0) {
          return;
        }
        for (var i = 0, len = list.length || 0; i < len; i++) {
          str += "<li class='left clearfix' data-rno='" + list[i].rno + "'>";
          str +=
            "  <div><div class='header'><strong class='primary-font'>[" +
            list[i].rno +
            "] " +
            list[i].replyer +
            "</strong>";
          str +=
            "    <small class='pull-right text-muted'>" +
            replyService.displayTime(list[i].replyDate) +
            "</small></div>";
          str += "    <p>" + list[i].reply + "</p></div></li>";
        }
        replyUL.html(str);
        showReplyPage(replyCnt);
      }
    ); //end function
  } //end showList
  var pageNum = 1;
  var replyPageFooter = $(".panel-footer");
  function showReplyPage(replyCnt) {
    var endNum = Math.ceil(pageNum / 10.0) * 10;
    var startNum = endNum - 9;
    var prev = startNum != 1;
    var next = false;
    if (endNum * 10 >= replyCnt) {
      endNum = Math.ceil(replyCnt / 10.0);
    }
    if (endNum * 10 < replyCnt) {
      next = true;
    }
    var str = "<ul class='pagination pull-right'>";
    if (prev) {
      str +=
        "<li class='page-item'><a class='page-link' href='" +
        (startNum - 1) +
        "'>Previous</a></li>";
    }
    for (var i = startNum; i <= endNum; i++) {
      var active = pageNum == i ? "active" : "";
      str +=
        "<li class='page-item " +
        active +
        " '><a class='page-link' href='" +
        i +
        "'>" +
        i +
        "</a></li>";
    }
    if (next) {
      str +=
        "<li class='page-item'><a class='page-link' href='" +
        (endNum + 1) +
        "'>Next</a></li>";
    }
    str += "</ul></div>";
    console.log(str);
    replyPageFooter.html(str);
  }
  replyPageFooter.on("click", "li a", function (e) {
    e.preventDefault();
    console.log("page click");
    var targetPageNum = $(this).attr("href");
    console.log("targetPageNum: " + targetPageNum);
    pageNum = targetPageNum;
    showList(pageNum);
  });
});
