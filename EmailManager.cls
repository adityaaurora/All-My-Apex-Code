public class EmailManager {
    public void sendMail(string address, string subject, string body){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddress = new String[] {address};
        mail.setToAddresses(toAddress);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        messaging.SendEmailResult[] result = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
    }
}
