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
    public partial class WriteArticle : System.Web.UI.Page
    {
        ManagerArticle aManagerArticle = new ManagerArticle();
        ManagerCategory aManagerCategory = new ManagerCategory();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateCategories();
                PopulateArticle();
            }
        }

        private void PopulateArticle()
        {
            if (Request["articleId"] != null)
            {
                int articleId;
                if (int.TryParse(Request["articleId"], out articleId))
                {
                    Article article = aManagerArticle.GetArticleById(int.Parse(Request["articleId"]));
                    titleTextBox.Text = article.Title;
                    categoryDropDownList.SelectedValue = article.CategoryId.ToString();
                    edit.Value = article.Content;
                    saveButton.Text = "Update";
                    publishButton.Visible = true;
                }
            }
        }

        private void PopulateCategories()
        {
            List<Category> categorieList = aManagerCategory.GetAllCategory();
            foreach (var index in categorieList)
            {
                categoryDropDownList.Items.Add(new ListItem(index.Name, index.Id.ToString()));
            }
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            User user = (User)Session["user"];
            Article aArticle = null;
            if (saveButton.Text.Equals("Create"))
            {
                aArticle = new Article();
            }
            else if (saveButton.Text.Equals("Update"))
            {
                aArticle = aManagerArticle.GetArticleById(int.Parse(Request["articleId"]));
            }

            aArticle.Title = titleTextBox.Text;
            aArticle.Content = Request.Form["ctl00$body$edit"];
            aArticle.CategoryId = Convert.ToInt16(categoryDropDownList.SelectedValue);
            aArticle.DateTime = DateTime.Now;

            if (saveButton.Text.Equals("Create"))
            {
                aArticle.UserId = user.Id;
                aArticle.Status = false;
                aArticle.HitCounter = 0;
                if (aManagerArticle.CreateArticle(aArticle) > 0)
                {
                    Response.Redirect("WriteArticle.aspx");
                }
            }
            else if (saveButton.Text.Equals("Update"))
            {
                if (aManagerArticle.UpdateArticle(aArticle) > 0)
                {
                    Response.Redirect("WriteArticle.aspx");
                }
            }
        }

        protected void publishButton_Click(object sender, EventArgs e)
        {
            User user = (User)Session["user"];
            Article aArticle = aManagerArticle.GetArticleById(int.Parse(Request["articleId"]));
            aArticle.Content = Request.Form["ctl00$body$edit"];
            aArticle.Title = titleTextBox.Text;
            aArticle.DateTime = DateTime.Now;
            aArticle.CategoryId = Convert.ToInt16(categoryDropDownList.SelectedValue);
            aArticle.Status = true;
            if (aManagerArticle.UpdateArticle(aArticle) > 0)
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void createNewButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("WriteArticle.aspx");
        }
    }
}