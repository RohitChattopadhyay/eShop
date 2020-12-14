<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.LinkedList" %>
<html>
<head>
    <title>eShop | Your online marketplace</title>
    <meta name="author" content="Rohit Chattopadhyay | 73">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="https://bootswatch.com/4/flatly/bootstrap.min.css">
    <script type="text/javascript" src="https://bootswatch.com/_vendor/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"/>
    <style>    
        .strike {
            text-decoration: line-through;
        }
        .profile-icon i{
            font-size: 1.5em;
        }
    </style>
</head>
<body>
<% if (request.getParameter("showNav")==null || !request.getParameter("showNav").equals("false")){%>
<nav class="navbar navbar-expand-lg">
    <div class="navbar-brand w-50">
        <a  href="/marketplace">
            <img src="./authlogo.png" alt="eShop" style="max-height:4em;">
        </a>
    </div>
    <form class="form-inline w-50 my-2 my-lg-0" method="GET" action="/marketplace/search">        
        <div class="input-group w-75 my-sm-0">
            <input list="history" autocomplete="off" autofocus type="text" class="form-control" required name="q" placeholder="Search" value="<%=(request.getParameter("q")==null)?"":request.getParameter("q")%>">
            <div class="input-group-append">
                <button class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
            </div>
        </div>        
        <a href="/marketplace/profile.jsp" class="mx-2 profile-icon btn-outline-primary px-2 border rounded-circle btn">
            <%=session.getAttribute("gender").equals("F")?"<i class='fas fa-chess-queen'></i>":"<i class='fas fa-chess-king'></i>"%>
        </a>
        <a href="/marketplace/auth/signout" class="profile-icon px-2 btn rounded-circle btn-outline-secondary my-2 my-sm-0"><i class="fas fa-power-off"></i></a>
    </form>
</nav>
<datalist id="history">
    <%
        LinkedList<String>  history = (LinkedList)session.getAttribute("search-history");
        if(history!=null)
            for(String item : history){
                %><option value='<%=item%>'>
    <%}%>
</datalist>
<%}%>
<div class="container">
