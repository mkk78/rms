<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%-- <%@ taglib prefix = "rms" uri = "/WEB-INF/link.tld"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">

<title>RMS</title>
<meta name="description" content="Index">
<meta name="author" content="Mitrais">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<rms:link type="stylesheet" href="css/styles.css?v=1.0" />

<!--[if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
  <![endif]-->
</head>

<body>
	<div
		class="mdl-layout mdl-js-layout mdl-layout--fixed-header demo-layout-transparent">
		<header class="mdl-layout__header">
			<div class="mdl-layout__header-row">
				<!-- Title -->
				<span class="mdl-layout-title">Title</span>
				<!-- Add spacer, to align navigation to the right -->
				<div class="mdl-layout-spacer"></div>
				<!-- Navigation. We hide it in small screens. -->
				<nav class="mdl-navigation mdl-layout--large-screen-only">
					Hi, <%=request.getSession().getAttribute("logName")%>
					<a class="mdl-navigation__link mdl-navigation__link--current" href="#">Users</a> 
					<a class="mdl-navigation__link" href="logout">Logout</a>
				</nav>
			</div>
		</header>
		<div class="mdl-layout__drawer">
			<span class="mdl-layout-title">Title</span>
			<nav class="mdl-navigation">
				<a class="mdl-navigation__link mdl-navigation__link--current"
					href="">Users</a> <a class="mdl-navigation__link" href="">Link</a>
				<a class="mdl-navigation__link" href="">Link</a>
			</nav>
		</div>
		<main class="mdl-layout__content">
		<div class="mdl-grid">
			<div class="mdl-card mdl-shadow--6dp mdl-cell mdl-cell--4-col">
				<div
					class="mdl-card__title mdl-color--primary mdl-color-text--white">
					<h2 class="mdl-card__title-text">User List</h2>
				</div>
				
				<table
					class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp">
					<thead>
						<tr>
							<th class="mdl-data-table__cell--non-numeric">User Name</th>
							<th>Password</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${users}" var="user">
							<tr>
								<td class="mdl-data-table__cell--non-numeric"><c:out value="${user.userName}" /></td>
								<td><c:out value="${user.password}" /></td>
								<td><a href="form?id=${user.id}"
									class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">Edit</a></td>
								<td><a href="delete?id=${user.id }"
									class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent">Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="mdl-card__actions mdl-card--border">
					<a href="register"
							class="mdl-button mdl-js-button mdl-button--colored">Add
								User</a>
				</div>
				
			</div>
		</div>
		</main>
	</div>
	<script src="js/scripts.js"></script>
</body>
</html>
