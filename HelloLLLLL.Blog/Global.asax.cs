using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace HelloLLLLL.Blog
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // 在应用程序启动时运行的代码
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
        void Application_AuthenticateRequest(object sender, EventArgs e)
        {
            HttpApplication app = sender as HttpApplication;
            string url = app.Context.Request.Url.ToString().ToLower();
            if (!url.Contains(".ashx")&&url.Contains("admin")&&!url.Contains("adminlogin"))
            {
                if (!app.Context.Request.IsAuthenticated)
                {
                    app.Context.Response.Redirect("/Admin/AdminLogin.aspx");
                }
            }




        }
    }
}