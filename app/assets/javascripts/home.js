var m = -1;

function change_color(){
	var array = ['rgb(0,0,255)','rgb(255,0,0)','rgb(255,255,255)','rgb(0,255,255)', 'rgb(13, 224, 174)', 'rgb(224, 13, 224)', 'rgb(162, 42, 147)','rgb(255, 227, 186)', 'rgb(239, 255, 199)','rgb(0, 235, 255)'];
	var array_size = array.length;
	var n = Math.floor((Math.random()*array_size));
	if (n!=m)
	{
		m = n;
		$(".home-jumbotron").animate({color: array[n]}, 676);
	}
	else
	{
		change_color();
	}
}

$(document).ready(function(){
	window.setInterval(function(){
		change_color()		
	}, 676);	
})
