using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HelloLLLLL.Blog.Models;

namespace HelloLLLLL.Blog.Admin.page
{
    public partial class LLComment : System.Web.UI.Page
    {
        public List<Pinglun> ListPingLuns;
        protected void Page_Load(object sender, EventArgs e)
        {
            ListPingLuns = TestData.GetLLComment();
        }
    }
}