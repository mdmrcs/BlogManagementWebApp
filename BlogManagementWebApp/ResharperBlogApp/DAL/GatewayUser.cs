using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using ResharperBlogApp.Model;

namespace ResharperBlogApp.DAL
{
    public class GatewayUser
    {
        string connectionString = ConfigurationManager.ConnectionStrings["BlogConString"].ConnectionString;
        public string SaveUser(User aUser)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "INSERT INTO UserTable VALUES ('"+ aUser.Username+"','"+aUser.Password+"','"+aUser.Name+"','"+aUser.Email+"','"+aUser.UserPic+"')";
            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();

            command.ExecuteNonQuery();

            connection.Close();

            return "Congratulation, Your Registration done Successfully";
        }

        public List<User> GetAllUser()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM UserTable";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader sqlDataReader = command.ExecuteReader();
            List<User> userList = new List<User>();
            while (sqlDataReader.Read())
            {
                User user = new User();
                user.Id = int.Parse(sqlDataReader["Id"].ToString());
                user.Username = sqlDataReader["Username"].ToString();
                user.Password = sqlDataReader["Password"].ToString();
                user.Name = sqlDataReader["Name"].ToString();
                user.Email = sqlDataReader["Email"].ToString();
                user.UserPic = sqlDataReader["UserPic"].ToString();
                userList.Add(user);
            }
            sqlDataReader.Close();
            connection.Close();
            return userList;
        }

        public User GetUserByUsername(string userName)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM UserTable WHERE Username='" + userName + "'";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader sqlDataReader = command.ExecuteReader();
            List<User> userList = new List<User>();
            while (sqlDataReader.Read())
            {
                User user = new User();
                user.Id = int.Parse(sqlDataReader["Id"].ToString());
                user.Username = sqlDataReader["Username"].ToString();
                user.Password = sqlDataReader["Password"].ToString();
                user.Name = sqlDataReader["Name"].ToString();
                user.Email = sqlDataReader["Email"].ToString();
                user.UserPic = sqlDataReader["UserPic"].ToString();
                userList.Add(user);
            }

            sqlDataReader.Close();
            connection.Close();

            if (userList.Count > 0)
            {
                return userList[0];
            }
            else
            {
                return null;
            }
        }
    }
}