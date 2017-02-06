<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArticleUI.aspx.cs" Inherits="ResharperBlogApp.UI.ArticleUI" validateRequest="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

   <%-- <title>
        <asp:ContentPlaceHolder ID="title" runat="server"></asp:ContentPlaceHolder>
    </title>--%>
    <!-- Latest compiled and minified CSS -->
  <%--  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>--%>
    <link href="../Content/demo.css" rel="stylesheet" />
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/font-awesome.css" rel="stylesheet" />
    <link href="../froala_editor_1.2.7/css/froala_editor.css" rel="stylesheet" />
    <link href="../froala_editor_1.2.7/css/froala_style.css" rel="stylesheet" />
    <link href="../Content/OwnStyleSheet.css" rel="stylesheet" />

  
   
</head>
    <body>
<form id="Form1" class="navbar-form navbar" role="search" runat="server">
      <section>
        <img src="../../images/banner.jpg" class="img-responsive" alt="Cinque Terre" />
    </section>


  <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">ResharperBlog</a>
                </div>
                <div>
                    <ul class="nav navbar-nav">
                        <li class=""><a href="Home.aspx">Home</a></li>
                      <%--  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Page 1-1</a></li>
                                <li><a href="#">Page 1-2</a></li>
                                <li><a href="#">Page 1-3</a></li>
                            </ul>
                        </li>--%>
                        <li><a href="ArticleUI.aspx">Write an Article</a></li>
                        <li><a href="#">About us</a></li>
                    </ul>
                   
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Enter you Keyword" />
                    </div>
                    <button type="submit" class="btn btn-default">Search</button>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="SignUp.aspx"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
                        <li><a href="Login.aspx"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>
  <%--  <asp:ContentPlaceHolder ID="body" runat="server">
        
    </asp:ContentPlaceHolder>--%>
         <div class="row">
        <div class="col-lg-8">
            <section id="Body2">
                     <h4>
               Write an Article : 
                </h4>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Title of Article :"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="titleTextBox" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Choose the Categories :"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="127px" Height="30px">
                               
                            </asp:DropDownList>
                        </td>
                    </tr>

                </table>
                <textarea id="edit" runat="server">
                    
                </textarea>
                <asp:Button ID="saveButton" runat="server" Text="Save" OnClick="saveButton_Click" />
                   <%--  <br />
                     <asp:Label ID="lblArticle" runat="server" Text=""></asp:Label>--%>
            </section>
             <div runat="server" id="show">
            
        </div>
       
            
        </div>
        <div class="col-lg-4">
            
        </div>
        
    </div>
  
    <div class="panel-footer">
        <span>
            <a id="iconTwitter" target="_blank" href="https://twitter.com" title="Follow on Twitter">Twitter </a>
        </span>
        <span>| </span>
        <span>
            <a id="iconFacebook" target="_blank" href="https://facebook.com" title="Facebook Page">Facebook </a>
        </span>
        <span>| </span>
        <span>
            <a id="iconYouTube" target="_blank" href="https://YouTube.com" title="YouTube Channel">YouTube</a>
        </span>
       
        <span>

          <a id="footer1">
www.resharper.org 
</a>  
        </span></div>

    <!-- jQuery library -->
<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>--%>
        <script src="../Scripts/jquery-2.1.4.js"></script>
        <script src="../froala_editor_1.2.7/js/froala_editor.min.js"></script>
        <script src="../froala_editor_1.2.7/js/plugins/tables.min.js"></script>
        <script src="../froala_editor_1.2.7/js/plugins/lists.min.js"></script>
        <script src="../froala_editor_1.2.7/js/plugins/colors.min.js"></script>
        <script src="../froala_editor_1.2.7/js/plugins/media_manager.min.js"></script>
        <script src="../froala_editor_1.2.7/js/plugins/font_family.min.js"></script>
        <script src="../froala_editor_1.2.7/js/plugins/font_size.min.js"></script>
        <script src="../froala_editor_1.2.7/js/plugins/block_styles.min.js"></script>
        <script src="../froala_editor_1.2.7/js/plugins/video.min.js"></script>
     <script>
         $(function () {
             $('#edit').editable({ inlineMode: false, height: 250, alwaysBlank: true })
         });
  </script>

    <!-- Latest compiled JavaScript -->
    <%--<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>--%>
        <script src="../Scripts/bootstrap.js"></script>
</form>
</body>

</html>