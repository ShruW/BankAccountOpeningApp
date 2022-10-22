<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewAccountNo.aspx.cs" Inherits="BankAccountOpeningApp.NewAccountNo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <style>
        .collapsible {
            background-color: lightcyan;
            padding: 10px;
            width: 100%;
            text-align: left;
            font-size: 15px;
            border: none;
        }

        .active {
            background-color: lightblue;
        }

        .content {
            padding: 5px 5px;
            display: none;
            overflow: hidden;
            background-color: lightsteelblue;
        }

/*        .icon {
    display: flex;
    align-items: center;
    padding: 10px 10px 10px 10px;
    width:100%;
}
*/
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="icon">
                <img src="icon.jpg" style="height: 60px; width: 60px;" />
                <h2>ABC Bank Online Portal</h2>
            </div>
            <div style="float: right; width: 20%; font-size: 18px;text-align:right;margin-right:10px">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Logout.aspx">Logout</asp:HyperLink>
            </div>
            <h4>Congratulations!</h4>

            Your New Account Number: 
            <asp:Label ID="lblAccNo" runat="server" Font-Bold="true"></asp:Label>
            <br />
            <br />
            <button type="button" id="btnCollapsible" class="collapsible">See your Account Details here :</button>
            <div id="col_content" class="content">
                Opening Balance:
                <asp:Label ID="lblOpeningBalance" runat="server"></asp:Label><br />
                Account Opening Date:
                <asp:Label ID="lblDate" runat="server"></asp:Label><br />
                Account Type:
                <asp:Label ID="lblType" runat="server"></asp:Label>
            </div>

        </div>
        <footer>
            <a href="Help.html" runat="server">Need Help?</a>
        </footer>
    </form>

    <script>
        var col_btn = document.getElementById("btnCollapsible");
        col_btn.addEventListener("click", function () {
            var content = document.getElementById("col_content"); //this.nextElementSibling;
            if (content.style.display === "block") {
                content.style.display = "none";
            } else {
                content.style.display = "block";
            }
        });

    </script>
</body>
</html>
