package com.pk.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		
		return  new PasswordAuthentication("semi3jo", "tpal3wh!");
	}

}
