<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%-- <%@ taglib prefix = "rms" uri = "/WEB-INF/link.tld"%> --%>
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
					Hi,
					<%=request.getSession().getAttribute("logName")%>
					<a class="mdl-navigation__link mdl-navigation__link--current"
						href="list">Users</a> <a class="mdl-navigation__link" href="logout">Logout</a>
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
		<div class="mdl-card mdl-shadow--6dp">
			<div class="mdl-card__title mdl-color--primary mdl-color-text--white">
				<h2 class="mdl-card__title-text">Acme Co.</h2>
			</div>
			<div class="mdl-card__supporting-text">
				<form action="update" id="form1" method="post">
					<input type="hidden" name="id" value="${user.id}" />
					<div class="mdl-textfield mdl-js-textfield">
						<input class="mdl-textfield__input" name="username" type="text"
							id="username" value="${user.userName}" /> <label
							class="mdl-textfield__label" for="username">Username</label>
					</div>
					<div class="mdl-textfield mdl-js-textfield">
						<input class="mdl-textfield__input" name="password"
							type="text" id="userpass" value="${user.password }" /> <label
							class="mdl-textfield__label" for="userpass">Password</label>
					</div>
				</form>
			</div>
			<div class="mdl-card__actions mdl-card--border">
				<button
					class="mdl-button mdl-button--colored mdl-js-button mdl-button--raised"
					type="submit" form="form1">Save</button>
					<a onclick="history.back()"><button
							class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">Back</button></a>
			</div>
		</div>
		</div>
		</main>
	</div>
	<script src="js/scripts.js"></script>
</body>
</html>
