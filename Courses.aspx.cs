using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.PopulateData();
    }
    private void PopulateData()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=CollegeManagement;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * From Courses";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    ListView1.DataSource = dt;
                    ListView1.DataBind();
                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=CollegeManagement;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        SqlCommand cmd1 = new SqlCommand("insert into Courses (ID,CourseName,CourseCode,DurationYears,Department,Status,Rts) values((select isnull(max(ID)+1,1) from Courses),'" + txtCourseName.Text + "','" + txtCourseCode.Text + "','" + txtDurationYears.Text + "','" + txtDepartment.Text + "','" + 1 + "',getdate())", con);

        con.Open();
        cmd1.ExecuteNonQuery();
        con.Close();
        this.PopulateData();
        txtCourseName.Text = "";
        txtCourseCode.Text = "";
        txtDurationYears.Text = "";
        txtDepartment.Text = "";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int ID = Convert.ToInt32(e.CommandArgument);
            SqlConnection conn = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=CollegeManagement;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            SqlCommand cmd = new SqlCommand("delete From Courses Where ID=" + ID + "", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            this.PopulateData();
        }

        if (e.CommandName == "edit")
        {
            string ID = e.CommandArgument.ToString();
            lblid.Text = ID.ToString();
            txtCourseName.Text = ((Label)e.Item.FindControl("lblCourseName")).Text;
            txtCourseCode.Text = ((Label)e.Item.FindControl("lblCourseCode")).Text;
            txtDurationYears.Text = ((Label)e.Item.FindControl("lblDurationYears")).Text;
            txtDepartment.Text = ((Label)e.Item.FindControl("lblDepartment")).Text;
        }
    }
    protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void ListView1_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
}