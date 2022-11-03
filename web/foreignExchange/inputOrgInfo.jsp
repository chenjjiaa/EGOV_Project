<%@ page import="com.gg.egov.util.StringUtil" %>
<%@page pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
    String orgcode = request.getParameter("orgcode");
    String successMsg = (String) request.getAttribute("successMsg");
    String errorMsg = (String) request.getAttribute("errorMsg");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <base href="<%=StringUtil.getServerPath(request)+"images/"%>">
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
<script src="/EGOV/js/jquery-3.6.0.js" ></script>
<script>

  //添加新行
  function addNewLine(invregnum,invname,cty) {
    $("#itemTable").append('<tr id="'+invregnum+'"><td width="20%" bgcolor="#FFFFFF" height="20" class="STYLE1"><div align="center" style="padding:5px" class="STYLE2 STYLE1">'+invname+'</div></td><td width="20%" bgcolor="#FFFFFF" class="STYLE1"><input type="hidden" name="cty" value="'+cty+'"><div align="center" style="padding:2px" class="STYLE2">'+cty+'</div></td><td width="20%" bgcolor="#FFFFFF" class="STYLE1"><div align="center" style="padding:5px" class="STYLE2 STYLE1"><input onblur="calculateCap()" type="text" name="regcapItem" id="regcapItem" style="width:90px; height:20px; border:solid 1px #035551; color:#000000"><font color="red">*</font></div></td><td width="20%" bgcolor="#FFFFFF" class="STYLE1"><div align="center" style="padding:2px" class="STYLE2"><input type="text" name="scale" id="scale" style="width:90px; height:20px; border:solid 1px #035551; color:#000000"><font color="red">*</font></div></td><td width="20%" bgcolor="#FFFFFF" class="STYLE1"><div align="center" style="padding:2px" class="STYLE2"><img id="deleteBtn" onclick="deleteRow('+ invregnum +')" src="../images/delete.jpg"/></div></td><input type="hidden" name="invregnum" value="'+invregnum+'" ></tr>');
  }

  //删除指定行
  function deleteRow(invregnum) {
    if (window.confirm("确定要删除此条记录吗？")){
      $("#"+invregnum).remove();
    }
  }

  //根据注册资本条目来计算 总注册资本、外方总注册资本
  function calculateCap() {

    //获取所有条目，形成一个条目集
    var regcapItems = document.getElementsByName("regcapItem");
    //获取所有国别
    var countrys = document.getElementsByName("cty")

    var totalCap = 0
    var foreignCap = 0;

    for (var i= 0; regcapItems.length>i; i++){

      //单独的条目对象
      var regcapItem = regcapItems[i]
      if (regcapItem.value.trim() != ""){

        //将条目对象设置到“总注册资本”中
        totalCap += parseInt(regcapItem.value);
        document.getElementById("regcap").value = totalCap;

        //设置外方注册总资本
        if (countrys[i].value != "中国"){
          foreignCap += parseInt(regcapItem.value);
          document.getElementById("outregcap").value = foreignCap;
        }
      }
    }
    //将计算过后的外资比例数值设置到“外方出资比例”中
    document.getElementById("proportionDiv").innerText = ((foreignCap/totalCap)*100).toFixed(2) + '%';
  }

  //提交表单
  function doSave() {
    if (validateForm()){
      document.forms["saveForm"].submit();
    }
  }

  //校验表单
  function validateForm() {
    //校验企业中文名
    if (document.getElementById("cnname").value.trim() == "") {
      alert("企业中文名不能为空，请填写");
      document.getElementById("cnname").focus();
      return false;
    }
    //校验联系人
    if (document.getElementById("contactman").value.trim() == "") {
      alert("联系人不能为空，请填写");
      document.getElementById("contactman").focus();
      return false;
    }
    //校验外汇登记证号
    if (document.getElementById("regno").value.trim() == "") {
      alert("外汇登记证号不能为空，请填写");
      document.getElementById("regno").focus();
      return false;
    }
    //校验企业英文名
    if (document.getElementById("enname").value.trim() == "") {
      alert("企业英文名不能为空，请填写");
      document.getElementById("enname").focus();
      return false;
    }
    //校验联系电话
    if (document.getElementById("contacttel").value.trim() == "") {
      alert("联系电话不能为空，请填写");
      document.getElementById("contacttel").focus();
      return false;
    }
    //校验注册币种
    if (document.getElementById("regcry").value == "") {
      alert("注册币种不能为空，请填写");
      document.getElementById("regcry").focus();
      return false;
    }
    //校验注册资本出资额
    var regcapItems = document.getElementsByName("regcapItem");
    for (var i = 0; regcapItems.length > i; i++) {
      if (regcapItems[i].value.trim() == "") {
        alert("注册资本出资额不能为空，请填写");
        regcapItems[i].focus();
        return false;
      }
    }
    //校验利润分配比例
    var scales = document.getElementsByName("scale");
    for (var i = 0; scales.length > i; i++) {
      if (scales[i].value.trim() == "") {
        alert("利润分配比例不能为空，请填写");
        scales[i].focus();
        return false;
      }
    }
    return true;
  }

  function tipsMsg() {
    <%
           if (successMsg != null){
    %>
          alert("<%=successMsg%>");
          document.location='/EGOV/foreignExchange/newInputOrg.jsp';
    <%
           }
    %>
    <%
           if (errorMsg != null){
    %>
          alert("<%=errorMsg%>");
          document.location='/EGOV/foreignExchange/newInputOrg.jsp';
    <%
           }
    %>
  }

</script>
</head>

<body onload="tipsMsg()">
<form action="/EGOV/servlet/saveInvAndEn" name="saveForm" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="30"><img src="../images/tab_03.gif" width="15" height="30" /></td>
        <td width="1101" background="../images/tab_05.gif"><img src="../images/311.gif" width="16" height="16" /> <span class="STYLE4">新设外商企业登记-录入</span></td>
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
          <tr>
            <td width="100" height="26" class="STYLE1" colspan="4"><div align="center" style="padding:5px" class="STYLE2 STYLE1"><font color="#FFFFFF"><B>企业基本信息</B></font></div></td>
          </tr>
          <tr>
            <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">组织机构代码:</div></td>
            <td width="250" bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><%=orgcode%></div></td>
              <input type="hidden" name="orgcode" id="<%=orgcode%>" value="<%=orgcode%>" >
            <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">外汇登记证号:</div></td>
            <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="regno" id="regno" style="width:150px; height:20px; border:solid 1px #035551; color:#000000"><font color="red">*</font></div></td>
          </tr>
          <tr>
            <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">企业中文名称:</div></td>
            <td width="250" bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="cnname" id="cnname" style="width:150px; height:20px; border:solid 1px #035551; color:#000000"><font color="red">*</font></div></td>
            <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">企业英文名称:</div></td>
            <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="enname" id="enname" style="width:150px; height:20px; border:solid 1px #035551; color:#000000"></div></td>
          </tr>
          <tr>
            <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">联系人:</div></td>
            <td width="250" bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="contactman" id="contactman" style="width:150px; height:20px; border:solid 1px #035551; color:#000000"></div></td>
            <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">联系电话:</div></td>
            <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="contacttel" id="contacttel" style="width:150px; height:20px; border:solid 1px #035551; color:#000000"></div></td>
          </tr>
          <tr>
            <td width="100" height="26" class="STYLE1" colspan="4"><div align="center" width="100%" style="padding:5px" class="STYLE2 STYLE1"><font color="#FFFFFF"><B>企业资金情况信息</B></font></div></td>
          </tr>        
          <tr>
            <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">注册资本:</div></td>
            <td width="250" bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input readonly type="text" name="regcap" id="regcap" style="width:150px; height:20px; border:solid 1px #035551; color:#000000"><font color="red">*</font></div></td>
            <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">注册币种:</div></td>
            <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2">
		      <select id="regcry" name="regcry" style="WIDTH:100px">
		        <option value=""></option>
		        <option value="0">美元</option>
		        <option value="1">人民币</option>
		      </select> <font color="red">*</font></div></td>
          </tr>
          <tr>
            <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">外方注册资本:</div></td>
            <td width="250" bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input readonly type="text" name="outregcap" id="outregcap" style="width:150px; height:20px; border:solid 1px #035551; color:#000000"><font color="red">*</font></div></td>
            <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">外方出资比例:</div></td>
            <td bgcolor="#FFFFFF" class="STYLE1"><div id="proportionDiv" align="left" style="padding:2px" class="STYLE2">0%</div></td>
          </tr>
          <tr>
            <td width="100" height="26" class="STYLE1" colspan="4"><div align="center" style="padding:5px" class="STYLE2 STYLE1"><font color="#FFFFFF"><B>投资者资金及利润分配</B></font></div></td>
          </tr> 
          <tr>
            <td width="100%" bgcolor="#FFFFFF" class="STYLE1" colspan="4">
                <table id="itemTable" border="0" width="100%" height="100%" cellpadding="0" cellspacing="1" bgcolor="#0e6f68">
		          <tr>
		            <td width="20%" bgcolor="#CCCCCC" height="20" class="STYLE1"><div align="center" style="padding:5px" class="STYLE2 STYLE1">投资者名称</div></td>
		            <td width="20%" bgcolor="#CCCCCC" class="STYLE1"><div align="center" style="padding:2px" class="STYLE2">国别</div></td>
		            <td width="20%" bgcolor="#CCCCCC" class="STYLE1"><div align="center" style="padding:5px" class="STYLE2 STYLE1">注册资本出资额</div></td>
		            <td width="20%" bgcolor="#CCCCCC" class="STYLE1"><div align="center" style="padding:2px" class="STYLE2">利润分配比例</div></td>
		            <td width="20%" bgcolor="#CCCCCC" class="STYLE1"><div align="center" style="padding:2px" class="STYLE2"><img src="../images/query.jpg" onclick="window.open('/EGOV/foreignExchange/orgcodeSelect.jsp', '分页查询投资人信息', 'width=1000, height=600, scrollbars=no')"/></div></td>
		          </tr>

                  <!-- =======  这里是关系表的信息  ======= -->
<%--		          <tr>--%>
<%--		            <td width="20%" bgcolor="#FFFFFF" height="20" class="STYLE1"><div align="center" style="padding:5px" class="STYLE2 STYLE1">XXXXXX</div></td>--%>
<%--		            <td width="20%" bgcolor="#FFFFFF" class="STYLE1"><div align="center" style="padding:2px" class="STYLE2"><span id="myspan">美国</span></div></td>--%>
<%--		            <td width="20%" bgcolor="#FFFFFF" class="STYLE1"><div align="center" style="padding:5px" class="STYLE2 STYLE1"><input type="text" name="regcapItem" id="regcapItem" style="width:90px; height:20px; border:solid 1px #035551; color:#000000"><font color="red">*</font></div></td>--%>
<%--		            <td width="20%" bgcolor="#FFFFFF" class="STYLE1"><div align="center" style="padding:2px" class="STYLE2"><input type="text" name="scale" id="scale" style="width:90px; height:20px; border:solid 1px #035551; color:#000000"><font color="red">*</font></div></td>--%>
<%--		            <td width="20%" bgcolor="#FFFFFF" class="STYLE1"><div align="center" style="padding:2px" class="STYLE2"><img  src="../images/delete.jpg"/></div></td>--%>
<%--                    <input type="hidden" name="invregnum" id="invregnum" value="" >--%>
<%--		          </tr>--%>

                </table>
            </td>
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
        <td bgcolor="#f3ffe3">
          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#0e6f68">
            <tr height="30">
              <td bgcolor="#FFFFFF" height="30" class="STYLE1" colspan="2" align="center">
                <img src="../images/ok.jpg" onclick="doSave()"/>&nbsp;&nbsp;
                <img src="../images/back.jpg" onclick="document.location='/EGOV/foreignExchange/newInputOrg.jsp'"/>
              </td>
            </tr>
          </table>
        </td>
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
