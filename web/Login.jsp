<%-- 
    Document   : Login
    Created on : Aug 31, 2021, 10:33:40 AM
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
        <title>Login</title>
    </head>
    <body>
    <center>
        
        
        <%@ page import = " java.sql.*" %>
        <%! String name, password, Msg="Login Unsuccessfull", ImgID1, ImgID2, link;    
            int Access = 0;
        %>   
        
        <% 
            name = request.getParameter("username");
            password = request.getParameter("password");
            session.setAttribute("UserName", name);                 
            
            try{
            String path = "jdbc:mysql://localhost/webapp";
            Connection connection = DriverManager.getConnection(path,"root","");
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from users where UName = '"+name+"'");
            while(resultSet.next()){
            if(password.equals(resultSet.getString(4))){  
                  Msg="Succesfuly Logged In";   
                  Access=1;
               }                    
               }
            connection.close();  
            }      
           catch(SQLException e){System.out.println(e.getMessage());           
           }              
        %><br><br><br><br>
         <center><h1><%=Msg%></h1>
          <%if(Access==1){
            ImgID1="Thanks.jpg";
            ImgID2="Continue.jpg";
            link="UserInfo.jsp";
          }
            else{         
             ImgID1="Try Again.jpg";
             ImgID2="Go Back.jpg";
             link="index.html";
                 }
          %>
          <img src="<%= ImgID1%>"><br>
          <a href="<%= link%>"><img src="<%= ImgID2%>" width="200" height="100"></a>   
          
          </center> 
       </body>
</html>
