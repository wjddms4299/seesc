<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<script>
function open_idCheck(){
	window.open('idCheck.jsp','idCheck','width=450,height=200')
}
function open_nicCheck(){
	window.open('nicCheck.jsp','nicCheck','width=450,height=200')
}
</script>
<style>
 body {
        font-family: Arial, sans-serif;
      }
      
      section {
        width: 50%;
        margin: 0 auto;
        text-align: center;
      }
      
      article {
        margin-bottom: 20px;
      }
      
      h2 {
        font-size: 36px;
        margin-bottom: 20px;
      }
      
      fieldset {
      	width: 100%
        border: 1px solid gray;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 2px 2px 5px lightgray;
      }
      
      table {
        width: 100%;
        margin: 0 auto;
        text-align: left;
      }
      
      th {
        font-size: 18px;
        padding: 10px;
      }
      
      input[type="text"],
      input[type="password"],
      input[type="email"] {
        width: 70%;
        padding: 10px;
        font-size: 16px;
        border-radius: 5px;
        border: 1px solid lightgray;
        margin-bottom: 20px;
      }
      .tel1{
      	width: 70px;
        padding: 10px;
        font-size: 16px;
        border-radius: 5px;
        border: 1px solid lightgray;
        margin-bottom: 20px;
      }
      .tel{
     	 width: 150px;
        padding: 10px;
        font-size: 16px;
        border-radius: 5px;
        border: 1px solid lightgray;
        margin-bottom: 20px;
        display: inline-block;
      }
      select{
     	 width: 100px;
        height: 40px;
        border: none;
        border-radius: 5px;
        background-color: lightgray;
        color: black;
        font-size: 16px;
        margin-left: 20px;
      }
      
      input[type="button"] {
        width: 100px;
        height: 40px;
        border: none;
        border-radius: 5px;
        background-color: #4CAF50;
        color: white;
        font-size: 16px;
        margin-left: 20px;
      }
      input[type="button"]:hover {
    background-color: #3e8e41;
	}
      
      input[type="submit"] {
        width: 100%;
        height: 40px;
        border: none;
        border-radius: 5px;
        background-color: #4CAF50;
        color: white;
        font-size: 16px;
        margin-top: 20px;
      }
      input[type="submit"]:hover {
   		 background-color: #3e8e41;
		}
      .article{
      width:70%;
      margin: 0px auto;
      text-align: center;
      }
</style>
</head>
<body>
<%@include file="../header.jsp" %>
	<section>
		<article>
			<br><br>
<h1 class ="h1">회원가입</h1>
         <br>
           <hr width="130px">
           <br>
		</article>
		<article class="article">
			<fieldset>
				<form name="memberJoin" action="memberJoin_ok.jsp">
				<table align="center">
					<tr>
						<th>아이디</th>
					</tr>
					<tr>
						<td><input type="text" name="user_id" placeholder="아이디를 입력해주세요." readonly></td>
						<td><input type="button" name="idCheck" value="중복확인" onclick="open_idCheck()"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
					</tr>
					<tr>
						<td><input type="password" name="user_pwd" placeholder="비밀번호를 입력해주세요." required></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
					</tr>
					<tr>
						<td><input type="password" name="user_pwd_ok" placeholder="비밀번호를 입력해주세요." required></td>
					</tr>
					<tr>
						<th>이름</th>
					</tr>
					<tr>
						<td><input type="text" name="user_name" placeholder="이름을 입력해주세요." required></td>
					</tr>
					<tr>
						<th>닉네임</th>
					</tr>
					<tr>
						<td><input type="text" name="user_nic" placeholder="닉네임을 입력해주세요." readonly></td>
						<td><input type="button" name="nicCheck" value="중복확인" onclick="open_nicCheck()"></td>
					</tr>
					<tr>
						<th>성별</th>
					</tr>
					<tr>
						<td>남자<input type="radio" name="user_se" value="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							여자<input type="radio" name="user_se" value="0"></td>
					</tr>
					<tr>
						<th>이메일</th>
					</tr>
					<tr>
						<td><input type="text" name="user_email" placeholder="이메일을 입력해주세요." required></td>
					</tr>
					<tr>
						<th>휴대전화</th>
					</tr>
					<tr>
						<td><input type="tel" name="user_tel1" placeholder="핸드폰 번호를 입력해주세요." maxlength="3" pattern="[0-9]{3}" onclick="this.value=''" required class="tel1">-<input type="tel" name="user_tel2" maxlength="4" pattern="[0-9]{4}" onclick="this.value=''" required class="tel">-<input type="tel" name="user_tel3" maxlength="4" pattern="[0-9]{4}" onclick="this.value=''" required class="tel"></td>
					</tr>
					<tr>
						<th>생년월일
					</tr>
					<tr>
						<td>
						<select name="year">
						<option value="">--선택--</option>
						<%
						for(int i=1950;i<=2020;i++){
							%>
						<option value="<%=i%>"><%=i %></option>
							<%
						}
						%>
						</select>
						<select name="month">
						<option value="">--선택--</option>
						<%
						for(int i=1;i<=12;i++){
					
	
							%>
						<option value="<%=i%>"><%=i %></option>
							<%
						}
						%>
						</select>
						<select name="day">
						<option value="">--선택--</option>
						<%
						for(int i=1;i<=31;i++){
							%>
						<option value="<%=i%>"><%=i %></option>
							<%
						}
						%>
						</select>
						</td>
					</tr>
					<tr>
					<td colspan="2" align="center"><div><input type="submit" value="가입하기"> </div></td>
					</tr>
				</table>
				</form>
			</fieldset>
		</article>
	</section>
<%@include file="../footer.jsp" %>
</body>
</html>