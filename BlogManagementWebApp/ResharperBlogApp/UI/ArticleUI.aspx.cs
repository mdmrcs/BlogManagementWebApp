using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ResharperBlogApp.BLL;
using ResharperBlogApp.Model;

namespace ResharperBlogApp.UI
{
    public partial class ArticleUI : System.Web.UI.Page
    {
       ManagerArticle aManagerArticle = new ManagerArticle();
       ManagerCategory aManagerCategory = new ManagerCategory();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["user"] == null)
            //{
            //    Session["articleMessage"] = "You must LogIn to write an article";
            //    Response.Redirect("LoginUI.aspx");
            //}
            List<Category> categorieList = aManagerCategory.GetAllCategory();
            if (!IsPostBack)
            {
                foreach (var index in categorieList)
                {
                    //categoryDropDownList.Items.Add(new ListItem(index.Name, index.Id.ToString()));
                    DropDownList1.Items.Add(new ListItem(index.Name, index.Id.ToString()));
                }
            }

        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            User user = (User) Session["user"];
            Article aArticle = new Article();
            aArticle.Content = Request.Form["edit"];
            //show.InnerHtml = aArticle.Content;
            aArticle.Title = titleTextBox.Text;
            aArticle.DateTime=DateTime.Now;
            aArticle.UserId = user.Id;
            aArticle.CategoryId = Convert.ToInt16(DropDownList1.SelectedValue);
            aArticle.Status = false;
            aArticle.HitCounter = 0;
            if (aManagerArticle.CreateArticle(aArticle) > 0)
            {
                Response.Redirect("Home.aspx");
            }


        }
    }

    
}