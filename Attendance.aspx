<%@ Page Title="" Language="C#" MasterPageFile="~/CollegeManagement.master" AutoEventWireup="true" CodeFile="Attendance.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #f2f6fa;
        margin: 0;
        padding: 0;
    }

    .attendance-container {
        max-width: 700px;
        margin: 40px auto;
        background-color: #fff;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    }

    .attendance-container h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #333;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
        margin-bottom: 6px;
        font-weight: 600;
        color: #444;
    }

    .form-group select,
    .form-group .aspNetRadioList {
        width: 100%;
        padding: 10px;
        font-size: 15px;
        border: 1px solid #ccc;
        border-radius: 6px;
    }

    .aspNetRadioList table {
        width: 100%;
    }

    .aspNetRadioList td {
        padding-right: 20px;
    }

    .submit-btn {
        display: block;
        width: 100%;
        padding: 12px;
        background-color: #007bff;
        color: white;
        font-size: 16px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        margin-top: 10px;
    }

    .submit-btn:hover {
        background-color: #0056b3;
    }

    .message-label {
        margin-top: 15px;
        text-align: center;
        font-weight: 600;
    }

    .attendance-table {
        width: 100%;
        margin-top: 30px;
        border-collapse: collapse;
    }

    .attendance-table th,
    .attendance-table td {
        border: 1px solid #ccc;
        padding: 10px;
        text-align: center;
    }

    .attendance-table th {
        background-color: #007bff;
        color: white;
    }
</style>
    <div class="attendance-container">
    <h2>Mark Student Attendance</h2>

    <div class="form-group">
        <label>Select Student:</label>
        <asp:DropDownList ID="ddlStudents" runat="server" CssClass="form-control" />
    </div>
        <asp:TextBox ID="txtAttendanceDate" Type="Date" runat="server"></asp:TextBox>
        <asp:Label ID="lblID" runat="server" Visible="false" Text="Label"></asp:Label>
    <div class="form-group">
        <label>Status:</label>
        <asp:RadioButtonList ID="rblStatus" runat="server" RepeatDirection="Horizontal" CssClass="aspNetRadioList">
            <asp:ListItem Text="Present" Value="1" />
            <asp:ListItem Text="Absent" Value="0" />
        </asp:RadioButtonList>
    </div>

    <asp:Button ID="Submit" runat="server" Text="Save Attendance" CssClass="submit-btn" OnClick="Submit_Click" />

    <asp:Label ID="lblMessage" runat="server" CssClass="message-label" ForeColor="Green" />

    <asp:ListView ID="lvAttendance" runat="server" OnItemCommand="lvAttendance_ItemCommand" OnItemEditing="lvAttendance_ItemEditing" OnItemDeleting="lvAttendance_ItemDeleting">
        <LayoutTemplate>
            <table class="attendance-table">
                <tr>
                    <th>StudentsID</th>
                    <th>ID</th>
                    <th>AttendanceDate</th>
                    <th>Status</th>
                </tr>
                <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("StudentsID") %></td>
                <td><%# Eval("ID") %></td>
                <td><%# Eval("AttendanceDate", "{0:yyyy-MM-dd}") %></td>
                <td><%# Convert.ToBoolean(Eval("Status")) ? "Present" : "Absent" %></td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
</div>
</asp:Content>

