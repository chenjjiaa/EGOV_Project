function popUpCalendar(obj1, obj2)
{
	_createRunqianCalendar();
	_showCalendar();
}

function _createRunqianCalendar() {
    var obj = document.getElementById("_runqianCalendar"); 
    if( obj == null ) {
		document.body.insertAdjacentHTML( 'afterBegin', "<div id=_runqianCalendar style='position: absolute; z-index: 7777; width: 145px; height: 175px; display: none'>" +
				"<iframe name=runqianCalendarIframe scrolling=no frameborder=0 width=100% height=100%></iframe></div>" );
    	_runqianCalendar.iframe = window.frames("runqianCalendarIframe");
	    _runqianCalendar.daysMonth  = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	    _runqianCalendar.day        = new Array(39);
	    _runqianCalendar.dayObj     = new Array(39);
	    _runqianCalendar.objExport  = null;
	    _runqianCalendar.eventSrc   = null;
	    _runqianCalendar.inputDate  = null;
	    _runqianCalendar.thisYear   = new Date().getFullYear();
	    _runqianCalendar.thisMonth  = new Date().getMonth()+ 1;
	    _runqianCalendar.thisDay    = new Date().getDate();
	    _runqianCalendar.today      = _runqianCalendar.thisDay +"/"+ _runqianCalendar.thisMonth +"/"+ _runqianCalendar.thisYear; 
	    _runqianCalendar.darkColor  = "#A4BEC8"; 
	    _runqianCalendar.lightColor = "#FFFFFF";
	    _runqianCalendar.wordColor  = "#000040";
	    _runqianCalendar.wordDark   = "#DCDCDC"; 
	    _runqianCalendar.dayBgColor = "#EDF2F4";
	    _runqianCalendar.todayColor = "#4682b4";
	    _runqianCalendar.DarkBorder = "#a9a9a9";
	    _runqianCalendar.type = "day";
	    _runqianCalendar.separator = "-";
    }
}   

function _createIframeSyntax() {
    var str = "<html><head><meta http-equiv='Content-Type' content='text/html; charset=gb2312'><style>"+
    "*{font-size: 12px; font-family: 宋体}"+
    ".bg{  color: "+ _runqianCalendar.lightColor +"; cursor: default; background-color: "+ _runqianCalendar.darkColor +";}"+
    "table#tableWeek td{ color: "+ _runqianCalendar.lightColor +";}"+
    "table#tableDay  td{ font-weight: bold;}"+
    ".over { text-align: center; border-top: 1px solid "+ _runqianCalendar.DarkBorder +"; border-left: 1px solid "+ _runqianCalendar.DarkBorder +";"+
    "border-right: 1px solid "+ _runqianCalendar.lightColor +"; border-bottom: 1px solid "+ _runqianCalendar.lightColor +";}"+
    ".out{ text-align: center; border-top: 1px solid #FFFFFF; border-left: 1px solid #FFFFFF;"+
    "border-bottom: 1px solid "+ _runqianCalendar.DarkBorder +"; border-right: 1px solid "+ _runqianCalendar.DarkBorder +"}"+
    "</style></head><body style='margin: 0px' oncontextmenu='return false'>";

    str += "<select id=tmpMonthSelect onblur='parent._hiddenSelect(this)' style='z-index:1; position:absolute;top:3px;left:85px;width:45px;display:none'"+
    " onchange='parent._runqianCalendar.thisMonth=this.value; parent._hiddenSelect(this); parent._writeCalendar();'></select>"+

    "<table id=tableMain class=bg border=0 cellspacing=2 cellpadding=0>"+
    "<tr><td height=18 bgcolor='"+ _runqianCalendar.lightColor +"'>"+
    "    <table id=tableHead width=140 border=0 cellspacing=1 cellpadding=0><tr align=center>"+
    "    <td width=12 height=18 class=bg title='向前翻1年' onselectstart='return false' style='cursor: hand' onclick='parent._prevYear()'><b>&lt;</b></td>"+
    "    <td width=30 align=right><INPUT id=yearInput onkeyup='parent._changeYear()' onfocus='this.select()' maxLength=4 oldValue='' style='width:30px;height:18px;border:none'></td>"+
    "    <td width=12 align=left onselectstart='return false'>年</td>"+
    "    <td width=12 class=bg title='向后翻1年' onselectstart='return false' onclick='parent._nextYear()' style='cursor: hand'><b>&gt;</b></td>"+
    "    <td width=12 class=bg title='向前翻1月' onselectstart='return false' style='cursor: hand' onclick='parent._prevMonth()'><b>&lt;</b></td>"+
    "    <td width=45 id=runqianYearMonth onselectstart='return false' title='点击此处选择月份' onclick='parent._funMonthSelect(parseInt(this.innerText, 10))'></td>"+
    "    <td width=12 class=bg title='向后翻1月' onselectstart='return false' onclick='parent._nextMonth()' style='cursor: hand'><b>&gt;</b></td></tr></table>"+
    "</td></tr><tr><td height=20><table id=tableWeek onselectstart='return false' border=1 width=140 cellpadding=0 cellspacing=0 ";
    str += " borderColorLight='"+ _runqianCalendar.darkColor +"' borderColorDark='"+ _runqianCalendar.lightColor +"'>"+
    "    <tr align=center><td height=20>日</td><td>一</td><td>二</td><td>三</td><td>四</td><td>五</td><td>六</td></tr></table>"+
    "</td></tr><tr><td valign=top width=140 bgcolor='"+ _runqianCalendar.lightColor +"'>"+
    "    <table id=tableDay onselectstart='return false' height=120 width=140 border=1 cellspacing=1 cellpadding=0>";
         for(var x=0; x<5; x++){ str += "<tr>";
         for(var y=0; y<7; y++)  str += "<td class=out id='runqianDay"+ (x*7+y) +"'></td>"; str += "</tr>";}
         str += "<tr>";
         for(var x=35; x<39; x++) str += "<td class=out id='runqianDay"+ x +"'></td>";
		 

         str +="<td colspan=1  class=out > <input style=' background-color: "+
			 _runqianCalendar.dayBgColor +";cursor: hand; padding-top: 4px; width: 100%; height: 100%; border: 0' onfocus='this.blur()'"+
         " type=button value='空' onclick='parent.clearDate()'/></td>" +
		 "<td colspan=1 class=out><input style=' background-color: "+
         _runqianCalendar.dayBgColor +";cursor: hand; padding-top: 4px; width: 100%; height: 100%; border: 0' onfocus='this.blur()'"+
         " type=button value='关闭' onclick='parent._hiddenCalendar()'/></td></tr></table>"+
    "</td></tr></table></body></html>";
    with(_runqianCalendar.iframe)
    {
        document.writeln(str); document.close();
        for(var i=0; i<39; i++)
        {
            _runqianCalendar.dayObj[i] = eval("runqianDay"+ i);
            _runqianCalendar.dayObj[i].onmouseover = _dayMouseOver;
            _runqianCalendar.dayObj[i].onmouseout  = _dayMouseOut;
            _runqianCalendar.dayObj[i].onclick     = _returnDate;
        }
    }
}

function _showCalendar() {
    _createIframeSyntax();
    var e = window.event.srcElement;   
    var o = _runqianCalendar.style; 
    _runqianCalendar.eventSrc = e;
	if (arguments.length == 0) _runqianCalendar.objExport = e;
    else _runqianCalendar.objExport = eval(arguments[0]);
	var t = e.offsetTop,  h = e.clientHeight, l = e.offsetLeft, p = e.type;
	while (e = e.offsetParent){t += e.offsetTop; l += e.offsetLeft;}
    o.display = "block"; 
    //_runqianCalendar.iframe.document.body.focus();
    var cw = _runqianCalendar.clientWidth, ch = _runqianCalendar.clientHeight;
    var dw = document.body.clientWidth, dl = document.body.scrollLeft, dt = document.body.scrollTop;
    if (document.body.clientHeight + dt - t - h >= ch) o.top = (p=="image")? t + h : t + h + 2;
    else o.top  = (t - dt < ch) ? ((p=="image")? t + h : t + h + 2) : t - ch;
    if (dw + dl - l >= cw) o.left = l; else o.left = (dw >= cw) ? dw - cw + dl : dl;

    var value = _runqianCalendar.objExport.value;
    if( _runqianCalendar.objExport.tagName == "TD" ) value = _runqianCalendar.objExport.innerText;
    value = _trimString( value );
    if ( value != ""){
    	var pos = value.indexOf( " " );
		if( pos > 0 ) value = value.substring( 0, pos );
		var y = _runqianCalendar.thisYear;
		var m = _runqianCalendar.thisMonth;
		var d = _runqianCalendar.thisDay;
		if( _runqianCalendar.separator.length > 0 ) {
			var tmp = value.split( _runqianCalendar.separator );
			if( tmp.length == 1 ) y = value;
			else if( tmp.length == 2 ) { y = tmp[0]; m = tmp[1]; }
			else if( tmp.length == 3 ) { y = tmp[0]; m = tmp[1]; d = tmp[2]; }
		}
		else {
			if( value.length == 4 ) y = value;
			else if( value.length == 6 ) {
				y = value.substring( 0, 4 );
				m = value.substring( 4 );
			}
			else if( value.length == 8 ) {
				y = value.substring( 0, 4 );
				m = value.substring( 4, 6 );
				d = value.substring( 6 );
			}
		}
        if( !isNaN( y ) ) _runqianCalendar.thisYear   = parseInt( y, 10 ); 
        if( !isNaN( m ) ) _runqianCalendar.thisMonth  = parseInt( m, 10 );
        if( !isNaN( d ) ) _runqianCalendar.thisDay    = parseInt( d, 10 );
        _runqianCalendar.inputDate  = parseInt(_runqianCalendar.thisDay, 10) +"/"+ parseInt(_runqianCalendar.thisMonth, 10) +"/"+ 
            parseInt(_runqianCalendar.thisYear, 10); 
    } 
    _writeCalendar();
}

function _funMonthSelect() {
    var m = isNaN(parseInt(_runqianCalendar.thisMonth, 10)) ? new Date().getMonth() + 1 : parseInt(_runqianCalendar.thisMonth);
    var e = _runqianCalendar.iframe.tmpMonthSelect;
    for (var i=1; i<13; i++) e.options.add(new Option(i +"月", i));
    e.style.display = ""; e.value = m; e.focus();
}

function _prevMonth() {
    _runqianCalendar.thisDay = 1;
    if (_runqianCalendar.thisMonth==1)
    {
        _runqianCalendar.thisYear--;
        _runqianCalendar.thisMonth=13;
    }
    _runqianCalendar.thisMonth--; _writeCalendar();
}

function _nextMonth() {
    _runqianCalendar.thisDay = 1;
    if (_runqianCalendar.thisMonth==12)
    {
        _runqianCalendar.thisYear++;
        _runqianCalendar.thisMonth=0;
    }
    _runqianCalendar.thisMonth++; _writeCalendar();
}

function _prevYear(){
	_runqianCalendar.thisDay = 1; 
	_runqianCalendar.thisYear--; 
	_writeCalendar();
}

function _nextYear(){
	_runqianCalendar.thisDay = 1; 
	_runqianCalendar.thisYear++; 
	_writeCalendar();
}

function _hiddenSelect(e){
	for(var i=e.options.length; i>-1; i--)e.options.remove(i); 
	e.style.display="none";
}

function _hiddenCalendar(){
	_runqianCalendar.style.display = "none";
}

function _appendZero(n){
	return(("00"+ n).substr(("00"+ n).length-2));
}

function _trimString( s ) {
	return s.replace(/(^\s*)|(\s*$)/g,"");
}

function _dayMouseOver() {
    this.className = "over";
    this.style.backgroundColor = _runqianCalendar.darkColor;
    if(_runqianCalendar.day[this.id.substr(10)].split("/")[1] == _runqianCalendar.thisMonth)
    this.style.color = _runqianCalendar.lightColor;
}

function _dayMouseOut() {
    this.className = "out"; var d = _runqianCalendar.day[this.id.substr(10)], a = d.split("/");
    this.style.removeAttribute('backgroundColor');
    if(a[1] == _runqianCalendar.thisMonth && d != _runqianCalendar.today)
    {
        this.style.color = _runqianCalendar.wordColor;
    }
}

function _writeCalendar() {
    var y = _runqianCalendar.thisYear;
    var m = _runqianCalendar.thisMonth; 
    var d = _runqianCalendar.thisDay;
    _runqianCalendar.iframe.yearInput.value = y;
    _runqianCalendar.iframe.runqianYearMonth.innerText = parseInt(m, 10) +" 月";
    _runqianCalendar.daysMonth[1] = (0==y%4 && (y%100!=0 || y%400==0)) ? 29 : 28;
    var w = new Date(y, m-1, 1).getDay();
    var prevDays = m==1  ? _runqianCalendar.daysMonth[11] : _runqianCalendar.daysMonth[m-2];
    for( var i=(w-1); i>=0; i--) {
        _runqianCalendar.day[i] = prevDays +"/"+ (parseInt(m, 10)-1) +"/"+ y;
        if(m==1) _runqianCalendar.day[i] = prevDays +"/"+ 12 +"/"+ (parseInt(y, 10)-1);
        prevDays--;
    }
    for(var i=1; i<=_runqianCalendar.daysMonth[m-1]; i++) _runqianCalendar.day[i+w-1] = i +"/"+ m +"/"+ y;
    for(var i=1; i<39-w-_runqianCalendar.daysMonth[m-1]+1; i++) {
        _runqianCalendar.day[_runqianCalendar.daysMonth[m-1]+w-1+i] = i +"/"+ (parseInt(m, 10)+1) +"/"+ y;
        if(m==12) _runqianCalendar.day[_runqianCalendar.daysMonth[m-1]+w-1+i] = i +"/"+ 1 +"/"+ (parseInt(y, 10)+1);
    }
    for(var i=0; i<39; i++) {
        var a = _runqianCalendar.day[i].split("/");
        _runqianCalendar.dayObj[i].innerText    = a[0];
        _runqianCalendar.dayObj[i].title        = a[2] +"-"+ _appendZero(a[1]) +"-"+ _appendZero(a[0]);
        _runqianCalendar.dayObj[i].bgColor      = _runqianCalendar.dayBgColor;
        _runqianCalendar.dayObj[i].style.color  = _runqianCalendar.wordColor;
        if ((i<10 && parseInt(_runqianCalendar.day[i], 10)>20) || (i>27 && parseInt(_runqianCalendar.day[i], 10)<12))
            _runqianCalendar.dayObj[i].style.color = _runqianCalendar.wordDark;
        if ( _runqianCalendar.inputDate == _runqianCalendar.day[i]) {
        	_runqianCalendar.dayObj[i].bgColor = _runqianCalendar.darkColor; 
        	_runqianCalendar.dayObj[i].style.color = _runqianCalendar.lightColor;
        }
        if (_runqianCalendar.day[i] == _runqianCalendar.today) {
        	_runqianCalendar.dayObj[i].bgColor = _runqianCalendar.todayColor; 
        	_runqianCalendar.dayObj[i].style.color = _runqianCalendar.lightColor;
        }
    }
}

function _returnDate() {
    if( _runqianCalendar.objExport ) {
        var returnValue = "";
        var a = (arguments.length==0) ? _runqianCalendar.day[this.id.substr(10)].split("/") : arguments[0].split("/");
        if( _runqianCalendar.type == "day" ) returnValue = a[2] + _runqianCalendar.separator + _appendZero(a[1]) + _runqianCalendar.separator + _appendZero(a[0]);
        else if( _runqianCalendar.type == "month" ) returnValue = a[2] + _runqianCalendar.separator + _appendZero(a[1]);
        else if( _runqianCalendar.type == "year" ) returnValue = a[2];
        _runqianCalendar.objExport.value = returnValue;
        if( _runqianCalendar.objExport.tagName == "TD" ) _runqianCalendar.objExport.innerText = returnValue;
        _hiddenCalendar();
    }
}

function clearDate()
{
	_runqianCalendar.objExport.value = "";
	_runqianCalendar.style.display = "none";
}

function _changeYear() {
	var obj = _runqianCalendar.iframe.yearInput;
	var y = obj.value;		
	if( isNaN( y ) || obj.oldValue == y ) return;
	obj.oldValue = y;
	var value = 0;
	try { value = parseInt( y ); } catch( e ) {}
	if( value > 999 && value < 10000 ) {
		_runqianCalendar.thisYear = value;
		_writeCalendar();	
	}
}
