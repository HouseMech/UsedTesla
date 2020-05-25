import Chart from 'chart.js';

function graphIt() {
  let prices = vehicle_data.map(item => item.car_price);
  let labels = vehicle_data.map(item => item.date_acquired)
  var ctx = document.getElementById('myChart')
  var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'line',

    // The data for our dataset
    data: {
        labels: labels,
        datasets: [{
            label: 'Vehicle prices',
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 99, 132)',
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
