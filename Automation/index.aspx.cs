using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!Page.IsPostBack)
        { 
            ListStudentCourse();
            ListUserİnfo();
        }
    }

    

    private void ListStudentCourse()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBSC"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();
       
        DataTable dtBooks = new DataTable();
        if (connection.State == ConnectionState.Open)
        {
            string query = "select * from Books ";

            SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
            adapter.Fill(dtBooks);

            dlCourses.DataSource = dtBooks;
            dlCourses.DataBind();
            connection.Close();

            
        }
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

    private void mainFilterFunction()
    {
        
        string dL = DropDownList1.SelectedValue;
        string dl2 = DropDownList2.SelectedValue;
        string input = TextBox2.Text;

        string connectionString = ConfigurationManager.ConnectionStrings["DBSC"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        string query = "";

        if (string.IsNullOrWhiteSpace(input))
        {
            if (dL == "Filter By Genre")
            {
                query = "SELECT * FROM Books";
                if (dl2 == "A-Z")
                    query = "SELECT * FROM Books order by title ASC ";
                else if (dl2 == "Z-A")
                    query = "SELECT * FROM Books order by title DESC";
            }
            else
            {
                query = "SELECT * FROM Books WHERE genre = '" + dL + "' ";
                if (dl2 == "A-Z")
                    query = "SELECT * FROM Books  WHERE genre = '" + dL + "' order by title ASC ";
                else if (dl2 == "Z-A")
                    query = "SELECT * FROM Books  WHERE genre = '" + dL + "' order by title DESC";
            }
        }
        else
        {
                query = "SELECT * FROM Books WHERE(Title LIKE '%" + input + "%'OR Author LIKE '%" + input + "%'OR Publisher LIKE '%" + input + "%' and genre = '+dL+')";
                if (dl2 == "A-Z")
                    query = "SELECT * FROM Books WHERE(Title LIKE '%" + input + "%'OR Author LIKE '%" + input + "%'OR Publisher LIKE '%" + input + "%' and genre = '+dL+') order by title ASC";
                else if (dl2 == "Z-A")
                    query = "SELECT * FROM Books WHERE(Title LIKE '%" + input + "%'OR Author LIKE '%" + input + "%'OR Publisher LIKE '%" + input + "%' and genre = '+dL+') ORDER BY title DESC";

                if (dL == "Filter By Genre")
                {
                    query = "SELECT * FROM Books WHERE(Title LIKE '%" + input + "%'OR Author LIKE '%" + input + "%'OR Publisher LIKE '%" + input + "%')";
                    if (dl2 == "A-Z")
                        query = "SELECT * FROM Books WHERE(Title LIKE '%" + input + "%'OR Author LIKE '%" + input + "%'OR Publisher LIKE '%" + input + "%') ORDER BY title ASC";
                    else if (dl2 == "Z-A")
                        query = "SELECT * FROM Books WHERE(Title LIKE '%" + input + "%'OR Author LIKE '%" + input + "%'OR Publisher LIKE '%" + input + "%') ORDER BY title DESC";
                }
            
        }
        connection.Open();
        // Bu kısım veritabanından verileri çekerek
        // dataliste bağladığımız kısım

        DataTable dtBooks = new DataTable();
        if (connection.State == ConnectionState.Open)
        {
            SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
            adapter.Fill(dtBooks);
            connection.Close();
        }
        dlCourses.DataSource = dtBooks;
        dlCourses.DataBind();
    }

    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
        mainFilterFunction();
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        mainFilterFunction();
    }
        
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        mainFilterFunction();
    }

    protected void DataListCommand(object source, DataListCommandEventArgs e)
    {
        
        string StudentID = Request.QueryString["sid"];
        Button btn = ((Button)e.CommandSource);

        string connectionString = ConfigurationManager.ConnectionStrings["DBSC"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();

        DataTable dtBooks = new DataTable();
        if (connection.State == ConnectionState.Open)
        {
            string query = "select * from Books where BookID = '" + Convert.ToInt32(e.CommandArgument) + "' ";
            SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
            adapter.Fill(dtBooks);
            connection.Close();
        }
        
        
        if (dtBooks.Rows.Count > 0)
        {

            Response.Redirect("BookDetail.aspx?sid="+StudentID+"&bid=" + dtBooks.Rows[0]["BookID"]);
           
        }
        
    }

    
    protected void ContactClick(object sender, EventArgs e)
    {
        Response.Redirect("Contact.aspx?sid=" + Request.QueryString["sid"]);
    }

    protected void HomeClick(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx?sid=" + Request.QueryString["sid"]);
    }

    protected void AboutUsClick(object sender, EventArgs e)
    {
        Response.Redirect("AboutUs.aspx?sid=" + Request.QueryString["sid"]);
    }


   







}