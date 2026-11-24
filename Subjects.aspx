<%@ Page Title="" Language="C#" MasterPageFile="~/CollegeManagement.master" AutoEventWireup="true" CodeFile="Subjects.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        body {
            background: linear-gradient(to right, #e0f7fa, #f8f9fa);
        }
        .card {
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        .table thead {
            background-color: #007bff;
            color: white;
        }
    </style>
    <div class="container mt-5">
        <h2 class="text-center mb-4 text-primary">Subject Management</h2>
        <div class="row">
            <!-- Left Column: Form -->
            <div class="col-lg-6 mb-4">
                <div class="card shadow-lg border-0 rounded p-4 bg-light">
                    <h5 class="card-title mb-3 text-success">Add New Subject</h5>

                    <div class="form-group mb-3">
                        <label for="txtSubjectName">Subject Name</label>
                        <asp:TextBox ID="txtSubjectName" CssClass="form-control" runat="server" placeholder="Enter subject name"></asp:TextBox>
                    </div>

                    <div class="form-group mb-3">
                        <label for="txtSubjectCode">Subject Code</label>
                        <asp:TextBox ID="txtSubjectCode" CssClass="form-control" runat="server" placeholder="Enter subject code"></asp:TextBox>
                    </div>

                    <div class="form-group mb-3">
                        <label for="txtCreditHours">Credit Hours</label>
                        <asp:TextBox ID="txtCreditHours" CssClass="form-control" runat="server" placeholder="Enter credit hours"></asp:TextBox>
                    </div>

                    <div class="form-group mb-3">
                        <label for="txtSemester">Semester</label>
                        <asp:TextBox ID="txtSemester" CssClass="form-control" runat="server" placeholder="Enter semester number"></asp:TextBox>
                    </div>

                    <div class="text-center">
                        <asp:Button ID="Button1" CssClass="btn btn-primary me-2" runat="server" Text="Submit" OnClick="Button1_Click" />
                        <asp:Button ID="Button2" CssClass="btn btn-secondary" runat="server" Text="Update" OnClick="Button2_Click" />
                    </div>

                    <asp:Label ID="lblid" runat="server" Visible="false" CssClass="mt-3 text-danger d-block text-center"></asp:Label>
                </div>
            </div>

            <!-- Right Column: Subject List -->
            <div class="col-lg-6 mb-4">
                <div class="card shadow-lg border-0 rounded p-4 bg-white">
                    <h5 class="card-title text-success mb-3">Subject List</h5>
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-hover">
                            <thead class="table-primary">
                                <tr class="text-center">
                                    <th>Subject</th>
                                    <th>Code</th>
                                    <th>Hours</th>
                                    <th>Semester</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="subjectTable">
                                <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand" OnItemDeleting="ListView1_ItemDeleting" OnItemEditing="ListView1_ItemEditing">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSubjectName" runat="server" Text='<%# Eval("SubjectName") %>' Visible="false"></asp:Label>
            <asp:Label ID="lblSubjectCode" runat="server" Text='<%# Eval("SubjectCode") %>' Visible="false"></asp:Label>
            <asp:Label ID="lblCreditHours" runat="server" Text='<%# Eval("CreditHours") %>' Visible="false"></asp:Label>
            <asp:Label ID="lblSemester" runat="server" Text='<%# Eval("Semester") %>' Visible="false"></asp:Label>

                                        <tr class="text-center">
                                            <td><%# Eval("SubjectName") %></td>
                                            <td><%# Eval("SubjectCode") %></td>
                                            <td><%# Eval("CreditHours") %></td>
                                            <td><%# Eval("Semester") %></td>
                                            <td>
                                                <asp:LinkButton ID="btnDelete" CssClass="btn btn-sm btn-danger me-1" runat="server" CommandName="Delete" CommandArgument='<%# Eval("ID") %>' OnClientClick="return confirm('Are you sure you want to delete this Subject?');">Delete</asp:LinkButton>
                                                <asp:LinkButton ID="btnEdit" CssClass="btn btn-sm btn-warning" runat="server" CommandName="Edit" CommandArgument='<%# Eval("ID") %>'>Edit</asp:LinkButton>
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
    </div>
</asp:Content>

