$(document).ready(function(){
	
	var startpos = 0;
	var diffpos = 0;
	var range = 50;
	var isEnable = false;

	mouseInit(e);
	
	
	function on_mouse_down(e) {
		startpos = event.clientX + diffpos;
		isEnable = true;
		return false;
	}
	
	function on_mouse_up(e) {
		isEnable = false;
		return false;
	}
	
	function on_mouse_move(e) {
		if (isEnable) {
			pos = event.clientX;
			diffpos = startpos - pos;
	
			var width = window.innerWidth / 2;
	
			if (diffpos > -(width - range) && diffpos < (width - range)) {
				document.getElementById("editor_area").style.width = width
						- diffpos + "px";
				document.getElementById("map_area").style.width = width - 20
						+ diffpos + "px";
			}
		}
	}
	
	function mouseInit(e) {
		document.getElementById("map_area_resize").onmousedown = on_mouse_down;
		document.onmouseup = on_mouse_up;
		document.onmousemove = on_mouse_move;
	}
	
});