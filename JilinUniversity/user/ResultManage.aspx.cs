﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JilinUniversity.user
{
    public partial class ResultManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ID", typeof(System.Int32));
            dt.Columns.Add("ResultName", typeof(System.String));
            dt.Columns.Add("FacilityName", typeof(System.String));
            dt.Columns.Add("PaperName", typeof(System.String));
            dt.Columns.Add("Writer", typeof(System.String));
            dt.Columns.Add("Publication", typeof(System.String));
            dt.Columns.Add("PublishDate", typeof(System.DateTime));

            DataRow dr = dt.NewRow();
            dt.Rows.Add(dr);

            GridViewDetection.DataSource = dt;
            GridViewDetection.DataBind();
        }

        protected void NewAddResult(object sender, EventArgs e)
        {

        }

        //模态框中确定按钮事件
        protected void GetReason_Invalid(object sender, EventArgs e)
        {

        }

        //GirdView操作点击事件
        protected void LBdownload_Command(object sender, CommandEventArgs e)
        {

        }

        //GridView数据绑定事件
        //用于处理分页为1时显示分页的问题
        protected void GridViewDetection_DataBound(object sender, EventArgs e)
        {
            if (GridViewDetection.Rows.Count != 0)
            {
                Control table = GridViewDetection.Controls[0];
                int count = table.Controls.Count;
                table.Controls[count - 1].Visible = true;
            }
        }

        //GridView行数据绑定事件
        //用于操作中按键的显示与隐藏
        protected void GridViewDetection_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        //GridView分页点击事件
        //用于操作GirdView的换页
        protected void GridViewDetection_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (e.NewPageIndex < 0)
            {
                GridViewDetection.PageIndex = 0;
            }
            else
            {
                GridViewDetection.PageIndex = e.NewPageIndex;
            }
            //GridViewBind();
        }
    }
}