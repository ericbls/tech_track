function updateList(){
	$.ajax({
		method: "GET",
		url: "/techtrack/func/dados",
	}).done(function(resp){
		$("#listTable tbody").empty()
		var table_html = ''

		resp.forEach(function(item, index){
			table_html += "<tr>"
			table_html += "<th>" + index + "</th>"
			table_html += "<th>" + item.id_maquina + "</th>"
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

function lineChart(){
	var ctx = $("#lineChart");//document.getElementsById('lineChart').getContext('2d');
	var varChart = new Chart(ctx,{
		type: 'line',
		data: {
			labels:["1","2","3","4","5","6","7"],
			datasets:[
				{
					label:"Máquina1",
					data:[10,20,30,40,50,60,70],
					pointStyle:'crossRot',
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
}

function barChart(){
	var ctx2 = $('#barChart');
	var myChart = new Chart(ctx2, {
		type: 'bar',
		data: {
			labels: ['Uso diário'],
			datasets: [
				{
					label: 'Off',
					data: [10],
					backgroundColor: '#55CACE'
				},
				{
					label: 'Running',
					data: [20],
					backgroundColor: '#643C8C'
				},
				{
					data: [5],
					backgroundColor: '#55CACE'
				},
				{
					data: [25],
					backgroundColor: '#643C8C'
				},
				{
					data: [10],
					backgroundColor: '#55CACE'
				},
				{
					data: [20],
					backgroundColor: '#643C8C'
				},
				{
					data: [10],
					backgroundColor: '#55CACE'
				}
			]
		},
		options: {
			scales: {
				xAxes: [{ stacked: true }],
				yAxes: [{ stacked: true }]
			}
		}
	});
}

$(document).ready(function(){
	lineChart();
	barChart();
	setInterval(function(){
		updateList()
	},5000);
})
