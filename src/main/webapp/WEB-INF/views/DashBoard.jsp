 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  </head>
  <style>
  .chart-container {
  min-width: 600px;
  min-height: 400px;
  margin: 0 auto;
}
  </style>
  <body>
    <div class="chart-container">
      <canvas id="myChart"></canvas>
    </div>
    <script>

function random_rgba() {
    var o = Math.round, r = Math.random, s = 255;
    return 'rgba(' + o(r()*s) + ',' + o(r()*s) + ',' + o(r()*s) + ',' + r().toFixed(1) + ')';
}
var test_labels = (${listjson});
console.log(test_labels);
var label_main =[];
var data_main =[];
var rgba_main=[];
for (var i = 0; i < test_labels.length; i++) {
    label_main.push(test_labels[i].name);
    data_main.push(test_labels[i].soldCount);
    rgba_main.push(random_rgba());
}
console.log(label_main);
console.log(data_main);
console.log(rgba_main);

var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: label_main,
    datasets: [{
      label: label_main,
      data: data_main,
      backgroundColor: rgba_main,
      borderColor: [
        'rgba(255, 99, 132, 1)',
        'rgba(54, 162, 235, 1)',
        'rgba(255, 206, 86, 1)'
      ],
      borderWidth: 1
    }]
  },
  options: {
    scales: {
      yAxes: [{
        ticks: {
          beginAtZero: true
        }
      }]
    }
  }
});
  </script>
  </body>
</html>