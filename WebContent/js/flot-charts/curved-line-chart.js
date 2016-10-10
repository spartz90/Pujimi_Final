$(document).ready(function(){
    
    /* Make some random data for the Chart*/
    
    var d1 = [];
    for (var i = 0; i <= 10; i += 1) {
        d1.push([i, parseInt(Math.random() * 30)]);
    }  
    
    /* Chart Options */
    
    var options = {
        series: {
            shadowSize: 0,
            curvedLines: { //This is a third party plugin to make curved lines
                apply: true,
                active: true,
                monotonicFit: true
            },
            lines: {
                show: true,
                lineWidth: 1,
            },
        },
        grid: {
            borderWidth: 0,
            labelMargin:10,
            hoverable: true,
            clickable: true,
            mouseActiveRadius:6,
            
        },
        xaxis: {
            tickDecimals: 1,
            ticks: true
        },
        
        yaxis: {
            tickDecimals: 1,
            ticks: true
        },
        
        legend: {
            show: false
        }
    };
    
    /* Let's create the chart */
    
    if ($("#curved-line-chart")[0]) {
        $.plot($("#curved-line-chart"), [
            {data: d1, lines: { show: true, fill: 0.1 }, label: 'Product 1', stack: true, color: 'red' },
        ], options);
    }
    
    /* Tooltips for Flot Charts */
    
    if ($(".flot-chart")[0]) {
        $(".flot-chart").bind("plothover", function (event, pos, item) {
            if (item) {
                var x = item.datapoint[0].toFixed(2),
                    y = item.datapoint[1].toFixed(2);
                $(".flot-tooltip").html(item.series.label + " of " + x + " = " + y).css({top: item.pageY+5, left: item.pageX+5}).show();
            }
            else {
                $(".flot-tooltip").hide();
            }
        });
        
        $("<div class='flot-tooltip' class='chart-tooltip'></div>").appendTo("body");
    }
});