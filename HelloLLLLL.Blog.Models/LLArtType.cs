using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloLLLLL.Blog.Models
{
     class LLArtType
    {

        public int Id { get; set; }

        public string TypeTile { get; set; }

        public string   TypeDetail { get; set; }

        public string TypeCTime { get; set; }

        public DateTime CreateTime { get; set; }

        public int IsHidden { get; set; }

    }
}
