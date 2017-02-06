using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using ResharperBlogApp.Model;

namespace ResharperBlogApp.DAL
{
    public class GatewayArticle
    {
        string connectionString = ConfigurationManager.ConnectionStrings["BlogConString"].ConnectionString;
        public int CreateArticle(Article aArticle)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "INSERT INTO ArticleTable(Title,Content,DateTime,UserId,CategoryId,Status,HitCounter) VALUES('" + aArticle.Title + "','" + aArticle.Content + "','" + aArticle.DateTime + "','" + aArticle.UserId + "','" + aArticle.CategoryId + "','" + aArticle.Status + "','" + aArticle.HitCounter + "')";
            SqlCommand sqlCommand = new SqlCommand(query, connection);
            connection.Open();
            int rowaffected= sqlCommand.ExecuteNonQuery();
            connection.Close();
            return rowaffected;
        }

        public int UpdateArticle(Article aArticle)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "UPDATE ArticleTable SET Title='" + aArticle.Title + "',Content='" + aArticle.Content + "',DateTime='" + aArticle.DateTime + "',UserId='" + aArticle.UserId + "',CategoryId='" + aArticle.CategoryId + "',Status='" + aArticle.Status + "',HitCounter='" + aArticle.HitCounter + "' WHERE Id='" + aArticle.Id + "'";
            SqlCommand sqlCommand = new SqlCommand(query, connection);
            connection.Open();
            int rowaffected = sqlCommand.ExecuteNonQuery();
            connection.Close();
            return rowaffected;
        }

        internal Article GetArticleById(int id)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM ArticleTable WHERE Id='" + id + "'";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            List<Article> articleList = new List<Article>();
            using (SqlDataReader sqlDataReader = command.ExecuteReader())
            {
                while (sqlDataReader.Read())
                {
                    Article article = new Article();
                    article.Id = int.Parse(sqlDataReader["Id"].ToString());
                    article.Title = sqlDataReader["Title"].ToString();
                    article.Content = WebUtility.HtmlDecode(sqlDataReader["Content"].ToString());
                    article.DateTime = (DateTime)sqlDataReader["Datetime"];
                    article.UserId = int.Parse(sqlDataReader["UserId"].ToString());
                    article.CategoryId = int.Parse(sqlDataReader["CategoryId"].ToString());
                    article.Status = (bool)sqlDataReader["Status"];
                    article.HitCounter = int.Parse(sqlDataReader["HitCounter"].ToString());
                    articleList.Add(article);

                }
                connection.Close();
            }

            if (articleList.Count == 0)
            {
                return null;
            }
            else
            {
                return articleList[0];
            }
        }

        public List<Article> GetAllArticleSortedByDateTime()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM ArticleTable WHERE Status='True' ORDER BY DateTime DESC";
            SqlCommand sqlCommand = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            List<Article> articleList = new List<Article>();
            while (sqlDataReader.Read())
            {
                Article article = new Article();
                article.Id = int.Parse(sqlDataReader["Id"].ToString());
                article.Title = sqlDataReader["Title"].ToString();
                article.Content = WebUtility.HtmlDecode(sqlDataReader["Content"].ToString());
                article.DateTime = (DateTime)sqlDataReader["Datetime"];
                article.UserId = int.Parse(sqlDataReader["UserId"].ToString());
                article.CategoryId = int.Parse(sqlDataReader["CategoryId"].ToString());
                article.Status = (bool)sqlDataReader["Status"];
                article.HitCounter = int.Parse(sqlDataReader["HitCounter"].ToString());
                articleList.Add(article);
            }
            connection.Close();
            return articleList;
        }

        public List<Article> GetArticleListSortedByHitCounter()
        {
         
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM ArticleTable WHERE Status='True' ORDER BY HitCounter DESC";
            SqlCommand sqlCommand = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            List<Article> articleList = new List<Article>();
            while (sqlDataReader.Read())
            {
                Article article = new Article();
                article.Id = int.Parse(sqlDataReader["Id"].ToString());
                article.Title = sqlDataReader["Title"].ToString();
                article.Content = WebUtility.HtmlDecode(sqlDataReader["Content"].ToString());
                article.DateTime = (DateTime)sqlDataReader["Datetime"];
                article.UserId = int.Parse(sqlDataReader["UserId"].ToString());
                article.CategoryId = int.Parse(sqlDataReader["CategoryId"].ToString());
                article.Status = (bool)sqlDataReader["Status"];
                article.HitCounter = int.Parse(sqlDataReader["HitCounter"].ToString());
                articleList.Add(article);
            }
            connection.Close();
            return articleList;
        }

        internal List<Article> GetArticleListByUserId(int userId)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM ArticleTable WHERE UserId='"+ userId +"' ORDER BY DateTime DESC";
            SqlCommand sqlCommand = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            List<Article> articleList = new List<Article>();
            while (sqlDataReader.Read())
            {
                Article article = new Article();
                article.Id = int.Parse(sqlDataReader["Id"].ToString());
                article.Title = sqlDataReader["Title"].ToString();
                article.Content = WebUtility.HtmlDecode(sqlDataReader["Content"].ToString());
                article.DateTime = (DateTime)sqlDataReader["Datetime"];
                article.UserId = int.Parse(sqlDataReader["UserId"].ToString());
                article.CategoryId = int.Parse(sqlDataReader["CategoryId"].ToString());
                article.Status = (bool)sqlDataReader["Status"];
                article.HitCounter = int.Parse(sqlDataReader["HitCounter"].ToString());
                articleList.Add(article);
            }
            connection.Close();
            return articleList;
        }
    }
}