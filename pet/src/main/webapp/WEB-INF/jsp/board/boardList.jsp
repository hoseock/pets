<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
<%@ include file="/WEB-INF/include/include-menuBar.jsp" %>
<link rel="stylesheet" type="text/css" href="/pet/css/board.css">

<script src='<c:url value = "/js/jquery/jquery-3.3.1.js"/>'></script>
<script type="text/javascript">

$(document).ready(function(){
    $("#write").on("click", function(e){ //글쓰기 버튼
        e.preventDefault();
        fn_openBoardWrite();
    });
     
    $("a[name='title']").on("click", function(e){ //제목누르면 디테일
        e.preventDefault();
        fn_openBoardDetail(this);
    });
});
 
 
function fn_openBoardWrite(){
    var comSubmit = new ComSubmit();
    comSubmit.setUrl("<c:url value='/board/openBoardWrite.do' />");
    comSubmit.submit();
}
 
function fn_openBoardDetail(obj){
    var comSubmit = new ComSubmit(obj.id);
    comSubmit.setUrl("<c:url value='/board/openBoardDetail.do' />");
    comSubmit.addParam("BOARD_ID", obj.parentNode.previousElementSibling.innerText);
    comSubmit.submit();
}
</script>
</head>
<body>
<form id="commonForm" name="commonForm"></form>
<div class="wrap">
<h2>게시판 목록</h2>
<ul class="board_search">
	<li><input type="radio" name="searchtype" id="search01" checked="checked" /><label for="search01">이름</label></li>
	<li><input type="radio" name="searchtype" id="search02" /><label for="search02">제목</label></li>
	<li><input type="radio" name="searchtype" id="search03" /><label for="search03">내용</label></li>
	<li><input type="text" title="검색어를 입력하세요" /><input type="submit" value="검색" /></li>
</ul>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="board_list">
    <colgroup>
        <col width="10%"/>
        <col width="*"/>
        <col width="15%"/>
        <col width="20%"/>
    </colgroup>
    <thead>
        <tr>
            <th scope="col">글번호</th>
            <th scope="col">제목</th>
            <th scope="col">조회수</th>
            <th scope="col">작성일</th>
            <th scope="col">콘텐츠</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${fn:length(list) > 0}">
                <c:forEach items="${list}" var="row">
                    <tr>
                        <td>${row.BOARD_ID}</td>
                     	<td><a href="#this" name="title">${row.BOARD_TITLE }</a></td>
                        <td>${row.BOARD_HIT }</td>
                        <td>${row.BOARD_DATE }</td>
                        <td id="tooltip" style="display:none;">${row.BOARD_CONTENTS }</td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4">조회된 결과가 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
         
    </tbody>
</table>
<div id="PAGE_NAVI"></div>
    <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
<!-- page_navi start -->
	<div class="page_navi">
		<a href="#" class="first">처음</a>
		<a href="#" class="prev">이전</a>
		<span>
			<strong>1</strong>
			<a href="#">2</a>
			<a href="#">3</a>
			<a href="#">4</a>
			<a href="#">5</a>
			<a href="#">6</a>
		</span>                    
		<a href="#" class="next">다음</a>
		<a href="#" class="last">마지막</a>
	</div>
	<div>
		<a href="#this" class="button" id="write">글쓰기</a>
	</div>

</div>
</body>
</html>
