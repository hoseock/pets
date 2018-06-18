function gfn_isNull(str) {
    if (str == null) return true;
    if (str == "NaN") return true;
    if (new String(str).valueOf() == "undefined") return true;   
    var chkStr = new String(str);
    if( chkStr.valueOf() == "undefined" ) return true;
    if (chkStr == null) return true;   
    if (chkStr.toString().length == 0 ) return true;  
    return false;
}
 
function ComSubmit(opt_formId) {
	opt_formId = opt_formId||"commonForm";
    var url;
     
    if(opt_formId == "commonForm"){
        $("#commonForm")[0].reset();
    }
     
    this.setUrl = function setUrl(pUrl){
        url = pUrl;
    };
     
    this.addParam = function addParam(key, value){
        $("#"+opt_formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >"));
    };
     
    this.submit = function submit(){
        var frm = $("#"+opt_formId)[0];
        frm.action = url;
        frm.method = "post";
        frm.submit();  
    };
}
