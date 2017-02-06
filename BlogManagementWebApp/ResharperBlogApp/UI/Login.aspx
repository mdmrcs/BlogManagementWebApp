<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ResharperBlogApp.UI.Login" %>
<%@ MasterType VirtualPath="~/Main.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
     <div class="row">
        <div class="col-lg-8">

            <section id="Body1">
                <table style="width: 444px">
                    <h4>Login Here
                    </h4>
                    <br />

                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="Username" runat="server" Text="Username"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:TextBox ID="usernameTextBox" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="usernameTextBox" ErrorMessage="Please enter Username" ForeColor="Red" ValidationGroup="vs1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:TextBox ID="passwordTextBox" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="passwordTextBox" ErrorMessage="Please enter Password" ForeColor="Red" ValidationGroup="vs1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Button ID="loginButton" runat="server" Text="Login" ValidationGroup="vs1" OnClick="loginButton_Click" /><br />
                            <asp:Label ID="lblError" runat="server"></asp:Label><br />
   <%--                         <asp:LinkButton ID="LinkButton2" ForeColor="Blue" runat="server" PostBackUrl="../UI/RegistrationUI.aspx" OnClick="LinkButton2_Click">Register</asp:LinkButton>--%>

                        </td>
                    </tr>


                </table>
            </section>




        </div>
    <div class="col-lg-4">
    </div>
    </div>
</asp:Content>
