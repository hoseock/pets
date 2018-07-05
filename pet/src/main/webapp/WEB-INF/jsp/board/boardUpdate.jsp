<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
<%@ include file="/WEB-INF/include/include-menuBar.jsp" %>
<link rel="stylesheet" type="text/css" href="/pet/css/board.css">
<script type="text/javascript">
$(document).ready(function(){
	$("#list").on("click", function(e){ //목록으로 버튼
    	e.preventDefault();
        fn_openBoardList();
     });
             
    $("#update").on("click", function(e){ //저장하기 버튼
        e.preventDefault();
        fn_updateBoard();
    });
             
    $("#delete").on("click", function(e){ //삭제하기 버튼
        e.preventDefault();
        fn_deleteBoard();
     });
});
function checksubmit(){
	if($('#BOARD_TITLE').val()==""){
		alert("제목을 입력하세요");	
		return false;
	}      
}
function fn_openBoardList(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/board/openBoardList.do' />");
	comSubmit.submit();
}
         
function fn_updateBoard(){
    var comSubmit = new ComSubmit("frm");
    comSubmit.setUrl("<c:url value='/board/updateBoard.do' />");
    comSubmit.submit();
}
         
function fn_deleteBoard(){
    var comSubmit = new ComSubmit();
    comSubmit.setUrl("<c:url value='/board/deleteBoard.do' />");
    comSubmit.addParam("BOARD_ID", $("#BOARD_ID").val());
    comSubmit.submit();
}
</script>
</head>
<body>
<form id="commonForm" name="commonForm"></form>
<div class="wrap">
    <form id="frm">
    <a>자유게시판</a>
        <table class="board_view">
            <colgroup>
                <col width="15%"/>
                <col width="35%"/>
                <col width="15%"/>
                <col width="35%"/>
            </colgroup>
            <caption>게시글 상세</caption>
            <tbody>
                <tr>
                    <th scope="row">글 번호</th>
                    <td>
                        ${map.map.BOARD_ID }
                        <input type="hidden" id="BOARD_ID" name="BOARD_ID" value="${map.map.BOARD_ID }">
                    </td>
                    <th scope="row">조회수</th>
                    <td>${map.map.BOARD_HIT }</td>
                </tr>
                <tr>
                    <th scope="row">작성자</th>
                    <td>${map.map.USER_ID }</td>
                    <th scope="row">작성시간</th>
                    <td>${map.map.BOARD_DATE}</td>
                </tr>
                <tr>
                    <th scope="row">제목</th>
                    <td colspan="3">
                        <input type="text" id="BOARD_TITLE" name="BOARD_TITLE" class="wdp_90" value="${map.map.BOARD_TITLE }"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" class="view_text">
                        <textarea rows="20" cols="100" title="내용" id="BOARD_CONTENTS" name="BOARD_CONTENTS">${map.map.BOARD_CONTENTS }</textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>

    <a href="#this" id="list" class="button">목록으로</a>
    <a href="#this" id="update" class="button">저장하기</a>
    <a href="#this" id="delete" class="button">삭제하기</a>
</div>
</body>
</html>