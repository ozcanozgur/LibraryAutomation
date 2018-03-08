using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AboutUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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