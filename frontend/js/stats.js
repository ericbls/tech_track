function updateList(){
	$.ajax({
		method: "GET",
		url: "/techtrack/func/dados",
	}).done(function(resp){
		$("#listTable tbody").empty()
		var table_html = ''

		resp.forEach(function(item, index){
			table_html += "<tr>"
			table_html += "<th>" + item.id_maq + "</th>"
			table_html += "<th>" + item.ip + "</th>"
			table_html += "<th>" + item.run + "</th>"
			table_html += "<th>" + item.data + "</th>"
			table_html += "</tr>"
		})
		$("#listTable tbody").html(table_html);
	}).fail(function(){
		alert("error");
	})
}



$(document).ready(function(){
	setInterval(function(){updateList()},5000);
		
})
