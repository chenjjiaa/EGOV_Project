<%@ page import="com.gg.egov.util.StringUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gg.egov.entity.Page" %>
<%@ page import="com.gg.egov.entity.Enterprise" %>
<%@page pageEncoding="utf-8"%>
<%
    Page pageObj = (Page) request.getAttribute("page");
    List<Enterprise> pageList = null;
    if (pageObj != null){
     pageList = pageObj.getDataList();
    }

%>
<%
    boolean isNotFirstPage = false;
    boolean isNotLastPage = false;
    if (pageObj != null){
        isNotFirstPage = pageObj.getPageno() > 1;
        isNotLastPage = pageObj.getPageno() < pageObj.getPageCount();
    }
%>
<html>
<head>
  <base href="<%=StringUtil.getServerPath(request)+"images/"%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script type="text/javascript" src="../clander/date.js"></script>
<script type="text/javascript" src="../clander/setday.js"></script>
<script>document.onclick=function() {}</script>
<title>外商投资企业选择</title>
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
.STYLE7 {font-size: 12px}

-->
</style>

<script>

  function pageQueryEnterprise() {
    document.forms["queryForm"].submit();
  }

  function resetForm() {
    document.forms["queryForm"].reset();
  }

  //翻页操作
  function changePage(pageX) {
    document.location='/EGOV/servlet/pageQueryEnterprise?pageno='+pageX;
  }

  //跳转至xx页操作
  function myChangePage() {
    var pagetext = document.getElementById("myChangeText");
    var pageno = pagetext.value;
    //非空验证
    if (pageno.trim() == ""){
      alert("请填写数字");
      pagetext.value = "";
      pagetext.focus();
      return;
    }
    //数字验证
    if (isNaN(pageno)){
      alert("您输入的不是数字，请重新填写");
      pagetext.value = "";
      pagetext.focus();
      return;
    }
    //范围验证
    changePage(pageno);
  }
</script>
</head>

<body>
<form name="queryForm" action="/EGOV/servlet/pageQueryEnterprise" >
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="30"><img src="../images/tab_03.gif" width="15" height="30" /></td>
        <td width="1101" background="../images/tab_05.gif"><img src="../images/311.gif" width="16" height="16" /> <span class="STYLE4">外商投资企业列表</span></td>
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
        	        <td width="120" class="STYLE1">组织机构代码:</td>
        	        <td width="140" class="STYLE1"><input type="text" name="orgcode" style="width:100px; height:20px; border:solid 1px #035551; color:#000000"></td>
        	        <td width="90" class="STYLE1">企业中文名称:</td>
        	        <td width="130" class="STYLE1" ><input type="text" name="cnname" style="width:100px; height:20px; border:solid 1px #035551; color:#000000"></td>
				    <td width="60"  nowrap class="STYLE1">登记日期:</td>
				    <td class="class1_td alignleft" nowrap>
				        <input type="text" name="startdate" style="width:75px; height:20px; border:solid 1px #035551; color:#000000" >
				        <input onclick="setday(document.all.startdate);" type="image" value=" 选择日期 " name="button004" src="../clander/clander.gif" align="top"/>
				  ～
				  <input type="text" name="enddate" style="width:75px; height:20px; border:solid 1px #035551; color:#000000" >
				  <input onclick="setday(document.all.enddate);" type="image" value=" 选择日期 " name="button004" src="../clander/clander.gif" align="top"/>
				      </td> 
        	    </tr>
        	    <tr>
        	        <td class="STYLE1" colspan="5" align="left"></td>
        	        <td nowrap class="STYLE1" align="right">
                      <input type="button" id="queryBtn" style="width:68px;height:27px;background-image:url('../images/query.jpg')" onclick="pageQueryEnterprise()" >
                      <input type="reset" value="" id="resetBtn" style="width:68px;height:27px;background-image:url('../images/clear.jpg')"  >
                    </td>
        	    </tr>
        	</table>
        </td>
        <td width="9" background="../images/tab_16.gif">&nbsp;</td>
      </tr>
      <tr height="10">
          <td width="9" background="../images/tab_12.gif">&nbsp;</td>
          <td bgcolor="#f3ffe3">&nbsp;</td>
          <td width="9" background="../images/tab_16.gif">&nbsp;</td>
      </tr>
  </table>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" background="../images/tab_12.gif">&nbsp;</td>
        <td bgcolor="#f3ffe3"><table width="99%" id="dataTable" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#0e6f68" >
          <tr>
            <td width="8%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">序号</div></td>
            <td width="20%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">组织机构代码</div></td>
            <td width="24%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">企业中文名称</div></td>
            <td width="10%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">登记日期</div></td>
            <td width="8%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">经办人</div></td>
            <td width="8%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">投资比例</div></td>
          </tr>
          <%
            if (pageList != null){
              int i = 0;
              for (Enterprise enterprise:pageList){
          %>
                <tr>
                  <input type="hidden" name="pageno" value="<%=pageObj.getPageno()%>">
                  <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=++i%></div></td>
                  <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"  style="cursor:pointer" onclick="window.opener.document.all.orgcode.value='<%=enterprise.getOrgcode()%>';window.close();"><%=enterprise.getOrgcode()%></div></td>
                  <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><%=enterprise.getCnname()%></div></td>
                  <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><%=enterprise.getRegdate()%></div></td>
                  <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><%=enterprise.getUsername()%></div></td>
                  <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">详细</div></td>
                </tr>
          <%
              }
            }
          %>

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
            <td width="25%" height="29" nowrap="nowrap"><span class="STYLE1">共3条纪录，当前第1/1页，每页3条纪录</span></td>
            <td width="75%" valign="top" class="STYLE1"><div align="right">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="25%" height="29" nowrap="nowrap"><span class="STYLE1">共3条纪录，当前第1/1页，每页3条纪录</span></td>
                        <td width="75%" valign="top" class="STYLE1"><div align="right">
                            <table width="352" height="20" border="0" cellpadding="0" cellspacing="0">

                                <tr>
                                    <td width="30" height="22" valign="middle"><div align="right"><img src="../images/firstPage<%=isNotFirstPage?"":"Disabled"%>.gif" <%= isNotFirstPage?"style=cursor:pointer onclick=document.location='/EGOV/servlet/pageQueryEnterprise?pageno=1'":""%> /></div></td>
                                    <td width="30" height="22" valign="middle"><div align="right"><img src="../images/prevPage<%=isNotFirstPage?"":"Disabled"%>.gif" <%= isNotFirstPage?"style=cursor:pointer onclick='changePage("+(pageObj.getPageno()-1)+")'":""%> /></div></td>
                                    <td width="30" height="22" valign="middle"><div align="right"><img src="../images/nextPage<%=isNotLastPage?"":"Disabled"%>.gif" <%= isNotLastPage?"style=cursor:pointer onclick='changePage("+(pageObj.getPageno()+1)+")'":""%> /></div></td>
                                    <td width="30" height="22" valign="middle"><div align="right"><img src="../images/lastPage<%=isNotLastPage?"":"Disabled"%>.gif" <%= isNotLastPage?"style=cursor:pointer onclick='changePage("+pageObj.getPageCount()+")'":""%> /></div></td>
                                    <td width="59" height="22" valign="middle"><div align="right" class="STYLE2 STYLE1">转到第</div></td>
                                    <td width="25" height="22" valign="middle"><span class="STYLE7">
                    <input name="textfield" type="text" class="STYLE1" style="height:20px; width:25px;text-align:right" size="5" />
                  </span></td>
                                    <td width="23" height="22" valign="middle" class="STYLE2 STYLE1">页</td>
                                    <td width="30" height="22" valign="middle"><img src="../images/go.gif" width="37" height="15" /></td>
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
