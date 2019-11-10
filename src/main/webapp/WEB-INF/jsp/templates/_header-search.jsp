<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Osoma</title>
    <meta name="description" content="osoma"/>
    <meta name="keywords" content="osoma"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <link href="assets/bootstrap/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>

    <!--    awesome font-->
    <link rel="stylesheet" href="assets/bootstrap/css/font-awesome.css">

    <!-- Custom Theme files -->
    <link href="css/style.css" rel='stylesheet' type='text/css'/>
    <!--    web fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,800,700' rel='stylesheet' type='text/css'>
    <link rel="shortcut icon" href="images/fav.png"/>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>

    <!--    bootstrap js-->
    <script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="js/exams-page.js"></script>
</head>
<body>



<!-- Static navbar -->
<nav class="navbar navbar-fixed-top navbar-custom">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="logo">
                <a href="/"><img src="images/logo2.png" title="logo"/></a>
            </div>

        </div>


        <div class="hidden-xs hidden-sm">
            <form class="navbar-form navbar-left" method="post" action="/search">
                <div class="form-group">
                    <input type="text" name="q" class="form-control"
                           placeholder="Search...">
                    <button type="submit" class="btn btn-default">
                        Search</button>
                </div>
            </form>
        </div>


        <div id="navbar" class="navbar-collapse collapse">
            <!--                    temporary-->
            <img src="images/giphy.gif" title="under construction" height="32" style="margin-left: 50px;"/>

            <ul class="nav navbar-nav navbar-right">


                <li>
                    <a href="/?page=login">
                        <i class="fa fa-createdby" aria-hidden="true"></i>
                        Login                            </a>

                </li>


                <li>

                    <a class="change-lang" href="#"
                       hreflang="pt"

                       rel="en_pt"
                    >

                        <img src="images/lang/pt.png"
                             alt="PT">
                    </a>

                </li>
            </ul>


        </div> <!--/.nav-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<br/>
    <br/>
    <br/>