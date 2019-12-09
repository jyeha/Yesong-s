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
        border-spacing: 0px;
        width: 100%;
        border: 1px solid #444444;
        border-collapse: collapse;
        border-style: none;
        padding: 0px;
        width: 300px;
    }

    th,
    td {
        border-spacing: 0px;
        padding: 0px;
        border-style: none;
    }

    div {
        padding: 15px;
        border-radius: 5px;
        display: table;
        width: 800px;
        margin-left: auto;
        margin-right: auto;
        background-color: white;
    }

    .btn {
        background-color: #00b4ab;
        border: 0px;
        color: white;
        margin-left: auto;
        margin-right: auto;
    }

    h2 {
        color: #00b4ab;
        text-align: center;
    }

    #back2 {
        padding: 0px;
        border-radius: 5px;
        display: table;
        width: 800px;
        margin-left: auto;
        margin-right: auto;
        background-color: white;
    }

    #navtr {
        border-spacing: 0px;
        padding: 0px;
        border-style: none;
    }
    
    #nav {
        border-spacing: 0px;
        width: 100%;
        /* border: 1px solid #444444; */
        border-collapse: collapse;
        border-style: none;
        padding: 0px;
    }

    #tdUser:hover {
        background: #00b4ab;
    }

    #tdUser {
        text-align: center;
        border-spacing: 0px;
        padding: 0px;
        border-style: none;
    }
</style>



<body bgcolor=#dadada>
    <h2>이용자 상세 정보</h2>
    <div id='back2'>
        <table id='nav'>
            <tr id='navtr'>
                <td id='tdUser' onclick='clickNav(1)'>이용자 정보</td>
                <td id='tdUser' onclick='clickNav(2)'>시험 정보</td>
            </tr>
        </table>
    </div>
    </br>
    <div>
        <script>
            var Request = function () {
                this.getParameter = function (name) {
                    var rtnval = '';
                    var nowAddress = unescape(location.href);
                    var parameters = (nowAddress.slice(nowAddress.indexOf('?') + 1,
                        nowAddress.length)).split('&');
                    for (var i = 0; i < parameters.length; i++) {
                        var varName = parameters[i].split('=')[0];
                        if (varName.toUpperCase() == name.toUpperCase()) {
                            rtnval = parameters[i].split('=')[1];
                            break;
                        }
                    }
                    return rtnval;
                }
            }
            var request = new Request();

            var id = request.getParameter('id');

            var s = '[{"id": "hh", "name":"Hong","sub_date":"19.02.11", "grade": "professor", "prof_ok":"19.02.11", "last_login":"19.8.16", "pw":"qwer1234"},'
                + '{"id": "kk", "name":"Kim","sub_date":"19.02.12", "grade": "student", "prof_ok":"none", "last_login":"19.5.12", "pw":"qwer1234"},'
                + '{"id": "pp", "name":"Park","sub_date":"19.01.11", "grade": "admin", "prof_ok":"none", "last_login":"19.11.25", "pw":"qwer1234"},'
                + '{"id": "nop", "name":"Nooop","sub_date":"19.08.11", "grade": "professor", "prof_ok":"none", "last_login":"19.11.25", "pw":"qwer1234"}]';

            var user_list = JSON.parse(s);
            var row = Number(user_list.length);
            for (i = 0; i < row; i++) {
                if (user_list[i].id == id) {
                    break;
                }
            }
            document.write("<table>")
            document.write("<tr><th>아이디</th><th>" + user_list[i].id + "</th></tr>");
            document.write("<tr><th>이름</th><th>" + user_list[i].name + "</th></tr>");
            document.write("<tr><th>등급</th><th>" + user_list[i].grade + "</th></tr>");
            document.write("<tr><th>가입 일시</th><th>" + user_list[i].sub_date + "</th></tr>");
            if (user_list[i].grade == "professor") {
                if (user_list[i].prof_ok == 'none') {
                    document.write("<tr><th>승인 여부</th><th>미승인</th></tr>");
                }
                else {
                    document.write("<tr><th>승인 여부</th><th>승인</th></tr>");
                    document.write("<tr><th>승인 일시</th><th>" + user_list[i].prof_ok + "</th></tr>");
                }

            }
            document.write("<tr><th>최종 로그인 정보</th><th>" + user_list[i].last_login + "</th></tr></table>");
            document.write("<form></br><input type=\'button\' value=\'수정\' onclick=\'location.href=\"user_change.html?id=" + id + "\"\'</form>");
            function clickNav(type) {
                if (type == 1) {
                    location.href = "user_list.html";
                } else {
                    location.href = "test_list.html";
                }
            }
        </script>

    </div>
</body>

</html>