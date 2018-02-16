using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class AddUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int userID = 0;
        try
        {
            string constr = ConfigurationManager.ConnectionStrings["DBSC"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        string qry ="insert into [Member] (FirstName, LastName, MailAddress, PhoneNumber, tcNo) values  ('" + txtName.Text  + "', '" + txtLastName.Text + "', '" + txtMailAdress.Text + "', '" + txtPhoneNumber.Text + "' , '" + txtTcNo.Text + "')";
        SqlCommand cmd = new SqlCommand(qry, con);
        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.Connection = con;
        con.Open();
        //int result= cmd.ExecuteNonQuery(); //Returns the count of rows effected by the Query
        userID = Convert.ToInt32(cmd.ExecuteScalar()); //Returns the first column of the first row
        con.Close();
        }
        catch (System.Data.SqlClient.SqlException ex )
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('User Already Exist');", true);
        }
        catch(Exception)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please Enter True Values');", true);
        }

        if (userID > 0)
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please Try Again');", true);
        else ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Successful');", true);


    }
}