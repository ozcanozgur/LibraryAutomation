using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        int userID = 0;

        
        
        string constr = ConfigurationManager.ConnectionStrings["DBSC"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cmd = new SqlCommand("INSERT INTO Contact(FirstName,MailAddress, Message) VALUES('" + txtName.Text.Trim() + "', '" + txtEmail.Text.Trim() + "', '" + TextBox2.Text.Trim() +"'); Select @@Identity", con);
        SqlDataAdapter sda = new SqlDataAdapter();


        cmd.Connection = con;
        con.Open();
        //int result= cmd.ExecuteNonQuery(); //Returns the count of rows effected by the Query
        userID = Convert.ToInt32(cmd.ExecuteScalar()); //Returns the first column of the first row
        con.Close();


        string message = string.Empty;
        if (userID > 0)
            message = "Message Sended";
        else message = "Sorry, your Message has A Problem Please try again";

        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + message + "');", true);
    }
}