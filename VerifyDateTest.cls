@isTest
private class TestVerifyDate {
    @isTest static void testWithinMonth(){
        Date date1 = Date.valueOf('2023-01-01');
        Date date2 = Date.valueOf('2023-01-20');
        Date test = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(Date.valueOf('2023-01-20'), test);
    }
    
    @isTest static void testOutsideMonth(){
		Date date1 = Date.valueOf('2023-01-01');
        Date date2 = Date.valueOf('2023-02-20');
        Date test = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(Date.valueOf('2023-01-31'), test);
    }
    
    @isTest static void testInvalidDate(){
        Boolean test = VerifyDate.DateWithin30Days(Date.valueOf('2023-01-01'), Date.valueOf('2023-06-01'));
        System.assertEquals(false, test);
    }
    
    @isTest static void testInsideMonth(){
		Date date1 = Date.valueOf('2023-01-01');
        Date date2 = Date.valueOf('2023-01-20');
        Boolean test = VerifyDate.DateWithin30Days(date1, date2);
        System.assertEquals(true, test);
    }
}
