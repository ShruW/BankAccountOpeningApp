<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="BankAccountOpeningApp.AddCustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="style.css">

</head>
<body>
    <form id="form1" runat="server">
        <div class="icon">
            <img src="icon.jpg" style="height:60px;width:60px;"/>
            <h2>ABC Bank Online Portal</h2>
        </div>
        <div style="float: right; width: 20%; font-size: 18px;text-align:right;margin-right:10px">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Logout.aspx">Logout</asp:HyperLink>
            </div>
        <h4>Add New Customer</h4>
        First Name:
        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="vtxtFirstName" ControlToValidate="txtFirstName" ValidationExpression="\w+[A-Za-z\s]+$" ErrorMessage="Please enter a valid first name" runat="server"></asp:RegularExpressionValidator>
        <br />
        <br />
        Last Name:
        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="vtxtLastName" ControlToValidate="txtLastName" ValidationExpression="\w+[A-Za-z\s]+$" ErrorMessage="Please enter a valid last name" runat="server"></asp:RegularExpressionValidator>
        <br />
        <br />
        Date of Birth:
        <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
        <asp:Calendar ID="cdrDOB" runat="server" OnSelectionChanged="cdrDOB_SelectionChanged"></asp:Calendar>
        <br />
        <br />
        Gender:
        <asp:RadioButtonList ID="rdlGender" runat="server">
            <asp:ListItem Value="M">Male</asp:ListItem>
            <asp:ListItem Value="F">Female</asp:ListItem>
            <asp:ListItem Value="O">Others</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <br />
        Phone Number:
        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
        <br />
        <br />
        Email Id:
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <br />
        <br />
        Password: 
        <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <br />
        Confirm Password:
        <asp:TextBox ID="txtConfirmPwd" runat="server" TextMode="Password"></asp:TextBox>
        <asp:CompareValidator ID="vtxtPwd" runat="server" ControlToValidate="txtPwd" ControlToCompare="txtConfirmPwd" ErrorMessage="Please re-enter password"></asp:CompareValidator>
        <br />
        <br />
        <asp:Button ID="btnAdd" runat="server" Text="Add Customer" OnClick="btnAdd_Click" />
        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
        <br />
        <asp:Label ID="lblMessage" runat="server" Width="300px"></asp:Label>
    </form>
    <footer>
        <a href="Help.html" runat="server">Need Help?</a>  
    </footer>
</body>
</html>
