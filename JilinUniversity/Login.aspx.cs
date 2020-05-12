using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JilinUniversity
{
    public partial class Login : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            Session["UserType"] = 1;
            Session["UserName"] = "JiLinUniversity";
            Session["ID"] = 1;
            Response.Write("<script language='javascript'>window.location='Home.aspx'</script>");
        }

        protected void LoginBtn2_Click(object sender, EventArgs e)
        {
            Session["UserType"] = 0;
            Session["UserName"] = "JiLinUniversity";
            Session["ID"] = 1;
            Response.Write("<script language='javascript'>window.location='Home.aspx'</script>");
        }
    }
}