$(function() {
	common.showMessage($("#message").val());
});

function search(currentPage) {
	$("#mainForm").attr("method","GET");
	$("#mainForm").attr("action",$("#basePath").val() + "/comments");
	$("#mainForm").submit();
}

function remove(id) {
	if(confirm("确定要删除这个订单号吗？")) {
		$("#id").val(id);
		$("#mainForm").attr("action",$("#basePath").val() + "/comments/remove");
		$("#mainForm").submit();
	}
}

function modifyInit(id) {
	$("#id").val(id);
	$("#mainForm").attr("action",$("#basePath").val() + "/ad/modifyInit");
	$("#mainForm").submit();
}