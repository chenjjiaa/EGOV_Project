<%@ page import="com.gg.egov.entity.User" %>
<%@page pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <!-- 之后的base路径用动态的方式获取！ -->
    <base href="/EGOV/images/"/>
<%
    User user = (User) request.getAttribute("user");
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 12px}
.STYLE4 {
	font-size: 12px;
	color: #1F4A65;
	font-weight: bold;
}

a:link {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;

}
a:visited {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;
}
a:hover {
	font-size: 12px;
	color: #FF0000;
	text-decoration: underline;
}
a:active {
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}
.STYLE7 {font-size: 12}

-->
</style>

<script>
    //提交表单
    function doSave() {
        //提交前验证表单
        if (validateForm()){
            document.forms["saveForm"].submit();
        }
    }

    //校验表单
    function validateForm() {
        //校验用户姓名
        var username = document.getElementById("username")
        if (username.value.trim() == ""){
            alert("用户姓名不能为空");
            username.focus();
            return false;
        }

        //校验用户密码
        var userpswd = document.getElementById("userpswd")
        if (userpswd.value == ""){
            alert("用户密码不能为空");
            userpswd.focus();
            return false;
        }

        //校验确认密码
        var checkpswd = document.getElementById("checkpswd")
        if (checkpswd.value != userpswd.value){
            alert("确认密码与用户密码不一致");
            checkpswd.value=""
            checkpswd.focus();
            return false;
        }

        //校验机构类型
        var orgtype = document.getElementById("orgtype")
        if (orgtype.value == ""){
            alert("组织机构类型不能为空");
            orgtype.focus();
            return false;
        }
        return true;
    }
</script>
</head>

<body>
<form action="/EGOV/servlet/UpdateUser" name="saveForm" method="post">
  <input type="hidden" name="pageno" value="<%=request.getAttribute("pageno")%>" />
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="15" height="30"><img src="../images/tab_03.gif" width="15" height="30" /></td>
          <td width="1101" background="../images/tab_05.gif"><img src="../images/311.gif" width="16" height="16" /> <span class="STYLE4">修改系统用户</span></td>
          <td width="281" background="../images/tab_05.gif"><table border="0" align="right" cellpadding="0" cellspacing="0">
          </table></td>
          <td width="14"><img src="../images/tab_07.gif" width="14" height="30" /></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="9" background="../images/tab_12.gif">&nbsp;</td>
          <td bgcolor="#f3ffe3"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#0e6f68" >
            <tr height="26"></tr>
            <tr>
              <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">用户代码</div></td>
              <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="hidden" name="usercode" id="usercode" value="<%=user==null?"admin":user.getUsercode()%>" ><%=user==null?"admin":user.getUsercode()%></div></td>
            </tr>
            <tr>
              <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">用户姓名</div></td>
              <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="username" id="username" style="width:100px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>
            </tr>
            <tr>
              <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">用户密码</div></td>
              <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="password" name="userpswd" id="userpswd" style="width:100px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>
            </tr>
            <tr>
              <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">确认密码</div></td>
              <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="password" name="checkpswd" id="checkpswd" style="width:100px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>
            </tr>
            <tr>
              <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">机构类型</div></td>
              <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2">
              <select name="orgtype" id="orgtype" style="width:105px; height:20px; border:solid 1px #035551; color:#000000">
                <option value="0" >外汇管理局</option>
                <option value="1" >银行</option>
              </select>&nbsp;<font color='red'>*</font></div></td>
            </tr>
          </table></td>
          <td width="9" background="../images/tab_16.gif">&nbsp;</td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="9" background="../images/tab_12.gif">&nbsp;</td>
          <td bgcolor="#f3ffe3"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#0e6f68">
            <tr height="26"><td bgcolor="#FFFFFF" height="26" class="STYLE1" colspan="2" style="padding-top:5px;padding-left:200px"><img src="../images/save.jpg" style="cursor:hand" onclick="doSave()" />&nbsp;&nbsp;<img src="../images/clear.jpg" style="cursor:hand" /></td></tr>
          </table></td>
          <td width="9" background="../images/tab_16.gif">&nbsp;</td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td height="29"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="15" height="29"><img src="../images/tab_20.gif" width="15" height="29" /></td>
          <td background="../images/tab_21.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="75%" valign="top" class="STYLE1"><div align="left">
                <table width="352" height="20" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="62" height="22" valign="middle"></td>
                    <td width="50" height="22" valign="middle"></td>
                  </tr>
                </table>
              </div></td>
            </tr>
          </table></td>
          <td width="14"><img src="../images/tab_22.gif" width="14" height="29" /></td>
        </tr>
      </table></td>
    </tr>
  </table>
</form>
</body>
</html>
