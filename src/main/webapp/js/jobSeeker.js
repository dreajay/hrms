var id;
function uploadJobSeeker() {
	var frm = document.getElementById("frmUpload");
	frm.action = "jobSeeker_upload?jobSeekerId=" + id;
	frm.submit();
}

function showwin(jobSeekerId) {
	var windNode = $("#win");
	// windNode.css("display","block");
	// windNode.show("slow");
	windNode.fadeIn("slow");
	id = jobSeekerId;
}

function hide() {
	var windNode = $("#win");

	// windNode.css("display","none");
	// windNode.hide("slow");
	windNode.fadeOut(1000);
}