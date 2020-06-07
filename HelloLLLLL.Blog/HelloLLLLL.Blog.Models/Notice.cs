using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloLLLLL.Blog.Models
{
   public class Notice
    {
        public string Title { get; set; }
        public int Id { get; set; }
        public string NoticeTime { get; set; }
        public string  NoticeContent { get; set; }
    }
    public class NoticeData
    {
        public int code { get; set; }
        public string msg { get; set; }
        public int count { get; set; }
        public List<Notice> data { get; set; }
    }
}
