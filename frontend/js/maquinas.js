function updateList(dados){
	$("#listTable tbody").empty()
	var table_html = ''

	dados.forEach(function(item, index){
		table_html += "<tr>"
		table_html += "<th>" + index + "</th>"
		table_html += "<th>" + item.fabricante + "</th>"
		table_html += "<th>" + item.modelo + "</th>"
		table_html += "<th>" + item.ip + "</th>"
		table_html += "</tr>"
	})
	$("#listTable tbody").html(table_html);
}




function submitAdd(){
	$("#addForm").on('click',function(event){
		event.preventDefault();

		var addInfo = $('#AddForm').serializeArray();
		var addJson = {};

		addInfo.forEach(function(input_data){
			addJson[input_data.name]=input_data.value;
		})

		var request =$.ajax({
			method: "POST",
			url: "/techtrack/func/cadastro/add",
			data: JSON.stringy(addJson),
			contentType: "application/json"
			dataType:"json",
		})

		request.fail(function(failed){
			console.log('FAIL: ',failed)
			fail();
		})

		request.done(function(resp){
			console.log('DONE: ',resp)
			success();
		})

	})
}





$(document).ready(function()
{
	$.ajax({
		method: "GET",
		url: "/techtrack/func/cadastro",
	}).done(function(resp){
		updateList(resp);
	}).fail(function(){
		alert("error");
  })
})
