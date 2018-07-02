<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	$("#list").on("click", function(e) { //목록으로 버튼
		e.preventDefault();
		fn_openBoardList();
	});

	$("#update").on("click", function(e) {
		e.preventDefault();
		fn_openBoardUpdate();
	});
});

function fn_openBoardList() {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/sample/openSampleBoardList.do' />");
	comSubmit.submit();
}

function fn_openBoardUpdate() {
	var idx = "${map.IDX}";
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/sample/openBoardUpdate.do' />");
	comSubmit.addParam("IDX", idx);
	comSubmit.submit();
}

 
//댓글 목록 
function commentList(){
    $.ajax({
        url : '<c:url value="/comment/selectCommentList.do" />',
        type : 'post',
        data : {bon:'${list.BON}'},
        success : function(data){
            var a =''; 
            $.each(data.list, function(key, value){ 
            	console.dir(key);
            	console.dir(value);
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+value.CNO+'">'+'댓글번호 : '+value.CNO+' / 작성자 : '+value.WRITER;
                a += '<a onclick="commentReply('+value.CNO+',\''+value.CONTENT+'\');"> 답변 </a>';
                a += '<a onclick="commentUpdate('+value.CNO+',\''+value.CONTENT+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+value.CNO+');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+value.CNO+'"> <p> 내용 : '+value.CONTENT +'</p>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        },
        error:function(jqXHR, textStatus, errorThrown ){
        	console.dir(textStatus);
        	console.dir(jqXHR);
        	console.dir(errorThrown);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : '<c:url value="/comment/insertComment.do" />',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(cno, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" name="commentUpdateBtn" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+cno).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(cno){
    var updateContent = $('[name=content_'+cno+']').val();
    
    $.ajax({
        url : '<c:url value="/comment/updateComment.do" />',
        type : 'post',
        data : {'content' : updateContent, 'cno' : cno},
        success : function(data){
//             if(data == 1) commentList(bno); //댓글 수정후 목록 출력 
            commentList();
        }
    });
}
 
//댓글 삭제 
function commentDelete(cno){
    $.ajax({
        url : '<c:url value="/comment/deleteComment.do" />',
        type : 'post',
        data : {'cno' : cno},
        success : function(data){
//         	alert("삭제되었습니다")
//             if(data == 1) commentList(bno); //댓글 삭제후 목록 출력 
            commentList();
        }
    });
}

//대댓글 입력폼
function commentReply(cno){
var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
    a += '<span class="reply-group-btn"><button class="btn btn-default" type="button" name="commentReplyBtn" onclick="commentReplyProc('+cno+');">답변</button> </span>';
    a += '</div>';
    
    $('.commentContent'+cno).html(a);
	
}
//댓글 등록
function commentReplyProc(cno){
    $.ajax({
        url : '<c:url value="/comment/insertComment.do" />',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}
 
$(document).ready(function(){
	$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
	    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
	    commentInsert(insertData); //Insert 함수호출(아래)
// 	    alert('입력되었습니다');
	    commentList(); //페이지 로딩시 댓글 목록 출력 
	});

    commentList(); //페이지 로딩시 댓글 목록 출력 
});
</script>
</head>
<body>
	<table class="board_view">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${map.IDX}</td>
				<th scope="row">조회수</th>
				<td>${map.HIT_CNT}</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${map.CREA_ID }</td>
				<th scope="row">작성시간</th>
				<td>${map.CREA_DTM }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map.TITLE }</td>
			</tr>
			<tr>
				<td colspan="4">${map.CONTENTS }</td>
			</tr>
		</tbody>
	</table>
	
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	<%@ include file="/WEB-INF/include/include-body.jsp"%>

	<form name="commentInsertForm">
		<div class="input-group">
		<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list}" var="list">
			<input type="hidden" name="bon" value="${list.BON}" /> 
							</c:forEach>
				</c:when>
		</c:choose>
			<input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요."/> 
				<button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
	
		</div>
	</form>

	<div class="container">
		<div class="commentList"></div>
	</div>
</body>
</html>
