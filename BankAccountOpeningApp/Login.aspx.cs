using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BankAccountOpeningApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void btnAdd_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("AddCustomer.aspx");
                
        //}

        //protected void btnManager_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("EditCustomer.aspx");
        //}

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["conString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("ValidateUser", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", Login1.UserName);
            cmd.Parameters.AddWithValue("@Pwd", Login1.Password);
            cmd.Parameters.Add("@Result", SqlDbType.Int, 1).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@Name", SqlDbType.VarChar, 20).Direction = ParameterDirection.Output;

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            int result = (int)cmd.Parameters["@Result"].Value; 
            if (result == -1)
                Login1.FailureText = "UserId and/or Password is incorrect!";
            else if (result == 1)
                //FormsAuthentication.RedirectFromLoginPage(cmd.Parameters["@Name"].Value.ToString(), Login1.RememberMeSet);
                Response.Redirect("EditCustomer.aspx?value=" + cmd.Parameters["@Name"].Value.ToString());
            else if (result == 2)
                //Response.Redirect("CustomerPage.aspx?value=" + cmd.Parameters["@Name"].Value.ToString());
                Response.Redirect("CustomerPage.aspx?userid=" + Login1.UserName);
        }
   
    }
}