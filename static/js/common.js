function reload(){
	window.location.reload();
}
function login(){
	window.location.href="/showtimePH/pages/user/login.jsp";
}
function goback(){
	history.go(-1);
}
function logout(){
	$.ajax({
        type : "post",
		async : false,  //同步请求
		url : "/showtimePH/user/logout/",
		timeout:1000,
        error: function(request) {
        	SimMessageAlert("注销失败");
        },
        success: function(data) {
        	data = parseInt(data, 10);
        	if(data==1)
        		window.location.href="";
        	else
        		window.location.reload();
        }
    });
}
