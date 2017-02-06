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
    public partial class Login : System.Web.UI.Page
    {
        ManagerUser aManagerUser = new ManagerUser();

        protected void Page_Load(object sender, EventArgs e)
        {
            if ("logout".Equals(Request["state"]))
            {
                Session["user"] = null;
            }
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            User user = aManagerUser.GetUserByUsername(usernameTextBox.Text);

            if (user != null && user.Password.Equals(passwordTextBox.Text))
            {
                Session["user"] = user;
                Response.Redirect("WriteArticle.aspx");
            }
            else
            {
                lblError.Text = "Username and/or Password do not match.";
            }
        }
    }
}