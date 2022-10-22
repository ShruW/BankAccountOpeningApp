<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditCustomer.aspx.cs" Inherits="BankAccountOpeningApp.EditCustomer" %>

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
            <div style="float: right; width: 20%; font-size: 18px;text-align:right;margin-right:10px">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Logout.aspx">Logout</asp:HyperLink>
            </div>
        <br />
        <asp:Label ID="lblHello" runat="server"></asp:Label>
        <%--<asp:LoginName ID="LoginName1" runat="server" />--%>
        <h4>List of customers</h4>
        <asp:GridView ID="gvCustomers" runat="server" DataKeyNames="ID" AutoGenerateColumns="false" OnRowEditing="gvCustomers_RowEditing" OnRowUpdating="gvCustomers_RowUpdating" OnRowCancelingEdit="gvCustomers_RowCancelingEdit">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="true" />
                <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                <asp:BoundField DataField="DOB" HeaderText="Date of Birth" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                <asp:BoundField DataField="Email" HeaderText="Email Id" />
                <asp:BoundField DataField="Phone" HeaderText="Phone Number" />
                <asp:CommandField ShowEditButton="true" />
            </Columns>
        </asp:GridView>
        <asp:Button ID="btnExport" runat="server" Text="Export to Excel" OnClick="btnExport_Click" />

    </form>
    <footer>
        <a href="Help.html" runat="server">Need Help?</a>
    </footer>
</body>
</html>
