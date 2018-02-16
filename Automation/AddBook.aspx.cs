using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;

public partial class AddBook : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        { 
            if (FileUpload1.HasFile)
            {
                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Images/Books Images/") + fileName);
            }
            int userID = 0;
                try
                {
                    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert '" + fileName + "';", true);
                    string constr = ConfigurationManager.ConnectionStrings["DBSC"].ConnectionString;
                    SqlConnection con = new SqlConnection(constr);
                    string qry = "insert into Books (title,genre,author,publisher,BookImage,Summary) values ('" + txtTitle.Text + "','" + txtGenre.Text + "','" + txtAuthor.Text + "','" + txtPublisher.Text + "','" + fileName + "', '" + TextBox2.Text + "')";
                    SqlCommand cmd = new SqlCommand(qry, con);
                    SqlDataAdapter sda = new SqlDataAdapter();
                    cmd.Connection = con;
                    con.Open();
                    //int result= cmd.ExecuteNonQuery(); //Returns the count of rows effected by the Query
                    userID = Convert.ToInt32(cmd.ExecuteScalar()); //Returns the first column of the first row
                    con.Close();
                }
                catch (Exception)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please Enter True Values');", true);
                }

                if (userID > 0)
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please Try Again');", true);
                else ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Successful');", true);
            
        }
        catch (Exception)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please Try Again');", true);
        }




    }




}