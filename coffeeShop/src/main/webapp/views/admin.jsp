<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<title>Coffee Shop</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
</head>
<body>
	<div class='container'>
		<h1>Coffee Shop</h1>
		<div class='navbar navbar-inverse'>
			<div class='navbar-inner nav-collapse'>
				<ul class="nav navbar-nav" style="width: 100%">
					<li class="active"><a href="admin">Home</a></li>
					<sec:authorize access="hasRole('ROLE_USER')">
						<li><a href="order">Order</a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li><a href="editProducts">Products</a></li>

						<li><a href="persons">Person</a></li>
						<li><a href="orders">List Orders</a></li>
					</sec:authorize>

					<li class="pull-right"><a href="logout">Logout</a></li>
					<li class="pull-right"><a href="editProfile/${user.id}">${user.firstName }
					</a></li>
				</ul>
			</div>
		</div>
		<h1>Succesfullly save the information</h1>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		crossorigin="anonymous"></script>

</body>
</html>