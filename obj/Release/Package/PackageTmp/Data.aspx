<%@ Page Title="Data" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Data.aspx.cs" Inherits="ProjetEurial.Data" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <h1>Tableau de donnée</h1>

    <select runat="server" id="myListBox">
        <option value="option1">Equipe du matin</option>
        <option value="option2">Equipe de l'après-midi</option>
        <option value="option2">Equipe de nuit</option>
    </select>

    <label><input type="checkbox" runat="server" id="myCheckbox" value="id" />id</label>
    <label><input type="checkbox" runat="server" id="Checkbox1" value="name" />name</label>
    <label><input type="checkbox" runat="server" id="Checkbox2" value="email" />email</label>
    <label><input type="checkbox" runat="server" id="Checkbox3" value="phone" />phone</label>
    <label><input type="checkbox" runat="server" id="Checkbox4" value="adress" />adress</label>
    <label><input type="checkbox" runat="server" id="Checkbox5" value="created_at" />created_at</label>

    <br /><br /><br />

        <asp:GridView ID="GridView1" runat="server"></asp:GridView>

        <br />

        <asp:Button ID="ExportButton" runat="server" Text="Export to CSV" OnClick="ExportButton_Click" />

        <asp:TextBox ID="TextBoxLogin" runat="server"></asp:TextBox>
        <asp:Button ID="ButtonLogin" runat="server" Text="Login" OnClick="login_Click"/>
        <asp:Button ID="ButtonSave" runat="server" Text="Enrengistrer" OnClick="save_Click" Enabled="False"/>
        <asp:Button ID="ButtonRegister" runat="server" Text="Creer un compte" OnClick="register_Click"/>
        <asp:Button ID="ButtonRAZ" runat="server" Text="appliquer tout les champs" OnClick="RAZ_all"/>
        <asp:Button ID="ButtonRAZ_none" runat="server" Text="effacer champs" OnClick="RAZ_none"/>
        <asp:Button ID="ButtonRAZ_defaut" runat="server" Text="champs par defaut" OnClick="RAZ_defaut"/> 
        <asp:TextBox ID="TextBoxDebug" runat="server" style="width:20%"></asp:TextBox>

    </main>

</asp:Content>