
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;



/**
 *
 * @author Miehleketo
 */
public class sendEmail {
    
    public static void main(String[] args)
    {
        EmailSender em=new EmailSender();
        //sendMail(String msg,String address,String subject)
        String address="elect21@gmail.com";
        String msg="working....";
        String subject="test email sender";
       // em.sendMail(msg, address, subject);
    }
}
