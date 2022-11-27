package dam2.dii.p12.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dam2.dii.p12.model.Contacto;
import dam2.dii.p12.service.ContactoService;

@WebServlet("/contact")
@MultipartConfig()
public class Contact extends HttpServlet {
  private static final long serialVersionUID = 1L;
  private ContactoService cService;

  public Contact() {
    super();
    this.cService = new ContactoService();
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String id = request.getParameter("id");
    String updId = request.getParameter("upd");
    if (updId != null) {
      Contacto contact = cService.getContactoById(updId);
      if (contact != null) {
        request.setAttribute("update", true);
        request.setAttribute("contact", contact);
      } else {
        request.setAttribute("error", "El contacto solicitado no existe");
        request.setAttribute("list", cService.getAllContacts());
      }
    } else if (id != null) {
      Contacto contact = cService.getContactoById(id);
      if (contact != null) {
        request.setAttribute("detail", contact);
      } else {
        request.setAttribute("error", "El contacto solicitado no existe");
        request.setAttribute("list", cService.getAllContacts());
      }
    } else {
      List<Contacto> contactList = cService.getAllContacts();
      request.setAttribute("list", contactList);
    }
    request.getRequestDispatcher("index.jsp").forward(request, response);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    Contacto contact = new Contacto(request.getParameter("name"), request.getParameter("surnames"),
        request.getParameter("email"), request.getParameter("phone"),
        request.getParameter("coments"));
    if (contact.getEmail() != null && cService.validateEmail(contact)) {
      contact = cService.createContacto(contact);
      if (contact.getId().equals("")) {
        request.setAttribute("error", "Se ha producido un error al intentar crear el contacto");
      }
    } else {
      request.setAttribute("error", "El email introducido no es válido.");
    }
    request.setAttribute("contact", contact);
    doGet(request, response);
  }

  protected void doPut(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    Contacto contact = new Contacto(request.getParameter("upd"), request.getParameter("name"),
        request.getParameter("surnames"), request.getParameter("email"),
        request.getParameter("phone"), request.getParameter("coments"));

    response.setContentType("aplication/json");
    response.setCharacterEncoding("UTF-8");
    PrintWriter output = response.getWriter();

    if (contact.getEmail() != null && cService.validateEmail(contact)) {
      contact = cService.updateContacto(contact);
      if (!contact.getId().equals("")) {
        output.print("{\"error\":\"\"}");
      } else {
        output
            .print("{\"error\":\"Se ha producido un error al intentar actualizar el contacto.\"}");
      }
    } else {
      output.print("{\"error\":\"El email introducido no es válido.\"}");
    }
    output.flush();
  }

  protected void doDelete(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/plain");
    String id = request.getParameter("id");
    if (!cService.deleteContactoById(id)) {
      response.sendError(404);
    } else {
      response.setStatus(200);
    }
  }

}
