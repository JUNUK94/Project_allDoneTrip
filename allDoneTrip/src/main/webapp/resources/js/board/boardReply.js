$(document).ready(function () {
  //=================================================선언부===========================================================

  var boardReply = $("#boardReply");
  var sessionForm = $("#sessionForm");
  var replyDelete = $("#replyDelete");

  var bno = sessionForm.find("input[name='bno']").val();
  var nick_Name = sessionForm.find("input[name='nick_Name']").val();
  var email = sessionForm.find("input[name='email']").val();
  var b_Type = sessionForm.find("input[name='b_Type']").val();

  //=================================================이벤트 영역========================================================

  //댓글 등록
  $("#sendBoardReply").on("click", function () {
    //일시 가져오기
    var d = new Date();
    var year = d.getFullYear();
    var month = d.getMonth() + 1;
    var date = d.getDate();
    var hour = d.getHours();
    var min = d.getMinutes();
    var sec = d.getSeconds();

    //ajax로 보낼 변수
    var r_Content = boardReply.val();
    var regdate =
      year + "." + month + "." + date + "/" + hour + ":" + min + ":" + sec;
    if (email != null && email != "") {
      $.ajax({
        url: "/community/replyWrite",
        type: "post",
        dataType: "JSON",
        data: {
          bno: bno,
          b_Type: b_Type,
          nick_Name: nick_Name,
          r_Content: r_Content,
          regdate: regdate,
          email: email,
        },
        async: false,
        success: function (map) {
          alert("댓글이 등록되었습니다.");
          window.location.reload();
        },
        error: function () {
          alert("댓글 등록에 실패하였습니다.");
        },
      }); //end of Ajax
    } else {
      alert("먼저 로그인이 필요합니다.");
    }
  });
}); //end of ajax

//댓글 삭제 이벤트
function replyDelete(rno) {
  event.preventDefault();
  var bno = document.getElementsByName("bno")[0].value;

  $.ajax({
    url: "/community/replyDelete",
    type: "post",
    dataType: "JSON",
    data: { bno: bno, rno: rno },
    success: function (map) {
      console.log(map);
      alert(map.message);
      window.location.reload();
    },
    error: function (request, error) {
      alert(request.responseText);
      console.log(
        "code:" +
          request.status +
          "\n" +
          "message:" +
          request.responseText +
          "\n" +
          "error:" +
          error
      );
    },
  }); //end of Ajax
}

//답글창 띄우기 이벤트
function reReply(rno, index) {
  event.preventDefault();

  var plan_No = document.getElementsByName("bno")[0].value;
  var frame = document.getElementById("reReply" + index);

  if (frame.style.display == "none") {
    frame.removeAttribute("style");
  } else {
    frame.setAttribute("style", "display:none");
  }
}

//답글 등록 이벤트
function reReplyInsert(rno, index) {
  //ajax로 보낼 변수
  var bno = document.getElementsByName("bno")[0].value;
  var nick_Name = document.getElementsByName("nick_Name")[0].value;
  var email = document.getElementsByName("email")[0].value;
  var r_Content = document.getElementById("reReplyText" + index).value;
  var b_Type = document.getElementsByName("b_Type")[0].value;
  var up_Rno = rno;

  var d = new Date();
  var year = d.getFullYear();
  var month = d.getMonth() + 1;
  var date = d.getDate();
  var hour = d.getHours();
  var min = d.getMinutes();
  var sec = d.getSeconds();

  var regdate =
    year + "." + month + "." + date + "/" + hour + ":" + min + ":" + sec;
  if (email != null && email != "") {
    $.ajax({
      url: "/community/reReplyWrite",
      type: "post",
      dataType: "JSON",
      data: {
        b_Type: b_Type,
        bno: bno,
        rno: rno,
        nick_Name: nick_Name,
        email: email,
        r_Content: r_Content,
        regdate: regdate,
        up_Rno: up_Rno,
      },
      success: function (map) {
        alert("답글이 등록되었습니다.");
        window.location.reload();
      },
      error: function (request, error) {
        alert("error");
        console.log(
          "code:" +
            request.status +
            "\n" +
            "message:" +
            request.responseText +
            "\n" +
            "error:" +
            error
        );
      },
    }); //end of Ajax
  } else {
    alert("먼저 로그인이 필요합니다.");
  }
}

//버튼 클릭시 답글 리스트 띄우기 이벤트
function show_reReplyList(index) {
  event.preventDefault();

  var frame = document.getElementById("reReplyList" + index);
  var aTag = document.getElementById("count_reReply" + index);

  if (frame.style.display == "none") {
    frame.style.display = "";
    aTag.innerHTML = "∧";
  } else {
    frame.style.display = "none";
    aTag.innerHTML = "∨";
  }
}
