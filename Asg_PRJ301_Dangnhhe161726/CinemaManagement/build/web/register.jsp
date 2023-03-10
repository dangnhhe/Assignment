<%-- 
    Document   : register
    Created on : Jan 28, 2023, 9:51:50 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                background-image: url("image/Eor57Ae.jpg");

            }
            h1{
                color: white;
                text-transform: uppercase;
                text-align: center;
                font-family: arial;
                background-size: cover;
                height: 100px;
            }
            table{
                padding-left: auto;
                background-color: #ff7b81;
                margin: 0 auto;
                margin-bottom: 50px;
                color: black;
                border-radius: 10px;
                padding: 20px 20px;
            }
        </style>
        <script>
            function validate() {
                var pass = document.getElementById("pass").value
                var cfpass = document.getElementById("cfpass").value
                if (pass == cfpass) {
                    document.getElementById("registerform").submit();
                } else {
                    alert("mat khau khong khop");
                }
            }
        </script>
    </head>
    <body>
        <h1>Create account</h1>

        <table >
            <tbody>
            <form action="Register" method="post" id="registerform">
                <tr>
                    <td>Họ và tên   </td>
                    <td><input type="text" name="fullname"></td>
                </tr>
                <tr>
                    <td>Tên đăng nhập    </td>
                    <td><input type="text" name="uname"></td>
                </tr>
                <tr>
                    <td>Mật khẩu </td>
                    <td><input type="password" name="pass" id="pass"></td>
                </tr>
                <tr>
                    <td>Xác nhận mật khẩu   </td>
                    <td><input type="password" name="cfpass" id="cfpass"></td>
                </tr>
                <tr>
                    <td>Giới tính</td>
                    <td><input type="radio" checked name="gender" value="Nam" name="">Nam<input type="radio"  value="Nu" name="gender">Nữ</td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email"></td>
                </tr>
                <tr>
                    <td>Địa chỉ</td>
                    <td><textarea  name="address" ></textarea></td>
                </tr>
                <tr>
                    <td>Thông tin điều khoản</td>
                    <td><input type="checkbox" name="agr" value="toi chap nhan">Tôi chấp nhận điều khoản</td>
                </tr>
            </form>
            <tr>
                <td></td>
                <td><button onclick="validate()">Đăng ký</button> <button type="reset">Huỷ</button></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
        </tbody>
    </table>

</form>
</body>
</html>
