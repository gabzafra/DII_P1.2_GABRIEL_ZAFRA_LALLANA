package dam2.dii.p12.service;

import java.util.List;
import dam2.dii.p12.dao.ContactDAO;
import dam2.dii.p12.model.Contacto;

public class ContactoService {
  private ContactDAO DAO = ContactDAO.getInstance();

  public Contacto getContactoById(String id) {
    return DAO.getContactById(id);
  }

  public List<Contacto> getAllContacts() {
    return DAO.getAllContacts();
  }
}
