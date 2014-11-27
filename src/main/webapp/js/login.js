var speed=20;
var temp=new Array(); 
var clipright=document.body.clientWidth/2,clipleft=0 
for (i=1;i<=2;i++){ 
	temp[i]=eval("document.all.div"+i+".style");
	temp[i].width=document.body.clientWidth/2;
	temp[i].height=document.body.clientHeight;
	temp[i].left=(i-1)*parseInt(temp[i].width);
} 
function openit(){ 
	clipright-=speed;
	temp[1].clip="rect(0 "+clipright+" auto 0)";
	clipleft+=speed;
	temp[2].clip="rect(0 auto auto "+clipleft+")";
	if (clipright<=0)
		clearInterval(tim);
} 
tim=setInterval("openit()",100);


