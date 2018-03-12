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
        ListUserİnfo();
    }

    private void ListUserİnfo()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBSC"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();

        DataTable dtUser = new DataTable();
        if (connection.State == ConnectionState.Open)
        {
            string query = " select * from Member where MemberID=  '" + Request.QueryString["sid"] + "' ";
            SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
            adapter.Fill(dtUser);

            DataList1.DataSource = dtUser;
            DataList1.DataBind();
            connection.Close();


        }
    }
}