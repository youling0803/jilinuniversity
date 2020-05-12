/*
 * 类名：数据库连接操作
 * 功能：DAl层操作
 * 作者：徐可
 * 修改时间：2017年9月20日
  * 修改履历：
 *          （1）
 *          （2）
 *          （3）
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace WebApplication1
{
    public class ConnectToSQL
    {
        //string ConnectSQL = "server=localhost;database=order;user=root;pwd=123456";//连接字符串
        string ConnectSQL = "server=localhost;database=jilinuniversity;user=root;pwd=@77136658rm";       //发布用
        // string ConnectSQL = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=E:\QQDOWNLOAD\比赛用的评分系统1.0界面美化\比赛用的评分系统1.0\局域网投票系统1_DATA.MDF;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";            //本地调试用
        public string SQL;//sql操作
        MySqlConnection SqlCon;
        MySqlCommand SqlCmd;


        public ConnectToSQL() { }

        public ConnectToSQL(string sql)

        {
            SQL = sql;
        }

        public int ReturnNum()
        {
            SqlCon = new MySqlConnection(ConnectSQL);
            SqlCmd = new MySqlCommand(SQL, SqlCon);
            try
            {
                SqlCon.Open();
                //MessageBox.Show("成功连接数据库");
                int num = (int)SqlCmd.ExecuteNonQuery();
                //MessageBox.Show(string.Format("成功读取{0},条记录", x));
                return num;
            }
            catch (Exception ex)
            {
                return 0;
            }
            finally
            {
                SqlCon.Close();
                //MessageBox.Show("成功关闭数据库连接", "提示信息", MessageBoxButtons.YesNoCancel);
            }
        }
        public int ReturnNum(string sql)
        {
            SQL = sql;
            SqlCon = new MySqlConnection(ConnectSQL);
            SqlCmd = new MySqlCommand(SQL, SqlCon);
            try
            {
                SqlCon.Open();
                //MessageBox.Show("成功连接数据库");
                int num = (int)SqlCmd.ExecuteNonQuery();
                //MessageBox.Show(string.Format("成功读取{0},条记录", x));
                return num;
            }
            catch (Exception ex)
            {
                return 0;
            }
            finally
            {
                SqlCon.Close();
                //MessageBox.Show("成功关闭数据库连接", "提示信息", MessageBoxButtons.YesNoCancel);
            }
        }
        /// <summary>
        /// 返回数据库中数据的条数
        /// 作者:徐可
        /// 时间:2017/9/20
        /// </summary>
        /// <returns></returns>
        public int ReturnNumber()
        {
            SqlCon = new MySqlConnection(ConnectSQL);
            SqlCmd = new MySqlCommand(SQL, SqlCon);
            try
            {
                SqlCon.Open();
                //MessageBox.Show("成功连接数据库");
                int num = SqlCmd.ExecuteNonQuery();
                //MessageBox.Show(string.Format("成功读取{0},条记录", x));
                return num;
            }
            catch (Exception ex)
            {
                return 0;
            }
            finally
            {
                SqlCon.Close();
                //MessageBox.Show("成功关闭数据库连接", "提示信息", MessageBoxButtons.YesNoCancel);
            }
        }
        public int ReturnNumber(string sql)
        {
            SQL = sql;
            SqlCon = new MySqlConnection(ConnectSQL);
            SqlCmd = new MySqlCommand(SQL, SqlCon);
            try
            {
                SqlCon.Open();
                //MessageBox.Show("成功连接数据库");
                int num = (int)SqlCmd.ExecuteNonQuery();
                //MessageBox.Show(string.Format("成功读取{0},条记录", x));
                return num;
            }
            catch (Exception ex)
            {
                return 0;
            }
            finally
            {
                SqlCon.Close();
                //MessageBox.Show("成功关闭数据库连接", "提示信息", MessageBoxButtons.YesNoCancel);
            }
        }
        /// <summary>
        /// 用datatable形式返回数据
        /// 作者:徐可
        /// 时间:2017/9/20
        /// </summary>
        /// <returns></returns>
        public DataTable ReturnDT()
        {
            SqlCon = new MySqlConnection(ConnectSQL);
            try
            {
                SqlCon.Open();
                MySqlDataAdapter SqlDA = new MySqlDataAdapter(SQL, SqlCon);
                DataTable dt = new DataTable();
                SqlDA.FillSchema(dt, SchemaType.Source);
                SqlDA.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                SqlCon.Close();
                //MessageBox.Show("成功关闭数据库连接", "提示信息", MessageBoxButtons.YesNoCancel);
            }
        }
    }
}