using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JilinUniversity
{
    /// <summary>
    /// 存储某一页面的名字和url
    /// 2020.05.11
    /// 徐可
    /// </summary>
    public partial class menu
    {

        public string menuName { get; set; }

        public string url { get; set; }

    }

    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label_userName.Text = (string)Session["UserName"];

            List<menu> Seller = new List<menu>(); //usertype=2为商家，显式商家能看的界面
            List<menu> User = new List<menu>();  //usertype=1为用户，只显示用户可以看的界面
            List<menu> Admins = new List<menu>();  //usertypw=0 为管理员，显示管理员可以看的界面
            //*****************************************************************************
            //每次新建页面，在这个部分里面添加页面的相关信息，就可以显示出来了。
            menu UsrOne = new menu();
            UsrOne.menuName = "课题管理";
            UsrOne.url = @"user/TopicManage.aspx";
            User.Add(UsrOne);
            menu UsrTwo = new menu();
            UsrTwo.menuName = "实验管理";
            UsrTwo.url = @"user/ExperimentManage.aspx";
            User.Add(UsrTwo);
            menu UserThree = new menu();
            UserThree.menuName = "成果管理";
            UserThree.url = @"user/ResultManage.aspx";
            User.Add(UserThree);

            menu MagOne = new menu();
            MagOne.menuName = "用户管理";
            MagOne.url = @"manager/UserManage.aspx";
            Admins.Add(MagOne);
            menu MagTwo = new menu();
            MagTwo.menuName = "公告管理";
            MagTwo.url = @"manager/NoticeManage.aspx";
            Admins.Add(MagTwo);

            //******************************************************************************

            if (Int32.Parse(Session["UserType"].ToString()) == 0)
            {
                Show(Admins);
            }
            if (Int32.Parse(Session["UserType"].ToString()) == 1)
            {
                Show(User);
            }
            else if (Int32.Parse(Session["UserType"].ToString()) == 2)
            {
                Show(Seller);
            }
        }

        private void Show(List<menu> Page)
        {
            string[] span = new string[Page.Count];
            for (int i = 0; i < Page.Count; i++)
            {
                span[i] = "";
                if (string.IsNullOrEmpty(Page[i].url))
                    span[i] += @"<li><a href='#'>";
                else
                {
                    span[i] = string.Format("<li><a href=\'{0}\' onclick=\"addTab(\'{1}\',\'{2}\')\">",
                               Page[i].url, Page[i].menuName, Page[i].url);
                    span[i] += @"<img src='image/icon1.png' class='icon' />";
                    span[i] += Page[i].menuName;
                    span[i] += @"</a>";
                }
                span[i] += @"</li>";
            }
            string ul = "";
            foreach (string lal in span)
                ul += lal;
            demo_list.InnerHtml = ul;
        }
    }
}