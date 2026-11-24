using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
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
            ddlGender.Items.Clear();
            ddlGender.Items.Add(new ListItem("-- Select Gender --", ""));
            ddlGender.Items.Add(new ListItem("Male", "Male"));
            ddlGender.Items.Add(new ListItem("Female", "Female"));
            ddlGender.Items.Add(new ListItem("Other", "Other"));
        }
    }
    protected void ddlGender_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblSelectedGender.Text = "Selected Gender: " + ddlGender.SelectedItem.Text;
    }
    protected void Insert_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=CollegeManagement;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        con.Open();

        int ID = 1;
        string query = "Select isnull(max(id) +1,1) from [Students]";

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

        string StudentPhoto = ID + ".jpg";
        if (FileUpload1.HasFile)
        {
            HttpPostedFile files = FileUpload1.PostedFile;
            string imgPath1 = "~/CollegeImg/Students/" + StudentPhoto;
            int widthC = 800;
            int heightC = 800;
            Stream streamC = files.InputStream;
            using (Bitmap imageC = new Bitmap(streamC))
            {
                using (Bitmap targetC = new Bitmap(widthC, heightC, PixelFormat.Format24bppRgb))
                {
                    using (Graphics graphicC = Graphics.FromImage(targetC))
                    {
                        graphicC.SmoothingMode = SmoothingMode.AntiAlias;
                        graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
                        graphicC.CompositingQuality = CompositingQuality.HighSpeed;
                        graphicC.CompositingMode = CompositingMode.SourceCopy;
                        graphicC.DrawImage(imageC, 0, 0, widthC, heightC);
                        targetC.Save(Server.MapPath(imgPath1), ImageFormat.Jpeg);
                    }
                }
            }
        }
        SqlCommand cmd1 = new SqlCommand("insert into Students(ID, Name, Dob, Gender, Email, Phone, AdmissionDate, Course, Address, StudentPhoto, Status, Rts) values('" + ID + "','" + txtName.Text + "', '" + txtDob.Text + "', '" + ddlGender.SelectedItem + "','" + txtEmail.Text + "','" + txtPhone.Text + "','" + txtAdmissionDate.Text + "','" + txtCourse.Text + "','" + txtAddress.Text + "','" + StudentPhoto + "', '1' ,getdate())", con);
        cmd1.ExecuteNonQuery();
        con.Close();
        this.PopulateData();
        txtName.Text = "";
        txtDob.Text = "";
        ddlGender.SelectedValue = "";
        txtEmail.Text = "";
        txtPhone.Text = "";
        txtAdmissionDate.Text = "";
        txtCourse.Text = "";
        txtAddress.Text = "";
        StudentPhoto = "";
    }
    private void PopulateData()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=CollegeManagement;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * from Students ";
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
    protected void Update_Click(object sender, EventArgs e)
    {
        string StudentPhoto = ID + ".jpg";
        if (FileUpload1.HasFile)
        {
            HttpPostedFile files1 = FileUpload1.PostedFile;
            string imgPath1 = "~/CollegeImg/Students/" + StudentPhoto;
            int widthC1 = 100;
            int heightC1 = 100;
            Stream streamC1 = files1.InputStream;
            using (Bitmap imageC = new Bitmap(streamC1))
            {
                using (Bitmap targetC = new Bitmap(widthC1, heightC1, PixelFormat.Format24bppRgb))
                {
                    using (Graphics graphicC = Graphics.FromImage(targetC))
                    {
                        graphicC.SmoothingMode = SmoothingMode.AntiAlias;
                        graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
                        graphicC.CompositingQuality = CompositingQuality.HighSpeed;
                        graphicC.CompositingMode = CompositingMode.SourceCopy;
                        graphicC.DrawImage(imageC, 0, 0, widthC1, heightC1);
                        targetC.Save(Server.MapPath(imgPath1), ImageFormat.Jpeg);
                    }
                }
            }
        }
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=CollegeManagement;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        string sql = "update Students set Name='" + txtName.Text + "', Dob='" + txtDob.Text + "', Gender='" + ddlGender.SelectedValue + "', Email='" + txtEmail.Text + "', Phone='" + txtPhone.Text + "',AdmissionDate='" + txtAdmissionDate.Text + "', Course='" + txtCourse.Text + "', Address='" + txtAddress.Text + "', StudentPhoto='" + StudentPhoto + "', Status='1'  where id='" + lblID.Text + "' ";
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        this.PopulateData();
        txtName.Text = "";
        txtDob.Text = "";
        ddlGender.SelectedValue = "";
        txtEmail.Text = "";
        txtPhone.Text = "";
        txtAdmissionDate.Text = "";
        txtCourse.Text = "";
        txtAddress.Text = "";
        StudentPhoto = "";
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            string id = e.CommandArgument.ToString();

            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=CollegeManagement;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            string sql = "delete from Students where id=" + id + "";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();

            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
            con.Close();
            this.PopulateData();
        }
        if (e.CommandName == "edit")
        {
            string id = e.CommandArgument.ToString();
            lblID.Text = id.ToString();
            txtName.Text = ((Label)e.Item.FindControl("lblName")).Text;
            txtDob.Text = ((Label)e.Item.FindControl("lblDob")).Text;
            ddlGender.SelectedValue = ((Label)e.Item.FindControl("lblGender")).Text;
            txtEmail.Text = ((Label)e.Item.FindControl("lblEmail")).Text;
            txtPhone.Text = ((Label)e.Item.FindControl("lblPhone")).Text;
            txtAdmissionDate.Text = ((Label)e.Item.FindControl("lblAdmissionDate")).Text;
            txtCourse.Text = ((Label)e.Item.FindControl("lblCourse")).Text;
            txtAddress.Text = ((Label)e.Item.FindControl("lblAddress")).Text;
            StudentPhoto.ImageUrl = "CollegeImg/Students/" + ((Label)e.Item.FindControl("lblStudentPhoto")).Text;
            this.PopulateData();
        }

        if (e.CommandName == "active")
        {
            string id = e.CommandArgument.ToString();
            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=CollegeManagement;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            SqlCommand cmd = new SqlCommand("update Students set Status=1 where id=" + id + "", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            this.PopulateData();
        }
        if (e.CommandName == "deactive")
        {
            string id = e.CommandArgument.ToString();
            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=CollegeManagement;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            SqlCommand cmd = new SqlCommand("update Students set Status=0 where id=" + id + "", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            this.PopulateData();
        }
    }
    protected void ListView1_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
    protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
}