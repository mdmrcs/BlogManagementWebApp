using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ResharperBlogApp
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                signUp.Visible = false;
                login.Visible = false;
                logOut.Visible = true;
                writeArticle.Visible = true;
            }
            else
            {
                signUp.Visible = true;
                login.Visible = true;
                logOut.Visible = false;
                writeArticle.Visible = false;
            }
        }
    }
}