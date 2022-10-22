<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="BankAccountOpeningApp.Logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="icon" style="float: left">
            <img src="icon.jpg" style="height: 60px; width: 60px;" />
            <h2>ABC Bank Online Portal</h2>
        </div>
        <div >
            Logout Successful
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Go to Login Page</asp:HyperLink>
            <br />
        </div>
    </form>
</body>
</html>
