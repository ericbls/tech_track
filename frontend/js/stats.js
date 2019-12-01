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
					pointStyle:'cross'
				},
				{
					label:"Máquina2",
					data:[70,60,50,40,30,20,10]
				}
			]
		},
		options: {
			title:{
				display:true,
				text:'Tempo de uso por máquina (em horas)'
			},
			scales:{
				yAxes:[{
					ticks:{
						beginAtZero:true
					}
				}]
			}
		}
	});
}


$(document).ready(function(){
	lineChart();
	setInterval(function(){
		updateList()
	},5000);
})
