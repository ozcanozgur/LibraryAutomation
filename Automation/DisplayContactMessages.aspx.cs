using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DisplayContactMessages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBSC"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();

        DataTable dtBooks = new DataTable();
        if (connection.State == ConnectionState.Open)
        {
            string query = "select * from Contact ";

            SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
            adapter.Fill(dtBooks);

            dlCourses.DataSource = dtBooks;
            dlCourses.DataBind();
            connection.Close();
        }
    }


}