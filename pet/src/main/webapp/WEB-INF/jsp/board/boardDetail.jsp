<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
<%@ include file="/WEB-INF/include/include-menuBar.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	$("#list").on("click", function(e){ //목록으로 버튼
		e.preventDefault();
        fn_openBoardList();
     });
             
    $("#update").on("click", function(e){
        e.preventDefault();
        fn_openBoardUpdate();
    });
});
         
function fn_openBoardList(){
	var comSubmit = new ComSubmit();
    comSubmit.setUrl("<c:url value='/board/openBoardList.do' />");
    comSubmit.submit();
}
         
function fn_openBoardUpdate(){
	var id = "${map.BOARD_ID}";
    var comSubmit = new ComSubmit();
    comSubmit.setUrl("<c:url value='/board/openBoardUpdate.do' />");
    comSubmit.addParam("BOARD_ID", id);
    comSubmit.submit();
}
</script>
<style>
.wrap{width:900px;margin:0 auto}
table{border-collapse:collapse;border-spacing:0}
a{text-decoration:none;color:inherit}
a:hover{text-decoration:none}
.button{margin:0;padding:0;width:40px;height:22px;font-size:12px;color:#fff;line-height:20px;border:none;background:#333;cursor:pointer}
</style>
</head>
<body>
<form id="commonForm" name="commonForm"></form>
<div class="wrap">
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
                <td>${map.BOARD_ID}</td>
                <th scope="row">조회수</th>
                <td>${map.BOARD_HIT}</td>
            </tr>
            <tr>
                <th scope="row">작성자</th>
                <td>${map.USER_ID}</td>
                <th scope="row">작성시간</th>
                <td>${map.BOARD_DATE}</td>
            </tr>
            <tr>
                <th scope="row">제목</th>
                <td colspan="3">${map.BOARD_TITLE }</td>
            </tr>
            <tr>
                <td colspan="4">${map.BOARD_CONTENTS }</td>
            </tr>
            <tr>
				<th scope="row">첨부파일</th>
				<td colspan="3">
					<c:forEach var="row" items="${list }">
						<input type="hidden" id="FILES_ID" value="${row.FILES_ID }">
						<a href="#this" name="file">${row.ORIGINAL_FILES_NM }</a> 
						(${row.FILES_SIZE }kb)
					</c:forEach>
				</td>
			</tr>
        </tbody>
    </table>
    <a href="#this" class="button" id="list">목록으로</a>
    <a href="#this" class="button" id="update">수정하기</a>
</div>
</body>
</html>
