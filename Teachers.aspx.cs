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
    }
    private void PopulateData()
    {
        string constr = @"Data Source=(localdb)\Projects;Initial Catalog=CollegeManagement;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * from Teachers";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lvTeachers.DataSource = dt;
                    lvTeachers.DataBind();
                }
            }
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\Projects;Initial Catalog=CollegeManagement;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
        con.Open();

        int ID = 1;
        string query = "Select isnull(max(id) +1,1) from [Teachers]";

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

        string ProfilePhoto = ID + ".jpg";
        if (FileUpload1.HasFile)
        {
            HttpPostedFile files = FileUpload1.PostedFile;
            string imgPath1 = "~/CollegeImg/Teachers/" + ProfilePhoto;
            int widthC1 = 400;
            int heightC1 = 400;
            Stream streamC = files.InputStream;
            using (Bitmap imageC = new Bitmap(streamC))
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
        SqlCommand cmd1 = new SqlCommand("insert into Teachers(ID, Name, Dob, Gender, Email, Phone, Address, Qualification, JoiningDate, Department, ProfilePhoto, Status, Rts) values('" + ID + "', '" + txtName.Text + "','" + txtDob.Text + "','" + ddlGender.SelectedItem + "','" + txtEmail.Text + "','" + txtPhone.Text + "','" + txtAddress.Text + "','" + txtQualification.Text + "', '" + txtJoiningDate.Text + "', '" + ddlDepartment.SelectedItem + "', '" + ProfilePhoto + "', '1' ,getdate())", con);
        cmd1.ExecuteNonQuery();
        con.Close();
        this.PopulateData();
        txtName.Text = "";
        txtDob.Text = "";
        ddlGender.SelectedValue = "";
        txtEmail.Text = "";
        txtPhone.Text = "";
        txtAddress.Text = "";
        txtQualification.Text = "";
        txtJoiningDate.Text = "";
        ddlDepartment.SelectedValue = "";
        ProfilePhoto = "";

    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtName.Text = "";
        txtDob.Text = "";
        ddlGender.SelectedValue = "";
        txtEmail.Text = "";
        txtPhone.Text = "";
        txtAddress.Text = "";
        txtQualification.Text = "";
        txtJoiningDate.Text = "";
        ddlDepartment.SelectedValue = "";
    }
    protected void lvTeachers_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
      
    string id = e.CommandArgument.ToString();

    if (e.CommandName == "delete")
    {
        string connectionString = @"Data Source=(localdb)\Projects;Initial Catalog=CollegeManagement;Integrated Security=True;";
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string sql = "DELETE FROM Teachers WHERE ID = @id";
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        // Refresh data
        this.PopulateData();
    }

    if (e.CommandName == "edit")
    {
        lblID.Text = id;
        txtName.Text = ((Label)e.Item.FindControl("lblName")).Text;
        txtDob.Text = ((Label)e.Item.FindControl("lblDob")).Text;
        ddlGender.SelectedValue = ((Label)e.Item.FindControl("lblGender")).Text;
        txtEmail.Text = ((Label)e.Item.FindControl("lblEmail")).Text;
        txtPhone.Text = ((Label)e.Item.FindControl("lblPhone")).Text;
        txtAddress.Text = ((Label)e.Item.FindControl("lblAddress")).Text;
        txtQualification.Text = ((Label)e.Item.FindControl("lblQualification")).Text;
        txtJoiningDate.Text = ((Label)e.Item.FindControl("lblJoiningDate")).Text;
        ddlDepartment.SelectedValue = ((Label)e.Item.FindControl("lblDepartment")).Text;
        ProfilePhoto.ImageUrl = "CollegeImg/Teachers/" + ((Label)e.Item.FindControl("lblProfilePhoto")).Text;

        // Optional: Set hidden field or modal activation here if needed
    }
}

    protected void lvTeachers_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
    protected void lvTeachers_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string ProfilePhoto = ID + ".jpg";
        if (FileUpload1.HasFile)
        {
            HttpPostedFile files1 = FileUpload1.PostedFile;
            string imgPath1 = "~/CollegeImg/Teachers/" + ProfilePhoto;
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
        string sql = "update Teachers set Name='" + txtName.Text + "', Dob='" + txtDob.Text + "', Gender='" + ddlGender.SelectedItem + "', Email='" + txtEmail.Text + "', Phone='" + txtPhone.Text + "', Address='" + txtAddress.Text + "', Qualification='" + txtQualification.Text + "', JoiningDate='" + txtJoiningDate.Text + "', Department='" + ddlDepartment.Text + "',ProfilePhoto='" + ProfilePhoto + "', Status='1'  where id='" + lblID.Text + "' ";
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
        txtAddress.Text = "";
        txtQualification.Text = "";
        txtJoiningDate.Text = "";
        ddlDepartment.SelectedValue = "";
        ProfilePhoto = "";
    }
}