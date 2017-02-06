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
    public partial class SignUp : System.Web.UI.Page
    {
        ManagerUser aManagerUser = new ManagerUser();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signupButton_Click(object sender, EventArgs e)
        {
            User aUser = new User();
            aUser.Username = usernameTextBox.Text;
            aUser.Password = passwordTextBox.Text;
            aUser.Name = nameTextBox.Text;
            aUser.Email = emailTextBox.Text;
            aUser.UserPic = imageFileUpload.FileName;
            imageFileUpload.SaveAs(Server.MapPath("../images/") + imageFileUpload.FileName);
            lblresult.Text = aManagerUser.SaveUser(aUser);
            //if (aManagerUser.SaveUser(aUser)>1)
            //{
            //    lblresult.Text = "Congratulation, Your Registration done Successfully.";
            //}
            //else
            //{

            //}
            usernameTextBox.Text = "";
            passwordTextBox.Text = "";
            emailTextBox.Text = "";
            nameTextBox.Text = "";
        }
    }
}