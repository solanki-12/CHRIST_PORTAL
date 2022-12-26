package emailAuthenticator;

import javax.mail.PasswordAuthentication;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;


public class BabyAuthenticator extends Authenticator
	{
	
	public PasswordAuthentication getPasswordAuthentication()
	{
		// create object of PasswordAuthentication and provide the
		// email and password of sender
		PasswordAuthentication pa = new PasswordAuthentication
		("solankianuj12@gmail.com", "dl7scb1254solanki");
		
		// return object 'pa'
		return pa;
	}
}
