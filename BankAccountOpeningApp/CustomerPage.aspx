<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerPage.aspx.cs" Inherits="BankAccountOpeningApp.CustomerPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="icon">
            <img src="icon.jpg" style="height: 60px; width: 60px;" />
            <h2>ABC Bank Online Portal</h2>
        </div>
        <div style="float: right; width: 20%; font-size: 18px; text-align: right; margin-right: 10px">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Logout.aspx">Logout</asp:HyperLink>
        </div>
        <asp:Label ID="lblName" runat="server"></asp:Label>
        <br />
        <div>
            <div class="topNav">
                <a href="" target="iframe">Change your details</a>
                <a href="" target="iframe">Open New Account</a>
                <a href="" target="iframe">Apply for card</a>
            </div>
            <iframe name="iframe" height="650" width="950" style="border: none"></iframe>
        </div>
    </form>
</body>
</html>
