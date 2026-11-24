<%@ Page Title="" Language="C#" MasterPageFile="~/CollegeManagement.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
        }
        .sidebar {
            height: 100vh;
            position: fixed;
            width: 250px;
            background-color: #343a40;
            padding-top: 20px;
        }
        .sidebar a {
            color: white;
            padding: 15px;
            display: block;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .main-content {
            margin-left: 260px;
            padding: 20px;
        }
        .card {
            margin-bottom: 20px;
        }
        .navbar {
            background-color: #007bff;
            color: white;
        }
        .navbar-brand, .nav-link {
            color: white !important;
        }
    </style>
        <div class="sidebar">
            <h3 class="text-white text-center">Admin Dashboard</h3>
            <a href="Dashboard.aspx">Dashboard</a>
            <a href="Students.aspx">Student Management</a>
            <a href="Teachers.aspx">Teacher Management</a>
            <a href="Courses.aspx">Course Management</a>
            <a href="Subjects.aspx">Subjects</a>
            <a href="Attendance.aspx">Attendance</a>
            <a href="#reports">Fees Management</a>
        </div>

        <div class="main-content">
            <nav class="navbar navbar-expand-lg">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">College Management System</a>
                    <div class="navbar-nav ms-auto">
                        <asp:Button ID="btnLogout"  Text="Logout" CssClass="btn btn-outline-light" OnClick="btnLogout_Click" />
                    </div>
                </div>
            </nav>

            <div class="container mt-4">
                <h2>Dashboard Overview</h2>
                <div class="row">
                    <div class="col-md-3">
                        <div class="card text-white bg-primary">
                            <div class="card-body">
                                <h5 class="card-title">Total Students</h5>
                                <asp:Label ID="lblTotalStudents" runat="server" Text="0" Font-Size="Large"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-white bg-success">
                            <div class="card-body">
                                <h5 class="card-title">Total Teachers</h5>
                                <asp:Label ID="lblTotalTeachers" runat="server" Text="0" Font-Size="Large"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-white bg-warning">
                            <div class="card-body">
                                <h5 class="card-title">Total Courses</h5>
                                <asp:Label ID="lblTotalCourses" runat="server" Text="0" Font-Size="Large"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <%--<div class="col-md-3">
                        <div class="card text-white bg-info">
                            <div class="card-body">
                                <h5 class="card-title">Pending Fees</h5>
                                <asp:Label ID="lblPendingFees" runat="server" Text="0" Font-Size="Large"></asp:Label>
                            </div>
                        </div>
                    </div>--%>
                </div>

                <%--<div class="row mt-4">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">Recent Activities</div>
                            <div class="card-body">
                                <asp:GridView ID="gvActivities" runat="server" CssClass="table table-striped" AutoGenerateColumns="True"></asp:GridView>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">Quick Actions</div>
                            <div class="card-body">
                                <asp:Button ID="btnAddStudent"  Text="Add New Student" CssClass="btn btn-primary mb-2" OnClick="btnAddStudent_Click" />
                                <asp:Button ID="btnAddTeacher"  Text="Add New Teacher" CssClass="btn btn-primary mb-2" OnClick="btnAddTeacher_Click" />
                                <asp:Button ID="btnAddCourse"  Text="Add New Course" CssClass="btn btn-primary mb-2" OnClick="btnAddCourse_Click" />
                            </div>
                        </div>
                    </div>
                </div>--%>
            </div>
        </div>
</asp:Content>

