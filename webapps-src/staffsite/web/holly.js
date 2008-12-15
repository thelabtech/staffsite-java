var top=0;
var left=0;

var velocity=0;
var timer;
var  stop=false;
function adjust()
{
	left=left+10;
	
	top=top+velocity;
	velocity=velocity+3;
	if (top>100){ velocity=-20;}
	if (left>1000){ left=0;}
	document.getElementById('holly').style.top=top;
	document.getElementById('holly').style.left=left;
	for ( i=0;i<4;i++){
		document.getElementById('berry['+i+']').style.top=top+Math.round(Math.random()*45)-30;
		document.getElementById('berry['+i+']').style.left=left+Math.round(Math.random()*45)-35;
	}
	clearTimeout(timer);
	if (!stop){ timer=setTimeout("adjust();",33);}
}

function stop(){
	stop=true;
}

