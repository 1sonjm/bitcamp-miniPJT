var request = null;

//request 积己 function Definition	 	
function createRequest(){	 	
 		try{
 			request = new XMLHttpRequest();
 			alert ("XMLHttpRequest() 肺 request instancet积己肯丰");
  		}catch(trymicrosoft){
 			try{
 				request = new ActiveXObject("Msxml2.XMLHTTP");
 				alert ("ActiveXObject(Msxml2.XMLHTTP) 肺 request instancet积己肯丰");
 			}catch(othermicrosoft){
 				try{
 					request =new ActiveXObject("Microsoft.XMLHTTP");
 					alert ("new ActiveXObject(Microsoft.XMLHTTP) 肺 request instancet积己肯丰");
 				}catch(failed){
 					request = null;
 				}
 			}
 		}
 		if( request == null ){
 			alert ("request按眉 积己矫 error 惯积窃.");
 		}
} 		