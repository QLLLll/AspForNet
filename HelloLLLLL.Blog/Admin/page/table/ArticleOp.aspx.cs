using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HelloLLLLL.Blog.Models;
namespace HelloLLLLL.Blog.Admin.page.table
{
    public partial class ArticleOp : System.Web.UI.Page
    {
       public List<LLType> ListType;
        public List<int> ListSelectType;
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = string.IsNullOrEmpty(Request["Id"]) ? -1:int.Parse(Request["Id"]) ;
            ListType = TestData.GetLLType();
            if(id>0)
            ListSelectType = TestData.GetArticle().Find(a => a.Id == id).ArtType;
        }
    }
}