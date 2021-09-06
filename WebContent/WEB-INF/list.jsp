<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	a { color: black; text-decoration: none; }
	a:hover { color: red; font-weight: bold; }

</style>

</head>
<body>

<%-- ${mvcboardList} --%>

	<table width="1000" align="center" border="1" cellpadding="5" cellspacing="0">
		<tr>
			<th colspan="5">게시판 보기</th>
		</tr>
		<tr>
			<td colspan="5" align="right">
				${mvcboardList.totalCount}(${mvcboardList.currentPage} / ${mvcboardList.totalPage})Page
			</td>
		</tr>
		<tr>
			<td width="70" align="center">글번호</td>
			<td width="640" align="center">제목</td>
			<td width="100" align="center">이름</td>
			<td width="120" align="center">작성일</td>
			<td width="70" align="center">조회수</td>
		</tr>
		<!-- 오늘 날짜를 기억하는 Date 클래스 객체를 만든다. -->
		<jsp:useBean id="date" class="java.util.Date"/>
		
		<!-- 메인글을 출력한다. -->
		<!-- request 영역의 mvcboardList 객체에서 1페이지 분량의 글이 저장된 ArrayList의 내용만 얻어온다. -->
		<c:set var="list" value="${mvcboardList.list}"/>
		
		<!-- 메인글이 1건도 없으면 없다고 출력한다. -->
		<c:if test="${list.size() == 0}">
		<tr>
			<td colspan="5">
				<marquee>테이블에 저장된 글이 없습니다.</marquee>
			</td>
		</tr>
		</c:if>
		<!-- 메인글이 있으면 메인글의 개수 만큼 반복하며 제목을 출력한다. -->
		<c:if test="${list.size() != 0}">
		<c:forEach var="vo" items="${list}">
		<tr>
			<td align="center">${vo.idx}</td>
			<td>
				<!-- 답글을 들여쓰기 해준다. -->
				<c:if test="${vo.lev > 0}">
				<c:forEach var="i" begin="1" end="${vo.lev}" step="1">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:forEach>
				</c:if>
				
				<!-- 오늘 입력된 글에 new 아이콘을 표시한다. -->
				<c:if test="${date.year == vo.writeDate.year && date.month == vo.writeDate.month && date.date == vo.writeDate.date}">
					<img src="./images/new1.png"/>
				</c:if>
				<c:set var="subject" value="${fn:replace(fn:trim(vo.subject), '<', '&lt;')}"/>
				<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
				<!-- 제목에 하이퍼링크를 걸어준다. => 하이퍼링크를 클릭하면 조회수를 증가하고 메인글의 내용을 표시한다. -->
				<a href="increment.nhn?idx=${vo.idx}&currentPage=${mvcboardList.currentPage}">
					${subject}
				</a>
				<!-- 조회수가 일정 횟수를 넘어서면 hot 아이콘을 표시한다. -->
				<c:if test="${vo.hit > 10}">
					<img src="./images/hot.gif"/>
				</c:if>
			</td>
			<td align="center">
				<c:set var="name" value="${fn:replace(fn:trim(vo.name), '<', '&lt;')}"/>
				<c:set var="name" value="${fn:replace(name, '>', '&gt;')}"/>
				${name}
			</td>
			<td align="center">
				<!-- 오늘 입력된 글은 시간만 어제 이전에 입력된 글은 날짜만 표시한다. -->
				<c:if test="${date.year == vo.writeDate.year && date.month == vo.writeDate.month && date.date == vo.writeDate.date}">
					<fmt:formatDate value="${vo.writeDate}" pattern="a h:mm"/>
				</c:if>
				<c:if test="${date.year != vo.writeDate.year || date.month != vo.writeDate.month || date.date != vo.writeDate.date}">
					<fmt:formatDate value="${vo.writeDate}" pattern="yyyy.MM.dd(E)"/>
				</c:if>
			</td>
			<td align="center">${vo.hit}</td>
		</tr>
		</c:forEach>
		</c:if>
		
		<!-- 페이지 이동 버튼 -->
		<tr>
			<td colspan="5" align="center">
			
			<!-- 처음으로 -->
			<c:if test="${mvcboardList.currentPage > 1}">
				<input class="button button1" type="button" value="맨앞" title="첫 번째 페이지로 이동" onclick="location.href='?currentPage=1'"/>
			</c:if>
			<c:if test="${mvcboardList.currentPage <= 1}">
				<input class="button button2" type="button" value="맨앞" disabled="disabled" title="이미 첫 번째 페이지 입니다."/>
			</c:if>
			
			<!-- 10페이지 앞으로 -->
			<c:if test="${mvcboardList.startPage > 1 }">
				<input class="button button1" type="button" value="이전" title="이전 10페이지로 이동" 
						onclick="location.href='?currentPage=${mvcboardList.currentPage - mvcboardList.pageSize}'"/>
			</c:if>
			<c:if test="${mvcboardList.startPage <= 1 }">
				<input class="button button2" type="button" value="이전" disabled="disabled" title="이미 첫 번째 10페이지 입니다."/>			
			</c:if>
			
			<!-- 페이지 이동 -->
			<c:forEach var="i" begin="${mvcboardList.startPage}" end="${mvcboardList.endPage}" step="1">
				<c:if test="${mvcboardList.currentPage == i}">
					<input class="button button2" type="button" value="${i}" disabled="disabled"/>
				</c:if>
				<c:if test="${mvcboardList.currentPage != i}">
					<input class="button button1" type="button" value="${i}" onclick="location.href='?currentPage=${i}'"/>
				</c:if>
			</c:forEach>
			
			<!-- 10페이지 뒤로 -->
			<c:if test="${mvcboardList.endPage < mvcboardList.totalPage}">
				<input class="button button1" type="button" value="다음" title="다음 10페이지로 이동" 
						onclick="location.href='?currentPage=${mvcboardList.endPage + 1}'"/>
			</c:if>
			<c:if test="${mvcboardList.endPage >= mvcboardList.totalPage}">
				<input class="button button2" type="button" value="다음" disabled="disabled" title="이미 마지막 10페이지 입니다."/>
			</c:if>
			
			<!-- 마지막으로 -->
			<c:if test="${mvcboardList.currentPage < mvcboardList.totalPage}">
				<input class="button button1" type="button" value="맨뒤" title="마지막 페이지로 이동" 
						onclick="location.href='?currentPage=${mvcboardList.totalPage}'"/>
			
			</c:if>
			<c:if test="${mvcboardList.currentPage >= mvcboardList.totalPage}">
				<input class="button button2" type="button" value="맨뒤" disabled="disabled" title="이미 마지막 페이지 입니다."/>			
			</c:if>
			
			</td>
			</tr>
		<!-- 글쓰기 버튼 -->
		<tr>
			<td colspan="5" align="right">
				<input type="button" value="글쓰기" onclick="location.href='insert.nhn'"/>
			</td>
		</tr>
		
	</table>

</body>
</html>