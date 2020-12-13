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
    </style>
</head>
<body>
<% if (request.getParameter("showNav")==null || !request.getParameter("showNav").equals("false")){%>
<nav class="navbar navbar-expand-lg">
    <a class="navbar-brand w-50" href="/marketplace">
        <img src="./authlogo.png" alt="eShop" style="max-height:4em;">
    </a>
    <form class="form-inline w-50 my-2 my-lg-0">
        <div class="input-group w-75 my-sm-0">
            <input type="text" class="form-control" name="q" placeholder="Search">
            <div class="input-group-append">
                <button class="btn btn-primary mr-2" type="submit">Search</button>
            </div>
        </div>        
        <a href="/marketplace/auth/signout" class="btn btn-secondary my-2 my-sm-0">Sign Out</a>
    </form>
</nav>
<%}%>
<div class="container">
