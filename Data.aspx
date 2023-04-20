<%@ Page Title="Data" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Data.aspx.cs" Inherits="ProjetEurial.Data" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <h1>Tableau de donnée</h1>

    <asp:CheckBox ID="CheckBox1" runat="server" Text="id" AutoPostBack="True" Checked="true" OnCheckedChanged="CheckBox_CheckedChanged" />
    <asp:CheckBox ID="CheckBox2" runat="server" Text="name" AutoPostBack="True" Checked="true" OnCheckedChanged="CheckBox_CheckedChanged" />
    <asp:CheckBox ID="CheckBox3" runat="server" Text="email" AutoPostBack="True" Checked="true" OnCheckedChanged="CheckBox_CheckedChanged" />
    <asp:CheckBox ID="CheckBox4" runat="server" Text="phone" AutoPostBack="True"  Checked="true" OnCheckedChanged="CheckBox_CheckedChanged" />
    <asp:CheckBox ID="CheckBox5" runat="server" Text="address" AutoPostBack="True" Checked="true" OnCheckedChanged="CheckBox_CheckedChanged" />
    <asp:CheckBox ID="CheckBox6" runat="server" Text="created_at" AutoPostBack="True" Checked="true" OnCheckedChanged="CheckBox_CheckedChanged" />
    

    <br /><br /><br />

        <asp:GridView ID="GridView1" runat="server"></asp:GridView>

        <br />

        <asp:Button ID="ExportButton" runat="server" Text="Export to CSV" OnClick="ExportButton_Click" />

        <br /><br />
        
    </main>

</asp:Content>