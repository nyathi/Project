/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package SERVLETS;

import java.util.*;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
//import javax.mail.*;
//simport javax.mail.internet.*;

public class EmailSender
{
    //send email with attachment
   /*public String sendMail(String msg,String address,String subject,String filePath)
    {
       Properties props = new Properties();
       props.put("mail.smtp.host", "smtp.gmail.com");
       props.put("mail.smtp.socketFactory.port", "465");
       props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
       props.put("mail.smtp.auth", "true");
       props.put("mail.smtp.port", "465");
       String mssg="";
       Session session = Session.getDefaultInstance(props,
	new javax.mail.Authenticator()
       {
            @Override
          protected PasswordAuthentication getPasswordAuthentication()
          {
	     return new PasswordAuthentication("eleck21@gmail.com","900221eleck");
	  }
	});

	try
        {
          Message message = new MimeMessage(session);
	  message.setFrom(new InternetAddress("eleck21@gmail.com"));
	  message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(address));
	  message.setSubject(subject);
	  //message.setText(msg);

          MimeBodyPart p1 = new MimeBodyPart();
          p1.setText(msg);

          MimeBodyPart p2 = new MimeBodyPart();

        // Put a file in the second part to attach
        FileDataSource fds = new FileDataSource(filePath);
        p2.setDataHandler(new DataHandler(fds));
        p2.setFileName(fds.getName());

        // Create the Multipart.  Add BodyParts to it.
        Multipart mp = new MimeMultipart();

        mp.addBodyPart(p2);
       mp.addBodyPart(p1);
        // Set Multipart as the message's content
        message.setContent(mp);
        Transport.send(message);

	mssg="Email sent to your email address.";

       }
        catch (MessagingException e)
       {
	  throw new RuntimeException(e);
       }

   return  mssg;
    }
     //send a plain text email
  public void sendMail(String msg,String address,String subject)
    {
       Properties props = new Properties();
       props.put("mail.smtp.host", "smtp.gmail.com");
       props.put("mail.smtp.socketFactory.port", "465");
       props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
       props.put("mail.smtp.auth", "true");
       props.put("mail.smtp.port", "465");

       Session session = Session.getDefaultInstance(props,
	new javax.mail.Authenticator()
       {
            @Override
          protected PasswordAuthentication getPasswordAuthentication()
          {
	     return new PasswordAuthentication("eleck21@gmail.com","900221eleck");
	  }
	});

	try
        {
          Message message = new MimeMessage(session);
	  message.setFrom(new InternetAddress("eleck21@gmail.com"));
	  message.setRecipients(Message.RecipientType.TO,
	  InternetAddress.parse(address));
	  message.setSubject(subject);
	  message.setText(msg);
        Transport.send(message);
        System.out.println("Done");

       }
        catch (MessagingException e)
       {
	  throw new RuntimeException(e);
       }


    }*/

}


