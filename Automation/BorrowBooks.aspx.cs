using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BorrowBooks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBSC"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();
        
        
        if (connection.State == ConnectionState.Open)
        {
            string query = "select top(5) title, bookImage  from Books where title like '%"+txtTitle.Text+"%' ";

            
            SqlDataAdapter sda = new SqlDataAdapter(query,connection);
            DataTable dtCourse = new DataTable();
            sda.Fill(dtCourse);
            datagrid.DataSource = dtCourse; //gridView'i data source öğeleri ile doldurur.
            datagrid.DataBind();
            /*if (sdr.Read())
            {
                Label1.Text =  sdr[1].ToString() +" in our stocks";
                Image1.ImageUrl = "/images/Books Images/" + sdr[0].ToString();
            }
            else
            {
                Label1.Text = "Ther is no Stock whit that title : " + txtTitle.Text;

            }*/
            connection.Close();
            
        }
        
    }

    protected void btn2Submit_Click(object sender, EventArgs e)
    {
        

        int userID = 0;
        
        
        string constr = ConfigurationManager.ConnectionStrings["DBSC"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            string qry = "insert into[Borrowed Books](BookID, MemberID, ExpiredDate, borrowDate) values ((select bookID FROM Books WHERE Title = '"+txtTitle2.Text+"') ,(select MemberID from Member where SchoolID = '" + TxtID.Text+ "'), getdate() + 15 , getdate())";
            SqlCommand cmd = new SqlCommand(qry, con);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.Connection = con;
            con.Open();
            //int result= cmd.ExecuteNonQuery(); //Returns the count of rows effected by the Query
            userID = Convert.ToInt32(cmd.ExecuteScalar()); //Returns the first column of the first row
            con.Close();
        
       



        if (userID > 0)
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please Try Again');", true);
        else ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Successful');", true);

    }

    

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {

        //txtDate.Text = Convert.ToDateTime(Calendar1.SelectedDate.ToLongDateString(), CultureInfo.CurrentCulture).ToString("dd/MM/yyyy");
        txtDate.Text = Calendar1.SelectedDate.Date.ToString("yyyy-MM-dd");


        Calendar1.Style.Add("display", "none");
    }

    protected void CustomersGridView_SelectedIndexChanged(Object sender, EventArgs e)
    {
        // Get the currently selected row using the SelectedRow property.
        GridViewRow row = datagrid.SelectedRow;

        // Display the first name from the selected row.
        // In this example, the third column (index 2) contains
        // the first name.
        txtTitle2.Text = row.Cells[1].Text;
        Image1.ImageUrl = "/images/Books Images/" + row.Cells[2].Text; 
    }
}