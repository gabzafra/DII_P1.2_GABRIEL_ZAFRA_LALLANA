repo https://github.com/gabzafra/DII_P1.2_GABRIEL_ZAFRA_LALLANA

La aplicación muestra inicialmente un formulario para crear un nuevo contacto. Se muestran dos botones, uno para añadir el contacto y otro para mostrar la lista de contactos.

Ambos botones hacen aparecer la lista de contactos bajo el formulario. En el caso de pulsarse el de Añadir, el nuevo contacto aparecerá en la lista.

En cada fila de la lista se puede hacer clic en los nombres de los contactos de la lista para mostrar el detalle de los mismos. También tienen un botón para eliminar el contacto y otro para editarlo.
Si pulsamos el de eliminar lo quita de lista.
Si pulsamos editar nos muestra un formulario con los datos actuales para que los editemos. Da opción de guardar las modificaciones o de cancelar la edición. En ambos casos volverá a la vista con el formulario de creación y la lista de contactos.

Como objetivos adicionales, me he propuesto mostrar toda la aplicación en index.jsp utilizando include. También el tener un solo servlet que emplee los metodos doGet, doPost, doPut y doDelete para usar apropiadamente los verbos HTTP. Esto me ha llevado a incluir algo de JavaScript para los verbos no soportados por HTML.

Al crear la aplicación he decidido emplear fuera de lo visto en clase: 
- JSTL en los JSP.
- Dividir index.jsp en “componentes” que se carguen mediante include según se quiera componer una vista u otra.
- JavaScript para las peticiones PUT y DELETE.
- Utilizar Bootstrap como librería de estilos.


Modelo:

Tenemos un bean Contacto.java que almacena los datos de cada contacto en Strings.

DAO:

La clase ContactDAO.java mantiene en un atributo HashMap la lista de contacto. Cuenta con metodos CRUD para manejar su contenido, auxiliares para proporcionar ids únicos a los contactos y crear copias de los objetos contacto. Esta clase esta concebida como singleton para forzar la existencia de una lista única de contactos.

Servicios:

La clase ContactoService.java utiliza el DAO de contactos para servir peticiones de los servlets referidas a los objetos contacto. Además emplea y proporciona un método para validar emails.

Controlador:

El servlet Contact.java mapea la url /contact y responde a peticiones GET, POST, PUT y DELETE del front. Al instanciarse obtiene un ContactoService cService que utiliza para llenar de datos las respuestas.
- doGet actua normalmente recibiendo requests, añadiendo atributos y haciendo forward.
- doPost tiene la particularidad de valerse de doGet para la respuesta y así actualizar la vista de la lista de usuarios.
- doPut recibe un FormData de una request de JS (con los datos actualizados ) y el id por parámetro (“upd”). Devuelve un JSON con un atributo error que está vacio si no hay problema y con un mensaje si lo hay.
- doDelete recibe un parámetro id con el id del contacto a eliminar y devuelve un 200 si tiene éxito o 404 si falla.

Vistas JSP:

index.jsp > Es el punto de entrada y carga dentro los otros componentes según sea necesario. También carga bootstrap, la hoja de estilos y los scripts.

css\styles.css > Tiene algunos estilos para modificar los de bootstrap

js\scripts.js > Tiene dos funciones para enviar las peticiones DELETE y PUT mediante fetch. Estas funciones también hacen redirecciones según si hay errores y en caso de PUT inyectan un mensaje de error para la vista de actualización.

components\

    > contact-list.jsp Muestra la lista de los contactos y hace aparecer mensajes de error si fallan los DELETE.
    > contact-detail.jsp Muestra el detalle de los datos de un contacto.
    > error-msj > Muestra errores pasados por parámetro.
    > contact-form > Muestra tanto el formulario de creación como el de actualización. En el caso de la actualización el botón Editar de la vista contact-detail manda un GET al servlet con un parámetro “upd” con la id del contacto a editar, recupera los datos del contacto y así puebla el formulario del que cambia el comportamiento onsubmit para que use la función js. 



