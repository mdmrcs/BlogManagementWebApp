using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using ResharperBlogApp.Model;

namespace ResharperBlogApp.DAL
{
    public class GatewayCategory
    {
        string connectionString = ConfigurationManager.ConnectionStrings["BlogConString"].ConnectionString;
        public List<Category> GetAllCategory()
        {

            
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM CategoryTable";
            SqlCommand sqlCommand = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            List<Category> categorieList = new List<Category>();
            while (sqlDataReader.Read())
            {
                Category category = new Category();
                category.Id = int.Parse(sqlDataReader["Id"].ToString());
                category.Name = sqlDataReader["Name"].ToString();
                categorieList.Add(category);
            }
            return categorieList;
        }
    }
}