using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ResharperBlogApp.DAL;
using ResharperBlogApp.Model;

namespace ResharperBlogApp.BLL
{
    public class ManagerUser
    {
        GatewayUser aGatewayUser = new GatewayUser();
        public string SaveUser(User aUser)
        {
            return aGatewayUser.SaveUser(aUser);
        }

        public List<User> GetAllUser()
        {
            return aGatewayUser.GetAllUser();
        }

        public User GetUserByUsername(string userName)
        {
            return aGatewayUser.GetUserByUsername(userName);
        }
    }
}