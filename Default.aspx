
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MovieSearch.Default" %>

<!DOCTYPE html>
    

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Find movies</title>    
    
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {font-family: "Lato", sans-serif}
        .mySlides {display: none}
    </style>

    <style type="text/css">
        #btnLoad {
            height: 52px;
            width: 165px;
        }
    </style>
    <style type="text/css">
    .modal
    {
        position: fixed;
        top: 0;
        left: 0;
        background-color: white;
        z-index: 99;
        opacity: 0.8;
        filter: alpha(opacity=80);
        min-height: 100%;
        width: 100%;
    }
    .loading
    {
        font-family: Arial;
        font-size: 10pt;
        border: 5px solid #67CFF5;
        width: 200px;
        height: 200px;
        display: none;
        position: fixed;
        background-color: white;
        z-index: 999;
    }
    </style>
    <link href="~/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <style>
    .jumbotron 
    { 
        background-color: #25408d; /* Dark Blue */
        color: #ffffff;
    }
    .container-fluid 
    {
        padding: 60px 50px;
    }
    </style>
    <style>
    .logo 
    {
        font-size: 200px;
    }
    @media screen and (max-width: 500px) 
    {
        .col-sm-4 
        {
            text-align: center;
            margin: 25px 0;
        }
    }
    .center {
    margin: auto;
    width: 50%;
    border: 3px solid green;
    padding: 10px;
        }
    </style>

</head>
    
<body style="height: 100%; width: 100%">
    
<script src="/scripts/bootstrap.min.js"></script>

<div class="jumbotron text-center">
  <h1>Mik Wadström</h1> 
  <p>Demo for Movie finder</p> 
</div>

<form runat="server">
     <div class="form-group center-block">
        <br />
        <asp:Label ID="lblKeyword" runat="server" class="form-control" CssClass="label label-default center-block" Text="Keyword for Search"></asp:Label><br />; 
        <asp:Textbox ID="txtMovies" runat="server"  class="form-control" CssClass="text-primary center-block" Width="138px"></asp:Textbox><br />
        <asp:Button ID="btnSubmit" runat="server" class="form-control" CssClass="btn btn-primary center-block" Text="Find Movies" OnClick="btnSubmit_Click" Width="114px"/><br />
        <asp:ListBox ID="lstMovies" runat="server" class="form-control" CssClass="form-control center-block" AutoGenerateColumns="false" Width="400px" Height="163px" Rows="8" OnSelectedIndexChanged="lstMovies_SelectedIndexChanged"></asp:ListBox><br />
        <asp:Label ID="lblPages" runat="server" class="form-control" CssClass="label label-default center-block">Page(s) with titles, chose page number and click Button new titles</asp:Label>
        <asp:RadioButtonList ID="rbPages" runat="server" class="radio-inline" CssClass="radio-control center-block"  BorderStyle="None" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbPages_SelectedIndexChanged" BorderWidth="0px" Height="162px" Width="400px" CellPadding="1" CellSpacing="1" EnableTheming="True" TextAlign="Left"></asp:RadioButtonList><br />
        <asp:Label ID="lblFoundNumMovies" runat="server" class="form-control" CssClass="label label-default center-block" Text="Found" Visible="False"></asp:Label><br />
        <asp:Label ID="lblTimeLog" runat="server" class="form-control" CssClass="label label-default center-block" Text="Logged Keywords for movies" Visible="False"></asp:Label><br />
        <asp:ListBox ID="lstSaveLog" runat="server" class="form-control" CssClass="form-control center-block" Height="104px" Width="400px" Visible="False"></asp:ListBox><br />
    </div>
    <div class="loading" align="center">
        <br />
        <img src="img/loader.gif" alt="Loading" />
    </div>
         

    <script> document.getElementById('txtMovies').focus(); </script>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">

        function ShowProgress() {
            setTimeout(function () {
                var modal = $('<div />');
                modal.addClass("modal");
                $('body').append(modal);
                var loading = $(".loading");
                loading.show();
                var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
                var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
                loading.css({ top: top, left: left });
            }, 200);
        }

        $('form').live("submit", function () {
            ShowProgress();
        });
</script>
    </form>     
    </body>
</html>
