
function showwin() {
    //alert("׼����ʾ����������������");
    var windNode = $("#win");
    //windNode.css("display","block");
    //windNode.show("slow");
    windNode.fadeIn("slow");
}

function hide() {
    var windNode = $("#win");

    //windNode.css("display","none");
    //windNode.hide("slow");
    windNode.fadeOut(1000);
}