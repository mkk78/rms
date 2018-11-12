<%@ page language="java" pageEncoding="UTF-8" session="false"%>
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
<link rel="stylesheet" href="css/styles.css?v=1.0">

<!--[if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
  <![endif]-->
</head>

<body>
	<div class="mdl-layout mdl-js-layout mdl-color--grey-100">
	<header class="mdl-layout__header">
			<div class="mdl-layout__header-row">
				<!-- Title -->
				<span class="mdl-layout-title">Title</span>
				<!-- Add spacer, to align navigation to the right -->
				<div class="mdl-layout-spacer"></div>
				<!-- Navigation. We hide it in small screens. -->
				
			</div>
		</header>
		<main class="mdl-layout__content">
		<div class="mdl-grid">
		<div class="mdl-layout-spacer"></div>
		<div class="mdl-card mdl-shadow--6dp mdl-cell mdl-cell--3-col">
			<div class="mdl-card__title mdl-color--primary mdl-color-text--white">
				<h2 class="mdl-card__title-text">Acme Co.</h2>
			</div>
			<div class="mdl-card__supporting-text">
				<form action="login" id="formLogin" method="post">
					<div class="mdl-textfield mdl-js-textfield">
						<input class="mdl-textfield__input" type="text" id="username" name="username" />
						<label class="mdl-textfield__label" for="username">Username</label>
					</div>
					<div class="mdl-textfield mdl-js-textfield">
						<input class="mdl-textfield__input" type="password" id="userpass" name="password" />
						<label class="mdl-textfield__label" for="userpass">Password</label>
					</div>
				</form>
			</div>
			<div class="mdl-card__actions mdl-card--border">
				<button	type="submit" form="formLogin" class="mdl-button mdl-button--colored mdl-js-button mdl-button--raised">Log in</button>
				<%-- <a href="${pageContext.request.contextPath}/register"><button	class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">Register</button> --%>
				</a>
			</div>
		</div>
		<div class="mdl-layout-spacer"></div>
		</div>
		</main>
	</div>
	<script src="js/scripts.js"></script>
</body>
</html>
