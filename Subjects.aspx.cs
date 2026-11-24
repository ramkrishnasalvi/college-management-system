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
                cmd.CommandText = "SELECT * From Subjects";
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
        SqlCommand cmd = new SqlCommand("insert into Subjects (SubjectName,SubjectCode,CreditHours,Semester,Status,Rts) values('" + txtSubjectName.Text + "','" + txtSubjectCode.Text + "','" + txtCreditHours.Text + "','" + txtSemester.Text + "','" + 1 + "',getdate())", con);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        this.PopulateData();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=CollegeManagement;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
         SqlCommand cmd = new SqlCommand("update Subjects set SubjectName='" + txtSubjectName.Text + "',SubjectCode='" + txtSubjectCode.Text + "',CreditHours='" + txtCreditHours.Text + "', Semester ='" + txtSemester.Text + "' Where SubjectId =" + lblid.Text + "", con);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        this.PopulateData();
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string id = e.CommandArgument.ToString();
            SqlConnection conn = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=CollegeManagement;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            SqlCommand cmd = new SqlCommand("delete From Subjects Where ID=" + ID + "", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            this.PopulateData();
        }

        if (e.CommandName == "Edit")
        {
            string ID = e.CommandArgument.ToString();
            lblid.Text = ID.ToString();
            txtSubjectName.Text = ((Label)e.Item.FindControl("lblSubjectName")).Text;
            txtSubjectCode.Text = ((Label)e.Item.FindControl("lblSubjectCode")).Text;
            txtCreditHours.Text = ((Label)e.Item.FindControl("lblCreditHours")).Text;
            txtSemester.Text = ((Label)e.Item.FindControl("lblSemester")).Text;

        }
    }
    protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void ListView1_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
}