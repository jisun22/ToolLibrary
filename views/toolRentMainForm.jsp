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
<title>Document</title>
<script>
   
    $(function (){init();});
    var locationChecked;
 
    
    function init(){
    	
    	<c:if test="${!empty param.selJijumNo}">
    		$("[name=jijumSel]").val(${param.selJijumNo});
    	</c:if>
    	<c:if test="${!empty param.selBigSort}">
		$("[name=bigSortSel]").val(${param.selBigSort});
		</c:if>
    	<c:if test="${!empty param.selSmallSort}">
		$("[name=smallSortSel]").val(${param.selSmallSort});
		</c:if>
		
    	<c:if test="${!empty param.selKeyword}">
		$("[name=keywordSel]").val("${param.selKeyword}");
		</c:if>
    	
		
		<c:if test="${!empty param.selPageCnt}">
		$("[name=selPageCnt]").val("${param.selPageCnt}");
		</c:if>
    	
		$("[name=cnt${requestScope.selPageCnt}]").css('font-weight','bold');
		
		$("[name=cnt${requestScope.selPageCnt}]").text('[${requestScope.selPageCnt}]');
		
		
    	}
    function searchRecord(){
    	
    }
    
    function goToolDetail(listNo,jijumNo){
    	$("[name=toolNo]").val(listNo);
    	$("[name=jijumNo]").val(jijumNo);
    	document.goForm.action="/toolRentDetail.do"; document.goForm.submit();}
    
    function goToolBook(listNo,jijumNo,nowStatus){
    	if(nowStatus!=0){alert("예약 불가능합니다"); return;}
    	$("[name=toolNo]").val(listNo);
    	$("[name=jijumNo]").val(jijumNo);
    	document.goForm.action="/toolRentBook.do"; document.goForm.submit();}
    
    function putJijum(){
    		var ss = $("[name=jijumSel]").val();
			$("[name=selJijumNo]").val(ss);
    }
    function putBigSort(){
    	var ss = $("[name=bigSortSel]").val();
			$("[name=selBigSort]").val(ss);
    }
    function putSmallSort(){
    	var ss = $("[name=smallSortSel]").val();
			$("[name=selSmallSort]").val(ss);
    }
    function putKeyword(){
    	
    	var ss = $("[name=keywordSel]").val();
    			$("[name=selKeyword]").val(ss);
    			
    }
    
			
			var pageCnt;
    	
    function goPageCnt(pageCnt){
    	
    	$("[name=selPageCnt]").val(pageCnt);
    
		
   	 
    	document.searchForm.submit();	
    	
    }
    
    
    function search(){
    	
    	$("[name=selPageCnt]").val(1);
    	
    	 
    	document.searchForm.submit();
    	
    	
    }
    
    
    
    
    
    
    
    
    
    
    
    
 
    </script>

<style>
    body{
        font-family: 'PT Sans Narrow';
    }
    img { border: 0; }
    ul { list-style: none; }



    .boardTitle span:hover{
        color: rgb(240, 227, 186);
         text-decoration: underline;
         text-underline-position: under;
         text-decoration-color: rgb(240, 227, 186);
         /* background-color: rgb(226, 211, 166); */
         /* border: solid 2px rgb(226, 211, 166); */
    }
    .searchTxt{
    width: 200px;
    height: 20px;
    font-size: 12px;
    border: 0;
    border-radius: 5px;
    /* outline: none; */
    padding-left: 10px;
    background-color: rgb(227, 223, 209);
    opacity: 0.8;
    }

    .boardSearch{
        background-color: rgb(249, 245, 224);
        border: 2px;
        height: 20px;
    }

    .selectBox{

        background-color:  rgb(233, 222, 200);
        width: 100px;
        height: 22px;
    }

    .SearchBtn{
        background-color:rgb(182, 175, 151);
        width: 50px;
        height: 22px;
        border: none;
        font-weight: bolder;
    }

    .SearchBtn:hover{
        color: rgb(110, 97, 79);
        background-color:rgb(200, 193, 166);
    }

    .reserBtn{
        width: 100px;
        height: 30px;
        border: none;
        font-weight: bolder;
        background-color:rgb(200, 193, 166); 
    }

    .reserBtn:hover{
        color: rgb(110, 97, 79);
        background-color:rgb(181, 174, 148);
    }

    .section{
        width: 600px;
        margin: 0 auto;
        background-color: rgb(208, 202, 190);
    }


   
</style>
</head>
<body style="background-color: rgb(234, 230, 219);">
<%@include file="/WEB-INF/views/commonHeader.jsp" %>
<form name="goForm" method="post">
<input type="hidden" name="locationNo">
<input type="hidden" name="toolNo"> 
<input type="hidden" name="jijumNo">
</form>
 
<form name="searchForm" method="post" action="/toolRentMainForm.do">
<input type="hidden" name="selJijumNo" value='${param.selJijumNo}'>
<input type="hidden" name="selBigSort" value="${param.selBigSort}">
<input type="hidden" name="selSmallSort" value="${param.selSmallSort }">
<input type="hidden" name="selKeyword" value="${param.selKeyword}">
<input type="hidden" name="selPageCnt" value="1">
</form>
        <form name="sendForm"  action="/toolRentMainForm.do" method="post">
            <!--===============================================================-->
            <center>
            <table  class="section" border="0" cellpadding="5" cellspacing="0" style="border-collapse:collapse" align="center" width="600px">
                <tr>
                    <th>
                        
                    
                        <select class="selectBox" onChange="putJijum();" name="jijumSel">
                            <option value="" selected>지점 선택</option>
                        <c:forEach var="jijum" items="${requestScope.jijums}" varStatus="loopTagStatus">
                            <option value='${jijum.NO}'  >"${jijum.NAME}"</option>
                        
                        </c:forEach>
                            
                      
                        </select>
                    </th>
                    <th>
                        <select name="bigSortSel" class="selectBox" onChange="putBigSort();" style="display:none">
                            <option value="" selected>공구 대분류</option>
                            
                            
                        <c:forEach var="bigSort" items="${requestScope.bigSorts}" varStatus="loopTagStatus">
                            <option value='${bigSort.NO}'  >"${bigSort.NAME}"</option>
                        
                        </c:forEach>
                        </select>
                    </th>
                    
                    
                    
                    
                    
                    <th>
                        <select name="smallSortSel" class="selectBox"onChange="putSmallSort();">
                            <option value="" selected>공구 소분류</option>
                            <c:forEach var="smallSort" items="${requestScope.smallSorts}" varStatus="loopTagStatus">
                            <option value='${smallSort.NO}'  >"${smallSort.NAME}"</option>
                        
                        </c:forEach>
                        </select>
                    </th>
                    
                    <th>
                        <input class="boardSearch" type="text" name="keywordSel" placeholder="검색어를 입력해주세요." maxlength="10" onChange="putKeyword();">
                    </th>
                    <th>
                        <input class="SearchBtn" type="button" value="검색" onclick="search();">
                    </th>
                </tr>
            </table>
            <div style="height: 10px;"></div>
            <!-- mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm -->
            <c:forEach var="list" items="${requestScope.toolLists}" varStatus="loopTagStatus">
        	<table  class="" border="1px" cellpadding="5" cellspacing="0" style="border-collapse:collapse" align="center" width="600px">
				<tr onClick="goToolDetail(${list.NO},${list.JIJUMNO});" style="cursor:pointer">
					<td rowspan="5" width="35%"><span style="cursor:pointer" width="300px" align="center" >
					<img src="resources/img/${list.NO}.jpg" width="180" height="180">
					</span></td>
               		<td ><span style="cursor:pointer" >${list.NAME}</span></td>			
				</tr>
				<tr onClick="goToolDetail(${list.NO},${list.JIJUMNO});" style="cursor:pointer">
                	<td >브랜드 : ${list.BRAND}
                	</td> 
                </tr>
				<tr onClick="goToolDetail(${list.NO},${list.JIJUMNO});" style="cursor:pointer">
              	  	<td colspan="4"><span style="cursor:pointer" onclick="">지점명 : ${list.JIJUMNAME}</span></td>
           		</tr>
           			
             
                 <tr onClick="goToolDetail(${list.NO},${list.JIJUMNO});" style="cursor:pointer">
                	<td >현재 상태 : ${list.NOWSTATUS==0? '예약가능':'예약불가능' }
                	</td> 
                </tr>
                <tr>
                	<td align="center">
                    <input type="button" value="예약하기" onclick="goToolBook(${list.NO},${list.JIJUMNO}, ${list.NOWSTATUS});">
                	</td>
                </tr>
                
                
            </tr>				
			</table><br>
		</c:forEach>
        <div align="center">
        <c:forEach begin="1" end="${requestScope.toolLists2.size()/10+1}" varStatus="loopTagStatus">
        <span name="cnt${loopTagStatus.index}" style="cursor:pointer" onclick="goPageCnt(${loopTagStatus.index });">${loopTagStatus.index }</span>
        </c:forEach>
        </div>
            
        </form>			  
        <%@include file="/WEB-INF/views/commonFooter.jsp" %>
    </body>
    </html>