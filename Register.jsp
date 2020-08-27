<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration Project</title>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	
		
	$(document).ready(function() {
		$('#btnsubmit').click(function() {

			var username = $('#uname').val();
			var password = $('#pwd').val();
			var confpassword = $('#cpwd').val();
			var dob = $('#dob').val();
			var phno = $('#phno').val();
			var email = $('#email').val();
			var indexat = email.indexOf("@"); //Index of "@" in the email field
			  var indexdot = email.indexOf("."); //Index of "." in the email field
			var country = $('#country').val();
			
			if(username=='')
			{
			alert('Please enter your User Name');
			$('#uname').focus();
			return false;
			}else if(password=='' || password.length < 6)
				{
				alert("The Password & confirm password should 6 to 12 characters");
				$('#pwd').focus();
				return false;
				
				}
			else if(password=='' || password != confpassword || confpassword=='')
	    	{
	    	alert('Password and confirm  password donot match');
	  	  $('#cpwd').focus();
	  	return false;
	    	}
	
			else if(dob=='')
				{
				alert("Please enter the DOB in 'yyyy-mm-dd' format")
				$('#dob').focus();
				return false;
				}else if(phno=='')
					{
					alert("Please enter your Phone No")
					$('#phno').focus();
					return false;
					}else if(indexat < 1 || (indexdot-indexat) < 2)
				    {
						  alert('Please enter a valid Email Id');
						  $('#email').focus();
						  return false;
					    }    else if(country=='')
					    	{
					    	alert('Please enter  Country ');
							$('#country').focus();
							return false;
					    	}
		

						

			$.ajax({
				type : 'POST',
				url : 'RegisterServlet',
                data :{
                	
                	username : username,
                	password : password,
                	confpassword : confpassword,
                	dob : dob,
                	phno : phno,
                	email : email,
                	country : country
                	},
				success : function(responseText) {
					console.log(responseText);
					if(responseText == "SUCCESS"){
						window.location.href = "Homejsp.jsp";
	                    
	                  }else{
	                      $('#result1').text(responseText);
	                  }
					//$('#result1').html(result);

				}

			});

		});

	});
</script>




</head>
<body>
	<center>
		<h2>User Registration using MVC Pattern</h2>
	</center>
	<form name="form">

		<table align="center">
			<tr>
				<td>UserName:</td>
				<td><input type="text" name="username" id="uname"></td>
			</tr>

			<tr>
				<td>Password:</td>
				<td><input type="password" name="password" id="pwd"></td>
			</tr>


			<tr>
				<td>Confirm Password:</td>
				<td><input type="password" name="confpassword" id="cpwd"></td>
			</tr>


			<tr>
				<td>DOB:</td>
				<td><input type="date" name="dob" id="dob"></td>
			</tr>


			<tr>
				<td>Phone No:</td>
				<td><input type="text" name="phno" id="phno"></td>
			</tr>


			<tr>
				<td>Email:</td>
				<td><input type="text" name="email" id="email"
					onchange()="check()"></td>
			</tr>


			<tr>
				<td>Country:</td>
				<td><input type="text" name="country" id="country"></td>
			</tr>

			<tr>
				<td><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="button" value="Register" id="btnsubmit"></td>
				<td><input type="reset" value="Reset"></td>
			</tr>
			<br>
			<tr>
				<td><span id="result1"></span></td>
			</tr>
		</table>
	</form>

</body>
</html>