<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery CDN과 bootstrap.js 파일의 스크립트를 사용해서 내비게이션 바가 동작한다. -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="./js/bootstrap.js"></script>
<!-- 부트스트랩 css 가져오기 -->
<link rel="stylesheet" href="./css/bootstrap.css">

<!-- 직접 만든 css 양식을 사용할 수 있어 -->
<link rel="stylesheet" href="./css/custom.css">

<script type="text/javascript">

	function passwordCheckFunction() {
//		console.log("passwordCheckFunction()");
		/* jQuery로 하기 */
		var userPassword1 = $('#userPassword1').val();
		var userPassword2 = $('#userPassword2').val();
//		console.log("userPassword1 : " + userPassword1 + " ," + "userPassword2 : " + userPassword2);
		if (userPassword1 != userPassword2) {
			$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
		} else {
			$('#passwordCheckMessage').html('');
		}
	}
	
//	회원 가입을 실행하는 함수
	function userRegister() {
//		alert('userRegister()');
		var userID = $('#userID').val();
		var userPassword1 = $('#userPassword1').val();
		var userPassword2 = $('#userPassword2').val();
		var userName = $('#userName').val();
		var userAge = $('#userAge').val();
		var userGender = $('input[name=userGender]:checked').val();
		var userEmail = $('#userEmail').val();
//		console.log(userID, userPassword1, userPassword2, userName, userAge, userGender, userEmail);

//		ajax를 해보자...............
		$.ajax({
			type: 'POST',			// 요청 방식
			url: './UserRegister',	// 서블릿 이름
			data: {					// 서블릿으로 전송할 데이터
				userID: userID,
				userPassword1: userPassword1,
				userPassword2: userPassword2,
				userName: userName,
				userAge: userAge,
				userGender: userGender,
				userEmail: userEmail
			},
//			ajax 요청이 성공하면 response.getWriter().write("문자열")의 문자열이 콜백 함수의 인수로 넘어온다.
			success: function() {	// ajax 요청이 성공하면 실행할 콜백 함수
//				alert('성공!');
				$('#userID').val('');
				$('#userPassword1').val('');
				$('#userPassword2').val('');
				$('#userName').val('');
				$('#userAge').val('');
				$('#userEmail').val('');
			},
			error: function(error) {		// ajax 요청이 실패하면 실행할 콜백 함수
//				alert('실패!ㅠㅠ');
			
			}
		});

	}


//	ID 중복 체크 함수
	function registerCheckFucntion() {
//		alert('registerCheckFucntion() 함수');

		var userID = $('#userID').val();
//		console.log(userID);
		$.ajax({
			type: 'POST',
			url: './UserRegisterCheck',
			data: {
				userID : userID
			},
			success: function(result) {
//				console.log(result);		// => case에 넘어오는 데이터가 문자열 이니까 문자열로 받아야해!
				switch (result) {
					case '0':
//						alert('이미 존재하는 회원 아이디입니다.');
						$('#idCheckMessage').html('이미 존재하는 회원 아이디입니다.');
						$('#checkMessage').html('이미 존재하는 회원 아이디입니다.');
						$('#checkType').attr('class', 'modal-content panel-warning');
						$('#userID').val('');
						$('#userID').focus();
						break;
					case '1':
//						alert('사용 가능한 아이디입니다.');
						$('#idCheckMessage').html('사용 가능한 아이디입니다.');
						$('#checkMessage').html('사용 가능한 아이디입니다.');
						$('#checkType').attr('class', 'modal-content panel-success');
						break;
					case '2':
//						alert('아이디를 입력한 후 중복체크 버튼을 누르세요');
						$('#idCheckMessage').html('아이디를 입력한 후 중복체크 버튼을 누르세요');
						$('#checkMessage').html('아이디를 입력한 후 중복체크 버튼을 누르세요.');
						$('#checkType').attr('class', 'modal-content panel-warning');
						$('#userID').val('');
						$('#userID').focus();
						break;
					default:
//						alert('sql 명령 오류');
						$('#idCheckMessage').html('');
						$('#checkMessage').html('');
						break;
						
				}
				$('#checkModal').modal('show');
			},
			error: function(error) {
				console.log('연결 실패');
			}
		});
		
	}
	
	
</script>
</head>
<body>
	<div class="container">
		<!-- 버전1. 
		<form action="./UserRegister" method="post"> -->
		<!-- 버전2. Ajax -->
		<form>
			<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th colspan="3">
							<h4>회원 가입 양식</h4>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 110px;">
							<h5>아이디</h5>
						</td>
						<td>
							<input id="userID" class="form-control" type="text" name="userID" placeholder="아이디를 입력하세요."/>
						</td>
						<td style="width: 110px;">
							<button class="btn btn-primary" type="button" onclick="registerCheckFucntion()">중복체크</button>
						</td>
					</tr>
					<tr>
						<td style="width: 110px;">
							<h5>비밀번호</h5>
						</td>
						<td colspan="2">
							<input id="userPassword1" class="form-control" type="password" name="userPassword1" 
							placeholder="비밀번호를 입력하세요." onkeyup="passwordCheckFunction()"/>
						</td>
					</tr>
					<tr>
						<td style="width: 110px;">
							<h5>비밀번호 확인</h5>
						</td>
						<td colspan="2">
							<input id="userPassword2" class="form-control" type="password" name="userPassword2" 
							placeholder="비밀번호를 다시 한 번 입력하세요." onkeyup="passwordCheckFunction()"/>
						</td>
					</tr>
					<tr>
						<td style="width: 110px;">
							<h5>이름</h5>
						</td>
						<td colspan="2">
							<input id="userName" class="form-control" type="text" name="userName" 
							placeholder="이름을 입력하세요."/>
						</td>
					</tr>
					<tr>
						<td style="width: 110px;">
							<h5>나이</h5>
						</td>
						<td colspan="2">
							<input id="userAge" class="form-control" type="text" name="userAge" 
							placeholder="나이를 입력하세요."/>
						</td>
					</tr>
					<tr>
						<td style="width: 110px;">
							<h5>성별</h5>
						</td>
						<td colspan="2">
							<div class="form-group" style="text-align: center; margin: 0 auto">
								<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-primary active">
										<input type="radio" name="userGender" autocomplete="off" value="남자" checked="checked"/>남자
									</label>
									<label class="btn btn-primary">
										<input type="radio" name="userGender" autocomplete="off" value="여자"/>여자
									</label>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 110px;">
							<h5>이메일</h5>
						</td>
						<td colspan="2">
							<input id="userEmail" class="form-control" type="email" name="userEmail" 
							placeholder="이메일을 입력하세요."/>
						</td>
					</tr>
					<tr>
						<td colspan="3" style="text-align: center;">
							<!-- 비밀번호 일치 검사 결과 메시지가 출력될 영역 -->
							<h5 id="passwordCheckMessage" style="color: red;"></h5>
							
							<!-- 아이디 중복 검사 결과 메시지가 출력될 영역 -->
							<h5 id="idCheckMessage" style="color: red;"></h5>						
							
							<!-- <input class="btn btn-primary" type="submit" value="회원가입"/> -->
							<input class="btn btn-primary" type="button" value="회원가입" onclick="userRegister()"/>
							<input class="btn btn-primary" type="reset" value="다시쓰기"/>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

<%
//	메시지 출력
	String messageType = null;
	if (session.getAttribute("messageType") != null) {
		messageType = (String) session.getAttribute("messageType");
//		out.println("messageType : " + messageType + "<br/>");
	}
	String messageContent = null;
	if (session.getAttribute("messageContent") != null) {
		messageContent = (String) session.getAttribute("messageContent");
//		out.println("messageContent : " + messageContent + "<br/>");
	}
	
	if (messageContent != null) {
%>

	<!-- 오류메시지 모달 팝업창 -->
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				
				<!-- 모달 팝업창의 종류를 설정한다. -->
				<!-- class에 panel-warning 또는 panel-success 스타일을 추가한다. -->
				<div class="modal-content 
<%
				if(messageType.equals("오류메시지")) {
					out.println("panel-warning");
				} else {
					out.println("panel-success");
				}
%>
				">
				
					<!-- 헤더 -->
					<div class="modal-header panel-heading">
						<!-- 헤더 왼쪽 'X' 버튼 -->
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">
							<%=messageType%>
						</h4>
					</div>
					<!-- 바디 -->
					<div class="modal-body">
						<%=messageContent%>
					</div>
					<!-- 풋터 -->
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<script type="text/javascript">
		$('#messageModal').modal('show');
	</script>
<%	
//		세션에 저장된 정보를 지운다.
		session.removeAttribute("messageType");
		session.removeAttribute("messageContent");
	}
%>

	<!-- 로그인 메시지 모달 팝업창 -->
	<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				
				<!-- 모달 팝업창의 종류를 설정한다. -->
				<!-- class에 panel-warning 또는 panel-success 스타일을 추가한다. -->
				<div id="checkType" class="modal-content panel-info">
				
					<!-- 헤더 -->
					<div class="modal-header panel-heading">
						<!-- 헤더 왼쪽 'X' 버튼 -->
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">
						<%-- <%=messageType%> 세션에서 넘어온게 없으니 아래처럼 고친다.--%>
							아이디 중복 체크 확인 메시지
						</h4>
					</div>
					<!-- 바디 -->
					<div id="checkMessage" class="modal-body">
						<%-- <%=messageContent%> 세션에서 넘어온게 없으니 지워준다--%>
						
					</div>
					<!-- 풋터 -->
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>