var noOfSeats = 0, clickCounter = 0, k = 0, UserCount = 0;// 좌석수 입력, 예약카운터, 사용자카운터
$(document).ready(function () {

    // <TABLE> OPTION INIT - TAG 비활성
    $('.table').attr('disabled', true);

    // <TABLE> INIT
    var TableRows = $('.table tr'); // <TR>(HEAD, A,B,..I)
    var emptyCell = '<td></td>';    // <TD>통로


    // <Table> SETTING , TableRows.length(==<TR>행의 개수)
    for (var i = 1; i < TableRows.length; i++) {
        var rowID = 1;// <TR> NUMBER
        var colId = $('.table tbody tr:nth-child(' + i + ') td:nth-child(' + 1 + ')').text();// tr태그의 i번째에서 td태그의 1번째 글자
        // 스타일에서 선택 구문 : table > tbody > tr:nth-child(1) > td:nth-child(2) { background-color: red; }
        // 스타일에서 선택 구문 : table > tbody > tr:nth-child(1) > td:nth-child(2) > p:nth-child(2){ background-color: yellow; }

        // <TR>행생성(.table tr td의 개수)
        for (var j = 0; j < 4; j++) {
            var id = rowID + colId;
            var appendString;
            if (i!=9 && j == 2) {
                // appendString = '<td><span class="tdBox emptyBox" id=' + id + '></span></td>';
                $('.table tbody tr:nth-child(' + i + ')').append(emptyCell);
                rowID--;
            } else {
                appendString = '<td><span class="tdBox" id=' + id + '></span></td>';
                $('.table tbody tr:nth-child(' + i + ')').append(appendString);
            }
            rowID++;
        }
    }
    // <Table> SETTING



    // 좌석수 텍스트 입력상자에서 마우스가 나갈시
    var redCount = 0;                           // 예약좌석수
    $('#Seats').bind("propertychange change keyup paste input",function () {
        var BookedSeats = $('#Seats').val();    // 좌석수 텍스트 입력상자
        var remindSeats = 28 - redCount;        // 남은 좌석수
        noOfSeats = BookedSeats;
        //alert(BookedSeats + ',' + remindSeats);

        if ( BookedSeats > 28 ) {
            alert('최대 좌석 선택수는 28개입니다.');
            $('#Seats').val('');
            $('.table tbody tr td span').css({opacity: 0.4});
        } else if( remindSeats < Number(BookedSeats) ) {
            alert( '잔여좌석은 '+ remindSeats + '좌석 입니다.');
            $('#Seats').val('');
            $('.table tbody tr td span').css({opacity: 0.4});
        } 
    });


    // 성인/학생 좌석수선택 -> 총좌석수 표기
    $('#Adults, #Students').change(function () {
        var adultNum = parseInt($('#Adults').val());        // 좌석수 텍스트 입력상자
        var studentNum = parseInt($('#Students').val());    // 좌석수 텍스트 입력상자
        $('#Seats').val(adultNum + studentNum).change();
    });




    // click이벤트 중복방지하기 위해서 .unbind().bind(), 마지막에 정의된 이벤트만 실행하고 싶을때 
    // 예약좌석수 버튼 선택시
    $('#Selectseat').unbind('click').bind('click', function () {


        //$('#Adults, #Students').val('0');
        if ($('#Seats').val() != '' || $('#Seats').val() != 0) {// 좌석수 텍스트 입력상자에 값이 있다면
            var table = document.getElementById("seatTable");// 좌석테이블 아이디 가져오기
            alert('총 좌석은' + $('#Seats').val())
            // 예약된 좌석(redColor) 갯수 센다.
            for (var i = 1, row; row = table.rows[i]; i++) {
                for (var j = 1, col; col = row.cells[j]; j++) {
                    if (col.firstChild != null) {
                        var ClassName = col.firstChild.className;
                        if (ClassName != '' && typeof ClassName !== "undefined" && ClassName !== null) {
                            if (ClassName[1] == 'redColor') {
                                redCount++;
                            }
                            else
                            {
                                break;
                            }
                        }
                    }
                }
            }
            // 마우스 클릭시 예약할 좌석이 없으면(예약된 좌석이 28개이상이면), 나올수 없는..
            if (redCount > 28) {
                $('.table tbody tr td').unbind('click');         // 각 좌석들의 click이벤트 없애기
                $('.table tbody tr td span').css({opacity: 0.4});// 전체 예약좌석들의 불투명표시
                alert('잔여좌석이 없습니다.');
                return;
            }

            // 테이블 초기화된거 풀고 선택가능 - 사용가능(테이블(table)내의 태그만 전부 활성화 시키기)
            $('.table').attr('disabled', false);
            $('.table tbody tr td span').css({opacity: 1});// 좌석예약이 가능하다고 암시하기 위해 전체좌석들의 선택 가능 표시(불투명도 설정)


            // 예약좌석수 선택후 -> 좌석선택시 결과처리
            $('.table tbody tr td').unbind('click').bind('click', function () {
                // 셀에 해당하는 좌석클릭
                var ClassName = $(this).find('span').attr('class');
                
                // 해당 좌석에 해당하는 div셀을 클릭시 빈공백이 있는 자리 해결하기 위한 처리후 실행
                // 예약좌석 선택기능
                if (ClassName != '' && typeof ClassName !== "undefined" && ClassName !== null ) {
                    ClassName = ClassName.split(" ");// <td><span class='tdBox greenColor'> 클래스이름 분리
                    if (ClassName[1] == 'greenColor') {// 예약할 좌석이 greenColor 선택시
                        $(this).find('span').removeClass('greenColor');
                        clickCounter--;
                    } else {// 예약할 좌석이 greenColor가 아닐때 선택시
                        if (clickCounter >= noOfSeats) {// 좌석 텍스트입력 상자의 숫자보다 크거나 같다면
                            return;
                        } else {// 좌석 텍스트입력 상자의 숫자보다 클릭한 횟수가 적다면
                            if (ClassName[1] == 'redColor') {
                                return;
                            } else {// 빈좌석을 선택시 greenColor를 클래스이름에 삽입하고 clickCounter를 하나 더한다.
                                $(this).find('span').addClass('greenColor');
                                clickCounter++;
                            }// if
                        }// if
                    }// if
                }// if
            });
        }
        else {
            alert('예약좌석 수를 선택해주세요.');
        }
    });


    // 좌석예약 버튼 클릭 -- 서버에 좌석예약번호 전송하기전
    $('#ConfirmSeat').unbind('click').bind('click', function () {
        var table = document.getElementById("seatTable");//좌석테이블 아이디 저장
        var idList = '';                    // 좌석번호 저장값
        var UserName = $('#Name').val();    // 아이디 텍스트 입력상자
        if (UserName == '') {
            alert('예약좌석은 회원서비스입니다.');
            return;
        }
        if ($('#Seats').val() == '' || $('#Seats').val() == 0) {
            alert('예약좌석 수를 입력해주세요.');
            return;
        } else {
            // 좌석 입력텍스트상자의 숫자와 예약할(greenColor)의 개수와 비교
            for (var i = 1, row; row = table.rows[i]; i++) {// #table tr
                for (var j = 1, col; col = row.cells[j]; j++) {// #table tr td
                    if (col.firstChild != null) {// #table tr td span
                        var ClassName = col.firstChild.className;// #table tr td span .class
                        if (ClassName != '' && typeof ClassName !== "undefined" && ClassName !== null) { // check className
                            ClassName = ClassName.split(" ");// to className[]
                            if (ClassName[1] == 'greenColor') {// check greenColor
                                UserCount++;// greenColor to a UserCount
                                // .table > tbody > tr의 i번째 > td의 j+1 번째의 id속성값 + ','
                                idList += $('.table tbody tr:nth-child(' + i + ') td:nth-child(' + (j + 1) + ') span').attr('id') + ',';
                                // greenColor to a redColor
                                $('.table tbody tr:nth-child(' + i + ') td:nth-child(' + (j + 1) + ') span').removeClass('greenColor').addClass('redColor');
                            }// if
                            if (ClassName[1] == 'greenColor') {
                                redCount++;// 예약된 카운터 개수
                            }//if
                        }// if
                    }// if
                }// for
            }// fro

            if (UserCount != parseInt(noOfSeats)) {// compare InputBox for seatCount; 다르면?
                UserCount = 0;
                var array = idList.split(',');// 좌석번호배열생성
                for (var l = 0; l < array.length; l++) {// 배열의 해당하는 id를 redColor를 삭제한후 greenColor를 추가한다.
                    $('#' + array[l]).removeClass('redColor').addClass('greenColor');
                }
                alert('선택한 좌석이 지정된 좌석 수와 일치하지 않습니다.');
                return;
            }
            idList = idList.substring(0, idList.length - 1);// 좌석번호 추출





            // <tr> 태그 생성
            var newRow = document.createElement('tr');
            newRow.setAttribute('id', 'id_' + k);
            $('.resultTable').append(newRow);// 결과 테이블에 <tr>테그 추가

            // 회원아이디
            var td = document.createElement('td');            
            td.innerHTML = UserName;
            document.getElementById('id_' + k).appendChild(td);

            // 선택한 좌석수
            td = document.createElement('td');
            td.innerHTML = UserCount;
            document.getElementById('id_' + k).appendChild(td);

            // 선택한 좌석번호
            td = document.createElement('td');
            td.innerHTML = idList;
            document.getElementById('id_' + k).appendChild(td);

            ////////////////////////////////////////////////////////////
            // 결과값(회원아이디,좌석개수,좌석번호리스트) 받아서
            // 서버 전송한다.
            ////////////////////////////////////////////////////////////

            k++;// 결과값을 출력할 <tr> 순서번호
            clickCounter = 0;   // 예약좌석개수
            UserCount = 0;      // 좌석개수

            // 초기화
            $('#Name').val('');// 아이디가 숨겨나서 다시 입력하면 오류
            $('#Seats').val('');
            $('#Adults, #Students').val('0');
            $('.table tbody tr td').unbind('click');
            $('.table tbody tr td span').css({opacity: 0.4});
        }
    });

});