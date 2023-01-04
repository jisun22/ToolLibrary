<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/fontawesome-free-6.2.1-web/css/all.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<script src = "/js/jquery-1.11.0.min.js"></script>
<title>마이페이지</title>
<script>
$(function(){   init(); });

function init(){

 	
	
}

function goBookList(){
	
	document.goBookListForm.submit();
	
	
}
function goMyWriting(){
	document.goMyWritingForm.submit();
	
}
function goPwChange(){
	document.goPwChangeForm.submit();
	
}
function goPhoneChange(){
	document.goPhoneChangeForm.submit();
	
}





</script>

<style>
    body{
        font-family: 'PT Sans Narrow';
    }
    img { border: 0; }
    ul { list-style: none; }

    .tableTitle{
        background-color: rgb(210, 203, 176);
    }
    
    .look:hover{
        background-color: rgb(192, 186, 165);
    }

    .myWrite:hover{
        background-color: rgb(192, 186, 165);
    }

    .myPageBtn{
        position: relative;
 
        width: 150px;
        height: 20px;
        border: none;
        font-weight: bolder;
        font-size:12px;
        background-color:rgb(225, 215, 185) ;
    }

    .myPageBtn:hover{
        background-color:rgb(214, 202, 166) ;
    }
</style>
</head>

<body style="background-color: rgb(234, 230, 219);">

<%@include file="/WEB-INF/views/commonHeader.jsp" %>

    <center>
    <form name="goMyPageInfoForm" method="post" action="/myPageInfo.do"></form>
    <form name="goBookListForm" method="post" action="/myPageBookList.do" ></form>
    <form name="goMyWritingForm" method="post"  action="/myPageMyWritingList.do" ></form>
    <form name="goPwChangeForm" method="post" action="/myPageInfoPwChange.do" ></form>
    <form name="goPhoneChangeForm" method="post" action="/myPageInfoPhoneChange.do" ></form>

    
    <form name="mypage" class="mypage">

        <table id="myInfo" class="move" border=1 cellspacing=0 width=550px cellpadding=5>
            <head>
                <tr class="tableTitle">
                    <td colspan="2"><center><b>내 정보</b></center></td>
                    
                    <td class="look" colspan="2" style="cursor:pointer" onClick="goBookList();"><center><b>대여 조회</b></center></td>
                    
                    <td class="myWrite" colspan="2" style="cursor:pointer" onClick="goMyWriting();"><center><b>내가 쓴 글</b></center></td> 
                 
                </tr>
            </head>
            <body>
            <!-- 내 정보-->
           <tr>
                <td style="background-color: rgb(216, 206, 190);">이메일</td> <td colspan="5">${memberInfo.get(0).get('EMAIL')}</td> 
           </tr>
           <tr>
                <td style="background-color: rgb(216, 206, 190);">비밀번호 변경</td>
                <td colspan="5">
                    <input class="myPageBtn" type="button" value="비밀번호 변경" class="changePwd" onClick="goPwChange();">
                        
                </td>
           </tr>
           <tr>
                <td style="background-color: rgb(216, 206, 190);">이름</td> <td colspan="5">${memberInfo.get(0).get('NAME')}</td>
           </tr>
           <tr>
                <td style="background-color: rgb(216, 206, 190);">핸드폰 번호</td> <td colspan="10">${memberInfo.get(0).get('PHONE')}</td>
                <input class="myPageBtn" type="hidden" value="핸드폰 번호 변경" class="changePwd" onClick="goPhoneChange();"  ></td>
           </tr>
           <tr>
           		<td style="background-color: rgb(216, 206, 190);">주소</td> <td colspan="5"> ${memberInfo.get(0).get('ADDR')}</td>
           <!-- 대여 조회-->
           <!--내가 쓴 글-->
             </body>
        </table>
    </form>
    </center>
     <%@include file="/WEB-INF/views/commonFooter.jsp" %>
</body>
</html>
