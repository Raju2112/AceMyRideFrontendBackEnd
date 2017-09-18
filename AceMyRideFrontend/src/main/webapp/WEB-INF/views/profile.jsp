<%@page=isisELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.hidden1 {
	display: none;
}
</style>

</head>
<body>
	<div>
		<c:if test="${userRole == 'ADMIN'}">
			<p>
				Hi,<a href="adminPanel">Admin Login</a>
			</p>
		</c:if>
	</div>
	<div class="col-sm-3">
		<ul>
			<li class="menu-item" data-target="edit">Edit Details</li>
			<li class="menu-item" data-target="manage">Manage Address</li>
			<li class="menu-item" data-target="order">Order History</li>
			<li class="menu-item" data-target="payment">Payment Methods</li>
			<li class="menu-item" data-target="deactivate">Payment Methods</li>

		</ul>
	</div>



	<div class="col-sm-9">
		<div class="content-item active" data-target="edit">
			Name:${userS.name}
			<%-- ${ } --%>
			<span class="edit-link" data-target="editName">edit</span><br>
			<div class="hidden1" data-target="editName">
				<form action="submitUpdate">
					Name:<input type="text" name="name" value="${userS.name}"><br>
					<input type="submit" value="Update Name">
				</form>
			</div>



			contact:${userS.contact}
			<%-- ${} --%>
			<span class="edit-link" data-target="editContact">edit</span><br>
			<div class="hidden1" data-target="editContact">
				<form action="submitUpdate">
					Contact:<input type="text" name="contact" value="${userS.contact}"><br>
					<input type="submit" value="Update Contact">
				</form>
			</div>




			DOB:${userS.birthDate}
			<%-- ${} --%>
			<span class="edit-link" data-target="editDob">edit</span><br>
			<div class="hidden1" data-target="editDob">
				<form action="submitUpdate">
					Date Of Birth:<input type="date" name="birthDate"
						value="${userS.birthDate}"><br> <input type="submit"
						value="Update DOB">
				</form>
			</div>



			Password:
			<%-- ${} --%>
			<span class="edit-link" data-target="editPassword">edit</span><br>
			<div class="hidden1" data-target="editPassword">
				<form action="submitUpdate">
					Old Password:<input type="password" name="currentPassword"><br>
					New Password:<input type="password" name="password"><br>
					Confirm Password:<input type="password" name="confirmPassword"><br>
					<input type="submit" value="Update Password">
				</form>
			</div>
		</div>
		<div class="content-item" data-target="manage">This is address</div>
		<div class="content-item" data-target="order">This is orders</div>
		<div class="content-item" data-target="payment">This is Payment</div>
	</div>
	<script type="text/javascript">
		$(document).ready(
				function() {

					$('.content-item').hide();
					$('.content-item.active').show();

					$('.menu-item').click(
							function(event) {
								var target = $(event.target)[0];
								var divToOpenName = $(target).attr(
										'data-target');
								var openDiv = $('.content-item.active').toggle(
										'fast');
								$(openDiv).removeClass('active');
								var divToOpen = $(
										'.content-item[data-target='
												+ divToOpenName + ']').toggle(
										'fast');
								divToOpen.addClass('active');
							});

					$('.edit-link').click(
							function(event) {
								var target = $(event.target)[0];
								var divToOpnName = $(target)
										.attr('data-target');
								var opnDiv = $('.hidden1.active').hide('fast');
								$(opnDiv).removeClass('active');
								var divToOpn = $(
										'.hidden1[data-target=' + divToOpnName
												+ ']').show('fast');
								divToOpn.addClass('active');
							});
				});
	</script>
</body>
</html>
