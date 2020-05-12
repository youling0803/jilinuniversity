using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JilinUniversity.user
{
    public partial class TopicManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ID", typeof(System.Int32));
            dt.Columns.Add("TopicCode", typeof(System.String));
            dt.Columns.Add("PDFFile", typeof(System.String));
            dt.Columns.Add("TopicName", typeof(System.String));
            dt.Columns.Add("FacilityName", typeof(System.String));
            dt.Columns.Add("Equipment", typeof(System.String));
            dt.Columns.Add("UserRole", typeof(System.String));
            dt.Columns.Add("AuditStatus", typeof(System.String));
            dt.Columns.Add("ApprovedTime", typeof(System.String));
            dt.Columns.Add("LeftTime", typeof(System.String));
            dt.Columns.Add("EndDate", typeof(System.DateTime));

            DataRow dr = dt.NewRow();
            dt.Rows.Add(dr);

            GridViewDetection.DataSource = dt;
            GridViewDetection.DataBind();
        }

        protected void NewAddAntiDetection(object sender, EventArgs e)
        {

        }

        protected void GetReason_Invalid(object sender, EventArgs e)
        {

        }

        protected void LBdownload_Command(object sender, CommandEventArgs e)
        {
            
        }

        protected void GridViewDetection_DataBound(object sender, EventArgs e)
        {

        }

        protected void GridViewDetection_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridViewDetection_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
    }
}