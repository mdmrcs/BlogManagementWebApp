using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using ResharperBlogApp.DAL;
using ResharperBlogApp.Model;

namespace ResharperBlogApp.BLL
{
    public class ManagerArticle
    {
        GatewayArticle aGatewayArticle = new GatewayArticle();
        public int CreateArticle(Article aArticle)
        {
            return aGatewayArticle.CreateArticle(aArticle);
        }

        public int UpdateArticle(Article aArticle)
        {
            return aGatewayArticle.UpdateArticle(aArticle);
        }

        public Article GetArticleById(int id)
        {
            return aGatewayArticle.GetArticleById(id);
        }

        public List<Article> GetAllArticleSortedByDateTime()
        {
            return aGatewayArticle.GetAllArticleSortedByDateTime();
        }

        public List<Article> GetArticleListSortedByHitCounter()
        {
            return aGatewayArticle.GetArticleListSortedByHitCounter();
        }

        public List<Article> GetArticleListByUserId(int userId)
        {
            return aGatewayArticle.GetArticleListByUserId(userId);
        }
    }
}