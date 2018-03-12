using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class StudentLoginPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    
    protected void registerButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("RegisterPage.aspx");
    }
    protected void adminPanelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("loginPage.aspx");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["DBSC"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);

        try
        {
            string uid = txtSchoolID.Text;
            string pass = txtPassword.Text;
            con.Open();
            string qry = "select * from Member where schoolID = '" + txtSchoolID.Text + "' and Password = '" + txtPassword.Text + "'";
            SqlCommand cmd = new SqlCommand(qry, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                Response.Redirect("index.aspx?sid="+sdr[0]);
            }
            else
            {
                Response.Write("UserId & Password Is not correct Try again..!!");

            }
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}