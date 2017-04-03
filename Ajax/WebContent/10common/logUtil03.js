
//==> Brower 화면에 log를  출력하는 fuction  
function log(message){
	var console = document.getElementById("console")
	if(console != null){
		console.innerHTML += message+"<br/>";
	}
}