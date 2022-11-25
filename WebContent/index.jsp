<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html lang="es">

	<head>
		<meta charset="UTF-8">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
			integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<link href="css/styles.css" rel="stylesheet">
		<title>Agenda</title>
	</head>

	<body>
		<div class="alert alert-danger container mx-auto mt-5" role="alert">
			Mensaje de error.
		</div>
		<div class="contact container mx-auto m-3">
			<form action="contact-new" method="POST">
				<fieldset>
					<legend>Nuevo contacto</legend>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="name" placeholder="Nombre" value="">
						<label for="name">Nombre</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="surnames" placeholder="Apellidos" value="">
						<label for="surnames">Apellidos</label>
					</div>
					<div class="form-floating mb-3">
						<input type="email" class="form-control" id="email" placeholder="Email" value="">
						<label for="email">Email</label>
					</div>
					<div class="form-floating mb-3">
						<input type="number" class="form-control" id="phone" placeholder="Teléfono" value="">
						<label for="phone">Teléfono</label>
					</div>
					<div class="form-floating mb-3">
						<textarea class="form-control" id="coments" placeholder="Comentarios" value=""></textarea>
						<label for="coments">Comentarios</label>
					</div>
					<button type="submit" class="btn btn-primary">Añadir</button>
				</fieldset>
			</form>
		</div>

		<div class="contact-list container">
			<h1>Contactos <a href="" class="btn btn-success">Crear nuevo</a></h1>
			<div class="row align-items-center border p-3">
				<div class="col">
					<a href="">Nombre</a>
				</div>
				<div class="col-1">
					<a href="" class="btn btn-primary">Editar</a>
				</div>
				<div class="col-1">
					<a href="" type="button" class="btn btn-danger">Borrar</a>
				</div>
			</div>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
			crossorigin="anonymous"></script>
	</body>

	</html>