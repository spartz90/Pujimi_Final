$(document).ready(function () {
    $("#s1").change(function () {
        var c1 = $("#s1").find('option:selected').val();
        chart6.hide(null, {
            withLegend: true
        });
        chart6.show([c1], {
            withLegend: true
        });
    });
});

var chart_week_char = ['월', '화', '수', '목', '금', '토', '일']

var chart1_data1 = ['10', '20', '30', '50', '60','20', '50']
var chart1_data2 = ['110', '20', '330', '150', '60','230', '50']


var chart1 = c3.generate({
	bindto: '#chart1',
    data: {
        x: 'x',
//        xFormat: '%Y%m%d', // 'xFormat' can be used as custom format of 'x'
        columns: [
            ['x', chart_week_char[0], chart_week_char[1], chart_week_char[2], chart_week_char[3], chart_week_char[4], chart_week_char[5], chart_week_char[6]],
//            ['x', '20130101', '20130102', '20130103', '20130104', '20130105', '20130106'],
            ['1주전', chart1_data1[0], chart1_data1[1], chart1_data1[2], chart1_data1[3], chart1_data1[4], chart1_data1[5], chart1_data1[6]],
            ['2주전', chart1_data2[0], chart1_data2[1], chart1_data2[2], chart1_data2[3], chart1_data2[4], chart1_data2[5], chart1_data2[6]]
        ],
        type: 'spline' 
    },
    color : {
    	pattern : ['#d62728', '#ff9896']
    },
    axis: {
        x: {
            type: 'categorized',
        }
    }
});


var chart2 = c3.generate({
	bindto: '#chart2',
    data: {
    	x: 'x',
        columns: [
            ['x', chart_week_char[0], chart_week_char[1], chart_week_char[2], chart_week_char[3], chart_week_char[4], chart_week_char[5], chart_week_char[6]],
            ['이번달', 30, 200, 100, 400, 150, 250, 0],
            ['지난달', 130, 100, 140, 200, 150, 50, 10]
        ],
        type: 'spline'        
    },
    color : {
    	pattern : ['#1f77b4', '#aec7e8']
    },
    axis: {
        x: {
            type: 'categorized'
            }
        }
});

var chart3 = c3.generate({
	bindto: '#chart3',
    data: {
    	x: 'x',
        columns: [
            ['x', chart_week_char[0], chart_week_char[1], chart_week_char[2], chart_week_char[3], chart_week_char[4], chart_week_char[5], chart_week_char[6]],
            ['남성', 30, 200, 100, 400, 150, 250,100],
            ['여성', 130, 100, 140, 200, 150, 50, 200]
        ],
        type: 'bar',
        colors : {
        	남성 :'#1f77b4',
        	여성 :'#d62728'
        },
    },
    bar: {
        width: {
            ratio: 0.5 // this makes bar width 50% of length between ticks
        }
        // or
        //width: 100 // this makes bar width 100px
    },
    axis: {
        x: {
            type: 'categorized',
        }
    }
});


var chart4 = c3.generate({
	bindto: '#chart4',
    data: {
    	x: 'x',
        columns: [
            ['x', chart_week_char[0], chart_week_char[1], chart_week_char[2], chart_week_char[3], chart_week_char[4], chart_week_char[5], chart_week_char[6]],
            ['20대', 30, 200, 200, 400, 150, 250, 10],
            ['30대', 130, 100, 100, 200, 150, 50, 20],
            ['40대', 230, 200, 200, 300, 250, 250, 30],
            ['50대', 100, 50, 150, 200, 300, 100, 10]
        ],
        type: 'bar',
    },
    grid: {
        y: {
            lines: [{value:0}]
        }
    },
    axis: {
        x: {
            type: 'categorized',
        }
    }
});

var chart5 = c3.generate({
	bindto: '#chart5',
    data: {
        // iris data from R
        columns: [
            ['밥류', 130],
            ['국류', 120],
            ['고기류', 420],
            ['채소류', 120],
            ['생선류', 220],
        ],
        type : 'pie',
        onclick: function (d, i) { console.log("onclick", d, i); },
        onmouseover: function (d, i) { console.log("onmouseover", d, i); },
        onmouseout: function (d, i) { console.log("onmouseout", d, i); }
    }
})


var chart6 = c3.generate({
	bindto: '#chart6',
    data: {
        columns: [
            ['밥류', 30, 10, 20],
            ['국류', 20],
            ['고기류', 20],
            ['채소류', 25],
            ['생선류', 25]
        ],        
        type : 'donut',
        onclick: function (d, i) { console.log("onclick", d, i); },
        onmouseover: function (d, i) { console.log("onmouseover", d, i); },
        onmouseout: function (d, i) { console.log("onmouseout", d, i); }
    },
    donut: {
        title: "고기류"
    }
});


var chart11 = c3.generate({
	bindto: '#chart11',
    data: {
        x: 'x',
//        xFormat: '%Y%m%d', // 'xFormat' can be used as custom format of 'x'
        columns: [
            ['x', chart_week_char[0], chart_week_char[1], chart_week_char[2], chart_week_char[3], chart_week_char[4], chart_week_char[5], chart_week_char[6]],
//            ['x', '20130101', '20130102', '20130103', '20130104', '20130105', '20130106'],
            ['1주전', chart1_data1[0], chart1_data1[1], chart1_data1[2], chart1_data1[3], chart1_data1[4], chart1_data1[5], chart1_data1[6]],
            ['2주전', chart1_data2[0], chart1_data2[1], chart1_data2[2], chart1_data2[3], chart1_data2[4], chart1_data2[5], chart1_data2[6]]
        ],
        type: 'spline' 
    },
    color : {
    	pattern : ['#d62728', '#ff9896']
    },
    axis: {
        x: {
            type: 'categorized',
        }
    }
});



var chart12 = c3.generate({
	bindto: '#chart12',
    data: {
    	x: 'x',
        columns: [
            ['x', chart_week_char[0], chart_week_char[1], chart_week_char[2], chart_week_char[3], chart_week_char[4], chart_week_char[5], chart_week_char[6]],
            ['이번주', 30, 200, 100, 400, 150, 250, 0],
            ['지난주', 130, 100, 140, 200, 150, 50, 10]
        ],
        type: 'spline'        
    },
    color : {
    	pattern : ['#1f77b4', '#aec7e8']
    },
    axis: {
        x: {
            type: 'categorized'
            }
        }
});
