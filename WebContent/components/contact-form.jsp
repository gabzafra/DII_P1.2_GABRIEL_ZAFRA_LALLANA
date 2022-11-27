<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div id="contact-form" class="contact container mx-auto m-3">
        <form action="<%=request.getContextPath()%>/contact" method="POST">
            <fieldset>
                <c:if test="${empty requestScope.update}">
                        <legend>Nuevo contacto</legend>
                </c:if>
                <c:if test="${!empty requestScope.update}">
                        <legend>Actualizar contacto</legend>
                </c:if>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" name="name" placeholder="Nombre" value="${requestScope.contact.name}">
                    <label for="name">Nombre</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" name="surnames" placeholder="Apellidos" value="${requestScope.contact.surnames}">
                    <label for="surnames">Apellidos</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="email" class="form-control" name="email" placeholder="Email" value="${requestScope.contact.email}">
                    <label for="email">Email</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="number" class="form-control" name="phone" placeholder="Teléfono" value="${requestScope.contact.phone}">
                    <label for="phone">Tel�fono</label>
                </div>
                <div class="form-floating mb-3">
                    <textarea class="form-control" name="coments" placeholder="Comentarios">${requestScope.contact.coments}</textarea>
                    <label for="coments">Comentarios</label>
                </div>
                <c:if test="${empty requestScope.update}">
                        <button type="submit" class="btn btn-primary">A�adir</button>
                </c:if>
                <c:if test="${!empty requestScope.update}">
                        <button type="submit" id="update-button" class="btn btn-primary">Guardar</button>
                        <a href="./contact" class="btn btn-danger">Cancelar</a>
                </c:if>
            <c:if test="${empty requestScope.list && empty requestScope.detail && empty requestScope.update}">
                <a href="./contact" class="btn btn-success">Ver contactos</a>
            </c:if>
            </fieldset>
        </form>
        <c:if test="${!empty requestScope.error}">
                        <jsp:include page="/components/error-msj.jsp">
                <jsp:param name="msj" value="${requestScope.error}" />
            </jsp:include>
        </c:if>
    </div>
            