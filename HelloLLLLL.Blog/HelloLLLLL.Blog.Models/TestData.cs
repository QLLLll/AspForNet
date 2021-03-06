﻿using System;
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
    }
}
