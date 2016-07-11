<%@ Page Title="Прехвърляне на XML файловете в БД" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddXml.aspx.cs" Inherits="CoffeeHouse.AddXml" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HyperLink ID="BackHyperLink" runat="server" NavigateUrl="~/Default.aspx">Връщане към началната страница</asp:HyperLink>
    <br />
    <br />
    <h2>Резултати от прехвърлянето:</h2>
    <asp:Table ID="ImportStatusTable" runat="server" BorderWidth="1px" CellPadding="10" GridLines="Horizontal"></asp:Table>
</asp:Content>