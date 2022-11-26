package dam2.dii.p12.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dam2.dii.p12.model.Contacto;
import dam2.dii.p12.service.ContactoService;

@WebServlet("/contact")
public class Contact extends HttpServlet {
  private static final long serialVersionUID = 1L;
  private static ContactoService cService;

  public Contact() {
    super();
    this.cService = new ContactoService();
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String id = request.getParameter("id");
    if (id != null) {
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
    // TODO Auto-generated method stub
    doGet(request, response);
  }

  protected void doPut(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // TODO Auto-generated method stub
  }

  protected void doDelete(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // TODO Auto-generated method stub
  }

}
