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
	let maquina = $("#dropdownMenuButton").text();
	let start_date = $("#start_date").val();
	let end_date = $("#end_date").val();
	let datas = [];
	let deltat = [];
	$.ajax({
			method: "GET",
			url: "/techtrack/func/dados/linha?id_maquina=" + maquina + "&data_inicial=" + start_date + "&data_final=" + end_date
		}).done(function(resp){
			resp.forEach(function(item,index){
				deltat[index]=(item.soma_por_dia)/3600;
				let temp = new Date(item.data_maq);
				let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
				let temp2 = temp.getDate() + " " + months[temp.getMonth()];
				datas[index]= temp2;
			})
			var ctx = $("#lineChart");
			var varChart = new Chart(ctx,{
				type: 'line',
				data: {
					labels:datas,
					datasets:[{
							label:"",
							data:deltat,
							pointStyle:'crossRot',
							borderColor:"rgba(100,60,140,1)",
							backgroundColor:"rgba(100,60,140,0.2)",
							pointBorder:"rgba(100,60,140,1)",
							pointBorderWidth:2,
							pointRadius:5,
							pointBackgroundColor:"rgba(100,60,140,1)"
						}]
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
								labelString:"Horas"
							},
							ticks:{
								beginAtZero:true,
								max:24
							}
						}]
					}
				}
			});
		}).fail(function(mensagem){
			alert(mensagem);
		});
};

function barChart(){
	let maquina2 = $("#dropdownMenuButton").text();
	let time_sum = [];
	$.ajax({
			method: "GET",
			url: "/techtrack/func/dados/barra?id_maquina=" + maquina2
		}).done(function(resp){
			resp.forEach(function(item,index){
				let finish_time = new Date("2000-01-01T" + item.data_maq + "Z")
				let finish_hour = finish_time.getHours();
				let finish_min = finish_time.getMinutes();
				let finish_sec = finish_time.getSeconds();
				let finish_sec_sum = finish_hour*3600+finish_min*60+finish_sec;
				let begin_sec_sum = finish_sec_sum - item.deltaT;
				let begin_hour = Math.floor(begin_sec_sum/3600);
				let idx1 = begin_hour - 7;
				let t1 = (begin_hour+1)
				let ret1 = t1*3600-begin_sec_sum;
				time_sum[idx1] += ret1;

				let idx2 = finish_hour - 7;
				let ret2 = finish_min*60+finish_sec;
				time_sum[idx2] += ret2;
				for(var i=idx1+1; i<idx2; i++){
					time_sum[i] += 3600;
				}
				console.log(time_sum);
		})

		var total_sum = time_sum.reduce(function(a,b){
			return a + b;
		}, 0);
		var relative_sum=[];
		console.log("total_sum: "+total_sum);
		time_sum.forEach(function(item,index){
			relative_sum[index] = item/total_sum;
		})
		var barChartData = {
			labels: ['7h','8h','9h','10h','11h','12h','13h','14h','15h','16h','17h','18h','19h','20h','21h','22h'],
			datasets: [{
				label: 'Running',
				backgroundColor: '#55CACE',
				data: relative_sum
			}]
		};
		var ctx2 = $("#barChart");
		var myChart = new Chart(ctx2, {
			type: 'bar',
			data: barChartData,
			options: {
				scales: {
					xAxes: [{ stacked: false }],
					yAxes: [{ stacked: false }]
				}
			}
		});
	}).fail(function(mensagem){
		console.log(mensagem.fail);
		console.log(mensagem.status);
		alert(mensagem.responseText);
	});
};

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
