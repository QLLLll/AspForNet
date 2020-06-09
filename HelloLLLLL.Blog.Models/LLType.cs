using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloLLLLL.Blog.Models
{
    public class LLType
    {
        public int Id { get; set; }
        public string TypeName { get; set; }

        public string TypeDetail { get; set; }

        public string TypeCTime { get; set; }

        public DateTime CreateTime { get; set; }

        public int IsHidden { get; set; }

    }

    public class ArtTypeData
    {
        public int code { get; set; }
        public string msg { get; set; }
        public int count { get; set; }
        public List<LLType> data { get; set; }
    }
}
