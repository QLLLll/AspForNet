using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloLLLLL.Blog.Models
{
   public static class TestData
    {
       public static List<Notice> getNotice()
        {
            List<Notice> listNotice = new List<Notice>();

            listNotice.Add(new Notice()
            {
                Id = 0,
                NoticeTime = "2020-12-12",
                Title = "更改一",
                NoticeContent = @"
                                界面足够简洁清爽。<br>
                                一个接口几行代码而已直接初始化整个框架，无需复杂操作。<br>
                                支持多tab，可以打开多窗口。<br>
                                支持无限级菜单和对font-awesome图标库的完美支持。<br>
                                失效以及报错菜单无法直接打开，并给出弹出层提示完美的线上用户体验。<br>
                                url地址hash定位，可以清楚看到当前tab的地址信息。<br>
                                刷新页面会保留当前的窗口，并且会定位当前窗口对应左侧菜单栏。<br>
                                移动端的友好支持。<br>
"
            });
            listNotice.Add(new Notice()
            {
                Id = 0,
                NoticeTime = "2020-12-12",
                Title = "更改一",
                NoticeContent = @"
                                界面足够简洁清爽。<br>
                                一个接口几行代码而已直接初始化整个框架，无需复杂操作。<br>
                                支持多tab，可以打开多窗口。<br>
                                支持无限级菜单和对font-awesome图标库的完美支持。<br>
                                失效以及报错菜单无法直接打开，并给出弹出层提示完美的线上用户体验。<br>
                                url地址hash定位，可以清楚看到当前tab的地址信息。<br>
                                刷新页面会保留当前的窗口，并且会定位当前窗口对应左侧菜单栏。<br>
                                移动端的友好支持。<br>
"
            });
            listNotice.Add(new Notice()
            {
                Id = 0,
                NoticeTime = "2020-11-12",
                Title = "更改2",
                NoticeContent = @"
                                keep running。<br>
                                测试测试。<br>
                               建站。<br>
                               
"
            });
            listNotice.Add(new Notice()
            {
                Id = 0,
                NoticeTime = "2011-12-12",
                Title = "更改3",
                NoticeContent = @"
                                url地址hash定位，可以清楚看到当前tab的地址信息。<br>
                                刷新页面会保留当前的窗口，并且会定位当前窗口对应左侧菜单栏。<br>
                                移动端的友好支持。<br>
"
            });



            return listNotice;

        }
   
        public static List<LLArticle> GetArticle()
        {
            List<LLArticle> lstArti = new List<LLArticle>();

            lstArti.Add(new LLArticle
            {
                Id = 1,
                Title = "博文一",
                Digest = "摘要一",
                Content = "12312431",
                ReadCount = 10,
                PresentCount = 20,
                CommentCount = 30,
                CreateTime = "2020-1-1 12:30",
                ReadPwd = "1234",
                ArtTypeName = new List<string> { "type1", "type2" },
                ArtType = new List<int> { 1, 2 }
            });
            lstArti.Add(new LLArticle
            {
                Id = 2,
                Title = "博文2",
                Digest = "摘要2",
                Content = "adfadfadwfadf",
                ReadCount = 10,
                PresentCount = 20,
                CommentCount = 30,
                CreateTime = "2010-2-1 12:30",
                ReadPwd = "",
                ArtTypeName = new List<string> { "type2", "type3" },
                ArtType = new List<int> { 1, 2 }
            });

            return lstArti;
        }
    
        public static List<LLType> GetLLType()
        {
            List<LLType> lstType = new List<LLType>();

            lstType.Add(new LLType()
            {
                Id = 1,
                TypeName = "type1"
            });
            lstType.Add(new LLType()
            {
                Id = 2,
                TypeName = "type2"
            });
            lstType.Add(new LLType()
            {
                Id = 3,
                TypeName = "type3"
            });
            lstType.Add(new LLType()
            {
                Id = 4,
                TypeName = "type4"
            });
            return lstType;
        }
    }
}
