using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Excel = Microsoft.Office.Interop.Excel; //COM reference added
using System.Web.DynamicData;

//ADD SORTING AND SEARCHING
namespace BankAccountOpeningApp
{
    public partial class EditCustomer : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            lblHello.Text = "Hello " + Request["value"].ToString();
            if (!IsPostBack)
            {
                BindData();
            }
        }

        protected void BindData()
        {
            SqlCommand cmd = new SqlCommand("ViewCustomer", con);
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(ds);
            gvCustomers.DataSource = ds;
            gvCustomers.DataBind();

            //for (int i = 0; i < gvCustomers.Rows.Count; i++)
            //{
            //    DateTime date =gvCustomers.Rows[i].Cells[3].Text.Date;
            //}

            //SqlCommand cmd = new SqlCommand("ViewCustomer", con);
            //con.Open();
            //SqlDataReader reader=cmd.ExecuteReader();
            //gvCustomers.DataSource = reader;
            //gvCustomers.DataBind();
            //con.Close();
        }

        protected void gvCustomers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCustomers.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void gvCustomers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = (GridViewRow)gvCustomers.Rows[e.RowIndex];
            int id = Convert.ToInt32(gvCustomers.DataKeys[e.RowIndex].Values[0]);
            //TextBox txtId = (TextBox)row.Cells[0].Controls[0];
            //Label lbl = (Label)row.FindControl("lblID");
            TextBox txtFName = (TextBox)row.Cells[1].Controls[0];
            TextBox txtLName = (TextBox)row.Cells[2].Controls[0];
            TextBox txtDOB = (TextBox)row.Cells[3].Controls[0]; 
            TextBox txtGender = (TextBox)row.Cells[4].Controls[0];
            TextBox txtEmail = (TextBox)row.Cells[5].Controls[0];
            TextBox txtPhone = (TextBox)row.Cells[6].Controls[0];
          
            SqlCommand cmd = new SqlCommand("EditCustomer", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", id);
            cmd.Parameters.AddWithValue("@FirstName", txtFName.Text);
            cmd.Parameters.AddWithValue("@LastName", txtLName.Text);
            cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
            cmd.Parameters.AddWithValue("@Gender", txtGender.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch(Exception ex) { }
            finally 
            {
                gvCustomers.EditIndex = -1;
                BindData();
            }
        }

        protected void gvCustomers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCustomers.EditIndex = -1;
            BindData();
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            //BindData();
            string path=Server.MapPath("Exported Files\\");
            if(!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);  //create folder
            }

            File.Delete(path + "ListOfCustomer.xlsx");

            Excel.Application app=new Excel.Application();
            app.Workbooks.Add(""); //Add new workbook

            Excel.Worksheet worksheet=default(Excel.Worksheet);
            worksheet = app.Sheets["Sheet1"]; //add sheet

            //add header
            for (int i = 0; i < gvCustomers.Columns.Count; i++)
            {
                worksheet.Cells[1, i + 1] = gvCustomers.Columns[i].HeaderText;
            }
            //add header
            //worksheet.Cells[1, 1] = "Customer ID";
            //worksheet.Cells[1, 2] = "First Name";
            //worksheet.Cells[1, 3] = "Last Name";
            //worksheet.Cells[1, 4] = "DOB";
            //worksheet.Cells[1, 5] = "Gender";
            //worksheet.Cells[1, 6] = "Email";
            //worksheet.Cells[1, 7] = "Phone";

            int rowCount = 2;
            for (int i=0; i<gvCustomers.Rows.Count; i++)
            {
                worksheet.Cells[rowCount, 1] = gvCustomers.Rows[i].Cells[0].Text.ToString();
                worksheet.Cells[rowCount, 2] = gvCustomers.Rows[i].Cells[1].Text.ToString();
                worksheet.Cells[rowCount, 3] = gvCustomers.Rows[i].Cells[2].Text.ToString();
                worksheet.Cells[rowCount, 4] = gvCustomers.Rows[i].Cells[3].Text.ToString();
                worksheet.Cells[rowCount,5] = gvCustomers.Rows[i].Cells[4].Text.ToString();
                worksheet.Cells[rowCount, 6] = gvCustomers.Rows[i].Cells[5].Text.ToString();
                worksheet.Cells[rowCount, 7] = gvCustomers.Rows[i].Cells[6].Text.ToString();
                rowCount++;
            }
            worksheet.SaveAs(path + "ListOfCustomer.xlsx");
            //app.Workbooks.Close();
            //app.Quit();
            //app = null;
            //worksheet = null;

            app.Workbooks.Open(path + "ListOfCustomer.xlsx");
            app.Visible = true;
        }
    }
}