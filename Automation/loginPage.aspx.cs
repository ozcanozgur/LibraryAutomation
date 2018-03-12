using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class loginPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void StudentPanelClick(object sender, EventArgs e)
    {
        Response.Redirect("StudentLoginPage.aspx");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["DBSC"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        
        try
        {
            string uid = txtUsername.Text;
            string pass = txtPassword.Text;
            con.Open();
            string qry = "select * from Admin where FirstName = '" + txtUsername.Text + "' and password = '" + txtPassword.Text + "'";
            SqlCommand cmd = new SqlCommand(qry, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                Response.Redirect("AdminPanelPage.aspx");
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