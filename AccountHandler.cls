public class AccountHandler {
    public static Account insertNewAccount(string inputName){
        try{
            Account acct = new Account(name = inputName);
            insert acct;
            return acct;
        }
        catch (DmlException e){
            return Null;
        }
    }
}
