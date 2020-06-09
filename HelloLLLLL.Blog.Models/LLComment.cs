using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloLLLLL.Blog.Models
{
   public  class Pinglun
    {
        public int Id { get; set; }
        public int ArtId { get; set; }
        public string ArtTitle { get; set; }

        public string Pubnisher { get; set; }

        public string Content { get; set; }

        public DateTime PubnishTime { get; set; }


    }
}
