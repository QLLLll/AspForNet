using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloLLLLL.Blog.Models
{
    public class LoginInfo
    {
        public int Id { get; set; }
        public string Ip { get; set; }
        public string City { get; set; }
        public string UserName { get; set; }
        public string LoginDate { get; set; }
        public string UserOS { get; set; }
    }
    public class LoginInfoData
    {
        public int code { get; set; }
        public string msg { get; set; }
        public int count { get; set; }
        public List<LoginInfo> data { get; set; }
    }
}
