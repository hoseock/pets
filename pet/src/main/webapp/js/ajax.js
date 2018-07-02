(function($){
//	function loadingStart(){
//		//화면의 높이와 너비를 구한다.
//			var maskHeight = $(document).height();  
//			var maskWidth = $(document).width();
//			var mask = "<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
//			var loadingImg = '';
//			loadingImg += "<div id='loadingImg' position:absolute; display:none; z-index:10000;'>";
//		 	loadingImg += " <img src='../resources/image/loading.gif'/>"; 
//			loadingImg += "</div>";
//			$('#loadingImg').css({
//				'top':maskHeight/2,
//				'left':maskWidth/2
//			});
//			//화면에 레이어 추가 
//			$('body').append(mask).append(loadingImg);
//			//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
//			$('#mask').css({
//				'width' : maskWidth,
//				'height': maskHeight,
//				'opacity' : '0.3'
//			});  
//			//마스크 표시
//			$('#mask').fadeIn(5000);    
//			//로딩중 이미지 표시
//			$('#loadingImg').fadeIn(5000);
//	}
//	function loadingClose() {
//			$('#mask, #loadingImg').fadeOut(5000); 
//	}

	function fn_ajax(form, url, successCallback, errorCallback){
		$.ajax({
		     type : 'POST',  
		     url : url,  
		     data: form,	
		     dataType:'json',
		     success : function(data) {
		    	 	$('body').oLoader({
		    	 		wholeWindow: true, //makes the loader fit the window size
		    	 		lockOverflow: true, //disable scrollbar on body
		    	 		backgroundColor: '#000',
		    	 		fadeInTime: 1000,
		    	 		fadeLevel: 0.4,
		    	 		image: '../resources/image/loader1.gif',  
		    	 		hideAfter: 1500
	 				});
				    if (successCallback) {
				    	successCallback(data);
				    }
		    },
		     error : function(jqXHR, textStatus, errorThrown){
		    	if(errorCallback){
		    		errorCallback(jqXHR, textStatus, errorThrown);
		    	}
		     }
		    ,complete:function(){
		    	$('body').oLoader('hide');
		    }
		})
	}
	window.commonModule={fn_ajax:fn_ajax}
})(jQuery);