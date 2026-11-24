<%@ Page Title="" Language="C#" MasterPageFile="~/CollegeManagement.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="~/Teachers.aspx.cs" Inherits="_Default"   %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container-fluid {
            /*max-width: 1300px;*/
            margin-top: 30px;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .mycard {
            max-width:1200px;
            justify-self: center;
        }
        .card-header {
            background-color: #007bff;
            color: white;
            border-radius: 10px 10px 0 0;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .error {
            color: #dc3545;
            font-size: 0.9em;
        }
        .table {
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
        }
        .table th {
            background-color: #007bff;
            color: white;
        }
        .student-photo {
        width: 60px;
        height: auto;
        border-radius: 5px;
    }
    </style>
    <div class="container-fluid">
            <div class="card mb-4 mycard">
    <div class="card-header">
        <h3 class="mb-0">Add New Teacher</h3>
    </div>
    <div class="card-body">
        <div class="row g-3">
            <div class="col-md-4">
                <asp:Label ID="lblID" runat="server" Visible="false" Text="Label"></asp:Label>
                <asp:Label ID="lblName" runat="server" Text="Label">Teacher Name</asp:Label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-4">
                <asp:Label ID="lblDob" runat="server" Text="Label">Date of Birth</asp:Label>
                <asp:TextBox ID="txtDob" runat="server" TextMode="Date" CssClass="form-control" />
            </div>
            <div class="col-md-4">
                <asp:Label ID="lblGender" runat="server" Text="Label">Gender</asp:Label>
                <br />
                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select">
                    <asp:ListItem Text="Select Gender" Value="" />
                    <asp:ListItem Text="Male" Value="M" />
                    <asp:ListItem Text="Female" Value="F" />
                    <asp:ListItem Text="Other" Value="O" />
                </asp:DropDownList>
            </div>
            <div class="col-md-4">
                <asp:Label ID="lblEmail" runat="server" Text="Label">Email</asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" />
            </div>
            <div class="col-md-4">
                <asp:Label ID="lblPhone" runat="server" Text="Label">Phone Number</asp:Label>
                <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" CssClass="form-control" />
            </div>
            <div class="col-md-4">
                <asp:Label ID="lblAddress" runat="server" Text="Label">Address</asp:Label>
                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" />
            </div>
            <div class="col-md-4">
                <asp:Label ID="lblQualification" runat="server" Text="Label">Qualification</asp:Label>
                <asp:TextBox ID="txtQualification" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-4">
                <asp:Label ID="lblJoiningDate" runat="server" Text="Label">Joining Date</asp:Label>
                <asp:TextBox ID="txtJoiningDate" runat="server" TextMode="Date" CssClass="form-control" />
            </div>
            <div class="col-md-4">
                <asp:Label ID="lblDepartment" runat="server" Text="Label">Department</asp:Label>
                <br />
                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-select">
                    <asp:ListItem Text="Select Department" Value="" />
                    <asp:ListItem Text="Computer Science" Value="CS" />
                    <asp:ListItem Text="Mathematics" Value="Math" />
                    <asp:ListItem Text="Physics" Value="Phy" />
                    <asp:ListItem Text="Chemistry" Value="Chem" />
                </asp:DropDownList>
            </div>
            <div class="col-md-4">
                <asp:Label ID="lblProfilePhoto" runat="server" Text="Label">Profile Photo</asp:Label>
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Image ID="ProfilePhoto" runat="server" Width="100" />
            </div>
        </div>
        <div class="mt-3">
            <asp:Button ID="btnAdd" runat="server" Text="Add Teacher" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-secondary" OnClick="btnClear_Click" />
        </div>
        <div class="modal-footer">
            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
        </div>
        <asp:Label ID="lblMessage" runat="server" CssClass="error mt-2 d-block" />
        <asp:HiddenField ID="hdnId" runat="server" />
    </div>
</div>

            <div class="card">
                <div class="card-header">
                    <h3 class="mb-0">Teachers List</h3>
                </div>
                <div class="card-body">
                    <asp:ListView ID="lvTeachers" runat="server" OnItemCommand="lvTeachers_ItemCommand" OnItemEditing="lvTeachers_ItemEditing" OnItemDeleting="lvTeachers_ItemDeleting">
                        <LayoutTemplate>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Dob</th>
                                        <th>Gender</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Address</th>
                                        <th>Qualification</th>
                                        <th>JoiningDate</th>
                                        <th>Department</th>
                                        <th>ProfilePhoto</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                </tbody>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblID" runat="server" Visible="false" Text='<%# Eval("ID") %>'></asp:Label>
                            <asp:Label ID="lblName" runat="server" Visible="false" Text='<%# Eval("Name") %>'></asp:Label>
                            <asp:Label ID="lblDob" runat="server" Visible="false" Text='<%# Eval("Dob") %>'></asp:Label>
                            <asp:Label ID="lblGender" runat="server" Visible="false" Text='<%# Eval("Gender") %>'></asp:Label>
                            <asp:Label ID="lblEmail" runat="server" Visible="false" Text='<%# Eval("Email") %>'></asp:Label>
                            <asp:Label ID="lblPhone" runat="server" Visible="false" Text='<%# Eval("Phone") %>'></asp:Label>
                            <asp:Label ID="lblAddress" runat="server" Visible="false" Text='<%# Eval("Address") %>'></asp:Label>
                            <asp:Label ID="lblQualification" runat="server" Visible="false" Text='<%# Eval("Qualification") %>'></asp:Label>
                            <asp:Label ID="lblJoiningDate" runat="server" Visible="false" Text='<%# Eval("JoiningDate") %>'></asp:Label>
                            <asp:Label ID="lblDepartment" runat="server" Visible="false" Text='<%# Eval("Department") %>'></asp:Label>
                            <asp:Label ID="lblProfilePhoto" runat="server" Visible="false" Text='<%# Eval("ProfilePhoto") %>'></asp:Label>
                            <asp:Label ID="lblRts" runat="server" Visible="false" Text='<%# Eval("Rts") %>'></asp:Label>
                            <asp:Label ID="lblStatus" runat="server" Visible="false" Text='<%# Eval("Status") %>'></asp:Label>
                            <tr>
                                <td><%# Eval("ID") %></td>
                                <td><%# Eval("Name") %></td>
                                <td><%# Eval("Dob") %></td>
                                <td><%# Eval("Gender") %></td>
                                <td><%# Eval("Email") %></td>
                                <td><%# Eval("Phone") %></td>
                                <td><%# Eval("Address") %></td>
                                <td><%# Eval("Qualification") %></td>
                                <td><%# Eval("JoiningDate") %></td>
                                <td><%# Eval("Department") %></td>
                                <td><img class="student-photo" src='CollegeImg/Teachers/<%# Eval("ProfilePhoto") %>' onerror="this.onerror=null;this.src='CollegeImg/Teachers/__Page.jpg';" /></td>
                                <td><%# Eval("Status") %></td>
                                <td>
                                    <asp:LinkButton ID="btnEdit" runat="server" Text="Edit" CommandName="edit" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-sm btn-warning me-2" data-bs-toggle="modal" data-bs-target="#editModal">Edit</asp:LinkButton>
                                    <asp:LinkButton ID="btnDelete" runat="server" Text="Delete" CommandName="delete" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Are you sure you want to delete this teacher?');" >Delete</asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <div class="alert alert-info">No teachers found.</div>
                        </EmptyDataTemplate>
                    </asp:ListView>
                </div>
            </div>

            <!-- Edit Modal -->
            <%--<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editModalLabel">Edit Teacher</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="txtEditName" class="form-label">Teacher Name</label>
                                <asp:TextBox ID="txtEditName" runat="server" CssClass="form-control" />
                            </div>
                            <div class="mb-3">
                                <label for="txtEditEmail" class="form-label">Email</label>
                                <asp:TextBox ID="txtEditEmail" runat="server" TextMode="Email" CssClass="form-control" />
                            </div>
                            <div class="mb-3">
                                <label for="ddlEditDepartment" class="form-label">Department</label>
                                <asp:DropDownList ID="ddlEditDepartment" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="Select Department" Value="" />
                                    <asp:ListItem Text="Computer Science" Value="CS" />
                                    <asp:ListItem Text="Mathematics" Value="Math" />
                                    <asp:ListItem Text="Physics" Value="Phy" />
                                    <asp:ListItem Text="Chemistry" Value="Chem" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>--%>
        </div>
</asp:Content>

