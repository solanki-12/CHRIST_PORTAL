import java.io.File;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeMessage.RecipientType;

@SuppressWarnings("unused")
class BabyAuthenticator extends Authenticator
{
	public PasswordAuthentication getPasswordAuthentication()
	{
		// create object of PasswordAuthentication and provide the
		// email and password of sender
		PasswordAuthentication pa = new PasswordAuthentication
		("Solankianuj12@gmail.com", "dl7scb1254solanki");
		
		// return object 'pa'
		return pa;
	}
}




public class SendOtp {

	int getOtp() {
		Random rn=new Random();
		int n;
		while(true) {
		n=rn.nextInt(9999);
		if(n>999 && n<=9999) {
			System.out.println(n);
			break;
			}
		}
		return n;
	}
	public static int otp(String email)throws Exception 
	{

		// create object of properties class to provide
		// the configuration
		Properties p = new Properties();
		
		// specify configuration
		p.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		p.put("mail.smtp.host","smtp.gmail.com");
		p.put("mail.smtp.port","587");
		p.put("mail.smtp.auth","true");
		p.put("mail.smtp.starttls.enable","true");
//		p.put("mail.debug","true");
		
		// create object of baby of authenticator
		BabyAuthenticator baby = new BabyAuthenticator();
		
		// get object of session
		Session session = Session.getInstance
				(p, baby);
		
		// create object of mime-message (means actual message)
		MimeMessage message = new MimeMessage(session);
		
		// provide the subject for the message
		message.setSubject("LogIn OTP");
		
		
		// create an array of internet-address of given size
		InternetAddress[] addresses = new InternetAddress[1];

				InternetAddress address = new InternetAddress(email);
		addresses[0]=address;
		// specify the types of RCVRS
		message.setRecipients(RecipientType.TO, addresses);
		
		// create some body parts
		MimeBodyPart body1 = new MimeBodyPart();
				//body2 = new MimeBodyPart(), 
				//body3 = new MimeBodyPart();
		SendOtp obj=new SendOtp();
		int otp=obj.getOtp();
		String s="<p style='color : blue;'>this is login otp "+otp+" Number<br> Please don't share anyone</p>";
		// associate a content with body1
		body1.setContent
		(s, "text/html");
		
		// associate attachment with body2 and body3
		//body2.attachFile(new File("d:\\dipu.jpeg"));
		//body3.attachFile(new File("C:\\Users\\sahil\\eclipse-workspace\\mail\\src\\SendOtp.java"));
		
		// create a multipart to store body parts
		MimeMultipart multipart = new MimeMultipart();
		
		multipart.addBodyPart(body1);
		
		// store multipart inside message
		message.setContent(multipart);
		
		// send the message to the mail server
		Transport.send(message);
		
		System.out.println("OK");
		return otp;

	}
	public static void pass_recovery(String email)throws Exception
	{
       Properties p = new Properties();
       p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
       p.put("mail.transport.protocol", "smtp");

		
		p.put("mail.smtp.host","smtp.gmail.com");
		p.put("mail.smtp.port","587");
		p.put("mail.smtp.auth","true");
		
		p.put("mail.smtp.starttls.enable","true");
//		p.put("mail.debug","true");
		
		BabyAuthenticator baby = new BabyAuthenticator();
		
		Session session = Session.getInstance
				(p, baby);
		
		MimeMessage message = new MimeMessage(session);
		
		message.setSubject("password Recovery");
		
		
		InternetAddress[] addresses = new InternetAddress[1];

		System.out.println(email);
				InternetAddress address = new InternetAddress(email);
		addresses[0]=address;
	
		message.setRecipients(RecipientType.TO, addresses);
		
		
		MimeBodyPart body1 = new MimeBodyPart();
		
		String s="<p style='color : red;'><a href='http://localhost:8080/Performance_Evaluation/student_pass_recvry_ByMail.jsp'>Recover Password click me</a></p>";
		body1.setContent
		(s, "text/html");
		
		MimeMultipart multipart = new MimeMultipart();
		
		multipart.addBodyPart(body1);
		
		message.setContent(multipart);
		Transport.send(message);
		
		System.out.println("OK");

		
	}
	public static void main(String[] args) throws Exception	
	{	
		
		SendOtp.otp("solankiarun01@gmail.com");
		System.out.println("code successfull ==>>");
	}
	
	
}
