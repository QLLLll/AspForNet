using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
using HelloLLLLL.Blog.Common;
using HelloLLLLL.Blog.Models;
using System.Web.SessionState;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace HelloLLLLL.Blog.Admin
{
    /// <summary>
    /// AdminPostData 的摘要说明
    /// </summary>
    public class AdminPostData : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";

            string action = context.Request.QueryString["action"];
            if (string.Compare(action, "adminLogin", false) == 0)
            {
                int varifyCode = 0;
                if (int.TryParse(context.Request["captcha"], out varifyCode))
                {
                    string json = string.Empty;
                    Debug.Write(varifyCode);
                    int sCode = -1;
                    var o = context.Session["varifyCode"];
                    if (o == null)
                    {
                        json = JsonConvert.SerializeObject(new { IsOk = "NoOk", Msg = "请刷新验证码再试" });
                        context.Response.Write(json);
                        return;
                    }
                    sCode = int.Parse(o.ToString());

                    if (sCode == varifyCode)
                    {
                        //验证用户名密码

                        FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, "admin", DateTime.Now, DateTime.Now.AddMinutes(30), false, "password", "/");
                        string authticket = FormsAuthentication.Encrypt(ticket);
                        HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, authticket);
                        cookie.Secure = false;
                        cookie.Expires = ticket.Expiration;
                        cookie.Path = FormsAuthentication.FormsCookiePath;
                        context.Response.Cookies.Add(cookie);

                        json = JsonConvert.SerializeObject(new { IsOk = "Ok" });
                        context.Response.Write(json);
                    }
                    else
                    {
                        json = JsonConvert.SerializeObject(new { IsOk = "NoOk", Msg = "验证码输入有误，请刷新验证码" });
                        context.Response.Write(json);
                        return;
                    }
                }
                else
                {
                    string json = JsonConvert.SerializeObject(new { IsOk = "NoOk", Msg = "" });
                    context.Response.Write(json);
                    return;
                }


            }
            else if (string.Compare(action, "yzm", false) == 0)
            {
                ValidateCode c = new ValidateCode();
                string code = c.CreateValidateCode(4);
                context.Session["varifyCode"] = code;

                c.CreateValidateGraphic(code, context);

            }
            else if (string.Compare(action, "loginInfo", false) == 0)
            {
                context.Response.ContentType = "application/json";
                LoginInfoData data = new LoginInfoData();

                int page = int.Parse(context.Request["page"]);
                int limit = int.Parse(context.Request["limit"]);


                data.code = 0;
                data.msg = "ok";
                data.count = 6;

                List<LoginInfo> listInfo = new List<LoginInfo>();

                listInfo.Add(new LoginInfo()
                {
                    City = "重庆",
                    Id = 0,
                    Ip = "192.168.1.1",
                    UserName = "LLLL",
                    LoginDate = "2020-6-10 19:00:00",
                    UserOS = "win10"
                });
                listInfo.Add(new LoginInfo()
                {
                    City = "重庆",
                    Id = 1,
                    Ip = "192.168.1.1",
                    UserName = "LLLL",
                    LoginDate = "2020-6-10 19:00:00",
                    UserOS = "win10"
                });
                listInfo.Add(new LoginInfo()
                {
                    City = "重庆",
                    Id = 2,
                    Ip = "192.168.1.1",
                    UserName = "LLLL",
                    LoginDate = "2020-6-10 19:00:00",
                    UserOS = "win10"
                });
                listInfo.Add(new LoginInfo()
                {
                    City = "重庆",
                    Id = 3,
                    Ip = "192.168.1.1",
                    UserName = "LLLL",
                    LoginDate = "2020-6-10 19:00:00",
                    UserOS = "win10"
                });
                listInfo.Add(new LoginInfo()
                {
                    City = "重庆",
                    Id = 4,
                    Ip = "192.168.1.1",
                    UserName = "LLLL",
                    LoginDate = "2020-6-10 19:00:00",
                    UserOS = "win10"
                });
                listInfo.Add(new LoginInfo()
                {
                    City = "重庆",
                    Id = 5,
                    Ip = "192.168.1.1",
                    UserName = "LLLL",
                    LoginDate = "2020-6-10 19:00:00",
                    UserOS = "win10"
                });
                data.data = listInfo.Skip((page - 1) * limit).Take(limit).ToList();



                context.Response.Write(JsonConvert.SerializeObject(data));
            }
            else if (string.Compare(action, "notice", false) == 0)
            {
                context.Response.ContentType = "application/json";
                string p = context.Request["page"];
                string l = context.Request["limit"];
                int page = -1;
                if(!string.IsNullOrEmpty(p))
              page=  int.Parse(p);
                int limit = -1;
                if (!string.IsNullOrEmpty(l))
                 limit=int.Parse(l);

                NoticeData data = new NoticeData();
                data.code = 0;
                data.msg = "ok";
                var list = TestData.getNotice();
                if (page < 0 || limit < 0)
                {
                    data.data = list;
                }
                else
                {
                    data.data = list.Skip((page - 1) * limit).Take(limit).ToList();
                }
                data.count = list.Count();



                context.Response.Write(JsonConvert.SerializeObject(data));

            }
            else if (string.Compare(action, "uploadImg", false) == 0)
            {
                ImgJson iJson = new ImgJson();
                iJson.data = new List<string>();

                string dir = "\\UpImgs\\" + DateTime.Now.ToString("yyyyMMdd");
                string physicsPath = HttpContext.Current.Server.MapPath("~" + dir);
                if (!System.IO.Directory.Exists(physicsPath))
                {
                    System.IO.Directory.CreateDirectory(physicsPath);
                }
                for (int i = 0; i < context.Request.Files.Count; i++)
                {
                    string phPath = string.Empty;
                    //获取上传的文件的对象  
                    HttpPostedFile img = context.Request.Files[i];

                    //获取上传文件的名称  
                    string s = img.FileName;
                    var strFileExtension = s.Substring(s.LastIndexOf('.') + 1, s.Length - s.LastIndexOf('.') - 1);
                    string allowextension = System.Configuration.ConfigurationManager.AppSettings["ImageType"];
                    if (allowextension.ToLower().IndexOf(strFileExtension.ToLower()) >= 0)
                    {
                        int len = s.LastIndexOf(".") - s.LastIndexOf("\\") - 1;
                        string fileName = DateTime.Now.ToString("yyyyMMdd") + DateTime.Now.Millisecond.ToString();
                        string fullName = fileName + "."+strFileExtension;

                        //fileName = fileName.Replace(",", "");
                        //fullName = fullName.Replace(",", "");
                        //fullName = fullName.Replace(":", "");
                        //截取获得上传文件的名称(ie上传会把绝对路径也连带上，这里只得到文件的名称)  
                        //string str = System.Guid.NewGuid().ToString("N")+ s.Substring(s.LastIndexOf(".") - 1); // s.Substring(s.LastIndexOf("\\") + 1);
                        string path = dir + "\\" + fullName;
                        phPath = physicsPath + "//" + fullName;
                        //保存文件  
                        img.SaveAs(phPath);
                        iJson.data.Add(path);
                    }
              
                }
                if (iJson.data.Count > 0 && iJson.data.Count == context.Request.Files.Count)
                {
                    iJson.code = 1;
                }
                else
                {
                    iJson.code = 0;
                    iJson.msg = "上传图片出现错误";
                }
                context.Response.ContentType = "application/json";
                context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
                context.Response.Write(JsonConvert.SerializeObject(iJson));
            }
            else if (string.Compare(action, "uploadImg1", false) == 0)
            {


                context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
                try
                {
                    string dir = "\\UpImgs\\" + DateTime.Now.ToString("yyyyMMdd");
                    string physicsPath = HttpContext.Current.Server.MapPath("~" + dir);
                    if (!System.IO.Directory.Exists(physicsPath))
                    {
                        System.IO.Directory.CreateDirectory(physicsPath);
                    }
                    if (context.Request.Files.Count > 0)
                    {
                        string phPath = string.Empty;
                        //获取上传的文件的对象  
                        HttpPostedFile img = context.Request.Files[0];

                        //获取上传文件的名称  
                        string s = img.FileName;
                        var strFileExtension = s.Substring(s.LastIndexOf('.') + 1, s.Length - s.LastIndexOf('.') - 1);
                        string allowextension = System.Configuration.ConfigurationManager.AppSettings["ImageType"];
                        if (allowextension.ToLower().IndexOf(strFileExtension.ToLower()) >= 0)
                        {
                            int len = s.LastIndexOf(".") - s.LastIndexOf("\\") - 1;
                            string fileName = DateTime.Now.ToString("yyyyMMdd") + DateTime.Now.Millisecond.ToString();
                            string fullName = fileName + "." + strFileExtension;

                            //fileName = fileName.Replace(",", "");
                            //fullName = fullName.Replace(",", "");
                            //fullName = fullName.Replace(":", "");
                            //截取获得上传文件的名称(ie上传会把绝对路径也连带上，这里只得到文件的名称)  
                            //string str = System.Guid.NewGuid().ToString("N")+ s.Substring(s.LastIndexOf(".") - 1); // s.Substring(s.LastIndexOf("\\") + 1);
                            string path = dir + "\\" + fullName;
                            phPath = physicsPath + "//" + fullName;
                            string pp = path.Replace("\\", "/");
                            //保存文件  
                            img.SaveAs(phPath);
                            context.Response.Write(JsonConvert.SerializeObject(new {error=0,url= pp }));
                        }

                    }
                }
                catch (Exception)
                {
                    context.Response.Write(JsonConvert.SerializeObject(new { error = 1, message="上传图片出错" }));
                    throw;
                }
               
                
                
               
                //context.Response.Write(JsonConvert.SerializeObject());
            }
            else if (string.Compare(action, "noticeAE", false) == 0)
            {
                

                var id = context.Request["noticeId"];
                var title = context.Request["noticeTitle"];
                var content = context.Request["noticeContent"];
                var time = context.Request["DataStart"];
                DateTime time1 = DateTime.Now;
                if (!string.IsNullOrEmpty(time))
                {
                    time1 = Convert.ToDateTime(time);
                }

                //编辑
                if (!string.IsNullOrEmpty(id))
                {

                }
                else
                {//新增

                }
                context.Response.Write(JsonConvert.SerializeObject(new { IsOk = "Ok", msg = "操作完成" }));

            }
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}