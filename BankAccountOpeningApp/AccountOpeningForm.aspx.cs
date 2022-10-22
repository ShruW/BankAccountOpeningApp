using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BankAccountOpeningApp
{
    public partial class AccountOpeningForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblName.Text = Request["name"].ToString();
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            if (txtBalance.Text == string.Empty)
                lblMsg.Text += "<br/>Please enter opening balance!";
            if (ddlAccType.SelectedIndex == 0)
                lblMsg.Text += "<br/>Please select account type!";

            int customerId = Convert.ToInt16( Session["CustomerId"]);
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("AddAccount", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@CustomerId", SqlDbType.Int).Value = customerId;
            cmd.Parameters.Add("@OpeningBalance", SqlDbType.Money).Value = txtBalance.Text;
            cmd.Parameters.Add("@AccType", SqlDbType.VarChar, 10).Value = ddlAccType.SelectedValue;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("NewAccountNo.aspx");
            }
            catch(Exception ex)
            {  }

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            int customerId =  Convert.ToInt16(Session["CustomerId"]);
            if (FileUpload1.PostedFile != null && FileUpload1.FileContent.Length > 0)
            {
                string fn = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string saveLoc = Server.MapPath("UploadedDocs") + "\\" + fn + "_CustomerID_" + customerId;
                try
                {
                    FileUpload1.PostedFile.SaveAs(saveLoc);
                    lblUploadStatus.Text = "File uploaded!";
                }
                catch (Exception ex)
                {
                    lblUploadStatus.Text = ex.Message;
                }
            }
            else
                lblUploadStatus.Text = "Please select a file to upload";
        }
    }
}