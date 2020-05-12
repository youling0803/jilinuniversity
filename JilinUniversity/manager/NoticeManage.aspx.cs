using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JilinUniversity.manager
{
    public partial class notice
    {
        public int id { get; set; }

        public string noticeName { get; set; }
    }

    public partial class NoticeManage : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<notice> list = new List<notice>();
            notice ntc = new notice();
            ntc.id = 1;
            ntc.noticeName = "测试用显示数据";
            list.Add(ntc);
            notice ntc2 = new notice();
            ntc2.id = 2;
            ntc2.noticeName = "测试用显示数据2";
            list.Add(ntc2);
            Show(list);
        }

        protected void NewAddNotice(object sender, EventArgs e)
        {
            ShowModal();
        }

        protected void GetReason_Invalid(object sender, EventArgs e)
        {

        }

        private void Show(List<notice> Page)
        {
            string[] span = new string[Page.Count];
            for (int i = 0; i < Page.Count; i++)
            {
                span[i] = "";
                if (string.IsNullOrEmpty(Page[i].noticeName))
                    span[i] += @"<li><a href='#'>";
                else
                {
                    span[i] = string.Format("<li><a onclick =\"clickNews({0})\" href=\"#\">", Page[i].id);
                    span[i] += Page[i].noticeName;
                    span[i] += @"</a>";
                }
                span[i] += @"</li>";
            }
            string ul = "";
            foreach (string lal in span)
                ul += lal;
            notice_list.InnerHtml = ul;
        }

        protected void ShowNews_ServerClick(object sender, EventArgs e)
        {
            string i = HiddenFieldDetail.Value;
            ShowModal();
        }
    }
}