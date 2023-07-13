public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(string inputName){
        List<List<sObject>> searchList = [FIND :inputName IN NAME FIELDS RETURNING
                                         Contact,Lead];
        return searchList;
    }
}
