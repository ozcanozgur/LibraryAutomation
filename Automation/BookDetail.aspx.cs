using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class BookDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string BookID = Request.QueryString["bid"];
            DataTable dtStudent = GetStudentDetails(BookID);

            if (dtStudent.Rows.Count > 0)
            {
                imgBookImage.ImageUrl = "/images/Books Images/" + dtStudent.Rows[0]["BookImage"].ToString();
                lblBookName.Text = dtStudent.Rows[0]["Title"].ToString();
                lblBookAuthor.Text = dtStudent.Rows[0]["Author"].ToString();



            }  
        }
    }

    

    private DataTable GetStudentDetails(string pBookID)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBSC"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();

        DataTable dtStudent = new DataTable();
        if (connection.State == ConnectionState.Open)
        {
            string query = "SELECT * from Books  Where BookID =" + pBookID + "";
            SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
            adapter.Fill(dtStudent);
            connection.Close();
        }
        return dtStudent;
    }
}