<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

    String seatInfo = "";
    String userid = request.getParameter("userid");
    String busRoute = request.getParameter("busRoute");
    String busList = request.getParameter("busList");
    String seatCount = request.getParameter("seatcount");
    String[] seatList = request.getParameterValues("seatlist");
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Sample jsp</title>
        <style>
            h1 {font-size:16pt; background:#AAFFAA; padding:5px; }
        </style>
        <script type="text/javascript">
        function doAction(){
            var s = document.getElementById('input').value;
            var url = 'hello4.jsp?param=' + encodeURI(s);
            window.location.href = url;
        }
        </script>
    </head>
<body>
    <h1>Sample jsp page</h1>
    <p>이 페이지는 샘플입니다.</p>
    <p>아이디：<%=userid%></p>
    <p>노선정보：<%=busRoute%></p>
    <p>배차정보：<%=busList%></p>
    <p>좌석수정보：<%=seatCount%></p>
    <p>시트리스트：
    <%=userid%>
<%  if (seatList != null){ 
        for(int i = 0;i < seatList.length;i++)
			out.write("seatList[" + i + "] = " + seatList[i] + "<br>" );
            //seatInfo += seatlist[i] + " ";
    }
%>
    </p>
</body>
</html>

    