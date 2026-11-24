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
        if (!IsPostBack)
        {
            string constr = (@"Data Source=(localdb)\Projects;Initial Catalog=CollegeManagement;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * from Students"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    ddlStudents.DataSource = cmd.ExecuteReader();
                    ddlStudents.DataValueField = "ID";
                    ddlStudents.DataBind();
                    con.Close();
                }
                ddlStudents.Items.Insert(0, new ListItem("--Select Category--", "0"));
            }
            
        }
    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        if (ddlStudents.SelectedIndex == 0 || rblStatus.SelectedIndex == -1)
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "Please select a student and status.";
            return;
        }
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=CollegeManagement;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        con.Open();

        int ID = 1;
        string query = "Select isnull(max(id) +1,1) from [Attendance]";

        using (SqlConnection conn = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=CollegeManagement;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False"))
        {
            conn.Open();
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                object result = cmd.ExecuteScalar();
                if (result != null && result != DBNull.Value)
                {
                    ID = Convert.ToInt32(result);
                }
            }
        }
        SqlCommand cmd1 = new SqlCommand("insert into Attendance(StudentsID, ID, AttendanceDate, Status, Rts) values('" + ddlStudents.SelectedValue + "', '" + ID + "', '" + txtAttendanceDate.Text + "','1' ,getdate())", con);
        cmd1.ExecuteNonQuery();
        con.Close();
        this.PopulateData();
        txtAttendanceDate.Text = "";
        lblMessage.ForeColor = System.Drawing.Color.Green;
        lblMessage.Text = "Attendance saved successfully!";
    }
    private void PopulateData()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=CollegeManagement;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * from Attendance";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lvAttendance.DataSource = dt;
                    lvAttendance.DataBind();
                }
            }
        }
    }
    protected void lvAttendance_ItemCommand(object sender, ListViewCommandEventArgs e)
    {

    }
    protected void lvAttendance_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
    protected void lvAttendance_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
}
