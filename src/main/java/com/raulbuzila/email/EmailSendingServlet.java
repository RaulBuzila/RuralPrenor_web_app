package com.raulbuzila.email;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServlet;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by raulbuzila on 7/1/2017.
 */

@Controller
@RequestMapping(value ="/EmailSendingServlet", method = RequestMethod.GET)
public class EmailSendingServlet extends HttpServlet {
  private String host;
  private String port;
  private String user;
  private String pass;

  public void init() {
    // reads SMTP server setting from web.xml file
    ServletContext context = getServletContext();
    host = context.getInitParameter("host");
    port = context.getInitParameter("port");
    user = context.getInitParameter("user");
    pass = context.getInitParameter("pass");
  }

  protected void doPost(HttpServletRequest request,
                        HttpServletResponse response) throws ServletException, IOException {
    // reads form fields
    String recipient = "raul95b@yahoo.com";
    String subject = request.getParameter("subject");
    String content = request.getParameter("content");

    String resultMessage = "";

    try {
      EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
              content);
      resultMessage = "The e-mail was sent successfully";
    } catch (Exception ex) {
      ex.printStackTrace();
      resultMessage = "There were an error: " + ex.getMessage();
    } finally {
      request.setAttribute("Message", resultMessage);
      getServletContext().getRequestDispatcher("/Result.jsp").forward(
              request, response);
    }
  }
}