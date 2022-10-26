<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateMyDetails.aspx.cs" Inherits="BankAccountOpeningApp.UpdateMyDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            First Name:
        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvtxtFirstName" ControlToValidate="txtFirstName" ErrorMessage="Please enter first name" runat="server"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="vtxtFirstName" ControlToValidate="txtFirstName" ValidationExpression="\w+[A-Za-z\s]+$" ErrorMessage="Please enter a valid first name" runat="server"></asp:RegularExpressionValidator>
        <br />
        <br />
        Last Name:
        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvtxtLastName" ControlToValidate="txtLastName" runat="server" ErrorMessage="Please enter Last name"></asp:RequiredFieldValidator>
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
        <asp:RequiredFieldValidator ID="rfvtxtEmail" ControlToValidate="txtEmail" ErrorMessage="Please enter Email" runat="server"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click"/>
        </div>
    </form>
    <footer>
        <a href="Help.html" runat="server">Need Help?</a>
    </footer>
</body>
</html>
