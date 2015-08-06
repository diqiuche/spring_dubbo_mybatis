<html>
<head>
    <meta charset="utf-8" content="text/html"/>
    <title>webix播放器播放视频</title>
    <link href="${baseDir.contextPath}/js/webix/codebase/webix.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${baseDir.contextPath}/js/webix/codebase/webix.js"></script>
</head>
<body id="main">
    <script type="text/javascript">

        webix.ui({
            view:"window",
            container:'main',
            fullscreen:true,  //全屏
            borderless:true,   //无边框设置
            body:{
                id:'videoPlayer',
                view:"video",
                borderless:true,
                controls:true,
                src: [
                    '${baseDir.contextPath}/user/getVideoSourceForWebIx/${VIDEOId}'
                ],
                autoplay:true   //自动播放

            },
            head:{
                view:"toolbar", elements:[
                    {view:"label", label: "${videoName}", align:'center'}
                ]
            },
            move:true   //页面可移动

        }).show();

        var isPlayingFlag = true;

        webix.UIManager.addHotKey("enter", function() {
            $$("videoPlayer").enable();
            var html5videoObj = $$("videoPlayer").getVideo();
            if(isPlayingFlag) {
                html5videoObj.pause();
                isPlayingFlag = false;
            }
            else {
                html5videoObj.play();
                isPlayingFlag = true;
            }
        });

    </script>
</body>
</html>