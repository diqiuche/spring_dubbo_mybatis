<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="utf-8">
    <script type="text/javascript" src="${baseDir.contextPath}/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="${baseDir.contextPath}/js/Highcharts-4.1.7/js/highcharts.js"></script>
    <script type="text/javascript" src="${baseDir.contextPath}/js/Highcharts-4.1.7/js/modules/exporting.js"></script>  <!-- 图表导出js库  -->
    <!-- <script type="text/javascript" src="../Highcharts-4.1.7/js/themes/grid-light.js"></script>-->
    <script type="text/javascript" src="${baseDir.contextPath}/js/Highcharts-4.1.7/js/highcharts-3d.js"></script>   <!-- 3d支持  -->
    <script type="text/javascript">

        $(document).ready(function(){
            var chart = new Highcharts.Chart({
                chart:{
                    renderTo:'container',
                    type:'column',  //柱状图
                    options3d:{
                        enabled:true,
                        alpha: 15,   //3D图旋转角度，此为α角，内旋角度
                        beta:15,  //3D图旋转角度，此为β角，外旋角度
                        depth:50,  //图表的全深比
                        viewDistance:25  //它定义了观看者在图前看图的距离
                    },
                    margin:75,
                    //zoomType:'y',  //在y轴进行缩放
                    events: {
                        click:function(e) {   //图标点击事件
                            //console.dir(this);
                            //alert(e.xAxis[0].value);
                        }
                    }

                },
                title:{
                    text:'this is tangsi\'s first highcharts'  //指定图标标题
                },
                xAxis:{
                    categories:['my','first','chart'],  //指定图标分组
                    lineColor:'red'                  //设置X轴颜色为红色
                },
                yAxis:{
                    title:{
                        text:'y轴标题'
                    }
                },
                series:[  //指定数据列
                    {
                        name:'wangshi',  //数据列名
                        data:[1,3,5],    //数据
                        color:'green',
                        events:{  //
                            click:function(e) {
                                alert(this.name);
                            }
                        }
                    },
                    {
                        name:'panshiyi',
                        data:[2,4,6],
                        color:'orange'
                    }
                ],
                exporting:{  //图标导出相关设置
                    enabled:true,
                    filename:'tangside picture'
                },
                tooltip:{
                    borderRadius:10,  //设置提示框圆角半径
                    enabled:true//,     //是否禁用提示框
                    /*formatter:function(){  //格式化（定制）自己的提示文字
                        return  '<strong style="color:'+this.series.color+'">'+this.series.name+'</strong>';
                        //this.series.name;//this.x + "----" + this.y;//this.series.name;//this.x;
                    }*/
                },
                plotOptions: {
                    column: {
                        depth: 25
                    }
                },
                credits:{  //图片右下角的版权信息
                    enabled:true,
                    href:'http://user.qzone.qq.com/971912943/infocenter?ptsig=*vtw9bRBmpBzwzh9Mjsq1JSUAZR8UwwoFLlFb3-SvdA_',
                    text:'唐思的图表 ©All Rights Reserved',
                    style:{
                        cursor:'pointer',
                        color:'green',
                        fontSize:'10px'
                    },
                    position:{
                        align:'left',
                        verticalAlign:'bottom',
                        y:-5,
                        x:100
                    }
                }
            });

            // Add mouse events for rotation
            $(chart.container).bind('mousedown.hc touchstart.hc', function (e) {
                e = chart.pointer.normalize(e);

                var posX = e.pageX,
                        posY = e.pageY,
                        alpha = chart.options.chart.options3d.alpha,
                        beta = chart.options.chart.options3d.beta,
                        newAlpha,
                        newBeta,
                        sensitivity = 5; // lower is more sensitive

                $(document).bind({
                    'mousemove.hc touchdrag.hc': function (e) {
                        // Run beta
                        newBeta = beta + (posX - e.pageX) / sensitivity;
                        newBeta = Math.min(100, Math.max(-100, newBeta));
                        chart.options.chart.options3d.beta = newBeta;

                        // Run alpha
                        newAlpha = alpha + (e.pageY - posY) / sensitivity;
                        newAlpha = Math.min(100, Math.max(-100, newAlpha));
                        chart.options.chart.options3d.alpha = newAlpha;

                        chart.redraw(false);
                    },
                    'mouseup touchend': function () {
                        $(document).unbind('.hc');
                    }
                });
            });
        });

    </script>
</head>
<body>
<div id="container" style="min-width:800px; height:400px;">


</div>
</body>
</html>