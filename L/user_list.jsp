<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html;charset=utf-8"
pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<meta charset="UTF-8">
<!DOCTYPE html>
<html>
<style>
    table {
        width: 100%;
        border: 1px solid #444444;
        border-collapse: collapse;
        text-align: center;
    }

    tr,
    td {
        border: 1px solid #444444;
    }

    tr{
        background: #fff;
    }
    tr:hover{
        background: #ddd;
    }

    div{
        border-radius: 20px;
        padding:25px;
        background-color: white;
    }

    th {
        background-color: #AAAAAA;
        border: 1px solid #444444;
    }
    p{
        text-align: right;
    }
</style>


<body bgcolor = #dadada>
    <div>
    <script>
    var s = "[";
        <%
            Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_data?serverTimezone=UTC", "root", "3br3br");
        String query = "SELECT * FROM user_data";
        query+=";";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        
        rs.next();
        while (rs.next()) {%>
            s+='{"id": "<%=rs.getString("user_id")%>",';
            s += '"name":"<%=rs.getString("user_name")%>",';
            s += '"sub_date": "null",';
            s += '"grade":"<%=rs.getString("user_grade")%>"},';
        <%}%>
            s=s.substr(0, s.length - 1);
        s += "]";

            // var s = '[{"id": "hh", "name":"Hong","sub_date":"19.02.11", "grade": "professor", "prof_ok":"19.02.11", "last_login":"19.8.16", "pw":"qwer1234"},'
            // + '{"id": "kk", "name":"Kim","sub_date":"19.02.12", "grade": "student", "prof_ok":"none", "last_login":"19.5.12", "pw":"qwer1234"},'
            // + '{"id": "pp", "name":"Park","sub_date":"19.01.11", "grade": "admin", "prof_ok":"none", "last_login":"19.11.25", "pw":"qwer1234"},'
            // + '{"id": "nop", "name":"Nooop","sub_date":"19.08.11", "grade": "professor", "prof_ok":"none", "last_login":"19.11.25", "pw":"qwer1234"}]';
        var user_list = JSON.parse(s);
        var row = Number(user_list.length);
        document.write("<form onsubmit=\"checkDelete();\"><table><tr><th>id</th><th>name</th><th>sub_date</th><th>grade</th><th></th></tr>");
        for (i = 0; i < row; i++) {
            var id = user_list[i].id;
            document.write("<tr>");
            document.write("<td onclick=\"clickTr(\'"+id+"\')\">" + id + "</td>");
            document.write("<td onclick=\"clickTr(\'"+id+"\')\">" +user_list[i].name+"</td>");
            document.write("<td onclick=\"clickTr(\'"+id+"\')\">" + user_list[i].sub_date + "</td>");
            document.write("<td onclick=\"clickTr(\'"+id+"\')\">" + user_list[i].grade);           
            if(user_list[i].grade == 'professor' && user_list[i].prof_ok == 'none'){
                document.write("(미승인)");
            }
            document.write("</td><td><input type=\"checkbox\" name=\"delete_list\" value=\"" + i + "\"></td>");
            document.write("</tr>");
        }
        document.write("</table>");
        document.write("<p><input type=\"button\" value=\"삭제\"/></p>");
        document.write("</form>");
        function checkDelete() {
            var chk_obj = document.getElementsByName("delete_list");
            var chk_leng = chk_obj.length;
            var checked = 0;

            for (i = 0; i < chk_leng; i++) {
                if (chk_obj[i].checked == true) {
                    checked += 1;
                    alert(user_list[Number(chk_obj[i].value)].name);
                }
            }
        }
        function clickTr(id){
            location.href="user_detail.jsp?id="+id;
        }
    </script>
    </div>
</body>

</html>