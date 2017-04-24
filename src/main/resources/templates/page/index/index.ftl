<#include "/core/frame.ftl">
<@html css="/css/index/style.css">

<link rel="stylesheet" href="/css/lib/bootstrap.css">

<!--header starts-->
<header class="main-header">
    <div class="backbg-color">
        <div class="navigation-bar">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <!--navigation starts-->
                        <nav class="navbar navbar-default">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="/admin/index"><span class="grey">影视</span>爬虫</a>
                            </div>
                            <div class="collapse navbar-collapse navbar-right" id="myNavbar">
                                <ul class="nav navbar-nav">
                                    <li class="active"><a href="/admin/detailPage" class="active">日常采集结果</a></li>
                                </ul>
                            </div>
                        </nav>
                        <!--navigation ends-->
                    </div>
                </div>
            </div>
        </div>
        <!--banner starts-->
        <div class="banner-text">
            <div class="container">
                <div class="row">
                    <div class="banner-info text-center">
                        <h2><span class="grey">影视爬虫</span> - 搜搜搜</h2>
                    </div>
                    <div class="banner-heading text-center">
                        <h3>输入你的搜索内容.</h3>
                    </div>
                    <div class="banner-search col-md-offset-2 col-md-8 col-md-offset-2">
                        <div class="col-md-3">
                            <select id="option" class="form-control sellone">
                                <option value="0" selecte="selected">全部</option>
                                <option value="1">优酷</option>
                                <option value="2">爱奇艺</option>
                                <option value="3">搜狐</option>
                                <option value="4">腾讯</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" id="content" class="form-control selltwo" placeholder="关键字"/>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-btn">
                                <button type="submit" onclick="indexSearch();">Search</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--banner ends-->
</header>
<!--header ends-->
<section class="intro-one">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="intro-text text-center">
                    <h3>影视爬虫，节省你的时间！</h3>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-1.9.1.min.js"></script>
<script src="js/owl.carousel.js"></script>
<script src="js/jquery.mixitup.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.quovolver.js"></script>
<!--for smooth scrolling-->
<script>
    function indexSearch() {
        var content = $("#content").val();
        var type = $("#option").val();
        alert(content);
        window.location.href="/admin/search?type=" + type + "&search_name=" + content;

    }
</script>


</@html>