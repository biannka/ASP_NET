<%@ Page Title="Форма за попълване на данни за кафене" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EnterDataList.aspx.cs" Inherits="CoffeeHouse.EnterDataList" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HyperLink ID="BackHyperLink" runat="server" NavigateUrl="~/Default.aspx">Връщане към началната страница</asp:HyperLink>
    <br />
    <br />
    <asp:Label ID="DbStatusLabel" runat="server"></asp:Label>
    <br />
    <asp:Label ID="XmlStatusLabel" runat="server"></asp:Label>
    <br />
    <br />
    <table>
        <colgroup>
            <col width="208px" />
            <col />
        </colgroup>
        <tr>
            <td>
                <asp:Label ID="lblCoffeeHouseId" runat="server" AssociatedControlID="InpCoffeeHouseID">ID на кафенето: *</asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="InpCoffeeHouseID" />
                <asp:RequiredFieldValidator ID="rfvBsID" ErrorMessage="Задължително поле ID на кафенето" ControlToValidate="InpCoffeeHouseID"
                    ForeColor="Red" Display="Dynamic" runat="server" ValidationGroup="CoffeeHouseValidationGroup" />
                <asp:CustomValidator ID="CustomValidatorCoffeeHouseID" ControlToValidate="InpCoffeeHouseID"
                    Display="Dynamic" ForeColor="Red" OnServerValidate="ValidateCoffeeHouseID" runat="server" ValidationGroup="CoffeeHouseValidationGroup" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCoffeeHouseName" runat="server" AssociatedControlID="InpCoffeeHouseName">Име на кафенето: *</asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="InpCoffeeHouseName" />
                <asp:RequiredFieldValidator ID="rfvBsName" ErrorMessage="Задължително поле Име на кафенето" ControlToValidate="InpCoffeeHouseName"
                    ForeColor="Red" Display="Dynamic" runat="server" ValidationGroup="CoffeeHouseValidationGroup" />
                <asp:RegularExpressionValidator ID="CoffeeHouseNameRegularExpressionValidator" runat="server"
                    ErrorMessage="Невалидни символи . / \ + , ; ' &quot; " ControlToValidate="InpCoffeeHouseName" ValidationExpression="[^./\+,;'&quot;]+"
                    ForeColor="Red" Display="Dynamic" ValidationGroup="CoffeeHouseValidationGroup" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" AssociatedControlID="working_time">Работно време: *</asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="working_time" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Задължително поле работно време" ControlToValidate="working_time"
                    ForeColor="Red" Display="Dynamic" runat="server" ValidationGroup="CoffeeHouseValidationGroup" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                    ErrorMessage="Невалидни символи . / \ + , ; ' : &quot; " ControlToValidate="working_time" ValidationExpression="[^./\+,;':&quot;]+"
                    ForeColor="Red" Display="Dynamic" ValidationGroup="CoffeeHouseValidationGroup" />
            </td>
        </tr>
    </table>
    <fieldset>
        <legend>Контакти</legend>
        <table>
            <colgroup>
                <col width="202px" />
                <col />
            </colgroup>
            <tbody>
                <tr>
                    <td>
                        <asp:Label ID="lblNumber" runat="server" AssociatedControlID="InpNumber">Телефонен номер: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="InpNumber" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ErrorMessage="Задължително поле телефонен номер" ControlToValidate="InpNumber"
                            ForeColor="Red" Display="Dynamic" runat="server" ValidationGroup="CoffeeHouseValidationGroup" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblEmail" runat="server" AssociatedControlID="InpEmail">Имейл: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="InpEmail" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ErrorMessage="Задължително поле Имейл" ControlToValidate="InpEmail"
                            ForeColor="Red" Display="Dynamic" runat="server" ValidationGroup="CoffeeHouseValidationGroup" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelSite" runat="server" AssociatedControlID="InpSite">Сайт: *</asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ErrorMessage="Задължително поле Имейл" ControlToValidate="InpSite"
                            ForeColor="Red" Display="Dynamic" runat="server" ValidationGroup="CoffeeHouseValidationGroup" />
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="InpSite" />
                    </td>
                </tr>
            </tbody>
        </table>
    </fieldset>
    <fieldset>
        <legend>Магазини</legend>
        <table>
            <colgroup>
                <col width="202px" />
                <col />
            </colgroup>
            <tbody>
                <tr>
                    <td>
                        <asp:Label ID="LabelCountry" runat="server" AssociatedControlID="InpCountry">Държава: </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="InpCountry" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCity" runat="server" AssociatedControlID="InpCity">Град: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="InpCity" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ErrorMessage="Задължително поле Град" ControlToValidate="InpCity"
                            ForeColor="Red" Display="Dynamic" runat="server" ValidationGroup="CoffeeHouseValidationGroup" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblStreet" runat="server" AssociatedControlID="InpStreet">Улица: </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="InpStreet" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblBuildingNumber" runat="server" AssociatedControlID="InpBuildingNumber">Номер на сграда: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="InpBuildingNumber" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ErrorMessage="Задължително поле Номер на сграда" ControlToValidate="InpBuildingNumber"
                            ForeColor="Red" Display="Dynamic" runat="server" ValidationGroup="CoffeeHouseValidationGroup" />
                    </td>
                </tr>
            </tbody>
        </table>
    </fieldset>
    <fieldset>
        <legend>Служител</legend>

        <asp:ListView ID="EmployeeListView" runat="server" ItemType="CoffeeHouse.CoffeeHousesModels.Employee" DataKeyNames="Id" ItemPlaceholderID="EmpTable"
            SelectMethod="EmployeeListView_GetData" InsertItemPosition="FirstItem" InsertMethod="EmployeeListView_InsertItem">

            <LayoutTemplate>
                <table runat="server" id="EmployeesTable">
                    <colgroup>
                        <col width="208px" />
                        <col />
                    </colgroup>
                    <tr runat="server" id="EmpTable" />
                </table>
            </LayoutTemplate>

            <ItemSeparatorTemplate>
                <tr runat="server">
                    <td colspan="2">
                        <hr />
                    </td>
                </tr>
            </ItemSeparatorTemplate>

            <ItemTemplate>
                <tr runat="server">
                    <td>
                        <asp:Label ID="LabelEmpId" runat="server" AssociatedControlID="InpEID">ИД </asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="InpEID" Text='<%#: Item.id %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblName" runat="server" AssociatedControlID="InpName">Име </asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="InpName" Text='<%#: Item.emp_name %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" AssociatedControlID="Inpposition">Длъжност </asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="Inpposition" Text='<%#: Item.position %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelSex" runat="server" AssociatedControlID="Inpsex">Пол </asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="Inpsex" Text='<%#: Item.sex %>' />

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelInpSalary" runat="server" AssociatedControlID="InpSalary">Заплата </asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="InpSalary" Text='<%#: Item.salary %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelAge" runat="server" AssociatedControlID="InpAge">Възраст </asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="InpAge" Text='<%#: Item.age %>' />
                    </td>
                </tr>
            </ItemTemplate>

            <InsertItemTemplate>
                <tr runat="server">
                    <td>
                        <asp:Label ID="LabelEmpId" runat="server" AssociatedControlID="InpEID">ИД: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="InpEID" Text='<%#: BindItem.id %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="Задължително поле ID" ControlToValidate="InpEID"
                            ForeColor="Red" Display="Dynamic" runat="server" ValidationGroup="EployeeValidationGroup" />

                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="lblName" runat="server" AssociatedControlID="InpName">Име: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="InpName" Text='<%#: BindItem.emp_name %>' />
                        <asp:RequiredFieldValidator ID="rfvName" ErrorMessage="Задължително поле име" ControlToValidate="InpName"
                            ForeColor="Red" Display="Dynamic" runat="server" ValidationGroup="EployeeValidationGroup" />
                    </td>
                </tr>
                <tr id="Tr2" runat="server">
                    <td>
                        <asp:Label ID="Labelposition" runat="server" AssociatedControlID="Inpposition">Длъжност: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="Inpposition" Text='<%#: BindItem.position %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ErrorMessage="Задължително поле Длъжност" ControlToValidate="Inpposition"
                            ForeColor="Red" Display="Dynamic" runat="server" ValidationGroup="EployeeValidationGroup" />
                        <asp:RegularExpressionValidator ID="InppositionNameRegularExpressionValidator" runat="server"
                    ErrorMessage="Разрешени възможности Продавач|Готвач|Чистач|Управител " ControlToValidate="Inpposition" ValidationExpression="\b(Продавач|Готвач|Чистач|Управител)\b+"
                    ForeColor="Red" Display="Dynamic" ValidationGroup="EployeeValidationGroup" />
                    </td>
                </tr>
                <tr id="Tr5" runat="server">
                    <td>
                        <asp:Label ID="LabelSex" runat="server" AssociatedControlID="Inpsex">Пол: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="Inpsex" Text='<%#: BindItem.sex %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ErrorMessage="Задължително поле Пол" ControlToValidate="Inpsex"
                            ForeColor="Red" Display="Dynamic" runat="server" ValidationGroup="EployeeValidationGroup" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                    ErrorMessage="Разрешени възможности Мъж | Жена " ControlToValidate="Inpsex" ValidationExpression="\b(Мъж|Жена)\b+"
                    ForeColor="Red" Display="Dynamic" ValidationGroup="EployeeValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="LabelInpSalary" runat="server" AssociatedControlID="InpSalary">Заплата: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="InpSalary" Text='<%#: BindItem.salary %>' />
                        <asp:RequiredFieldValidator ID="rfvInpSalary" ErrorMessage="Задължително поле заплата" ControlToValidate="InpSalary"
                            ForeColor="Red" Display="Dynamic" runat="server" ValidationGroup="EployeeValidationGroup" />
                        <asp:CompareValidator ID="InpSalaryCompareValidator" runat="server" ErrorMessage="Заплатата трябва да е положително десетично число"
                            ForeColor="Red" Display="Dynamic"
                            ValidationGroup="EployeeValidationGroup" Type="Double" ValueToCompare="0" Operator="GreaterThan" ControlToValidate="InpSalary" CultureInvariantValues="True" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="LabelAge" runat="server" AssociatedControlID="InpAge">Възраст: </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="InpAge" Text='<%#: BindItem.age %>' />
                          <asp:CompareValidator ID="CompareValidatorAge" runat="server" ErrorMessage="Възрастта трябва да е положително десетично число"
                            ForeColor="Red" Display="Dynamic"
                            ValidationGroup="EployeeValidationGroup" Type="Double" ValueToCompare="0" Operator="GreaterThan" ControlToValidate="InpAge" CultureInvariantValues="True" />
                    </td>
                </tr>
                <tr id="Tr10" runat="server">
                    <td colspan="2">
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Добавяне на служител" ValidationGroup="EployeeValidationGroup" />
                        <asp:Button ID="CanceltButton" runat="server" CausesValidation="false" CommandName="Cancel" Text="Изчистване на полетата" ValidationGroup="CancelValidationGroup" />

                        <asp:ValidationSummary ID="EployeeValidationGroup" runat="server" ValidationGroup="EployeeValidationGroup" />
                    </td>
                </tr>
            </InsertItemTemplate>
        </asp:ListView>
    </fieldset>

    <fieldset>
        <legend>Продукти</legend>

        <asp:ListView ID="ProductsListView" runat="server" ItemType="CoffeeHouse.CoffeeHousesModels.Product" DataKeyNames="Id" ItemPlaceholderID="itemPlaceholder"
            SelectMethod="ProductsListView_GetData" InsertItemPosition="LastItem" InsertMethod="ProductsListView_InsertItem">

            <LayoutTemplate>
                <table runat="server" id="ProductsTable">
                    <colgroup>
                        <col width="208px" />
                        <col />
                    </colgroup>
                    <tr runat="server" id="itemPlaceholder" />
                </table>
            </LayoutTemplate>

            <ItemSeparatorTemplate>
                <tr id="Tr1" runat="server">
                    <td colspan="2">
                        <hr />
                    </td>
                </tr>
            </ItemSeparatorTemplate>
            <ItemTemplate>
                <tr runat="server">
                    <td>
                        <asp:Label ID="ProductIDLabel" runat="server" AssociatedControlID="ProductID">ID на продукта:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="ProductID" Text='<%#: Item.Id %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="PriceLabel" runat="server" AssociatedControlID="Price">Цена:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="Price" Text='<%#: Item.price %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="ProductNameLabel" runat="server" AssociatedControlID="ProductName">Име на продукт:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="ProductName" Text='<%#: Item.product_name %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" AssociatedControlID="Description">Описание:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="Description" Text='<%#: Item.description %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <InsertItemTemplate>
                <tr runat="server">
                    <td>
                        <asp:Label ID="ProductIDLabel" runat="server" AssociatedControlID="ProductID">ID на продукта: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="ProductID" Text='<%#: BindItem.Id %>' />
                        <asp:RequiredFieldValidator ID="ProductIDRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле ID на продукта" ControlToValidate="ProductID" ForeColor="Red" Display="Dynamic" ValidationGroup="ProductInsertValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="PriceLabel" runat="server" AssociatedControlID="Price">Цена: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="Price" Text='<%#: BindItem.price %>' />
                        <asp:RequiredFieldValidator ID="PriceRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Цена" ControlToValidate="Price" ForeColor="Red" Display="Dynamic" ValidationGroup="ProductInsertValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="ProductNameLabel" runat="server" AssociatedControlID="ProductName">Име на продукт: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="ProductName" Text='<%#: BindItem.product_name %>' />
                        <asp:RequiredFieldValidator ID="ProductNameRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле ime na produkt" ControlToValidate="ProductName" ForeColor="Red" Display="Dynamic" ValidationGroup="ProductInsertValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" AssociatedControlID="Description">Описание:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="Description" Text='<%#: BindItem.description %>' />
                    </td>
                </tr>
                <td>
                    <fieldset>
                        <legend>Кафе</legend>
                        <asp:ListView ID="CoffeesListView" runat="server" ItemType="CoffeeHouse.CoffeeHousesModels.Coffee" DataKeyNames="Id" ItemPlaceholderID="itemPlaceholder"
                            SelectMethod="CoffeesListView_GetData" InsertItemPosition="FirstItem" InsertMethod="CoffeesListView_InsertItem" >

                            <LayoutTemplate>
                                <table runat="server" id="CoffeesTable">
                                    <fieldset>
                                        <colgroup>
                                            <col width="208px" />
                                            <col />
                                        </colgroup>
                                        <tr runat="server" id="itemPlaceholder" />
                                    </fieldset>
                                </table>
                            </LayoutTemplate>

                            <ItemSeparatorTemplate>
                                <tr id="Tr1" runat="server">
                                    <td colspan="2">
                                        <hr />
                                    </td>
                                </tr>
                            </ItemSeparatorTemplate>
                            <ItemTemplate>
                                 <tr id="Tr21" runat="server">
                                    <td>
                                        <asp:Label ID="CoffeeNameLabel" runat="server" AssociatedControlID="CoffeeName">Име на кафето </asp:Label>
                                    </td>
                                    <td>
                                        <asp:Literal runat="server" ID="CoffeeName" Text='<%#: BindItem.coffee_name %>' /> 
                                    </td>
                                </tr>
                                <tr id="Tr19" runat="server">
                                    <td>
                                        <asp:Label ID="drink_typeLabel" runat="server" AssociatedControlID="drink_type">Начин на консумация </asp:Label>
                                    </td>
                                    <td>
                                        <asp:Literal runat="server" ID="drink_type" Text='<%#: BindItem.drink_type %>' /> 
                                    </td>
                                </tr>
                                <tr id="Tr3" runat="server">
                                    <td>
                                        <asp:Label ID="Label3" runat="server" AssociatedControlID="coffee_type">Марка на кафето </asp:Label>
                                    </td>
                                    <td>
                                        <asp:Literal runat="server" ID="coffee_type" Text='<%#: BindItem.coffee_type %>' /> 
                                    </td>
                                </tr>
                                <tr id="Tr20" runat="server">
                                    <td>
                                        <asp:Label ID="LabelSupplement_price" runat="server" AssociatedControlID="supplement_price">Цена на добавката </asp:Label>
                                    </td>
                                    <td>
                                        <asp:Literal runat="server" ID="supplement_price" Text='<%#: BindItem.supplement_price %>' />
                                    </td>
                                </tr>
                                <tr id="Tr22" runat="server">
                                    <td>
                                        <asp:Label ID="Supplement_typeLabel" runat="server" AssociatedControlID="supplement_type">Вид на добавката </asp:Label>
                                    </td>
                                    <td>
                                        <asp:Literal runat="server" ID="supplement_type" Text='<%#: BindItem.supplement_type %>' /> 
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <tr id="Tr21" runat="server">
                                    <td>
                                        <asp:Label ID="CoffeeNameLabel" runat="server" AssociatedControlID="CoffeeName">Име на кафето:*</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="CoffeeName" Text='<%#: BindItem.coffee_name %>' />
                                        <asp:RequiredFieldValidator ID="CoffeeNameRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Име на кафето" ControlToValidate="CoffeeName" ForeColor="Red" Display="Dynamic" ValidationGroup="CoffeetInsertValidationGroup" />
                                    </td>
                                </tr>
                                <tr id="Tr19" runat="server">
                                    <td>
                                        <asp:Label ID="drink_typeLabel" runat="server" AssociatedControlID="drink_type">Начин на консумация: *</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="drink_type" Text='<%#: BindItem.drink_type %>' />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                    ErrorMessage="Разрешени възможности Гореща|Студена " ControlToValidate="drink_type" ValidationExpression="\b(Гореща|Студена)\b+"
                                    ForeColor="Red" Display="Dynamic" ValidationGroup="CoffeeInsertValidationGroup" />
                                    </td>
                                </tr>
                                 <tr id="Tr3" runat="server">
                                    <td>
                                        <asp:Label ID="Label3" runat="server" AssociatedControlID="coffee_type">Марка на кафето: *</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="coffee_type" Text='<%#: BindItem.coffee_type %>' />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorType" runat="server"
                            ErrorMessage="Задължително поле Марка на кафето" ControlToValidate="coffee_type" ForeColor="Red" Display="Dynamic" ValidationGroup="CoffeeInsertValidationGroup" />
                                    </td>
                                </tr>
                                <tr id="Tr20" runat="server">
                                    <td>
                                        <asp:Label ID="LabelSupplement_price" runat="server" AssociatedControlID="supplement_price">Цена на добавката:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="supplement_price" Text='<%#: BindItem.supplement_price %>' />
                                    </td>
                                </tr>
                                <tr id="Tr22" runat="server">
                                    <td>
                                        <asp:Label ID="Supplement_typeLabel" runat="server" AssociatedControlID="supplement_type">Вид на добавката:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="supplement_type" Text='<%#: BindItem.supplement_type %>' />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                    ErrorMessage="Разрешени възможности Захар|Канела|Мляко|Сметана|Без " ControlToValidate="supplement_type" ValidationExpression="\b(Захар|Канела|Мляко|Сметана|Без)\b+"
                                    ForeColor="Red" Display="Dynamic" ValidationGroup="CoffeeInsertValidationGroup" />
                                    </td>
                                </tr>
                                <tr id="Tr23" runat="server">
                                    <td colspan="2">
                                        <asp:Button ID="InsertButtonCoffee" runat="server" CommandName="Insert" Text="Добавяне на кафе" ValidationGroup="CoffeeInsertValidationGroup" />
                                        <asp:Button ID="CanceltButtonCoffee" runat="server" CausesValidation="false" CommandName="Cancel" Text="Изчистване на полетата" ValidationGroup="CancelValidationGroup" />
                                        <asp:ValidationSummary ID="CoffeeInsertValidationSummary" runat="server" ValidationGroup="CoffeeInsertValidationGroup" />
                                    </td>
                                </tr>
                            </InsertItemTemplate>
                        </asp:ListView>
                    </fieldset>
                </td>
                <tr></tr>
                <td>
                    <fieldset>
                        <asp:ListView ID="FoodListView" runat="server" ItemType="CoffeeHouse.CoffeeHousesModels.Food" DataKeyNames="Id" ItemPlaceholderID="itemPlaceholder"
                            SelectMethod="FoodListView_GetData" InsertItemPosition="FirstItem" InsertMethod="FoodListView_InsertItem">

                            <LayoutTemplate>
                                <legend>Храна</legend>
                                <table runat="server" id="FoodsTable">
                                    <colgroup>
                                        <col width="208px" />
                                        <col />
                                    </colgroup>
                                    <tr runat="server" id="itemPlaceholder" />
                                </table>
                            </LayoutTemplate>

                            <ItemSeparatorTemplate>
                                <tr id="Tr1" runat="server">
                                    <td colspan="2">
                                        <hr />
                                    </td>
                                </tr>
                            </ItemSeparatorTemplate>
                            <ItemTemplate>
                                <tr runat="server">
                                    <td>
                                        <asp:Label ID="FoodNameLabel" runat="server" AssociatedControlID="FoodName">Име на храната:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:Literal runat="server" ID="FoodName" Text='<%#: Item.food_name %>' />
                                    </td>
                                </tr>
                                <tr id="Tr11" runat="server">
                                    <td>
                                        <asp:Label ID="Labelfood_type" runat="server" AssociatedControlID="food_type">Тип на храната:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:Literal runat="server" ID="food_type" Text='<%#: Item.food_type %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>

                            <InsertItemTemplate>
                                <tr id="Tr21" runat="server">
                                    <td>
                                        <asp:Label ID="FoodNameLabel" runat="server" AssociatedControlID="FoodName">Име на храната: *</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="FoodName" Text='<%#: BindItem.food_name %>' />
                                    </td>
                                </tr>
                                <tr id="Tr19" runat="server">
                                    <td>
                                        <asp:Label ID="food_typeLabel" runat="server" AssociatedControlID="food_type">Тип на храната: *</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="food_type" Text='<%#: BindItem.food_type %>' />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                    ErrorMessage="Разрешени възможности Солено|Сладко " ControlToValidate="food_type" ValidationExpression="\b(Солено|Сладко)\b+"
                                    ForeColor="Red" Display="Dynamic" ValidationGroup="FoodInsertValidationGroup" />
                                    </td>
                                </tr>
                                <tr id="Tr23" runat="server">
                                    <td colspan="2">
                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Добавяне на храна" ValidationGroup="FoodInsertValidationGroup" />
                                        <asp:Button ID="CanceltButton" runat="server" CausesValidation="false" CommandName="Cancel" Text="Изчистване на полетата" ValidationGroup="CancelValidationGroup" />

                                        <asp:ValidationSummary ID="FoodInsertValidationSummary" runat="server" ValidationGroup="FoodInsertValidationGroup" />
                                    </td>
                                </tr>
                            </InsertItemTemplate>
                        </asp:ListView>
                    </fieldset>
                </td>
                <tr id="Tr8" runat="server">
                    <td colspan="2">
                        <asp:Button ID="InsertButtonProduct" runat="server" CommandName="Insert" Text="Добавяне на продукт" ValidationGroup="ProductInsertValidationGroup" />
                        <asp:Button ID="CanceltButtonProduct" runat="server" CausesValidation="false" CommandName="Cancel" Text="Изчистване на полетата" ValidationGroup="CancelValidationGroup" />

                        <asp:ValidationSummary ID="ProductInsertValidationSummary" runat="server" ValidationGroup="ProductInsertValidationGroup" />
                    </td>
                </tr>

            </InsertItemTemplate>

        </asp:ListView>
    </fieldset>
    <fieldset>
        <legend>Подарък:</legend>
        <table>
            <colgroup>
                <col width="202px" />
                <col />
            </colgroup>
            <tbody>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" AssociatedControlID="InpGiftName">Име на подарък:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="InpGiftName" />
                        <asp:RequiredFieldValidator ID="ProductIDRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле име на подарък" ControlToValidate="InpGiftName" ForeColor="Red" Display="Dynamic" ValidationGroup="GiftInsertValidationGroup" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" AssociatedControlID="InpGiftType">Вид на подарък: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="InpGiftType" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                    ErrorMessage="Разрешени възможности Храна|Кафе|Отстъпка|Ваучер " ControlToValidate="InpGiftType" ValidationExpression="\b(Храна|Кафе|Отстъпка|Ваучер)\b+"
                                    ForeColor="Red" Display="Dynamic" ValidationGroup="GiftInsertValidationGroup" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" AssociatedControlID="InpGiftReason">Причина: </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="InpGiftReason" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                    ErrorMessage="Разрешени възможности Редовен|Покупка " ControlToValidate="InpGiftReason" ValidationExpression="\b(Редовен|Покупка)\b+"
                                    ForeColor="Red" Display="Dynamic" ValidationGroup="GiftInsertValidationGroup" />
                    </td>
                </tr>
            </tbody>
        </table>
    </fieldset>
    <asp:Button ID="SubmitButton" runat="server" Text="Запис на кафене" ValidationGroup="CoffeeHouseValidationGroup" OnClick="SubmitButton_Click" />

    <asp:ValidationSummary ID="CoffeeHouseValidationSummary" runat="server" ValidationGroup="CoffeeHouseValidationGroup" />

</asp:Content>
