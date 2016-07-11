<%@ Page Title="Добре дошли в Кафенето. Изберете опция" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CoffeeHouse.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ol>
        <li>
            <asp:Button ID="ImportButton" runat="server" Text="Прехвърляне от XML файлове в БД" PostBackUrl="~/AddXml.aspx" />
        </li>
        <li>
            <asp:HyperLink ID="EnterDataHyperLink" runat="server" NavigateUrl="~/EnterDataList.aspx">Въвеждане на данни</asp:HyperLink>
        </li>
    </ol>



</asp:Content>
