<!doctype html>
<head>
    <meta charset="utf-8" />
    <!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <!-- Mobile viewport optimized: h5bp.com/viewport -->
    <meta name="viewport" content="width=device-width">

    <title>Hub · BootMetro</title>

    <meta name="robots" content="noindex, nofollow">
    <meta name="description" content="BootMetro : Simple and complete web UI framework to create web apps with Windows 8 Metro user interface." />
    <meta name="keywords" content="bootmetro, modern ui, modern-ui, metro, metroui, metro-ui, metro ui, windows 8, metro style, bootstrap, framework, web framework, css, html" />
    <meta name="author" content="AozoraLabs by Marcello Palmitessa"/>

    <!-- remove or comment this line if you want to use the local fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" type="text/css" href="content/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="content/css/bootstrap-responsive.css">
    <link rel="stylesheet" type="text/css" href="content/css/bootmetro.css">
    <link rel="stylesheet" type="text/css" href="content/css/bootmetro-tiles.css">
    <link rel="stylesheet" type="text/css" href="content/css/bootmetro-charms.css">
    <link rel="stylesheet" type="text/css" href="content/css/metro-ui-light.css">
    <link rel="stylesheet" type="text/css" href="content/css/icomoon.css">
    <link rel="stylesheet" type="text/css" href="content/css/datepicker.css">
    <link rel="stylesheet" type="text/css" href="content/css/daterangepicker.css">

    <!--  these two css are to use only for documentation -->
    <link rel="stylesheet" type="text/css" href="content/css/demo.css">
    <link rel="stylesheet" type="text/css" href="scripts/google-code-prettify/prettify.css" >

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="content/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="content/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="content/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="content/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="content/ico/apple-touch-icon-57-precomposed.png">

    <!-- All JavaScript at the bottom, except for Modernizr and Respond.
       Modernizr enables HTML5 elements & feature detects; Respond is a polyfill for min/max-width CSS3 Media Queries
       For optimal performance, use a custom Modernizr build: www.modernizr.com/download/ -->
    <script src="scripts/modernizr-2.6.1.min.js"></script>

    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-3182578-6']);
        _gaq.push(['_trackPageview']);
        (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>
</head>

<body>
<!--[if lt IE 7]>
<p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
<![endif]-->

<!-- Header
================================================== -->
<header id="nav-bar" class="container-fluid">
    <div class="row-fluid">
        <div class="span8">
            <div id="header-container">
                <a id="backbutton" class="win-backbutton" href="./index.html"></a>
                <h5>BootMetro</h5>
                <div class="dropdown">
                    <a class="header-dropdown dropdown-toggle accent-color" data-toggle="dropdown" href="#">
                        Start
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="./hub.html">Hub</a></li>
                        <li><a href="./tiles-templates.html">Tile Templates</a></li>
                        <li><a href="./listviews.html">ListViews</a></li>
                        <li><a href="./appbar-demo.html">Demo App-Bar</a></li>
                        <li><a href="./table.html">Demo Table</a></li>
                        <li><a href="./icons.html">Icons</a></li>
                        <li><a href="./scaffolding.html">Bootstrap Scaffolding</a></li>
                        <li><a href="./base-css.html">Bootstrap Base CSS</a></li>
                        <li><a href="./components.html">Bootstrap Components</a></li>
                        <li><a href="./javascript.html">Bootstrap Javascript</a></li>
                        <li class="divider"></li>
                        <li><a href="./index.html">Home</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div id="top-info" class="pull-right">
            <a href="#" class="pull-left">
                <div class="top-info-block">
                    <h3>FirstName</h3>
                    <h4>LastName</h4>
                </div>
                <div class="top-info-block">
                    <b class="icon-user"></b>
                </div>
            </a>
            <hr class="separator pull-left"/>
            <a id="settings" class="pull-left" href="#">
                <b class="icon-settings"></b>
            </a>
        </div>
    </div>
</header>

<div class="container-fluid">
    <div class="row-fluid">
        <div class="metro span12">
            <div class="metro-sections">

                <div id="section1" class="metro-section tile-span-4">

                    <h2>MetroUI Demos</h2>

                    <a class="tile wide imagetext bg-color-blueDark" href="./tiles-templates.html">
                        <div class="image-wrapper">
                            <img src="content/img/metro-tiles.jpg" />
                        </div>
                        <div class="column-text">
                            <div class="text4">List of all tile templates: square, wide, widepeek, with images or text only.</div>
                        </div>
                        <div class="app-label">Tiles Templates</div>
                    </a>

                    <a class="tile wide imagetext wideimage bg-color-orange" href="./appbar-demo.html">
                        <img src="content/img/appbar.png" alt=""/>
                        <div class="textover-wrapper bg-color-blue">
                            <div class="text2">Application Bar</div>
                        </div>
                    </a>

                    <a class="tile app wide bg-color-greenDark" href="./table.html">
                        <div class="image-wrapper">
                            <img src="content/img/My Apps.png" alt=""/>
                        </div>
                        <div class="app-label">Styled Table</div>
                    </a>

                    <a class="tile app bg-color-purple" href="./listviews.html">
                        <div class="image-wrapper">
                            <span class="icon icon-list-2"></span>
                        </div>
                        <span class="app-label">ListView</span>
                    </a>

                    <a class="tile app bg-color-red" href="./charms-demo.html">
                        <div class="image-wrapper">
                            <span class="icon icon-publish"></span>
                        </div>
                        <span class="app-label">[TODO] Charms</span>
                    </a>

                    <a class="tile app bg-color-yellow" href="./images.html">
                        <div class="image-wrapper">
                            <span class="icon icon-images"></span>
                        </div>
                        <span class="app-label">[TODO] Images</span>
                    </a>

                    <a class="tile app bg-color-blueDark" href="./icons.html">
                        <div class="image-wrapper">
                            <span class="icon icon-IcoMoon" ></span>
                        </div>
                        <span class="app-label">Icons</span>
                    </a>

                </div>

                <div id="section2" class="metro-section tile-span-4">

                    <h2>Bootstrap Metro</h2>

                    <a class="tile wide imagetext bg-color-blue" href="./scaffolding.html">
                        <div class="image-wrapper">
                            <img src="content/img/My Apps.png" />
                        </div>
                        <div class="column-text">
                            <div class="text">Grid system</div>
                            <div class="text">Layouts</div>
                            <div class="text">Responsive design</div>
                        </div>
                        <span class="app-label">SCAFFOLDING</span>
                    </a>

                    <a class="tile wide imagetext bg-color-blueDark" href="./base-css.html">
                        <div class="image-wrapper">
                            <img src="content/img/Coding app.png" />
                        </div>
                        <div class="column-text">
                            <div class="text">Typography</div>
                            <div class="text">Tables</div>
                            <div class="text">Forms</div>
                            <div class="text">Buttons</div>
                        </div>
                        <span class="app-label">BASE CSS</span>
                    </a>

                    <a class="tile app bg-color-orange" href="./components.html">
                        <div class="image-wrapper">
                            <img src="content/img/RegEdit.png" alt="" />
                        </div>
                        <span class="app-label">COMPONENTS</span>
                    </a>

                    <a class="tile app bg-color-red" href="./javascript.html">
                        <div class="image-wrapper">
                            <img src="content/img/Devices.png" alt="" />
                        </div>
                        <span class="app-label">JAVASCRIPT</span>
                    </a>

                </div>

                <!--<div id="section3" class="metro-section tile-span-2">-->
                <!--<h2>Category 3</h2>-->
                <!--<div class="tile tile-double bg-color-blue">-->
                <!--<div class="tile-icon-large">-->
                <!--<img src="content/img/Live%20SkyDrive.png" />-->
                <!--</div>-->
                <!--<span class="tile-label">Live SkyDrive</span>-->
                <!--</div>-->
                <!--<div class="tile bg-color-blueDark">-->
                <!--<div class="tile-icon-large">-->
                <!--<img src="content/img/Bluetooth.png" />-->
                <!--</div>-->
                <!--<span class="tile-label">Bluetooth</span>-->
                <!--</div>-->
                <!--<div class="tile bg-color-red">-->
                <!--<div class="tile-icon-large">-->
                <!--<img src="content/img/Control%20Panel.png" />-->
                <!--</div>-->
                <!--<span class="tile-label">Control Panel</span>-->
                <!--</div>-->
                <!--<div class="tile bg-color-green">-->
                <!--<div class="tile-icon-large">-->
                <!--<img src="content/img/Signal.png" />-->
                <!--</div>-->
                <!--<span class="tile-label">WiFi Settings</span>-->
                <!--</div>-->
                <!--<div class="tile bg-color-yellow">-->
                <!--<div class="tile-icon-large">-->
                <!--<img src="content/img/Computer%20alt%202.png" />-->
                <!--</div>-->
                <!--<span class="tile-label">My Computer</span>-->
                <!--</div>-->
                <!--</div>-->

            </div>

            <!-- <a id="tiles-scroll-prev" class="win-command carousel-control left" href="#metro-carousel" data-slide="prev">
               <span class="win-commandimage win-commandring">&#xe05d;</span>
            </a>
            <a id="tiles-scroll-next"  class="win-command carousel-control right" href="#metro-carousel" data-slide="next">
               <span class="win-commandimage win-commandring">&#xe059;</span>
            </a> -->

        </div>
    </div>
</div>


<div id="charms" class="win-ui-dark">

    <div id="theme-charms-section" class="charms-section">
        <div class="charms-header">
            <a href="#" class="close-charms win-command">
                <span class="win-commandimage win-commandring">&#xe05d;</span>
            </a>
            <h2>Settings</h2>
        </div>

        <div class="row-fluid">
            <div class="span12">

                <form class="">
                    <label for="win-theme-select">Change theme:</label>
                    <select id="win-theme-select" class="">
                        <option value="metro-ui-semilight">Semi-Light</option>
                        <option value="metro-ui-light">Light</option>
                        <option value="metro-ui-dark">Dark</option>
                    </select>
                </form>

            </div>
        </div>
    </div>

</div>

<script type="text/javascript" src='scripts/jquery-1.8.2.min.js'></script>
<script type="text/javascript" src="scripts/google-code-prettify/prettify.js"></script>
<script type="text/javascript" src="scripts/jquery.mousewheel.js"></script>
<script type="text/javascript" src="scripts/jquery.scrollTo.js"></script>
<script type="text/javascript" src="scripts/bootstrap.min.js"></script>
<script type="text/javascript" src="scripts/bootmetro.js"></script>
<script type="text/javascript" src="scripts/bootmetro-charms.js"></script>
<script type="text/javascript" src="scripts/demo.js"></script>
<script type="text/javascript" src="scripts/holder.js"></script>
<script type="text/javascript" src="scripts/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="scripts/daterangepicker.js"></script>

<script type="text/javascript">
    $(".metro").metro();
</script>
</body>
</html>
