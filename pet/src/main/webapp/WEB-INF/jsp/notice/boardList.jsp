<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>first</title>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
<script src='<c:url value = "/js/jquery/jquery-3.3.1.js"/>'></script>
<script>
$(function(){
	$('table > tbody > tr > td').on("click",function(){
		var children = this.parentNode.children;
		var $td = $('#tooltip');
		for(var i=0;i<children.length;i++){
			$td.text =children[i].innerText;
	      }
		
 		alert($td.text);
	})
	 $("a[name='title']").on("click", function(e){ //제목
         e.preventDefault();
         fn_openBoardDetail(this);
     });
	
    $("#write").on("click", function(e){
        e.preventDefault();
        fn_openBoardWrite();
    });


});

function fn_openBoardWrite(){
    var comSubmit = new ComSubmit();
    comSubmit.setUrl("<c:url value='/notice/openBoardWrite.do' />");
    comSubmit.submit();
}
 
function fn_openBoardDetail(obj){
    var comSubmit = new ComSubmit();
    comSubmit.setUrl("<c:url value='/notice/openBoardDetail.do' />");
    comSubmit.addParam("NOTICE_ID",obj.parentNode.previousElementSibling.innerText);
    comSubmit.submit();
   

}


</script>

</head>
<body>
<h2>게시판 목록</h2>
<table style="border:1px solid #ccc">
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
            
            <th scope="col">콘텐츠</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${fn:length(list) > 0}">
                <c:forEach items="${list}" var="row">
                    <tr>
                        <td>${row.NOTICE_ID}</td>
                     	<td><a href="#this" name="title">${row.TITLE }</a></td>
                        <td>${row.HIT_CNT }</td>
                        
                        <td id="tooltip" style="display:none;">${row.CONTENTS }</td>
                     
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
<a href="#this" class="btn" id="write">글쓰기</a>
<%@ include file="/WEB-INF/include/include-body.jsp" %>
</body>
</html>
