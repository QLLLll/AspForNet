using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloLLLLL.Blog.Models
{
    public class LLArticle
    {
        public int Id { get; set; }
        public string Title { get; set; }

        public string Digest { get; set; }

        public DateTime ArtTime { get; set; }
        public string CreateTime { get; set; }

        public DateTime LastUpdatetime { get; set; }

        public string Content { get; set; }

        public string ReadPwd { get; set; }

        public string Editor { get; set; }

        public List<int> ArtType { get; set; }

        public List<string> ArtTypeName { get; set; }

        public int PresentCount { get; set; }

        public int CommentCount { get; set; }

        public int ReadCount { get; set; }

    }

    public class ArticleData
    {
        public int code { get; set; }
        public string msg { get; set; }
        public int count { get; set; }
        public List<LLArticle> data { get; set; }
    }
}
