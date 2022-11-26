<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="contact-list container">
        <h1>Contactos <a href="" class="btn btn-success">Crear nuevo</a></h1>
        <c:forEach items="${requestScope.list}" var="contact">
            <div class="row align-items-center border p-2">
                <div class="col">
                    <a href="./contact?id=${contact.id}">${contact.name}</a>
                </div>
                <div class="col-1">
                    <a href="" class="btn btn-primary">Editar</a>
                </div>
                <div class="col-1">
                    <a href="" type="button" class="btn btn-danger">Borrar</a>
                </div>
            </div>
        </c:forEach>
    </div>