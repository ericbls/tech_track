var url =  "http://18.223.194.18"

function success(){
	var alert  = '<div class="alert alert-success alert-dismissible fade show" role="alert">O cadastro foi realizado com sucesso!'
	    alert += '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span> </button></div>';

	$('.container').prepend(alert);
}

function fail(){
	var alert  = '<div class="alert alert-warning alert-dismissible fade show" role="alert">O cadastro nao pode ser realizado, verifique as opcoes e preencha novamente!'
	    alert += '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span> </button></div>';

	$('.container').prepend(alert);
}

function updateList(){
	$.ajax({
		method: "GET",
		url: url + "/techtrack/func/cadastro",
	}).done(function(resp){
		$("#listTable tbody").empty()
		var table_html = ''

		resp.forEach(function(item, index){
			table_html += "<tr>"
			table_html += "<th>" + item.id + "</th>"
			table_html += "<th>" + item.fabricante + "</th>"
			table_html += "<th>" + item.modelo + "</th>"
			table_html += "<th>" + item.ip + "</th>"
			table_html += "<th> <button type=\"button\" class=\"btn btn-danger\"><i data-eva=\"trash\" data-eva-fill=\"#ffffff\" data-eva-height=\"18\" data-eva-width=\"18\" data-eva-animation=\"flip\"></i></button> </th>"
			table_html += "</tr>"
		})
		$("#listTable tbody").html(table_html);
		eva.replace();
	}).fail(function(){
		alert("error");
	})
}

function submitAdd(){
	$("#AddForm").on('submit',function(event){
		event.preventDefault();

		var addInfo = $('#AddForm').serializeArray();
		var addJson = {};

		addInfo.forEach(function(input_data){
			addJson[input_data.name]=input_data.value;
		})

		var request = $.ajax({
			method: "POST",
			url: url + "/techtrack/func/cadastro/add",
			data: JSON.stringify(addJson),
			contentType: "application/json",
			dataType:"json"
		})

		request.fail(function(failed){
			console.log('FAIL: ',failed)
			fail();
		})

		request.done(function(resp){
			console.log('DONE: ',resp)
			success();
			updateList();
		})

		/*$("#AddForm input").on('keyup',function(){
		    let empty = false;

		    $("#AddForm input").each(function() {
		      empty = $(this).val().length == 0;
		    });

		    if (empty)
		      $("#add_but").attr('disabled', 'disabled');
		    else
		      $("#add_butt").attr('disabled', false);
	  	});
	  	*/
	})
}

function submitDel(){
	$("#listTable .btn").on('click',function(event){
		console.log($(this).parentElement.firstElementChild.innerHTML);
	})

	$("#DelForm").on('submit',function(event){
		event.preventDefault();

		var delInfo = $('#DelForm').serializeArray();
		var delJson = {};

		delInfo.forEach(function(input_data){
			delJson[input_data.name]=input_data.value;
		})

		var request = $.ajax({
			method: "POST",
			url: url + "/techtrack/func/cadastro/del",
			data: JSON.stringify(delJson),
			contentType: "application/json",
			dataType:"json"
		})

		request.fail(function(failed){
			console.log('FAIL: ',failed)
			fail();
		})

		request.done(function(resp){
			console.log('DONE: ',resp)
			success();
			updateList();
		})

	})
}

function submitMod(){
	$("#ModForm").on('submit',function(event){
		event.preventDefault();

		var modInfo = $('#ModForm').serializeArray();
		var modJson = {};

		modInfo.forEach(function(input_data){
			modJson[input_data.name]=input_data.value;
		})

		var request = $.ajax({
			method: "POST",
			url: url + "/techtrack/func/cadastro/update",
			data: JSON.stringify(modJson),
			contentType: "application/json",
			dataType:"json"
		})

		request.fail(function(failed){
			console.log('FAIL: ',failed)
			fail();
		})

		request.done(function(resp){
			console.log('DONE: ',resp)
			success();
			updateList();
		})

	})
}

$(document).ready(function()
{
 	updateList();
	submitAdd();
	submitDel();
	submitMod();
})
