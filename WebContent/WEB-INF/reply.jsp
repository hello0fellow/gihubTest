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
</head>
<body>

	<!-- 원본글을 보여주는 테이블 -->
		<table width="600" align="center" border="1" cellpadding="5" cellspacing="0">
			<tr>
				<th colspan="5">원본글 보기</th>
			</tr>
			<tr>
				<td width="80" align="center">글번호</td>
				<td width="320" align="center">이름</td>
				<td width="120" align="center">작성일</td>
				<td width="80" align="center">조회수</td>
			</tr>
			<tr>
				<td align="center">${vo.idx}</td>
				<td align="center">
					<c:set var="name" value="${fn:replace(fn:trim(vo.name), '<', '&lt;')}"/>
					<c:set var="name" value="${fn:replace(name, '>', '&gt;')}"/>
					${name}
				<td align="center">
					<!-- 오늘 날짜를 기억하는 Date 클래스 객체를 만든다. -->
					<jsp:useBean id="date" class="java.util.Date"/>
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
			<tr>
				<td align="center">제목</td>
				<td colspan="3">
					<c:set var="subject" value="${fn:replace(fn:trim(vo.subject), '<', '&lt;')}"/>
					<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
					${subject}
				</td>
			</tr>
			<tr>
				<td align="center">내용</td>
				<td colspan="3">
					<c:set var="content" value="${fn:replace(fn:trim(vo.content), '<', '&lt;')}"/>
					<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
					<c:set var="content" value="${fn:replace(content, enter, '<br/>')}"/>
					${content}
				</td>
			</tr>
		</table>
		
		<hr color="tomato" size="3"/>
		
	<!-- 답글을 보여주는 테이블 -->		
	<form action="replyInsert.nhn" method="post">
		
		<input type="text" name="idx" value="${vo.idx}"/>	<!-- 질문글의 글번호 -->
		<input type="text" name="ref" value="${vo.ref}"/>	<!-- 글 그룹 -->
		<input type="text" name="lev" value="${vo.lev}"/>	<!-- 질문글 레벨 -->
		<input type="text" name="seq" value="${vo.seq}"/>	<!-- 같은 글 그룹에서 글 출력 순서-->
		<input type="text" name="currentPage" value="${currentPage}"/>	<!-- 답글 입력 후 돌아갈 페이지 번호 -->
		
		<table width="600" align="center" border="1" cellpadding="5" cellspacing="0">
			<tr>
				<th colspan="5">답글쓰기</th>
			</tr>
			<tr>
				<td width="100" align="center">이름</td>
				<td width="500">
					<input type="text" name="name"/>
				</td>
			</tr>
			<tr>
				<td align="center">제목</td>
				<td>
					<input type="text" name="subject" style="width: 98%"/>
				</td>
			</tr>
			<tr>
				<td align="center">내용</td>
				<td>
					<textarea rows="10" cols="50" name="content" style="resize: none;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<input type="hidden" name="idx" value="${vo.idx}"/>
					<input type="hidden" name="currentPage" value="${currentPage}"/>
					
					<input type="submit" value="저장하기"/>
					<input type="reset" value="다시쓰기"/>
					<input type="button" value="돌아가기" onclick="history.back()"/>
					<input type="button" value="목록보기" onclick="location.href='list.nhn?currentPage=${currentPage}'"/>
				</td>
			</tr>
		</table>	
	</form>

</body>
</html>