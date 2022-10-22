using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BankAccountOpeningApp
{
    public partial class NewAccountNo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int customerId = Convert.ToInt32(Session["customerId"]);
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from Account where CustomerId=@CustomerId", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("@CustomerId", SqlDbType.Int).Value = customerId;

            try
            {
                con.Open();
                SqlDataReader reader=cmd.ExecuteReader();
                while (reader.Read())
                {
                    lblAccNo.Text = reader["AccNo"].ToString();
                    lblOpeningBalance.Text=reader["OpeningBalance"].ToString();
                    lblDate.Text = reader["AccOpeningDate"].ToString();
                    lblType.Text = reader["AccType"].ToString();
                }
                con.Close();
            }
            catch(Exception ex)
            { }
            }
    }
}