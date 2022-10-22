using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BankAccountOpeningApp
{
    public partial class AddCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            if (txtFirstName.Text == string.Empty)
                lblMessage.Text += "<br/>Please enter first name.";
            if (txtLastName.Text == string.Empty)
                lblMessage.Text += "<br/>Please enter last name.";
            if (txtDOB.Text == string.Empty)
                lblMessage.Text += "<br/>Please enter date of birth.";
            if (txtEmail.Text == string.Empty)
                lblMessage.Text += "<br/>Please enter email.";
            if (txtPhone.Text == string.Empty)
                lblMessage.Text += "<br/>Please enter phone number.";
            if (txtPwd.Text == string.Empty)
                lblMessage.Text += "<br/>Please enter password";

            int age=DateTime.Now.Year-Convert.ToDateTime(txtDOB.Text).Year;
            if (age <= 21 || age >= 100)
                lblMessage.Text += "<br>Age should be between 21 and 100.";

            if (lblMessage.Text==string.Empty)
            {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);
                SqlCommand cmd = new SqlCommand("AddCustomer", con);
                cmd.CommandType=CommandType.StoredProcedure;

                cmd.Parameters.Add("@FirstName",SqlDbType.NVarChar,20).Value=txtFirstName.Text;
                cmd.Parameters.Add("@LastName", SqlDbType.NVarChar, 20).Value = txtLastName.Text;
                cmd.Parameters.Add("@DOB", SqlDbType.Date).Value = txtDOB.Text;
                cmd.Parameters.Add("@Gender", SqlDbType.VarChar, 1).Value = rdlGender.SelectedValue;
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 20).Value = txtEmail.Text;
                cmd.Parameters.Add("@Phone", SqlDbType.NVarChar, 20).Value = txtPhone.Text;
                cmd.Parameters.Add("@Pwd", SqlDbType.NVarChar, 20).Value = txtPwd.Text;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    //lblMessage.Text = "New Customer Added!";
                    int customerId = GetCustId();
                    Session["CustomerId"] = customerId;
                    Response.Redirect("AccountOpeningForm.aspx?name=" + txtFirstName.Text);
                }
                catch(Exception ex)
                {
                    lblMessage.Text = ex.Message;
                }
                finally
                {
                    Clear();
                }
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        private void Clear()
        {
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtDOB.Text = string.Empty;
            rdlGender.ClearSelection();
            cdrDOB.SelectedDate= DateTime.Now;
            txtPwd.Text = string.Empty;
            txtConfirmPwd.Text = string.Empty;
        }
        protected void cdrDOB_SelectionChanged(object sender, EventArgs e)
        {
            txtDOB.Text = cdrDOB.SelectedDate.ToShortDateString();
        }

        private int GetCustId()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select IDENT_CURRENT('Customer')", con);
            cmd.CommandType = CommandType.Text;

            con.Open();
            int id = Convert.ToInt16(cmd.ExecuteScalar());
            con.Close();
            return id;
        }
    }
}