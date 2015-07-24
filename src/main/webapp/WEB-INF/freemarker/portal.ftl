<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Saving Portal State - jQuery EasyUI</title>
    <link rel="stylesheet" type="text/css" href="${baseDir.contextPath}/js/jquery-easyui-1.4.3/themes/metro/easyui.css">
    <link rel="stylesheet" type="text/css" href="${baseDir.contextPath}/js/jquery-easyui-1.4.3/themes/icon.css">
    <script type="text/javascript" src="${baseDir.contextPath}/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="${baseDir.contextPath}/js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${baseDir.contextPath}/js/jquery-easyui-1.4.3/extension/jquery.portal.js"></script>
</head>
<body>
<h2>EasyUI Portal</h2>
<p>This example shows how to build a simple portal system with floating panels.</p>
<div id="pp" style="width:700px;position:relative">
    <div style="width:30%;"></div>
    <div style="width:40%;"></div>
    <div style="width:30%;"></div>
</div>
<style type="text/css">
    .demo-rtl .portal-column-left{
        padding-left: 10px;
        padding-right: 10px;
    }
    .demo-rtl .portal-column-right{
        padding-left:10px;
        padding-right: 0;
    }
</style>
<script type="text/javascript" src="${baseDir.contextPath}/js/jquery-easyui-1.4.3/extension/jquery.portal.js"></script>
<script type="text/javascript">
    var panels = [
        {id:'p1',title:'Tutorials',height:200,collapsible:true,href:'${baseDir.contextPath}/user/tologin',openAnimation:'slide'},
        {id:'p2',title:'Clock',href:'portal_p2.html'},
        {id:'p3',title:'PropertyGrid',height:200,collapsible:true,closable:true,href:'portal_p3.html'},
        {id:'p4',title:'DataGrid',height:200,closable:true,href:'portal_p4.html'},
        {id:'p5',title:'Searching',href:'portal_p5.html'},
        {id:'p6',title:'Graph',href:'portal_p6.html'}
    ];
    function getCookie(name){
        var cookies = document.cookie.split(';');
        if (!cookies.length) return '';
        for(var i=0; i<cookies.length; i++){
            var pair = cookies[i].split('=');
            if ($.trim(pair[0]) == name){
                return $.trim(pair[1]);
            }
        }
        return '';
    }
    function getPanelOptions(id){
        for(var i=0; i<panels.length; i++){
            if (panels[i].id == id){
                return panels[i];
            }
        }
        return undefined;
    }
    function getPortalState(){
        var aa = [];
        for(var columnIndex=0; columnIndex<3; columnIndex++){
            var cc = [];
            var panels = $('#pp').portal('getPanels', columnIndex);
            for(var i=0; i<panels.length; i++){
                cc.push(panels[i].attr('id'));
            }
            aa.push(cc.join(','));
        }
        return aa.join(':');
    }
    function addPanels(portalState){
        var columns = portalState.split(':');
        for(var columnIndex=0; columnIndex<columns.length; columnIndex++){
            var cc = columns[columnIndex].split(',');
            for(var j=0; j<cc.length; j++){
                var options = getPanelOptions(cc[j]);
                if (options){
                    var p = $('<div/>').attr('id',options.id).appendTo('body');
                    p.panel(options);
                    $('#pp').portal('add',{
                        panel:p,
                        columnIndex:columnIndex
                    });
                }
            }
        }

    }

    $(function(){
        $('#pp').portal({
            onStateChange:function(){
                var state = getPortalState();
                var date = new Date();
                date.setTime(date.getTime() + 24*3600*1000);
                document.cookie = 'portal-state='+state+';expires='+date.toGMTString();
            }
        });
        var state = getCookie('portal-state');
        if (!state){
            state = 'p1,p2:p3,p4:p5,p6';    // the default portal state
        }
        addPanels(state);
        $('#pp').portal('resize');
    });
</script>
</body>
</html>