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
                <label for="phone">Tel�fono</label>
            </div>
            <div class="form-floating mb-3">
                <textarea class="form-control" id="coments" placeholder="Comentarios" value=""></textarea>
                <label for="coments">Comentarios</label>
            </div>
            <button type="submit" class="btn btn-primary">A�adir</button>
        </fieldset>
    </form>
</div>