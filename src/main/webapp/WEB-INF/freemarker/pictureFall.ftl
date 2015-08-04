<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" content="text/html"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>瀑布流页面</title>
    <link href="${baseDir.contextPath}/js/wookmark/css/main.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${baseDir.contextPath}/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="${baseDir.contextPath}/js/wookmark/imagesloaded.pkgd.js"></script>
    <script type="text/javascript" src="${baseDir.contextPath}/js/wookmark/wookmark.js"></script>
</head>
<body>
    <div role="main" >
        <ul id="container" class="tiles-wrap animated">
            <li><img src="${baseDir.contextPath}/images/beautiful/image_1.jpg" alt="盛夏光年" width="200" height="283" tips="盛夏光年1"/></li>
            <li><img src="${baseDir.contextPath}/images/beautiful/image_2.jpg" alt="盛夏光年" width="200" height="300" tips="盛夏光年2"/></li>
            <li><img src="${baseDir.contextPath}/images/beautiful/image_3.jpg" alt="盛夏光年" width="200" height="252" tips="盛夏光年3"/></li>
            <li><img src="${baseDir.contextPath}/images/beautiful/image_4.jpg" alt="盛夏光年" width="200" height="158" tips="盛夏光年4"/></li>
            <li><img src="${baseDir.contextPath}/images/beautiful/image_5.jpg" alt="盛夏光年" width="200" height="300" tips="盛夏光年5"/></li>
            <li><img src="${baseDir.contextPath}/images/beautiful/image_6.jpg" alt="盛夏光年" width="200" height="297" tips="盛夏光年6"/></li>
            <li><img src="${baseDir.contextPath}/images/beautiful/image_7.jpg" alt="盛夏光年" width="200" height="297" tips="盛夏光年7"/></li>
            <li><img src="${baseDir.contextPath}/images/beautiful/image_8.jpg" alt="盛夏光年" width="200" height="200" tips="盛夏光年8"/></li>
            <li><img src="${baseDir.contextPath}/images/beautiful/image_9.jpg" alt="盛夏光年" width="200" height="398" tips="盛夏光年9"/></li>
            <li><img src="${baseDir.contextPath}/images/beautiful/image_10.jpg" alt="盛夏光年" width="200" height="267" tips="盛夏光年10"/></li>
        </ul>
    </div>

    <script type="text/javascript">
        $(document).ready(function(){
            var wookmark,
                    container = '#container',
                    $container = $(container),
                    $window = $(window),
                    $document = $(document);
            $('img', $container).click(function(){
                alert($(this).attr('tips'));
            });

            imagesLoaded(container, function () {
                wookmark = new Wookmark(container, {
                    offset: 20, // Optional, the distance between grid items
                    itemWidth: 210, // Optional, the width of a grid item
                    autoResize:true
                });
            });

            /**
             * When scrolled all the way to the bottom, add more tiles
             */
            function onScroll() {
                // Check if we're within 100 pixels of the bottom edge of the broser window.
                var winHeight = window.innerHeight ? window.innerHeight : $window.height(), // iphone fix
                        closeToBottom = ($window.scrollTop() + winHeight > $document.height() - 100);

                if (closeToBottom) {
                    // Get the first then items from the grid, clone them, and add them to the bottom of the grid
                    var $items = $('li', $container),
                            $firstTen = $items.slice(0, 10).clone(true).css('opacity', 0);
                    $container.append($firstTen);

                    wookmark.initItems();
                    wookmark.layout(true, function () {
                        // Fade in items after layout
                        setTimeout(function() {
                            $firstTen.css('opacity', 1);
                        }, 600);
                    });
                }
            };

            // Capture scroll event.
            $window.bind('scroll.wookmark', onScroll);
        });
    </script>
</body>
</html>