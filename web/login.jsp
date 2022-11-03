<%@page pageEncoding="utf-8"%>
<%
    String withoutLogin = (String) request.getAttribute("withoutLogin");
    request.getSession(false);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <link href="style/login.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">

        $("#login-button").click(function(event){
            event.preventDefault();

            $('form').fadeOut(500);
            $('.wrapper').addClass('form-success');
        });

        function validateForm(){
            {
                if (form.orgtype.value == "-1"){
                    alert("您还没有选择机构类型！（Select Orgtype 栏为空）");
                    return false;
                }
                if(form.usercode.value.trim() == "")//如果用户名为空
                {
                    alert("您还没有填写账号！");
                    form.usercode.focus();
                    return false;
                }
                if(form.userpswd.value.trim() == "")//如果密码为空
                {
                    alert("您还没有填写密码！");
                    myform.userpswd.focus();
                    return false;
                }
            }
            return true;
        }

        function doLogin() {
            if (validateForm()){
                document.forms["form"].submit()
            }
        }

        function withoutLogin() {
            <%
                if (withoutLogin != null){
            %>
                alert("<%=withoutLogin%>")
                document.location="/EGOV/login.jsp";
            <%
                }
            %>
        }
    </script>
</head>
<body onload="withoutLogin()">
<div class="wrapper">
    <div class="container">
        <h1>Welcome To  EGOV</h1>
        <br>
        <form name="form" class="form" method="post" action="/EGOV/servlet/login">
            <select name="orgtype">
                <option value="-1">Select Orgtype</option>
                <option value="0">外汇管理局</option>
                <option value="1">银行</option>
            </select>
            <input type="text" placeholder="Usercode" name='usercode' id="usercode" value="">
            <input type="password" placeholder="Password" name='userpswd' id="userpswd" value="">
            <input type="button" id="login" name='login' value='Login' onclick="doLogin()">
<!--            <button type="submit" id="login-button" name='submit' value='submit'>Login</button>-->
        </form>
    </div>

    <ul class="bg-bubbles">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>
</body>
</html>