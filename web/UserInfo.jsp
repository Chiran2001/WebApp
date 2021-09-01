<%-- 
    Document   : UserInfo
    Created on : Sep 1, 2021, 10:15:30 AM
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
            h1{font-family: Comic Sans MS;
                color: Green} 
    
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <body>
        <%@ page import = " java.sql.*" %>        
        <%! 
            String uFname, uSname, username, uPassword, uGender, uMarried, uCity, uNationality, uConPass;
            int uAge;
        %>   
                
     <%     
        String username=(String)session.getAttribute("UserName");   
         try{
            String path = "jdbc:mysql://localhost/webapp";
            Connection connection = DriverManager.getConnection(path,"root","");
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from users where UName = '"+username+"'");
            while(resultSet.next()){                
                uFname = resultSet.getString(1);
                uSname = resultSet.getString(2);
                uGender = resultSet.getString(5);                 
                uMarried = resultSet.getString(6);
                uAge = resultSet.getInt(7);
                uCity = resultSet.getString(8); 
                uNationality = resultSet.getString(9);                 
               }
            connection.close(); 
         }                                           
           catch(SQLException e){out.println(e.getMessage());}
        %>  
    <center><h1>Profile</h1>
        First Name: <%= uFname%><br><br>
        Last Name: <%= uSname%><br><br>
        Gender: <%= uGender%><br><br>
        Civil Status: <%= uMarried%><br><br>
        Age: <%= uAge%><br><br>
        City: <%= uCity%><br><br>
        Nationality: <%= uNationality%><br><br>
        </center>
    </body>
</html>
