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
                background-image: url("https://phunugioi.com/wp-content/uploads/2020/02/mau-background-dep.jpg")
            }
            h1{
              color: blue; 
              text-transform: uppercase;
              text-align: center;
              font-family: arial;
              background-size: cover;
              height: 100px;
            }
            table{
                padding-left: auto;
                background-color: red;
                }
            tbody{
                text-align: center;
                }
        </style>
        <script>
            function validate(){
                var pass=document.getElementById("pass").value
                  var cfpass=document.getElementById("cfpass").value
                  if(pass==cfpass){
                   document.getElementById("registerform").submit();
                  }else{
                      alert("mat khau khong khop");
                      }
            }      
        </script>
    </head>
    <body>
        <h1>Tạo tài khoản</h1>
       
        <table >
<!--            <thead>
                <tr>
                    <th></th>
                    <th></th>
                </tr>
            </thead>-->
            <tbody>
                  <form action="Register" method="post" id="registerform">
                <tr>
                    <td>Ho va ten  (*)</td>
                    <td><input type="text" name="fullname"></td>
                </tr>
                <tr>
                    <td>Ten dang nhap (*)</td>
                    <td><input type="text" name="uname"></td>
                </tr>
                <tr>
                    <td>Mat Khau(*)</td>
                    <td><input type="password" name="pass" id="pass"></td>
                </tr>
                <tr>
                    <td>Xac nhan mat khau</td>
                    <td><input type="password" name="cfpass" id="cfpass"></td>
                </tr>
                <tr>
                    <td>Gioi Tinh</td>
                    <td><input type="radio" checked name="gender" value="Nam" name="">Nam<input type="radio"  value="Nu" name="gender">Nu</td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email"></td>
                </tr>
                <tr>
                    <td>Dia chi</td>
                    <td><textarea  name="address" ></textarea></td>
                </tr>
                <tr>
                    <td>Thong tin dieu khoan</td>
                    <td><input type="checkbox" name="agr" value="toi chap nhan">Toi chap nhan dieu khoang</td>
                </tr>
                    </form>
                <tr>
                    <td></td>
                    <td><button onclick="validate()">dang ky</button> <button type="reset">huy</button></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>

        </form>
        <h1>Cảm ơn quý khách</h1>
        <p style="color: red;">${mess}</p>
        <p>${fullname}</p>
        <p>${uname}</p>
          <p>${pass}</p>
               <p>${cfpass}</p>
               <p>${gender}</p>
               <p>${email}</p><!-- comment --><!--        <p></p> --><!--        <p></p> -->
                      <p>${address}</p>
                             <p>${agr}</p>
    </body>
</html>