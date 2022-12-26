package emailAuthenticator;

import java.util.Properties;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeMessage.RecipientType;


public class EmailSender {

	public static void sendEmail() throws Exception
			{
			// create object of properties class to provide
			// the configuration
			Properties p = new Properties();
			
			// specify configuration
			p.put("mail.smtp.host","smtp.gmail.com");
			p.put("mail.smtp.port","587");
			p.put("mail.smtp.auth","true");
			p.put("mail.smtp.starttls.enable","true");
//			p.put("mail.debug","true");
			
			// create object of baby of authenticator
			BabyAuthenticator baby = new BabyAuthenticator();
			
			// get object of session
			Session session = Session.getInstance
					(p, baby);
			
			// create object of mime-message (means actual message)
			MimeMessage message = new MimeMessage(session);
			
			// provide the subject for the message
			message.setSubject("Guys, JUST A TEST MAIL !!");
			
			String[] receivers = ("anuj.solanki@science.christuniversity.in"
					+" saltymanish@gmail.com").split(" ");

			// create an array of internet-address of given size
			InternetAddress[] addresses = new InternetAddress[receivers.length];
			
			for(int i = 0; i < addresses.length; i++)
			{
				// convert email in string into internet-address
				InternetAddress address = new InternetAddress(receivers[i]);
				
				// assign the object of internet-address into array
				addresses[i] = address;
			}
			
			// specify the types of RCVRS
			message.setRecipients(RecipientType.TO, addresses);
			
			// create some body parts
			MimeBodyPart body1 = new MimeBodyPart(),
					body2 = new MimeBodyPart(), 
					body3 = new MimeBodyPart();
			
			// associate a content with body1
			body1.setContent
			("<p style='color : red;'>This mail was sent by our application</p>", "text/html");
			
			
			// associate attachment with body2 and body3
//			body2.attachFile(new File("d:\\dipu.jpeg"));
//			body3.attachFile(new File("C:\\Users\\sahil\\eclipse-workspace\\mail\\src\\SendEmailToGmailServer.java"));
		//	
			
			
			// create a multipart to store body parts
			MimeMultipart multipart = new MimeMultipart();
			
			multipart.addBodyPart(body1);
			multipart.addBodyPart(body2);
			multipart.addBodyPart(body3);
			
			// store multipart inside message
			message.setContent(multipart);
			
			// send the message to the mail server
			Transport.send(message);
			
			System.out.println("OK");
			}

}
