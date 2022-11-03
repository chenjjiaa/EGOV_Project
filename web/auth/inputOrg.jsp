<%@ page import="com.gg.egov.util.StringUtil" %>
<%@page pageEncoding="utf-8"%>
<html>
<head>
    <base href="<%=StringUtil.getServerPath(request)+"images/"%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script type="text/javascript" src="../clander/date.js"></script>
<script type="text/javascript" src="../clander/setday.js"></script>
<script>document.onclick=function() {}</script>
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
.STYLE7 {font-size: 12px;}

-->
</style>

<script>
    function showEnterpriseMsg() {
        if (validateForm()){
            document.forms["showMsgForm"].submit();
        }
    }
    function validateForm() {
        if (document.getElementById("orgcode").value == ""){
            alert("请将查询到的企业组织机构代码设置到文本框中！")
            return false;
        }
        return true;
    }
</script>
</head>

<body>
<form name="showMsgForm" action="/EGOV/servlet/showEnterpriseMsg" >
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="30"><img src="../images/tab_03.gif" width="15" height="30" /></td>
        <td width="1101" background="../images/tab_05.gif"><img src="../images/311.gif" width="16" height="16" /> <span class="STYLE4">资本金账户开户核准-录入</span></td>
        <td width="281" background="../images/tab_05.gif"><table border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"></td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
        <td width="14"><img src="../images/tab_07.gif" width="14" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr height="5">
          <td width="9" background="../images/tab_12.gif">&nbsp;</td>
          <td bgcolor="#f3ffe3">&nbsp;</td>
          <td width="9" background="../images/tab_16.gif">&nbsp;</td>
      </tr>
      <tr>
        <td width="9" background="../images/tab_12.gif">&nbsp;</td>
        <td bgcolor="#f3ffe3">
        	<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1">
        	    <tr>
        	        <td width="90" class="STYLE1">组织机构代码:</td>
        	        <td width="140" class="STYLE1"><input type="text" readonly name="orgcode" id="orgcode" style="width:100px; height:20px; border:solid 1px #035551; color:#000000"></td>
        	        <td width="215" class="STYLE1">
                        <input type="button" id="queryBtn" style="width:68px;height:27px;background-image:url('../images/query.jpg')" onclick="window.open('/EGOV/auth/orgcodeSelect.jsp', '选择组织机构代码', 'width=720, height=400, scrollbars=no')" >
                        <input type="button" id="addBtn" style="width:68px;height:27px;background-image:url('../images/ok.jpg')" onclick="showEnterpriseMsg()" >
                        <input type="reset" value="" id="resetBtn" style="width:68px;height:27px;background-image:url('../images/clear.jpg')"  >
                    </td>
                    <td class="STYLE1">&nbsp;</td>
        	    </tr>
        	</table>
        </td>
        <td width="9" background="../images/tab_16.gif">&nbsp;</td>
      </tr>
  </table>
  </tr>
  <tr>
    <td height="29"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="29"><img src="../images/tab_20.gif" width="15" height="29" /></td>
        <td background="../images/tab_21.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25%" height="29" nowrap="nowrap"><span class="STYLE1">&nbsp;</td>
            <td width="75%" valign="top" class="STYLE1"><div align="right">&nbsp;</div></td>
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
