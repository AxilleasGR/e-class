<%@ page import="com.example.BasicClasses.teacher" %><%--
  Created by IntelliJ IDEA.
  User: vagel
  Date: 10/7/2021
  Time: 4:32 μ.μ.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add question - Teacher</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    response.addHeader("Cache-Control", "post-check=0, pre-check=0");

    //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0);

    //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma", "no-cache");

    if ((String)request.getSession(false).getAttribute("online")==null || !((String)request.getSession(false).getAttribute("acctype")).equals("2")){
        response.sendRedirect("index.jsp");
    }

%>
<div class="header">
    <span class="logo"><%= ((teacher) request.getSession(false).getAttribute("usr_obj")).getUsername() %>, assign new questions</span>
    <div class="header-left">
        <a class="home" href="./teacher_home.jsp">Home</a>
    </div>
    <div class="header-right">
        <a class="logout" href="./logout.jsp">Logout</a>
    </div>
</div>
<form method="post" action="AddQuestions">
    <input type="hidden" name="myField" id="myField" />
        <br>
        <br>
        <br>
        <br>
    Question difficulty<select name="questdif">
    <option value="1" selected>1</option>
    <option>2</option>
    <option>3</option>
</select><br><br></tr>
    Multiple choice <input type="radio" onclick="javascript:yesnoCheck();" name="yesno" id="multichoice"> Fill the blank <input type="radio" onclick="javascript:yesnoCheck();" name="yesno" id="filltheblank">True or false <input type="radio" onclick="javascript:yesnoCheck();" name="yesno" id="trueorfalse"><br>
    <div id="mc" style="display:none">
        <b>question:</b>
        Question<input type="text"  name="question"/>
        Choice 1<input type="text" name="choice1"/>
        Choice 2 correct<input type="text"  name="choice_correct" style="border: 2px solid green;"/>
        Choice 3    <input type="text"  name="choice2" />
    </div>
    <div id="ftb" style="display: none">
        Fill the blank<input type="text" id="fillblank" name="filltheblank">
    </div>
    <div id="trf" style="display:none">
        question<input type="text name=trueorfalse">
        True<input type="radio" id="True"    name="first_item"/>
        False<input type="radio" id="False"  name="first_item" />
    </div>
    <br>
    <input type="submit" value="Assign new question">
</form>
<script type="text/javascript">

    function yesnoCheck() {
        if (document.getElementById('multichoice').checked) {
            document.getElementById('mc').style.display = 'block';
            document.getElementById('ftb').style.display = 'none';
            document.getElementById('trf').style.display = 'none';
            document.getElementById('myField').value ="multichoice";
        }
        else if(document.getElementById('filltheblank').checked) {
            document.getElementById('mc').style.display = 'none';
            document.getElementById('ftb').style.display = 'block';
            document.getElementById('trf').style.display = 'none';
            document.getElementById('myField').value ='filltheblank';
        }
        else if(document.getElementById('trueorfalse').checked){
            document.getElementById('mc').style.display = 'none';
            document.getElementById('ftb').style.display = 'none';
            document.getElementById('trf').style.display = 'block';
            document.getElementById('myField').value ='trueorfalse';
        }
    }

</script>


</body>
</html>
