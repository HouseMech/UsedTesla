import Chart from 'chart.js';

function graphIt() {
  let prices = vehicle_data.map(item => item.price);
  let labels = vehicle_data.map(item => item.data_acquired)
  var ctx = document.getElementById('myChart')
  var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'line',

    // The data for our dataset
    data: {
        labels: labels,
        datasets: [{
            label: 'Vehicle prices',
            borderColor: 'rgb(114, 147, 203)',
            fill: false,
            data: prices
        }]
    },

    // Configuration options go here
    options: {}
  });
}

$(document).on('turbolinks:load', function() {
  graphIt();
});
