using ResharperBlogApp.BLL;
using ResharperBlogApp.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ResharperBlogApp.UI
{
    public partial class ShowArticle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int articleId;
            if (int.TryParse(Request["articleId"], out articleId))
            {
                ManagerArticle aManagerArticle = new ManagerArticle();
                Article article = aManagerArticle.GetArticleById(articleId);
                if (article != null)
                {
                    articlePanel.InnerHtml = article.Content;
                }
            }
        }
    }
}