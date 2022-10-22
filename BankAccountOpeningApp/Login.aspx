<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BankAccountOpeningApp.Login" %>

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
            <h2>Welcome to ABC Bank</h2>
        </div>
        <%--<h2><img src="icon1.jpg" style="height:60px;width:60px;"/>Welcome to ABC Bank</h2>--%>
        <div style="background-color: red; color: white; font-size: 18px; height: 40px; line-height: 40px; vertical-align: middle">
            Log In to Online Banking
        </div>
        <br />
        <div style="float: left; width: 50%">
            <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate" BorderStyle="Solid"></asp:Login>
            <br />
            <asp:HyperLink ID="lnkAddCustomer" runat="server" NavigateUrl="~/AddCustomer.aspx">New Customer? Enroll now</asp:HyperLink>
            <%--<asp:Button ID="btnAdd" runat="server" Text="New Customer? Enroll now" OnClick="btnAdd_Click"/>--%>
        </div>
        <div style="float: right; width: 50%">
            <%--<div style="float: left; width: 40%">
                Stay connected with our app!
            <img alt="image of phone" src="bnwphone.jpg" height="200" width="200" />
            </div>--%>
            <div style="float: right; width: 60%">
                <u style="border-bottom: 1px dotted black">Login Issues</u><br />
                <br />
                <a href="Help.html" style="font-size: 14px">Need help with login?</a><br />
                <br />
                <u style="border-bottom: 1px dotted black">Contact us</u><br />
                <br />
                <a href="Help.html" style="font-size: 14px">Learn more about our bank</a><br />
                <a href="Help.html" style="font-size: 14px">Find our location near you</a><br />
                <a href="Help.html" style="font-size: 14px">Customer care</a>

            </div>
        </div>
        <br />
        <br />
        <div class="gallery">
            <%-- <a href="Images\Loan.jpg" target="_blank">--%>
                <img src="Images\Loan.jpg" alt="Loan" width="150" height="150" />
            <%--</a>--%>
            <div class="desc">Apply for Loan Online</div>
        </div>

        <div class="gallery">
            <%--<a target="_blank" href="Images\Card.jpg">--%>
            <img src="Images\Card.jpg" alt="Cars" width="150" height="150" />
            <%--</a>--%>
            <div class="desc">Get 0 fee Credit Card</div>
        </div>

        <div class="gallery">
            <%--<a href="Images\Customer.jpg" target="_blank">--%>
            <img src="Images\Customer.jpg" alt="Customer Service" width="150" height="150" />
            <%--</a>--%>
            <div class="desc">24x7 Customer Service</div>
        </div>

        <div class="gallery">
            <%--            <a href="Images\Financial Guidance.jpg" target="_blank">--%>
            <img src="Images\Financial Guidance.jpg" alt="Financial Guidance" width="150" height="150" />
            <%--</a>--%>
            <div class="desc">Financial Guidance for all stages of life</div>
        </div>

        <div class="gallery">
            <%--            <a href="Images\Financial Guidance.jpg" target="_blank">--%>
            <img src="Images\App.jpg" alt="Mobile App" width="150" height="150" />
            <%--</a>--%>
            <div class="desc">Secure, convenient banking with our app</div>
        </div>
    </form>
</body>

</html>
