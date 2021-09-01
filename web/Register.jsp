<%-- 
    Document   : Register
    Created on : Aug 31, 2021, 12:09:43 PM
    Author     : CHIRAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            
             body{font-family:Comic Sans MS;
                     font-size:30;                      
                    } 
            h1{font-family: Comic Sans MS;} 
    
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <%@ page import = " java.sql.*" %>
        
        <%! 
            String uFname, uSname, username, uPassword, uGender, uMarried, uCity, uNationality, uConPass, Msg="Login Unsuccessfull", ImgID1, ImgID2, link;
            int uAge,Access;
        %>   
        
        <%                        
            uFname = request.getParameter("firstName");
            uSname = request.getParameter("lastName");
            username = request.getParameter("Username");  
            uPassword = request.getParameter("Pass");
            uConPass = request.getParameter("ConPass");
            uGender = request.getParameter("Gender");
            uMarried = request.getParameter("rdo");
            uCity = request.getParameter("city");
            uNationality = request.getParameter("nationality");
            uAge = Integer.parseInt(request.getParameter("age"));               
            
            if(uPassword.equals(uConPass)){
                
            try{
            String path = "jdbc:mysql://localhost/webapp";
            Connection connection = DriverManager.getConnection(path,"root","");
            Statement statement = connection.createStatement();
            Access = statement.executeUpdate("insert into users(FName,LName,UName,UPassword,UGender,UMarried,UAge,UCity,UNationality) values('"+uFname+"','"+uSname+"','"+username+"','"+uPassword+"','"+uGender+"','"+uMarried+"','"+uAge+"','"+uCity+"','"+uNationality+"')");
            Msg="Succesfuly Logged In";
            connection.close();
              }
            catch(SQLException e){
                Msg="User Already Exist!";            
              }           
              }             
            else{
            Msg="User Already Exist!"; 
            }
        %><br><br><br><br>
        
         <center><h1><%=Msg%></h1>
          <%if(Access==1){
            ImgID1="Thanks.jpg";
            ImgID2="Continue.jpg";
            link="index.html";
          }
            else{         
             ImgID1="Try Again.jpg";
             ImgID2="Go Back.jpg";
             link="SignUp.html";
                 }
          %>
          <img src="<%= ImgID1%>"><br>
          <a href="<%= link%>"><img src="<%= ImgID2%>" width="200" height="100"></a>   
          
          </center> 
       
    </body>
</html>
