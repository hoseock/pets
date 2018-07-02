<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
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
<div id="menu_bar">
	<%@ include file="/WEB-INF/include/include-menuBar.jsp"%>
</div>
    <form id="frm">
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
                        ${map.IDX }
                        <input type="hidden" id="BOARD_ID" name="BOARD_ID" value="${map.BOARD_ID }">
                    </td>
                    <th scope="row">조회수</th>
                    <td>${map.BOARD_HIT }</td>
                </tr>
                <tr>
                    <th scope="row">작성자</th>
                    <td>${map.USER_ID }</td>
                    <th scope="row">작성시간</th>
                    <td>${map.BOARD_DATE}</td>
                </tr>
                <tr>
                    <th scope="row">제목</th>
                    <td colspan="3">
                        <input type="text" id="BOARD_TITLE" name="BOARD_TITLE" class="wdp_90" value="${map.BOARD_TITLE }"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" class="view_text">
                        <textarea rows="20" cols="100" title="내용" id="BOARD_CONTENTS" name="BOARD_CONTENTS">${map.BORDE_CONTENT }</textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
     
    <a href="#this" class="btn" id="list">목록으로</a>
    <a href="#this" class="btn" id="update">저장하기</a>
    <a href="#this" class="btn" id="delete">삭제하기</a>

</body>
</html>
