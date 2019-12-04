var url =  "http://18.223.194.18"

function buildList(){
	$.ajax({
		method: "GET",
		url: url + "/techtrack/func/dados/stats"
	})
	.done(function(resp){
		$("#listTable tbody").empty();
		$("#dropItems").empty();
		var table_html = '';
		var drop_html = '';
		resp.forEach(function(item, index){
			table_html += "<tr>";
			table_html += "<th>" + item.id + "</th>";
			table_html += "<th>" + item.fabricante + "</th>";
			table_html += "<th>" + item.modelo + "</th>";
			if(item.run == 1){
				table_html += "<th>Em Uso</th>";
			} else {
				table_html += "<th>Ocioso</th>";
			}
			var data_maq = new Date(item.data_maq);
			table_html += "<th>" + data_maq.toUTCString() + "</th>";
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
		url: url + "/techtrack/func/dados/stats"
	})
	.done(function(resp){
		$("#listTable tbody").empty();
		$("#dropItems").empty();
		var table_html = '';
		var drop_html = '';
		resp.forEach(function(item, index){
			table_html += "<tr>";
			table_html += "<th>" + item.id + "</th>";
			table_html += "<th>" + item.fabricante + "</th>";
			table_html += "<th>" + item.modelo + "</th>";
			if(item.run == 1){
				table_html += "<th>Em Uso</th>";
			} else {
				table_html += "<th>Ocioso</th>";
			}
			var data_maq = new Date(item.data_maq);
			table_html += "<th>" + data_maq.toUTCString() + "</th>";
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
	var start_date = $("#start_date").val();
	var end_date = $("#end_date").val();
	console.log(maquina);
	console.log(start_date);
	console.log(end_date);
	var datas = [];
	var deltat = [];
	$.ajax({
			method: "GET",
			url: "/techtrack/func/dados/linha?id_maquina=" + maquina + "&data_inicial=" + start_date + "&data_final=" + end_date
		}).done(function(resp){
			resp.forEach(function(item,index){
				deltat[index]=item.soma_por_dia;
				datas[index]=item.data_maq;
			})
		}).fail(function(mensagem){
			alert(mensagem);
		});
	var ctx = $("#lineChart");
	var varChart = new Chart(ctx,{
		type: 'line',
		data: {
			labels:datas,
			datasets:[
				{
					label:"",
					data:deltat,
					pointStyle:'cross7Rot',
					borderColor:"rgba(100,60,140,1)",
					backgroundColor:"rgba(100,60,140,0.2)",
					pointBorder:"rgba(100,60,140,1)",
					pointBorderWidth:2,
					pointRadius:5,
					pointBackgroundColor:"rgba(100,60,140,1)"
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

/*
function barChart(){
	$.ajax({
			method: "GET",
			url: "/techtrack/func/barra?id=" + maquina
		}).done(function(resp){
			//$("#listTable tbody").empty();
		})
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
*/

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
