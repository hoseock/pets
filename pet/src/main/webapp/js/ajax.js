(function($){
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