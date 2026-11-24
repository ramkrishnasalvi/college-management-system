<%@ Page Title="" Language="C#" MasterPageFile="~/CollegeManagement.master" AutoEventWireup="true" CodeFile="Students.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background: #f7f9fc;
    }

    .form-container {
        max-width: 800px;
        margin: 40px auto 40px;
        background: white;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 0 15px rgba(0,0,0,0.1);
    }

    .form-group {
        margin-bottom: 15px;
    }

    .form-group label {
        display: block;
        margin-bottom: 6px;
        font-weight: 600;
    }

    .form-group input[type="text"],
    .form-group input[type="email"],
    .form-group input[type="date"],
    .form-group input[type="tel"],
    .form-group textarea {
        width: 100%;
        padding: 8px 12px;
        border: 1px solid #ccc;
        border-radius: 6px;
        box-sizing: border-box;
    }
    .student-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 40px;
    }

    .student-table th,
    .student-table td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
    }

    .student-table th {
        background-color: #007bff;
        color: white;
    }

    .student-photo {
        width: 60px;
        height: auto;
        border-radius: 5px;
    }
</style>
    <div class="form-container">
        <h2>Student Panel</h2>
    <asp:Label ID="lblID" runat="server" Visible="false" Text="Label"></asp:Label>

    <div class="form-group">
        <label>Name</label>
        <asp:TextBox ID="txtName" runat="server" />
    </div>

    <div class="form-group">
        <label>Date of Birth</label>
        <asp:TextBox ID="txtDob" runat="server" TextMode="Date" />
    </div>

    <div class="form-group">
        <asp:Label ID="lblGender" runat="server" Text="Label">Gender</asp:Label>
    <asp:DropDownList ID="ddlGender" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlGender_SelectedIndexChanged" />
    <asp:Label ID="lblSelectedGender" runat="server" Font-Bold="true" />
</div>

    <div class="form-group">
        <label>Email</label>
        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" />
    </div>

    <div class="form-group">
        <label>Phone</label>
        <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" />
    </div>

    <div class="form-group">
        <label>Admission Date</label>
        <asp:TextBox ID="txtAdmissionDate" runat="server" TextMode="Date" />
    </div>

    <div class="form-group">
        <label>Course</label>
        <asp:TextBox ID="txtCourse" runat="server" />
    </div>

    <div class="form-group">
        <label>Address</label>
        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" />
    </div>

    <div class="form-group">
        <label>Upload Photo</label>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Image ID="StudentPhoto" runat="server" Height="100" Width="100" />
    </div>

    <asp:Button ID="Insert" runat="server" Text="Insert" CssClass="btn btn-success" OnClick="Insert_Click" />
    <asp:Button ID="Update" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="Update_Click" />
</div>

<asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand" OnItemEditing="ListView1_ItemEditing" OnItemDeleting="ListView1_ItemDeleting">
    <LayoutTemplate>
        <table class="student-table">

            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>DOB</th>
                <th>Gender</th>
                <th>Email</th>
                <th>Phone</th>
                <th>AdmissionDate</th>
                <th>Course</th>
                <th>Address</th>
                <th>Photo</th>
                <th>Status</th>
                <th colspan="4">Action</th>
            </tr>
            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
        </table>
    </LayoutTemplate>

    <ItemTemplate>
        <asp:Label ID="lblID" runat="server" Visible="false" Text='<%# Eval("ID") %>'></asp:Label>
        <asp:Label ID="lblName" runat="server" Visible="false" Text='<%# Eval("Name") %>'></asp:Label>
        <asp:Label ID="lblDob" runat="server" Visible="false" Text='<%# Eval("Dob") %>'></asp:Label>
        <asp:Label ID="lblGender" runat="server" Visible="false" Text='<%# Eval("Gender") %>'></asp:Label>
        <asp:Label ID="lblEmail" runat="server" Visible="false" Text='<%# Eval("Email") %>'></asp:Label>
        <asp:Label ID="lblPhone" runat="server" Visible="false" Text='<%# Eval("Phone") %>'></asp:Label>
        <asp:Label ID="lblAdmissionDate" runat="server" Visible="false" Text='<%# Eval("AdmissionDate") %>'></asp:Label>
        <asp:Label ID="lblCourse" runat="server" Visible="false" Text='<%# Eval("Course") %>'></asp:Label>
        <asp:Label ID="lblAddress" runat="server" Visible="false" Text='<%# Eval("Address") %>'></asp:Label>
        <asp:Label ID="lblStudentPhoto" runat="server" Visible="false" Text='<%# Eval("StudentPhoto") %>'></asp:Label>
        <asp:Label ID="lblRts" runat="server" Visible="false" Text='<%# Eval("Rts") %>'></asp:Label>
        <asp:Label ID="lblStatus" runat="server" Visible="false" Text='<%# Eval("Status") %>'></asp:Label>
        <tr>
            <td><%# Eval("ID") %></td>
            <td><%# Eval("Name") %></td>
            <td><%# Eval("Dob") %></td>
            <td><%# Eval("Gender") %></td>
            <td><%# Eval("Email") %></td>
            <td><%# Eval("Phone") %></td>
            <td><%# Eval("AdmissionDate") %></td>
            <td><%# Eval("Course") %></td>
            <td><%# Eval("Address") %></td>
            <td><img class="student-photo" src='CollegeImg/Students/<%# Eval("StudentPhoto") %>' onerror="this.onerror=null;this.src='CollegeImg/Students/__Page.jpg';" /></td>
            <td><%# Eval("Status") %></td>
            <td><asp:LinkButton ID="LinkButton1" CssClass="btn btn-sm btn-danger" CommandName="delete" CommandArgument='<%# Eval("ID") %>' runat="server" OnClientClick="return confirm('Are you sure you want to delete this Student?');">Delete</asp:LinkButton></td>
            <td><asp:LinkButton ID="LinkButton2" CssClass="btn btn-sm btn-warning" CommandName="edit" CommandArgument='<%# Eval("ID") %>' runat="server">Edit</asp:LinkButton></td>
            <td><asp:LinkButton ID="LinkButton3" CssClass="btn btn-sm btn-success" CommandName="active" CommandArgument='<%# Eval("ID") %>' runat="server">Active</asp:LinkButton></td>
            <td><asp:LinkButton ID="LinkButton4" CssClass="btn btn-sm btn-danger" CommandName="deactive" CommandArgument='<%# Eval("ID") %>' runat="server">De-Active</asp:LinkButton></td>
        </tr>
    </ItemTemplate>
</asp:ListView>
</asp:Content>

