using System;
using System.Collections.Generic;
using System.Configuration;
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
        if (!IsPostBack)
        {
            LoadDashboardData();
            //LoadRecentActivities();
        }
    }
    private void LoadDashboardData()
    {
        string connString = @"Data Source=(localdb)\Projects;Initial Catalog=CollegeManagement;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection conn = new SqlConnection(connString))
        {
            conn.Open();

            // Total Students
            SqlCommand cmdStudents = new SqlCommand("SELECT COUNT(*) FROM Students", conn);
            lblTotalStudents.Text = cmdStudents.ExecuteScalar().ToString();

            // Total Teachers
            SqlCommand cmdTeachers = new SqlCommand("SELECT COUNT(*) FROM Teachers", conn);
            lblTotalTeachers.Text = cmdTeachers.ExecuteScalar().ToString();

            // Total Courses
            SqlCommand cmdCourses = new SqlCommand("SELECT COUNT(*) FROM Courses", conn);
            lblTotalCourses.Text = cmdCourses.ExecuteScalar().ToString();

            // Pending Fees
            //SqlCommand cmdFees = new SqlCommand("SELECT SUM(PendingAmount) FROM Fees WHERE Status = 'Pending'", conn);
            //lblPendingFees.Text = cmdFees.ExecuteScalar().ToString() ?? "0";
        }
    }

    private void LoadRecentActivities()
    {
        string connString = @"Data Source=(localdb)\Projects;Initial Catalog=CollegeManagement;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection conn = new SqlConnection(connString))
        {
            SqlCommand cmd = new SqlCommand("SELECT TOP 5 Activity, ActivityDate FROM ActivityLog ORDER BY ActivityDate DESC", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            //gvActivities.DataSource = dt;
            //gvActivities.DataBind();
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        // Implement logout logic
        Response.Redirect("Login.aspx");
    }

    protected void btnAddStudent_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddStudent.aspx");
    }

    protected void btnAddTeacher_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddTeacher.aspx");
    }

    protected void btnAddCourse_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddCourse.aspx");
    }
}
