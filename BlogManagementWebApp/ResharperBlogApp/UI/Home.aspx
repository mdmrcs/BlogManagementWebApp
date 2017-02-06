<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ResharperBlogApp.UI.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
     <%@ Import Namespace="ResharperBlogApp.BLL" %>
<%@ Import Namespace="ResharperBlogApp.Model" %>

<% 
    ManagerCategory aManagerCategory = new ManagerCategory();
    ManagerArticle aManagerArticle = new ManagerArticle();
    //List<Category> categoryList = aManagerCategory.GetAllCategory();
    List<Article> getArticleListSortedByDateTime = aManagerArticle.GetAllArticleSortedByDateTime();
    List<Article> getArticleListSortedByHitCounter = aManagerArticle.GetArticleListSortedByHitCounter();
    
%>
            <div class="container content">
            <div class="row">
                <div class="col-lg-8">

                    <h1 class="page-header">All Articles<small></small></h1>
                    <% 
                        int selectedPage = Convert.ToInt16(Request.QueryString["page"]);
                        int page = 1;
                        if (selectedPage > 1)
                        {
                            page = selectedPage;
                        }
                        aManagerArticle = new ManagerArticle();
                        List<Article> articleList = aManagerArticle.GetAllArticleSortedByDateTime();
                        int noOfArticles = articleList.Count;
                        int noOfPage = noOfArticles / 10 + 1;
                        int start = (page - 1) * 10 + 1;
                        int limit = (page - 1) * 10 + 10;
                        if (limit > noOfArticles)
                        {
                            limit = noOfArticles;
                        }
                        for (int index = start; index <= limit; index++)
                        {
                            Article article = articleList[index - 1];
                    %>
                    <h4>
                        <a href="ShowArticle.aspx?articleId=<%=article.Id%>"><%=article.Title %></a>
                    </h4>
                   
                    <% 
                        //User user = userManager.GetUserById(article.UserId);
                        
                    %>
                    <p>Author Name :Adnan Amin <%--<%""%>--%> &nbsp;&nbsp;<span class="glyphicon glyphicon-time"></span>Posted on : <%=article.DateTime.ToLongDateString()%> at <%=article.DateTime.ToLongTimeString() %></p>
                    <hr />
                    <div class="row">
                        <div class="col-lg-3">
                            <a href="ShowArticle.aspx?articleId=<%=article.Id%>">
                                <%
                        string source = article.Content;
                        var reg = new Regex("src=(?:\"|\')?(?<imgSrc>[^>]*[^/].(?:jpg|bmp|gif|png))(?:\"|\')?");
                        var match = reg.Match(source);
                        if (match.Success)
                        {
                            var encod = match.Groups["imgSrc"].Value;
                                %>
                                <img src="<%=encod %>" alt="" style="width: 200px" height="170" />
                                <%
                        }
                        else
                        {
                                %>
                                <img class="img-responsive" src="../images/Jellyfish.png" alt="" width="200" height="200" />
                                <% 
                        }    
                                %>
                            </a>
                        </div>
                        <div class="col-lg-9 article">
                            <p class="text-justify">
                                <%
                        string stripped = Regex.Replace(article.Content, "<.*?>", string.Empty);
                        int length = stripped.Length;
                        if (length > 500)
                        {
                            length = 500;
                        }
                        Response.Write(stripped.Substring(0, length));
                                %>
                        .....
                            </p>
                            <a class="btn btn-primary" href="ShowArticle.aspx?articleId=<%=article.Id%>">Read More <span class="glyphicon glyphicon-chevron-right"></span></a>
                        </div>
                    </div>
                    <hr />
                    <% }
                    %>
                </div>
  <div class="col-lg-4">
       <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Most Recent Articles</h3>
                </div>
                <div class="panel-body">
                    <%
                    int articlelimit = 5;
                    getArticleListSortedByDateTime = aManagerArticle.GetAllArticleSortedByDateTime();
                    getArticleListSortedByHitCounter = aManagerArticle.GetArticleListSortedByHitCounter();
                    if (getArticleListSortedByDateTime.Count < 5)
                    {
                    articlelimit = getArticleListSortedByDateTime.Count;
                    }
                    for (int index=1;index<=articlelimit;index++)
                    {
                    %>
                    <div class="media">
                        <div class="media-left media-middle">
                            <a href="ShowArticle.aspx?articleId=<%=getArticleListSortedByDateTime[index-1].Id%>">
                                <!--<img class="media-object" src="../..." alt="...">-->
                                <%
                                   string source = getArticleListSortedByDateTime[index - 1].Content;
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
                            <a href="ShowArticle.aspx?articleId=<%=getArticleListSortedByDateTime[index-1].Id%>">
                                <h4 class="media-heading"><%=getArticleListSortedByDateTime[index-1].Title %></h4>
                            </a>
                            <p>
                                <%
                                string content = getArticleListSortedByDateTime[index - 1].Content;
                                string stripped=Regex.Replace(content, "<.*?>", string.Empty);
                                int length = stripped.Length;
                                if (length > 20)
                                {
                                length = 20;
                                }
                                Response.Write(stripped.Substring(0,length));
                                %>
                            </p>
                        </div>
                    </div>
                    <%
                    }
                    %>
                </div>
            </div>

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Most Viewed Articles</h3>
                </div>
                <div class="panel-body">
                    <%
                    articlelimit = 5;
                    if (getArticleListSortedByHitCounter.Count < 5)
                    {
                    articlelimit = getArticleListSortedByHitCounter.Count;
                    }
                    for (int index = 1; index <= articlelimit; index++)
                    {
                    %>
                    <div class="media">
                        <div class="media-left media-middle">
                            <a href="ShowArticle.aspx?articleId=<%=getArticleListSortedByHitCounter[index-1].Id %>">
                                <!--<img class="media-object" src="../..." alt="...">-->
                                <%
                                   string source = getArticleListSortedByHitCounter[index - 1].Content;
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
                            <a href="ShowArticle.aspx?articleId=<%=getArticleListSortedByHitCounter[index-1].Id %>">
                                <h4 class="media-heading"><%=getArticleListSortedByHitCounter[index-1].Title %></h4>
                            </a>
                            <p>
                                <% 
                                string content = getArticleListSortedByHitCounter[index - 1].Content;
                                string stripped = Regex.Replace(content, "<.*?>", string.Empty);
                                int length = stripped.Length;
                                if (length > 20)
                                {
                                    length = 20;
                                }
                                Response.Write(stripped.Substring(0, length));
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
        </div>
</asp:Content>
