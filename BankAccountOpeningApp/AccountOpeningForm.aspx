<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountOpeningForm.aspx.cs" Inherits="BankAccountOpeningApp.AccountOpeningForm" %>

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
        Hello<asp:Label ID="lblName" runat="server"></asp:Label>
        <br />
        Get an account number within a few minutes! 
        <br />
        <br />
        Account Type:
        <asp:DropDownList ID="ddlAccType" runat="server">
            <asp:ListItem>Please select</asp:ListItem>
            <asp:ListItem Value="SAVING">Saving</asp:ListItem>
            <asp:ListItem Value="CURRENT">Current</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        Opening Balance:
        <asp:TextBox ID="txtBalance" runat="server"></asp:TextBox>
        <br />
        <br />
        Please upload Proof:
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
        <asp:Label ID="lblUploadStatus" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
        <br />
        <asp:Button ID="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" />
    </form>
    <footer>
        <a href="Help.html" runat="server">Need Help?</a>
    </footer>
</body>
</html>
