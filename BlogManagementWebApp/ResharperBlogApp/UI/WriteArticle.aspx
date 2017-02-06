<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="WriteArticle.aspx.cs" Inherits="ResharperBlogApp.UI.WriteArticle" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/demo.css" rel="stylesheet" />
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/font-awesome.css" rel="stylesheet" />
    <link href="../froala_editor_1.2.7/css/froala_editor.css" rel="stylesheet" />
    <link href="../froala_editor_1.2.7/css/froala_style.css" rel="stylesheet" />
    <link href="../Content/OwnStyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
<%@ Import Namespace="ResharperBlogApp.BLL" %>
<%@ Import Namespace="ResharperBlogApp.Model" %>
<% 
    ManagerArticle aManagerArticle = new ManagerArticle();
    User user = (User)Session["user"];
    List<Article> articleList = aManagerArticle.GetArticleListByUserId(user.Id);
%>
   
    <div class="row">
        <div class="col-lg-8">
            <section id="Body2">
                     <h4>
               Write an Article : 
                </h4>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Title of Article: "></asp:Label>
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
                            <asp:DropDownList ID="categoryDropDownList" runat="server" Width="127px" Height="30px">
                               
                            </asp:DropDownList>
                        </td>
                    </tr>

                </table>
                <textarea id="edit" runat="server">                    
                </textarea>
                <asp:Button ID="createNewButton" runat="server" Text="Create new" OnClick="createNewButton_Click" />
                <asp:Button ID="saveButton" runat="server" Text="Create" OnClick="saveButton_Click" />
                <asp:Button ID="publishButton" runat="server" Text="Publish" OnClick="publishButton_Click" Visible="false"/>
            </section>
             <div runat="server" id="show">
            
        </div>
       
            
        </div>
        <div class="col-lg-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">My articles</h3>
                </div>
                <div class="panel-body">
                <%
                    for (int index = 1; index <= articleList.Count; index++)
                    {
                    %>
                    <div class="media">
                        <div class="media-left media-middle">
                            <a href="WriteArticle.aspx?articleId=<%=articleList[index-1].Id%>">
                                <%
                                   string source = articleList[index - 1].Content;
                                   var reg = new Regex("src=(?:\"|\')?(?<imgSrc>[^>]*[^/].(?:jpg|bmp|gif|png))(?:\"|\')?");
                                   var match = reg.Match(source);
                                   if (match.Success)
                                   {
                                       var encod = match.Groups["imgSrc"].Value;
                                %>
                                <img class="media-object" src="<%= encod %>" height="64" width="64"/>
                                <%
                                   }
                                   else
                                   {
                                %>
                                <img class="media-object" src="../../images/commentor.png" height="64" width="64"/>
                                <%
                                   }
                                %>
                            </a>
                        </div>
                        <div class="media-body">
                            <a href="WriteArticle.aspx?articleId=<%=articleList[index-1].Id%>">
                                <h4 class="media-heading"><%=articleList[index-1].Title %></h4>
                            </a>
                            <p>
                                <%
                                string content = articleList[index - 1].Content;
                                string stripped=Regex.Replace(content, "<.*?>", string.Empty);
                                int length = stripped.Length;
                                if (length > 20)
                                {
                                length = 20;
                                }
                                Response.Write(stripped.Substring(0,length));
                                %>
                            </p>
                            <p style="color:red; font-weight:bold;">
                                <%
                                if (articleList[index - 1].Status)
                                {
                                    Response.Write("Published");
                                }
                                else 
                                {
                                    Response.Write("Not published");
                                }
                                 %>
                            </p>
                        </div>
                    </div>
                    <%
                    }
                    %>
                </div>
            </div>
        </div>        
    </div>
 

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
             $('#body_edit').editable({ inlineMode: false, height: 250, alwaysBlank: true })
         });
  </script>

    <!-- Latest compiled JavaScript -->
    <%--<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>--%>
        <script src="../Scripts/bootstrap.js"></script>
</asp:Content>
