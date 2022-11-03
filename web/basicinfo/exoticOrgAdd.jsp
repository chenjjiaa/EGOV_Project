<%@ page import="com.gg.egov.util.StringUtil" %>
<%@page pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <base href="<%=StringUtil.getServerPath(request)+"images/"%>">
  <%String errorMsg = (String) request.getAttribute("errorMsg");%>
  <%String successMsg = (String) request.getAttribute("successMsg");%>
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
  //保存投资人信息
  function doSave() {
    if (validateForm()){
      document.forms["saveForm"].submit();
    }
  }
  //校验表单:投资人
  function validateForm() {
    //校验投资人名称
    var invname = document.getElementById("invname")
    if (invname.value.trim() == ""){
      alert("投资人名称不能为空");
      invname.focus();
      return false;
    }

    //校验国家、地区
    var cty = document.getElementById("cty")
    if (cty.value.trim() == ""){
      alert("国家/地区不能为空");
      cty.focus();
      return false;
    }

    //校验组织机构代码
    var orgcode = document.getElementById("orgcode")
    if (orgcode.value == ""){
      alert("织机构代码不能为空");
      orgcode.focus();
      return false;
    }

    //校验联系人
    var contactman = document.getElementById("contactman")
    if (contactman.value.trim() == ""){
      alert("联系人不能为空");
      contactman.focus();
      return false;
    }

    //校验联系电话
    var contacttel = document.getElementById("contacttel")
    if (contacttel.value.trim() == ""){
      alert("联系电话不能为空");
      contacttel.focus();
      return false;
    }

    //校验电子信箱
    var email = document.getElementById("email")
    if (email.value.trim() == ""){
      alert("电子信箱不能为空");
      email.focus();
      return false;
    }
    return true;
  }

  function TipsMsg() {
    <%
              if (errorMsg != null){
    %>
                alert("<%=errorMsg%>");
                document.location='/EGOV/basicinfo/exoticOrgList.jsp';
    <%
              }
    %>
    <%
              if (successMsg != null){
    %>
                alert("<%=successMsg%>");
                document.location='/EGOV/basicinfo/exoticOrgList.jsp';
    <%
              }
    %>
  }

</script>
</head>

<body onload="TipsMsg()">
<form action="/EGOV/servlet/AddInvestor" name="saveForm" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="30"><img src="../images/tab_03.gif" width="15" height="30" /></td>
        <td width="1101" background="../images/tab_05.gif"><img src="../images/311.gif" width="16" height="16" /> <span class="STYLE4">新增投资人信息</span></td>
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
        <td bgcolor="#f3ffe3"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#0e6f68">
          <tr height="26"></tr>
          <tr>
            <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">投资人名称:</div></td>
            <td bgcolor="#FFFFFF" class="STYLE1" colspan="3"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="invname" id="invname" style="width:100px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>
          </tr>
          <tr>
            <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">所属国家/地区:</div></td>
            <td bgcolor="#FFFFFF" class="STYLE1" colspan="3"><div align="left" style="padding:2px" class="STYLE2">

			<select name="cty" id="cty" style="width:105px; height:20px; border:solid 1px #035551; color:#000000">
		        <option value="">请选择...</option>
		        <option value="0">中国</option>
		        <option value="1">美国</option>
		        <option value="2">英国</option>
		        <option value="3">日本</option>
                <option value="4">德国</option>
		    </select>&nbsp;<font color='red'>*</font>
            </div></td>
          </tr>
          <tr>
            <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">组织机构代码:</div></td>
            <td bgcolor="#FFFFFF" class="STYLE1" colspan="3"><div align="left" style="padding:2px" class="STYLE2"><input type="text" id="orgcode" name="orgcode" style="width:100px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;</div></td>
          </tr>
          <tr>
            <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1" ><div align="right" style="padding:5px" class="STYLE2 STYLE1">联系人:</div></td>
            <td bgcolor="#FFFFFF" class="STYLE1" colspan="3"><div align="left" style="padding:2px" class="STYLE2"><input type="text" id="contactman" name="contactman" style="width:100px; height:20px; border:solid 1px #035551; color:#000000"></div></td>
          </tr>
          <tr>
            <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">联系电话:</div></td>
            <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" id="contacttel" name="contacttel" style="width:100px; height:20px; border:solid 1px #035551; color:#000000"></div></td>
            <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">电子信箱:</div></td>
            <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" id="email" name="email" style="width:100px; height:20px; border:solid 1px #035551; color:#000000"></div></td>
          </tr>
          <tr>
            <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">备注:</div></td>
            <td bgcolor="#FFFFFF" class="STYLE1" colspan="3"><div align="left" style="padding:2px" class="STYLE2"><textarea name="remark" id="remark" style="width:490px; height:50px; border:solid 1px #035551; color:#000000" ></textarea></div></td>
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
          <tr height="26"><td bgcolor="#FFFFFF" height="26" class="STYLE1" colspan="2" style="padding-top:5px;padding-left:200px"><img src="../images/save.jpg" style="cursor:hand" onclick="doSave()" />&nbsp;&nbsp;<img src="../images/clear.jpg" style="cursor:hand" />&nbsp;&nbsp;<img src="../images/back.jpg" style="cursor:hand" onclick="history.go(-1)" /></td></tr>
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
