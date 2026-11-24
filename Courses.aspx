<%@ Page Title="" Language="C#" MasterPageFile="~/CollegeManagement.master" AutoEventWireup="true" CodeFile="Courses.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="container-fluid mt-4">
        <div class="row">
            <!-- Left Column -->
            <div class="col-lg-6">
                <div class="card shadow p-4">
                    <h4 class="mb-3 text-primary">Add New Course</h4>

                    <div class="form-group mb-2">
                        <label>Course Name</label>
                        <asp:TextBox ID="txtCourseName" runat="server" CssClass="form-control" />
                    </div>

                    <div class="form-group mb-2">
                        <label>Course Code</label>
                        <asp:TextBox ID="txtCourseCode" runat="server" CssClass="form-control" />
                    </div>

                    <div class="form-group mb-2">
                        <label>Duration (Years)</label>
                        <asp:TextBox ID="txtDurationYears" runat="server" CssClass="form-control" />
                    </div>

                    <div class="form-group mb-3">
                        <label>Department</label>
                        <asp:TextBox ID="txtDepartment" runat="server" CssClass="form-control" />
                    </div>

                    <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-success me-2" OnClick="Button1_Click" />
                    <br />
                    <asp:Button ID="Button2" runat="server" Text="Update" CssClass="btn btn-secondary" OnClick="Button2_Click" />

                    <asp:Label ID="lblid" runat="server" Visible="false" CssClass="d-block mt-3 text-muted"></asp:Label>
                </div>
            </div>

            <!-- Right Column -->
            <div class="col-lg-6">
                <div class="card shadow p-4">
                    <h4 class="mb-3 text-primary">Course List</h4>

                    <table class="table table-bordered table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Course Name</th>
                                <th>Code</th>
                                <th>Duration</th>
                                <th>Department</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand" OnItemDeleting="ListView1_ItemDeleting" OnItemEditing="ListView1_ItemEditing">
                                <ItemTemplate>

                                    <asp:Label ID="lblCourseName" runat="server" Text='<%# Eval("CourseName") %>' Visible="false"></asp:Label>
            <asp:Label ID="lblCourseCode" runat="server" Text='<%# Eval("CourseCode") %>' Visible="false"></asp:Label>
            <asp:Label ID="lblDurationYears" runat="server" Text='<%# Eval("DurationYears") %>' Visible="false"></asp:Label>
            <asp:Label ID="lblDepartment" runat="server" Text='<%# Eval("Department") %>' Visible="false"></asp:Label>




 
                                    <tr>
                                        <td><%# Eval("ID") %></td>
                                        <td><%# Eval("CourseName") %></td>
                                        <td><%# Eval("CourseCode") %></td>
                                        <td><%# Eval("DurationYears") %></td>
                                        <td><%# Eval("Department") %></td>
                                        <td>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-danger btn-sm me-1" OnClientClick="return confirm('Are you sure you want to delete this Courses?');">Delete</asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="edit" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-warning btn-sm">Edit</asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

