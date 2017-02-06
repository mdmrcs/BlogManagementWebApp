<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ResharperBlogApp.UI.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
     <div class="row">
        <div class="col-lg-8">
               <section id="Body1">
                    <table style="width: 464px">
                         <h4>Sign-Up Here</h4> 
                        <tr>
                            <td class="auto-style5"> <asp:Label ID="Label3" runat="server" Text="Username"></asp:Label></td>
                              <td class="auto-style4">
                                  <asp:TextBox ID="usernameTextBox" runat="server"></asp:TextBox> 
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter Username" ControlToValidate="usernameTextBox" ForeColor="Red" ValidationGroup="vs1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                         <tr>
                            <td class="auto-style5"> <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label></td>
                              <td class="auto-style3">
                                  <asp:TextBox ID="passwordTextBox" runat="server" TextMode="Password"></asp:TextBox> 
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter Password" ControlToValidate="passwordTextBox" ForeColor="Red" ValidationGroup="vs1"></asp:RequiredFieldValidator>
                             </td>
                        </tr>
                         <tr>
                            <td class="auto-style5"> <asp:Label ID="Label5" runat="server" Text="Confirm Password "></asp:Label></td>
                              <td class="auto-style3"> <asp:TextBox ID="confirmpasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter Password" ControlToValidate="confirmpasswordTextBox" ForeColor="Red" ValidationGroup="vs1"></asp:RequiredFieldValidator>
                             </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="nameTextBox" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td class="auto-style5"> <asp:Label ID="Label6" runat="server" Text="Email"></asp:Label></td>
                              <td class="auto-style3">
                                  <asp:TextBox ID="emailTextBox" runat="server"></asp:TextBox> 
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="emailTextBox" ErrorMessage="Please enter Email" ForeColor="Red" ValidationGroup="vs1"></asp:RequiredFieldValidator>
                             </td>
                        </tr>
                       
                         <tr>
                            <td class="auto-style5">
                                <asp:Label ID="Label7" runat="server" Text="Upload Picture"></asp:Label> </td>
                              <td class="auto-style3">
                                  <asp:FileUpload ID="imageFileUpload" runat="server" Width="216px" />
                                  <br />
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="imageFileUpload" ErrorMessage="Please upload Picture" ForeColor="Red" ValidationGroup="vs1"></asp:RequiredFieldValidator>
                             </td>
                        </tr>
                        <tr>
                            <td class="auto-style5"> <asp:Button ID="signupButton" runat="server" Text="Sign-Up" OnClick="signupButton_Click" ValidationGroup="vs1" />
                                <br />
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="confirmpasswordTextBox" ControlToValidate="passwordTextBox" ErrorMessage="Passwords must match" ForeColor="Red"></asp:CompareValidator>
                                <br />
                            </td>
                            <td class="auto-style3"><asp:Label ID="lblresult" runat="server"></asp:Label></td>
                        </tr>
                        <br/>
                        <br/>
                     
                       
                    </table>
                    
                </section>
        </div>
        <div class="col-lg-4">
            
        </div>
        
    </div>
</asp:Content>
