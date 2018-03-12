using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DisplayUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        string constr = ConfigurationManager.ConnectionStrings["DBSC"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlDataAdapter sda = new SqlDataAdapter("select (FirstName +' '+ LastName) as Name , MailAddress , PhoneNumber , SchoolID from member", con);
        con.Open();
        DataTable dtCourse = new DataTable();
        sda.Fill(dtCourse);
        datagrid.DataSource = dtCourse; //gridView'i data source öğeleri ile doldurur.
        datagrid.DataBind();
        con.Close();
    }


}