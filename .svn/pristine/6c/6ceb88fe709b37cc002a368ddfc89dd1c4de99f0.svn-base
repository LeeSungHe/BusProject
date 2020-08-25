<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 2020. 8. 11.오후 4:54:17 ]</title>
</head>
<body>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:400,700,500);

/* main Styles */

html { box-sizing: border-box; }

*, *:before, *:after { box-sizing: inherit; }

body {
  background: #fafafa;
  font-family: "Roboto", sans-serif;
  font-size: 14px;
  margin: 0;
}

a { text-decoration: none; }

.container {
  width: 1000px;
  margin: auto;
}

h1 { text-align:center; margin-top:150px;}

/* Navigation Styles */

nav { background: #2ba0db; }

nav ul {
  font-size: 0;
  margin: 0;
  padding: 0;
}

nav ul li {
  display: inline-block;
  position: relative;
}

nav ul li a {
  color: #fff;
  display: block;
  font-size: 14px;
  padding: 15px 14px;
  transition: 0.3s linear;
}

nav ul li:hover { background: #126d9b; }

nav ul li ul {
  border-bottom: 5px solid #2ba0db;
  display: none;
  position: absolute;
  width: 250px;
}

nav ul li ul li {
  border-top: 1px solid #444;
  display: block;
}

nav ul li ul li:first-child { border-top: none; }

nav ul li ul li a {
  background: #373737;
  display: block;
  padding: 10px 14px;
}

nav ul li ul li a:hover { background: #126d9b; }

nav .fa.fa-angle-down { margin-left: 6px; }
</style>
</head>

<body>
<nav>
  <div class="container">
    <ul>
      <li><a href="#">Home</a></li>
    <li> <a href="#">운행정보<i class='fa fa-angle-down'></i></a>
        <ul>
          <li><a href="#">운행시간표</a></li>
          <li><a href="#">지역별버스노선</a></li>
        </ul>
      </li>
      
      <li> <a href="#">예매확인<i class='fa fa-angle-down'></i></a>
        <ul>
          <li><a href="#">예매확인</a></li>
          <li><a href="#">예매환불/취소</a></li>
          <li><a href="#">예매변경</a></li>
        </ul>
      </li>
      <li class='sub-menu'> <a href="#">이용안내<i class='fa fa-angle-down'></i></a>
        <ul>
          <li><a href="#">예매안내</a></li>
          <li><a href="#">결제안내</a></li>
          <li><a href="#">환불안내</a></li>
        </ul>
      </li>
       <li class='sub-menu'> <a href="#">게시판<i class='fa fa-angle-down'></i></a>
        <ul>
          <li><a href="#">공지사항</a></li>
          <li><a href="#">F&Q</a></li>
        </ul>
      </li>
      <li> <a href="#">로그인</a> </li>
      <li> <a href="#">회원가입</a> </li>
    </ul>
   
    
  </div>
</nav>

<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script> 
<script>
$('nav li').hover(
  function() {
	  $('ul', this).stop().slideDown(200);
  },
	function() {
    $('ul', this).stop().slideUp(200);
  }
);
</script>
</body>
</html>