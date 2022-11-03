<%@ page import="java.util.List" %>
<%@ page import="com.gg.egov.entity.User" %>
<%@ page import="com.gg.egov.entity.Page" %>
<%@ page import="com.gg.egov.util.StringUtil" %>
<%@ page import="com.gg.egov.util.DBUtil" %>
<%@page pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

  <!-- 之后的base路径用动态的方式获取！ -->
<%--  <base href="/EGOV/images/"/>--%>
    <base href="<%=StringUtil.getServerPath(request)+"images/"%>">

  <%
      String successMsg = (String) request.getAttribute("successMsg");
      String failedMsg = (String) request.getAttribute("failedMsg");
      Page pageObj = (Page) request.getAttribute("page");
      List<User> pageList = null;
      if (pageObj != null){
          pageList = pageObj.getDataList();
      }
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
.STYLE7 {font-size: 12px}

-->
</style>

<script>

    /**
     * 全选
     */
  function checkAll(){
    var checkboxs = document.getElementsByName("usercode")
    var checkboxall = document.getElementById("checkall")
    if (checkboxall.checked){
      for (var i=0; checkboxs.length > i; i++){
        checkboxs[i].checked = true;
      }
    }else {
      for (var i=0; checkboxs.length > i; i++){
        checkboxs[i].checked = false;
      }
    }

        //从下面抠上来的
        var usercodes = document.getElementsByName("usercode");
        var count = 0;
        for (var i=0; usercodes.length>i; i++){
            if (usercodes[i].checked){
                count++;
            }
        }

        var deleteImag = document.getElementById("deleteImag");
        var updateImag = document.getElementById("updateImag");
        if (count == 0){
            deleteImag.src = "/EGOV/images/delete_disabled.jpg";
            deleteImag.hidden = true
            updateImag.src = "/EGOV/images/update_disabled.jpg";
            updateImag.hidden = true
        }

        if (count == 1){
            deleteImag.src = "/EGOV/images/delete.jpg";
            deleteImag.hidden = false
            updateImag.src = "/EGOV/images/update.jpg";
            updateImag.hidden = false
        }

        if (count > 1){
            deleteImag.src = "/EGOV/images/delete.jpg";
            deleteImag.hidden = false
            updateImag.src = "/EGOV/images/update_disabled.jpg";
            updateImag.hidden = true
        }
  }

    /**
     * 取消全选
     */
    function cancelAll() {

    }

    //翻页操作
    function changePage(pageX) {
        document.location='/EGOV/servlet/PageQueryUser?pageno='+pageX;
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


    /**
     * 单选按钮与 修改、删除图片联动
     */
    function control_Update_And_Delete() {
        var usercodes = document.getElementsByName("usercode");
        var count = 0;
        for (var i=0; usercodes.length>i; i++){
            if (usercodes[i].checked){
                count++;
            }
        }

        var deleteImag = document.getElementById("deleteImag");
        var updateImag = document.getElementById("updateImag");
        if (count == 0){
            deleteImag.src = "/EGOV/images/delete_disabled.jpg";
            deleteImag.hidden = true
            updateImag.src = "/EGOV/images/update_disabled.jpg";
            updateImag.hidden = true
        }

        if (count == 1){
            deleteImag.src = "/EGOV/images/delete.jpg";
            deleteImag.hidden = false
            updateImag.src = "/EGOV/images/update.jpg";
            updateImag.hidden = false
        }

        if (count > 1){
            deleteImag.src = "/EGOV/images/delete.jpg";
            deleteImag.hidden = false
            updateImag.src = "/EGOV/images/update_disabled.jpg";
            updateImag.hidden = true
        }

        var checkboxall = document.getElementById("checkall")
        if (count == usercodes.length){
            checkboxall.checked = true;
        }else {
            checkboxall.checked = false;
        }
    }

    /**
     * 更新用户操作
     */
    function doUpdate() {
        document.forms["updateUser"].submit();
    }

    /**
     * 删除用户操作
     */
    function doDelete(){
        if (window.confirm("您确认要删除用户信息吗？")){
            document.forms["updateUser"].action="/EGOV/servlet/DeleteUser";
            document.forms["updateUser"].submit();
        }
    }

    /**
     * 打印新建用户 成功/失败 信息
     */
    function printMsg() {
        <%
            if (successMsg != null){
        %>
            alert("<%=successMsg%>");
        <%
            }
        %>
        <%
            if (failedMsg != null){
        %>
        alert("<%=failedMsg%>");
        <%
            }
        %>
    }

</script>
</head>

<body onload="printMsg()">
<form action="/EGOV/servlet/GoUpdateUser" name='updateUser' method="post" >
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="30"><img src="../images/tab_03.gif" width="15" height="30" /></td>
        <td width="1101" background="../images/tab_05.gif"><img src="../images/311.gif" width="16" height="16" /> <span class="STYLE4">系统用户列表</span></td>
        <td width="281" background="../images/tab_05.gif"><table border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="../images/add.jpg" style="cursor:hand" onclick="document.location='/EGOV/system/userAdd.html'"/></div></td>
                  </tr>
              </table></td>
              <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img hidden id="updateImag" src="../images/update_disabled.jpg" style="cursor:hand" onclick="doUpdate()"/></div></td>
                  </tr>
              </table></td>
              <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img hidden id="deleteImag" src="../images/delete_disabled.jpg" style="cursor:hand" onclick="doDelete()" /></div></td>
                  </tr>
              </table></td>
            </tr>
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

          <tr>
            <td width="6%" height="26" background="../images/tab_14.gif" class="STYLE1">
                <div align="center" class="STYLE2 STYLE1"><input type="checkbox" name="checkbox" id="checkall" value="" onclick="checkAll()" /></div></td>
            <td width="8%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">序号</div></td>
            <td width="12%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">用户代码</div></td>
            <td width="24%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">用户姓名</div></td>
            <td width="38%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">机构类型</div></td>
          </tr>

<%
          if (pageList != null){
            int i = 0;

            for (User user:pageList){
%>
              <tr>
                <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
                  <input type="hidden" name="pageno" value="<%=pageObj.getPageno()%>" />
                  <input name="usercode" value="<%=user.getUsercode()%>" onclick="control_Update_And_Delete()" type="checkbox" class="STYLE2" />
                </div></td>
                <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=++i%></div></td>
                <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><%=user.getUsercode()%></div></td>
                <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><%=user.getUsername()%></div></td>
                <td height="18" bgcolor="#FFFFFF"><div align="center" ><a href="/EGOV/PageQueryUser?pageno=<%=pageObj.getPageno()%>"><%=StringUtil.getOrgType(user.getOrgtype())%></a></div></td>
              </tr>
<%
            }
          }
%>

<%--          <tr>--%>
<%--            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">--%>
<%--              <input name="checkbox" type="checkbox" class="STYLE2" value="checkbox" />--%>
<%--            </div></td>--%>
<%--            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">1</div></td>--%>
<%--            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">zhangsan</div></td>--%>
<%--            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">张三</div></td>--%>
<%--            <td height="18" bgcolor="#FFFFFF"><div align="center" ><a href="#">外汇管理局</a></div></td>--%>
<%--          </tr>--%>

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
            <td width="25%" height="29" nowrap="nowrap"><span class="STYLE1">共<%=pageObj.getTotalsize()%>条纪录，当前第<%=pageObj.getPageno()%>/<%=pageObj.getPageCount()%>页，每页<%=pageObj.getPagesize()%>条纪录</span></td>
            <td width="75%" valign="top" class="STYLE1"><div align="right">
              <table width="352" height="20" border="0" cellpadding="0" cellspacing="0">

                  <%
                      boolean isNotFirstPage = pageObj.getPageno() > 1;
                      boolean isNotLastPage = pageObj.getPageno() < pageObj.getPageCount();
                  %>
                  <tr>
                                                                                                                        <!-- 这里将展示三目运算符的巅峰 -->
                                                                                                                        <!-- 这里将展示三目运算符的巅峰 -->
                                                                                                                        <!-- 这里将展示三目运算符的巅峰 -->
                                                                                                                        <!-- 这里将展示三目运算符的巅峰 -->
                      <td width="30" height="22" valign="middle">
                          <div align="right">
                              <img src="/EGOV/images/firstPage<%= isNotFirstPage?"":"Disabled" %>.gif" <%= isNotFirstPage?"style=cursor:pointer onclick=document.location='/EGOV/servlet/PageQueryUser?pageno=1'":""%>   />
                          </div>
                      </td>
                      <td width="30" height="22" valign="middle">
                          <div align="right">
                              <img src="../images/prevPage<%= isNotFirstPage?"":"Disabled" %>.gif" <%= isNotFirstPage?"style=cursor:pointer onclick='changePage("+(pageObj.getPageno()-1)+")'":""%> />
                          </div>
                      </td>
                      <td width="30" height="22" valign="middle">
                          <div align="right">
                              <img src="../images/nextPage<%= isNotLastPage?"":"Disabled" %>.gif" <%= isNotLastPage?"style=cursor:pointer onclick='changePage("+(pageObj.getPageno()+1)+")'":""%> />
                          </div>
                      </td>
                      <td width="30" height="22" valign="middle">
                          <div align="right">
                              <img src="../images/lastPage<%= isNotLastPage?"":"Disabled" %>.gif" <%= isNotLastPage?"style=cursor:pointer onclick='changePage("+pageObj.getPageCount()+")'":""%> />
                          </div>
                      </td>
                      <td width="59" height="22" valign="middle"><div align="right">转到第</div></td>
                      <td width="25" height="22" valign="middle"><span class="STYLE7">
                        <input id="myChangeText" type="text" class="STYLE1" style="height:14px; width:25px;text-align:right" size="5" />
                      </span></td>
                      <td width="23" height="22" valign="middle">页</td>
                      <td width="30" height="22" valign="middle"><img src="../images/go.gif" onclick="myChangePage()" width="37" height="15" /></td>
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
