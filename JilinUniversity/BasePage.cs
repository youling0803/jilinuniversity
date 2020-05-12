using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;

namespace JilinUniversity
{
    public class BasePage : System.Web.UI.Page
    {
        /// <summary>
        /// 保存和更新提示
        /// author：徐可
        /// date：2020.05.11
        /// </summary>
        /// <param name="msg"></param>
        protected void SendAndRefresh(string msg)
        {
            string s = "<script language='javascript' type='text/javascript'> sendAndRefresh('" + msg + "','refresh');</script>";
            Page.ClientScript.RegisterStartupScript(ClientScript.GetType(), "sendAndRefresh", s);
        }

        /// <summary>
        /// 确认删除提示
        /// author：徐可
        /// date：2020.05.11
        /// </summary>
        /// <param name="msg"></param>
        protected void Cancel(string msg)
        {
            string s = "<script language='javascript' type='text/javascript'> cancel('" + msg + "',deleteclick);</script>";
            Page.ClientScript.RegisterStartupScript(ClientScript.GetType(), "cancel", s);//若未找到相关数据，弹窗提示
        }
        /// <summary>
        /// 确认发送提示
        /// author：徐可
        /// date：2020.05.11
        /// </summary>
        /// <param name="msg"></param>
        protected void CancelSend(string msg)
        {
            string s = "<script language='javascript' type='text/javascript'> cancel('" + msg + "',sendClick);</script>";
            Page.ClientScript.RegisterStartupScript(ClientScript.GetType(), "cancel", s);//若未填写相关数据，弹窗提示
        }

        /// <summary>
        /// 其他弹出框提示
        /// author：徐可
        /// date：2020.05.11
        /// </summary>
        /// <param name="msg"></param>
        protected void Send(string msg)
        {
            string s = "<script language='javascript' type='text/javascript'> send('" + msg + "','refresh');</script>";
            Page.ClientScript.RegisterStartupScript(ClientScript.GetType(), "send", s);
        }

        /// <summary>
        /// 保存及跳转页面提示
        /// author：徐可
        /// date：2020.05.11
        /// </summary>
        /// <param name="msg">弹出的信息</param>
        /// <param name="go">需要跳转的页面</param>
        protected void SendAndGo(string msg, int go)
        {
            string s = "<script language='javascript' type='text/javascript'> sendAndgoto('" + msg + "','" + go + "');</script>";
            Page.ClientScript.RegisterStartupScript(ClientScript.GetType(), "send", s);
        }

        /// <summary>
        /// 保存及跳转指定页面
        /// author：徐可
        /// date：2020.05.11
        /// </summary>
        /// <param name="msg">弹出的信息</param>
        /// <param name="go">需要跳转的页面</param>
        protected void SendAndgotoPage(string msg, string page)
        {
            string s = "<script language='javascript' type='text/javascript'> sendAndgotoPage('" + msg + "','" + page + "');</script>";
            Page.ClientScript.RegisterStartupScript(ClientScript.GetType(), "sendAndgotoPage", s);
        }

        /// <summary>
        /// 调用模态框
        /// author：徐可
        /// date：2020.05.11
        /// </summary>
        protected void ShowModal()
        {
            string s = "<script language='javascript' type='text/javascript'> show_modal();</script>";
            Page.ClientScript.RegisterStartupScript(ClientScript.GetType(), "show_modal", s);
        }

        /// <summary>
        /// 调用修改密码模态框
        /// author：徐可
        /// date：2020.05.11
        /// </summary>
        protected void ShowRestartModal()
        {
            string s = "<script language='javascript' type='text/javascript'> show_restartModal();</script>";
            Page.ClientScript.RegisterStartupScript(ClientScript.GetType(), "show_restartModal", s);
        }

        /// <summary>
        /// 调用客户权限分配模态框
        /// author：徐可
        /// date：2020.05.11
        /// </summary>
        protected void ShowAuditModal()
        {
            string s = "<script language='javascript' type='text/javascript'> show_auditModal();</script>";
            Page.ClientScript.RegisterStartupScript(ClientScript.GetType(), "show_auditModal", s);
        }
        protected void SelectMailContent(int msg)
        {
            Response.Redirect("MailContentInternal.aspx?id=" + msg + "&sign=" + 1);
        }
    }
}