using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ResharperBlogApp.DAL;
using ResharperBlogApp.Model;

namespace ResharperBlogApp.BLL
{
    public class ManagerCategory
    {
        GatewayCategory aGatewayCategory =new GatewayCategory();
        public List<Category> GetAllCategory()
        {
            return aGatewayCategory.GetAllCategory();

        }
    }
}