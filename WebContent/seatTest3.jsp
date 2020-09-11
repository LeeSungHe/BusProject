<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import = "java.util.Arrays" %>
<%
	String fSeat = request.getParameter("s");
    String seatInfo = "1,28,9";
    String seats[];
    if(fSeat == null || fSeat.equals("")) seats = seatInfo.split(",");
    else seats = fSeat.split(",");
    
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Online seat reservation</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" type="text/css" href="seat.css"/>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script type="text/javascript" src="seat.js"></script>
    </head>
    <body>
        주소에서 날아오는 초기값은 s=1,28,9 설정<br><br>
        
        임의적인 설정값은 주소에서 변경 sample => seatTest3.jsp?s=<% for(int i=0,kk=seats.length; i<kk;i++){out.print((i<kk-1)?(seats[i]+","):seats[i]);} %> <br><br><br>
        <a href="http://220.70.27.150:8080/Busbusiness/seatTest/seatTest3.jsp?s=1,9,20,27,28">http://220.70.27.150:8080/Busbusiness/seatTest/seatTest3.jsp?s=1,9,20,27,28</a>
		<br><br>
        <div class="container-fluid">
            <div class="row">
                <div>
                    <h1>버스좌석 예약</h1>
                    <div class='row text-center'>
                        <input type="hidden" class="form-control input" id="Name" value="helloId" placeholder="아이디">
                        성인<input type="number" min='0' max='28' style="width:3%;margin-right: 10px;" id="Adults" value="0" >
                        학생<input type="number" min='0' max='28' style="width:3%;margin-right: 10px;" id="Students" value="0" >
                        <input type="text" min='0' max='28' class="form-control input" id="Seats"  style="width:7%;margin-right: 10px;" placeholder="총좌석" readonly="readonly">명
                        <button type="button" id="Selectseat" class="btn btn-success seatsBtn">예약석선택</button>
                    </div>
                    <div class='row'>
                    </div>
                    <div class="row">
                        <div class="screen">운전석</div>
                        <div class=''>출입구</div>
                    </div>
                    <div class="row">
                        <div></div>
                        <div>
                            <table id="seatTable" class="table fixed-column td">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>1</th>
                                        <th>2</th>
                                        <th>3</th>
                                        <th>4</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>A</td>
                                    </tr>
                                    <tr>
                                        <td>B</td>
                                    </tr>
                                    <tr>
                                        <td>C</td>
                                    </tr>
                                    <tr>
                                        <td>D</td>
                                    </tr>
                                    <tr>
                                        <td>E</td>
                                    </tr>
                                    <tr>
                                        <td>F</td>
                                    </tr>
                                    <tr>
                                        <td>G</td>
                                    </tr>
                                    <tr>
                                        <td>H</td>
                                    </tr>
                                    <tr>
                                        <td>I</td>
                                    </tr>
                                </tbody>
                            </table>
                            <button type="button" id="ConfirmSeat" class="btn btn-warning seatsBtn">좌석예약</button>
                            <div>
                                <span class="spanBox" style='Background-color:green'></span><label>선택 좌석</label>
                                <span class="spanBox" style='Background-color:red'></span><label>예약 좌석</label>
                                <span class="spanBox"></span><label>빈좌석</label>
                            </div>
                        </div>
                        <div></div>
                    </div>
                </div>
            </div>
            <div class='row'>
                <div class=''></div>
                <div class=''>
                    <!-- 좌석 예약 결과 표시 -->
                    <table class='table-striped table table-bordered resultTable'>
                        <thead>
                            <tr>
                                <th>회원</th>
                                <th>좌석 수</th>
                                <th>좌석 번호</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                    <!-- 좌석 예약 결과 표시 -->
                </div>
                <div class='col-xs-12 col-sm-4 col-md-4 col-lg-4'></div>
            </div>
        </div>
    </body>
	<script type="text/javascript">    
	$(document).ready(function () {
	
		// 예약좌석프로그램 첫로딩 표시 테스트
		var $loadInsertData = function(fvar1){
		$fArr1 = fvar1.split(',');
		
		$('.table').attr('disabled', false);				// table 태그 활성화
		$('.table tbody tr td span').css({opacity: 1});		// 투명도 설정
		var table = document.getElementById("seatTable");	// 좌석테이블
		var TableRows = $('.table tr');						// table>tr
		var emptyCell = '<td></td>';						// 빈td
		
		// Table> SETTING ,seatInit 좌석번호 초기화
		for (var i = 1, seatInit = 1; i < TableRows.length-1; i++) {
		    var rowID = 1;// 행시작
		    var colId = $('.table tbody tr:nth-child(' + i + ') td:nth-child(' + 1 + ')').text();// 행제목
		
		    // 열카운터
		    for (var j = 0; j < 4; j++) {
		        if (i!=9&&j==2) {rowID--;} 
		        else {
		        	var $fChk = $fArr1.indexOf((seatInit).toString());
		         if($fChk>-1){ // 좌석 id값 비교
		         	//console.log('i = ' + i + ', j = ' + j + ', seatInit = ' + seatInit);
		             var tableCell = document.getElementById(seatInit.toString());//좌석테이블 아이디 저장
		             $('#' + seatInit).addClass('redColor');
		        	}
		        	seatInit++;// 좌석번호증가
		        }
		        rowID++;
		    }
		}
		    $('#Seats').val('');
		    $('#Adults, #Students').val('0');
		    $('.table tbody tr td').unbind('click');
		    $('.table tbody tr td span').css({opacity: 0.4});
		    
		}('<% for(int i=0,kk=seats.length; i<kk;i++){out.print((i<kk-1)?(seats[i]+","):seats[i]);} %>');// 주소에서 날아오는값
	
	});
	</script>
</html>