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

            string BookID = Request.QueryString["bid"];
            string UserID = Request.QueryString["sid"];
            DataTable dtBook = GetBookDetail(BookID);

            if (dtBook.Rows.Count > 0)
            {
                imgBookImage.ImageUrl = "/images/Books Images/" + dtBook.Rows[0]["BookImage"].ToString();
                lblBookName.Text = dtBook.Rows[0]["Title"].ToString();
                lblBookAuthor.Text = dtBook.Rows[0]["Author"].ToString();
                lblBookSummary.Text = dtBook.Rows[0]["Summary"].ToString();
                lblBookPublisher.Text = dtBook.Rows[0]["Publisher"].ToString();
                lblBookRate.Text = dtBook.Rows[0]["BookRate"].ToString();
                
                if(Convert.ToInt32(dtBook.Rows[0]["StockSituation"]) >= 1)
                {
                    labelStock.Text = "Book Stock available to reserve";
                }
                else if (Convert.ToInt32(dtBook.Rows[0]["StockSituation"]) == 0)
                {
                    labelStock.Text = "Book Stock is not available to reserve";
                }

                if (Convert.ToInt32(dtBook.Rows[0]["BookRate"]) >= 1)
                {
                    span1.Attributes["class"] = "fa fa-star checked";
                }
                if(Convert.ToInt32(dtBook.Rows[0]["BookRate"]) >= 2)
                {
                    
                    span2.Attributes["class"] = "fa fa-star checked";
                }
                if (Convert.ToInt32(dtBook.Rows[0]["BookRate"]) >= 3)
                {
                    span3.Attributes["class"] = "fa fa-star checked";
                }
                if (Convert.ToInt32(dtBook.Rows[0]["BookRate"]) >= 4)
                {
                    span4.Attributes["class"] = "fa fa-star checked";
                }
                if (Convert.ToInt32(dtBook.Rows[0]["BookRate"]) >= 5)
                {
                    span5.Attributes["class"] = "fa fa-star checked";
                }

            getComments(BookID);



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

    private DataTable GetBookDetail(string pBookID)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBSC"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();

        DataTable dtBook = new DataTable();
        if (connection.State == ConnectionState.Open)
        {
            string query = "SELECT * from Books  Where BookID =" + pBookID + "";
            SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
            adapter.Fill(dtBook);
            connection.Close();
        }
        return dtBook;
    }

    private void getComments(string pBookID)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBSC"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();

        DataTable dtComment = new DataTable();
        if (connection.State == ConnectionState.Open)
        {
            string query = "select(m.FirstName + ' ' + m.LastName) as Name ,comment, rate from RateAndCommentBooks rcb  " +
                "join Member m on rcb.MemberID = m.MemberID  " +
                "join Books b on rcb.BookID = b.BookID where rcb.BookID =" + pBookID + "  ORDER BY RateID DESC";

            SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
            adapter.Fill(dtComment);

            dlComment.DataSource = dtComment;
            dlComment.DataBind();
            connection.Close();


        }
    }

    protected void btnReserve_OnClick(object sender, EventArgs e)
    {

        string BookID = Request.QueryString["bid"];
        string UserID = Request.QueryString["sid"];
        DataTable dtBook = new DataTable();


        string constr = ConfigurationManager.ConnectionStrings["DBSC"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        

        string insertQry = "insert into[ReservedBooks](BookID, MemberID, reserveDate) values((select bookID FROM Books WHERE BookID = '" + BookID + "')," +
            " (select MemberID from Member where MemberID = '" + UserID + "'), getdate())";

        string updateQry = "update Books set StockSituation = StockSituation-1  where BookID = '" + BookID + "'";

        string query = "SELECT * from Books  Where BookID =" + BookID + "";

        SqlCommand cmd = new SqlCommand(insertQry, con);
        SqlCommand cmd2 = new SqlCommand(updateQry, con);
        cmd.Connection = con;
        cmd2.Connection = con;
        con.Open();


        SqlDataAdapter adapter = new SqlDataAdapter(query, con);
        adapter.Fill(dtBook);
        if(Convert.ToInt32(dtBook.Rows[0]["StockSituation"]) != 0)
        {
            if (Convert.ToInt32(dtBook.Rows[0]["StockSituation"]) == 1)
            {
                labelStock.Text = "Book Stock is not available to reserve";
            }
                cmd.ExecuteNonQuery();
            cmd2.ExecuteNonQuery();
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Reserved');", true);
        }
        else{ 
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please Try Another Time');", true);
           
        }

        con.Close();


        

    }

    protected void btnComment_OnClick(object sender, EventArgs e)
    {
        
        string BookID = Request.QueryString["bid"];
        string UserID = Request.QueryString["sid"];
        string rateString = rate.Text;
        int rateInt = 0;
        Int32.TryParse(rateString, out  rateInt);
        imgTik.Visible = true;
        string constr = ConfigurationManager.ConnectionStrings["DBSC"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        // string qry = "insert into RateAndCommentBooks(BookID, MemberID, rate, rateDate, comment)" +
        //     " values((select bookID FROM Books WHERE bookID = '" + BookID + "') ," +
        //   " (select MemberID from Member where MemberID = '" + UserID + "'), '"+ rate.Text +"' ,getdate(), '"+ textBox.Text +"')";
       // string qry = "exec SP_Add_Comment '" + BookID + "','" + UserID + "','" + textBox.Text + "', '" + Convert.ToInt32(rate.Text) + "'";
        SqlCommand cmd = new SqlCommand("SP_Add_Comment", con);
        cmd.CommandType = CommandType.StoredProcedure;
        
        cmd.Parameters.Add(new SqlParameter("@BookID",BookID));
        cmd.Parameters.Add(new SqlParameter("@UserID", UserID));
        cmd.Parameters.Add(new SqlParameter("@Comment",textBox.Text));
        cmd.Parameters.Add(new SqlParameter("@Rate", rateInt));
        
        cmd.Connection = con;
        con.Open();
        int result = cmd.ExecuteNonQuery();
        
        con.Close();
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
        rate.Text = "1";
    }
    protected void star2_OnClick(object sender, EventArgs e)
    {
        starOne.Attributes["class"] = "fa fa-star set fa-2x checked";
        starTwo.Attributes["class"] = "fa fa-star  set fa-2x checked";
        starThree.Attributes["class"] = "fa fa-star  set fa-2x";
        starFour.Attributes["class"] = "fa fa-star set fa-2x";
        starFive.Attributes["class"] = "fa fa-star set fa-2x";
        rate.Text = "2";
    }
    protected void star3_OnClick(object sender, EventArgs e)
    {
        starOne.Attributes["class"] = "fa fa-star set fa-2x checked";
        starTwo.Attributes["class"] = "fa fa-star set fa-2x checked";
        starThree.Attributes["class"] = "fa fa-star set fa-2x checked";
        starFour.Attributes["class"] = "fa fa-star set fa-2x";
        starFive.Attributes["class"] = "fa fa-star set fa-2x";
        rate.Text = "3";
    }
    protected void star4_OnClick(object sender, EventArgs e)
    {
        starOne.Attributes["class"] = "fa fa-star set fa-2x checked";
        starTwo.Attributes["class"] = "fa fa-star set fa-2x checked";
        starThree.Attributes["class"] = "fa fa-star set fa-2x checked";
        starFour.Attributes["class"] = "fa fa-star set fa-2x checked";
        starFive.Attributes["class"] = "fa fa-star set fa-2x";
        rate.Text = "4";
    }
    protected void star5_OnClick(object sender, EventArgs e)
    {
        starOne.Attributes["class"] = "fa fa-star set fa-2x checked";
        starTwo.Attributes["class"] = "fa fa-star set fa-2x  checked";
        starThree.Attributes["class"] = "fa fa-star set fa-2x checked";
        starFour.Attributes["class"] = "fa fa-star set fa-2x checked";
        starFive.Attributes["class"] = "fa fa-star set fa-2x checked";
        rate.Text = "5";
    }

}

