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
            ListUserİnfo();
            string BookID = Request.QueryString["bid"];
            string UserID = Request.QueryString["sid"];
            DataTable dtStudent = GetStudentDetails(BookID);

            if (dtStudent.Rows.Count > 0)
            {
                imgBookImage.ImageUrl = "/images/Books Images/" + dtStudent.Rows[0]["BookImage"].ToString();
                lblBookName.Text = dtStudent.Rows[0]["Title"].ToString();
                lblBookAuthor.Text = dtStudent.Rows[0]["Author"].ToString();
                lblBookSummary.Text = dtStudent.Rows[0]["Summary"].ToString();
                lblBookPublisher.Text = dtStudent.Rows[0]["Publisher"].ToString();
                lblBookRate.Text = dtStudent.Rows[0]["BookRate"].ToString();

                if (Convert.ToInt32(dtStudent.Rows[0]["BookRate"]) >= 1)
                {
                    span1.Attributes["class"] = "fa fa-star checked";
                }
                if(Convert.ToInt32(dtStudent.Rows[0]["BookRate"]) >= 2)
                {
                    
                    span2.Attributes["class"] = "fa fa-star checked";
                }
                if (Convert.ToInt32(dtStudent.Rows[0]["BookRate"]) >= 3)
                {
                    span3.Attributes["class"] = "fa fa-star checked";
                }
                if (Convert.ToInt32(dtStudent.Rows[0]["BookRate"]) >= 4)
                {
                    span4.Attributes["class"] = "fa fa-star checked";
                }
                if (Convert.ToInt32(dtStudent.Rows[0]["BookRate"]) >= 5)
                {
                    span5.Attributes["class"] = "fa fa-star checked";
                }

            }  


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

    protected void btnReserve_OnClick(object sender, EventArgs e)
    {

        string BookID = Request.QueryString["bid"];
        string UserID = Request.QueryString["sid"];
        int userID = 0;


        string constr = ConfigurationManager.ConnectionStrings["DBSC"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        string qry = "insert into[ReservedBooks](BookID, MemberID, reserveDate) values((select bookID FROM Books WHERE BookID = '" + BookID + "')," +
            " (select MemberID from Member where MemberID = '" + UserID + "'), getdate())";
        SqlCommand cmd = new SqlCommand(qry, con);
        //SqlDataAdapter sda = new SqlDataAdapter();
        cmd.Connection = con;
        con.Open();
        //int result= cmd.ExecuteNonQuery(); //Returns the count of rows effected by the Query
        userID = Convert.ToInt32(cmd.ExecuteScalar()); //Returns the first column of the first row
        con.Close();





        if (userID > 0)
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please Try Again');", true);
        else ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Successful');", true);

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

    protected void star1_OnClick(object sender, EventArgs e)
    {
        starOne.Attributes["class"] = "fa fa-star set fa-2x checked";
        starTwo.Attributes["class"] = "fa fa-star set fa-2x";
        starThree.Attributes["class"] = "fa fa-star set fa-2x";
        starFour.Attributes["class"] = "fa fa-star set fa-2x";
        starFive.Attributes["class"] = "fa fa-star  set fa-2x";
        rate.Text = "1.0";
    }
    protected void star2_OnClick(object sender, EventArgs e)
    {
        starOne.Attributes["class"] = "fa fa-star set fa-2x checked";
        starTwo.Attributes["class"] = "fa fa-star  set fa-2x checked";
        starThree.Attributes["class"] = "fa fa-star  set fa-2x";
        starFour.Attributes["class"] = "fa fa-star set fa-2x";
        starFive.Attributes["class"] = "fa fa-star set fa-2x";
        rate.Text = "2.0";
    }
    protected void star3_OnClick(object sender, EventArgs e)
    {
        starOne.Attributes["class"] = "fa fa-star set fa-2x checked";
        starTwo.Attributes["class"] = "fa fa-star set fa-2x checked";
        starThree.Attributes["class"] = "fa fa-star set fa-2x checked";
        starFour.Attributes["class"] = "fa fa-star set fa-2x";
        starFive.Attributes["class"] = "fa fa-star set fa-2x";
        rate.Text = "3.0";
    }
    protected void star4_OnClick(object sender, EventArgs e)
    {
        starOne.Attributes["class"] = "fa fa-star set fa-2x checked";
        starTwo.Attributes["class"] = "fa fa-star set fa-2x checked";
        starThree.Attributes["class"] = "fa fa-star set fa-2x checked";
        starFour.Attributes["class"] = "fa fa-star set fa-2x checked";
        starFive.Attributes["class"] = "fa fa-star set fa-2x";
        rate.Text = "4.0";
    }
    protected void star5_OnClick(object sender, EventArgs e)
    {
        starOne.Attributes["class"] = "fa fa-star set fa-2x checked";
        starTwo.Attributes["class"] = "fa fa-star set fa-2x  checked";
        starThree.Attributes["class"] = "fa fa-star set fa-2x checked";
        starFour.Attributes["class"] = "fa fa-star set fa-2x checked";
        starFive.Attributes["class"] = "fa fa-star set fa-2x checked";
        rate.Text = "5.0";
    }

}

