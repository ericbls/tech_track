var url =  "http://18.223.194.18"

function buildList(){
	$.ajax({
		method: "GET",
		url: url + "/techtrack/func/dados"
	})
	.done(function(resp){
		$("#listTable tbody").empty();
		$("#dropItems").empty();
		var table_html = '';
		var drop_html = '';
		resp.forEach(function(item, index){
			table_html += "<tr>";
			table_html += "<th>" + index + "</th>";
			table_html += "<th>" + item.id + "</th>";
			table_html += "<th>" + item.ip + "</th>";
			table_html += "<th>" + item.run + "</th>";
			table_html += "<th>" + item.data_maq + "</th>";
			table_html += "</tr>"
			drop_html += "<a class=\"dropdown-item\" href=\"#\">" + item.id + "</a>"
		})
		$("#listTable tbody").html(table_html);
		$("#dropItems").html(drop_html);
		$("#dropdownMenuButton").html(resp[0].id)
		//atualizando o dropdown
		$("#dropItems a").click(function(e){
			e.preventDefault();
			var selText = $(this).text();
			$("#dropdownMenuButton").text(selText);
			$("#dropdownMenuButton").val(selText);
		})
	})
	.fail(function(mensagem){
		alert(mensagem);
	});

  var start_date_input=$('input[name="start_date"]');
  var start_container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
  var start_options={
		todayBtn: true,
    format: 'yyyy-mm-dd',
    container: start_container,
    todayHighlight: true,
    autoclose: true,
  };
  start_date_input.datepicker(start_options);

	var end_date_input=$('input[name="end_date"]');
	var end_container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
	var end_options={
		todayBtn: true,
		format: 'yyyy-mm-dd',
		container: end_container,
		todayHighlight: true,
		autoclose: true,
	};
	end_date_input.datepicker(end_options);
};

function updateList(){
	$.ajax({
		method: "GET",
		url: url + "/techtrack/func/dados"
	})
	.done(function(resp){
		$("#listTable tbody").empty();
		$("#dropItems").empty();
		var table_html = '';
		var drop_html = '';
		resp.forEach(function(item, index){
			table_html += "<tr>";
			table_html += "<th>" + index + "</th>";
			table_html += "<th>" + item.id + "</th>";
			table_html += "<th>" + item.ip + "</th>";
			table_html += "<th>" + item.run + "</th>";
			table_html += "<th>" + item.data_maq + "</th>";
			table_html += "</tr>"

			drop_html += "<a class=\"dropdown-item\" href=\"#\">" + item.id + "</a>"
		})
		$("#listTable tbody").html(table_html);
		$("#dropItems").html(drop_html);
		//atualizando o dropdown
		$("#dropItems a").click(function(e){
			e.preventDefault();
			var selText = $(this).text();
			$("#dropdownMenuButton").text(selText);
			$("#dropdownMenuButton").val(selText);
		});
	})
	.fail(function(mensagem){
		alert(mensagem);
	});
};

function lineChart(){
	var maquina = $("#dropdownMenuButton").text();
	var start_date = $("#start_date").text();
	var end_date = $("#end_date").text();
	$.ajax({
			method: "GET",
			url: "/techtrack/func/dados/linha?id_maquina=" + maquina + "&data_inicial=" + start_date + "&dafa_final=" + end_date
		}).done(function(resp){
			//$("#listTable tbody").empty();
		}).fail(function(mensagem){
			alert(mensagem);
		});
	var ctx = $("#lineChart");
	var varChart = new Chart(ctx,{
		type: 'line',
		data: {
			labels:["1","2","3","4","5","6","7"],
			datasets:[
				{
					label:"Máquina1",
					data:[10,20,30,40,50,60,70],
					pointStyle:'cross7Rot',
					borderColor:"rgba(100,60,140,1)",
					backgroundColor:"rgba(100,60,140,0.2)",
					pointBorder:"rgba(100,60,140,1)",
					pointBorderWidth:2,
					pointRadius:5,
					pointBackgroundColor:"rgba(100,60,140,1)"
				},
				{
					label:"Máquina2",
					data:[70,60,50,40,30,20,10],
					pointStyle:'circle',
					borderColor:"rgba(80,200,200,1)",
					backgroundColor:"rgba(80,200,200,0.2)",
					pointBorder:"rgba(80,200,200,1)",
					pointBorderWidth:2,
					pointRadius:5,
					pointBackgroundColor:"rgba(80,200,200,1)",
				}
			]
		},
		options: {
			title:{
				display:true,
				text:'Tempo de uso por máquina (em horas)'
			},
			scales:{
				xAxes:[{
					display:true,
					scaleLable:{
						display:true,
						labelString:'Dias'
					}
				}],
				yAxes:[{
					display:true,
					scaleLable:{
						display:true,
						labelString:'Horas'
					},
					ticks:{
						beginAtZero:true,
						max:100
						//stepsize:5
					}
				}]
			},
			hover:{
				mode:'nearest',
				intersect:true
			}
		}
	});
};

function barChart(){
	/*
	$.ajax({
			method: "GET",
			url: "/techtrack/func/barra?id=" + maquina
		}).done(function(resp){
			//$("#listTable tbody").empty();
		})
		*/
	var barChartData = {
		labels: ['7h','8h','9h','10h','11h','12h','13h','14h','15h','16h','17h','18h','19h','20h','21h','22h'],
		datasets: [{
			label: 'Running',
			backgroundColor: '#55CACE',
			data: [
				10,
				40,
				30
			]
		}, {
			label: 'Off',
			backgroundColor: '#643C8C',
			data: [
				90,
				60,
				70
			]
		}]
	};
	var ctx2 = $("#barChart");
	var myChart = new Chart(ctx2, {
		type: 'bar',
		data: barChartData,
		options: {
			scales: {
				xAxes: [{ stacked: true }],
				yAxes: [{ stacked: true }]
			}
		}
	});
};

	//lineChart(selecText,selecStart,selecEnd);
	//barChart(selText);

$(document).ready(function(){
	buildList();
	$("#reloadGraphs").click(function(){
		lineChart();
		barChart();
	});
	setInterval(function(){
		updateList()
	},5000);
})
