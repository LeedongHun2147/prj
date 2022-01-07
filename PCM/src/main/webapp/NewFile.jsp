<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

</head>
<body>
	<SCRIPT language=JavaScript> 

function getTime() { 

now = new Date(); 

dday = new Date(2013,02,14,11,45,00); 

// 원하는 날짜, 시간 정확하게 초단위까지 기입.

days = (dday - now) / 1000 / 60 / 60 / 24; 

daysRound = Math.floor(days); 

hours = (dday - now) / 1000 / 60 / 60 - (24 * daysRound); 

hoursRound = Math.floor(hours); 

minutes = (dday - now) / 1000 /60 - (24 * 60 * daysRound) - (60 * hoursRound); 

minutesRound = Math.floor(minutes); 

seconds = (dday - now) / 1000 - (24 * 60 * 60 * daysRound) - (60 * 60 * hoursRound) - (60 * minutesRound); 

secondsRound = Math.round(seconds); 

document.getElementById("counter1").innerHTML = hoursRound; 

document.getElementById("counter2").innerHTML = minutesRound; 

document.getElementById("counter3").innerHTML = secondsRound; 

newtime = window.setTimeout("getTime();", 1000); 

} 

</SCRIPT>

	<STYLE type=text/css>

/*타임*/
#count {
	height: 167px;
	color: #000;
	padding-left: 100px;
	padding-top: 130px;
	background-image:
		url(http://www.bb.co.kr/data/201302/IJ13607483252985/12.jpg);
	background-repeat: no-repeat;
}

#bt {
	height: 16px;
	width: 49;
	padding-left: 100px;
	padding-top: 0px;
}
</STYLE>

	<TABLE cellSpacing=0 cellPadding=0>

		<TBODY>

			<TR>

				<TD height=167 width=256>

					<DIV id=count>
						<SPAN style="FONT: bold 12px Gulim; COLOR: #000" id=counter1></SPAN>
						<FONT style="FONT-FAMILY: '굴림'; size: 7px">시간</FONT> <SPAN
							style="FONT: bold 12px Gulim; COLOR: #000" id=counter2></SPAN> <FONT
							style="FONT-FAMILY: '굴림'; size: 7px">분</FONT> <SPAN
							style="FONT: bold 12px Gulim; COLOR: #000" id=counter3></SPAN> <FONT
							style="FONT-FAMILY: '굴림'; size: 7px">초 남음</FONT> <SPAN
							style="padding-left: 30px;"></SPAN>
					</div>

				</TD>
			</TR>
		</TBODY>
	</TABLE>

	<SCRIPT>getTime()</SCRIPT>
</body>
</html>