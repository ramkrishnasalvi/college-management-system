<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url("CollegeImg/IMG/BACK.jpg"); /* Path to your background image */
            background-size: cover;
            background-position: center;
        }

        .login-container {
           background-color: #ffffff73;
            width: 350px;
            margin: 100px auto;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.3);
            text-align: center;
        }

        .login-container h2 {
            color: #333;
            margin-bottom: 25px;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 90%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        .login-container input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #0066cc;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 15px;
        }

        .login-container input[type="submit"]:hover {
            background-color: #004d99;
        }

        .error-message {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="login-container">
            <h1>College Management Login</h1>

            <asp:TextBox ID="txtUsername" runat="server" Placeholder="Enter Username" CssClass="textbox"></asp:TextBox><br />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Enter Password" CssClass="textbox"></asp:TextBox><br />

            <asp:Button ID="Button1" runat="server" Text="Login" CssClass="button" OnClick="Button1_Click" /><br />

            <asp:Label ID="LabelError" runat="server" CssClass="error-message"></asp:Label>
        </div>
    </form>
</body>
</html>
