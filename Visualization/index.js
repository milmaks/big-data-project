function csvToArray(str, dateFrom, dateTo, delimiter = ",") {
    // slice from start of text to the first \n index
    // use split to create an array from string by delimiter
    const headers = str.slice(0, str.indexOf("\n")).split(delimiter);

    // slice from \n index + 1 to the end of the text
    // use split to create an array of each csv value row
    const rows = str.slice(str.indexOf("\n") + 1).split("\n");

    // Map the rows
    // split values from each row into an array
    // use headers.reduce to create an object
    // object properties derived from headers:values
    // the object passed as an element of the array
    const arr = rows.map(function (row) {
        const values = row.split(delimiter);
        const el = headers.reduce(function (object, header, index) {
            object[header] = values[index];
            return object;
        }, {});
        return el;
    });

    draw(arr, dateFrom, dateTo);
}

function draw(data, dateFrom, dateTo) {
    var dom = document.getElementById('container');
    var myChart = echarts.init(dom, null, {
        renderer: 'canvas',
        useDirtyRect: false
    });

    var temperature = [];
    var humidity = [];
    var wind_speed = [];
    var load = [];
    var time = [];
    var hours, minutes, date;

    dateFrom = parseInt(dateFrom.substring(0,4) + dateFrom.substring(5,7) + dateFrom.substring(8));
    dateTo = parseInt(dateTo.substring(0,4) + dateTo.substring(5,7) + dateTo.substring(8));

    data.forEach(element => {
        if(parseInt(element.date) >= parseInt(dateFrom) && parseInt(element.date) <= parseInt(dateTo)) {
            temperature.push(element.temperature);
            humidity.push(element.relative_humidity);
            wind_speed.push(element.wind_speed);
            load.push(element.load);
            hours = element.time / 10000;
            date = element.date.toString();
            minutes = (element.time - hours * 10000) / 100;
            time.push(`${date.substring(6)}/${date.substring(4,6)}/${date.substring(0,4)} ${('0'+hours.toString()).slice(-2)}:${('0'+minutes.toString()).slice(-2)}`);
        }
    });

    var option;

    const colors = ['#5470C7', '#5470C6', '#91CC75', '#EE6666'];

    option = {
        color: colors,

        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross'
            }
        },
        grid: {
            right: '15%'
        },
        toolbox: {
            feature: {
                dataView: { show: true, readOnly: false },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
        legend: {
            data: ['Load', 'Humidity', 'Wind Speed', 'Temperature']
        },
        xAxis: [
            {
                type: 'category',
                axisTick: {
                    alignWithLabel: true
                },
                // prettier-ignore
                data: time
            }
        ],
        yAxis: [
            {
                type: 'value',
                name: 'Load',
                position: 'left',
                alignTicks: true,
                offset: 53,
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: colors[0]
                    }
                },
                axisLabel: {
                    formatter: '{value} MW'
                }
            },
            {
                type: 'value',
                name: 'Humidity',
                position: 'right',
                alignTicks: true,
                offset: 40,
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: colors[1]
                    }
                },
                axisLabel: {
                    formatter: '{value} %'
                }
            },
            {
                type: 'value',
                name: 'Wind Speed',
                position: 'right',
                alignTicks: true,
                offset: 110,
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: colors[2]
                    }
                },
                axisLabel: {
                    formatter: '{value} m/s'
                }
            },
            {
                type: 'value',
                name: 'Temperature',
                position: 'left',
                alignTicks: true,
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: colors[3]
                    }
                },
                axisLabel: {
                    formatter: '{value} °C'
                }
            }
        ],
        series: [
            {
                name: 'Load',
                type: 'line',
                data: load,
            },
            {
                name: 'Humidity',
                type: 'bar',
                yAxisIndex: 1,
                data: humidity,
            },
            {
                name: 'Wind Speed',
                type: 'bar',
                yAxisIndex: 2,
                data: wind_speed
            },
            {
                name: 'Temperature',
                type: 'line',
                yAxisIndex: 3,
                data: temperature
            }
        ]
    };

    if (option && typeof option === 'object') {
        myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
}