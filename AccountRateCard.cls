public class AccountRateCard {
    public static void calculateRate(List<Account> accts){
        //accounts not committed
        Set<Date> startDates = new Set<Date>();
        Set<Date> endDates = new Set<Date>();
        for (Account acc: accts){
        	if (acc.Start_Date__c != null && acc.End_Date__c != null) {
            	startDates.add(acc.Start_Date__c);
                endDates.add(acc.End_Date__c);
        	}
        }    
        
        //System.debug(endDates);
            
        List<Rate_Card__c> rateCards = [Select Start_Date__C, End_Date__c, Rate__c
                                        from Rate_Card__c where 
                                        Start_Date__c <= :startDates
                                        OR End_Date__c >= :endDates];
        //System.debug(rateCards);
        
        for (Account acc : accts){
            if(acc.Start_Date__c == null || acc.End_Date__c == null){
                acc.Rate__c = null;
            } else {
                Decimal calcRate = 0;
                for (Rate_Card__c rateCard : rateCards){
                    Date rateStartDate = (rateCard.Start_Date__c >= acc.Start_Date__c) ? rateCard.Start_Date__c : acc.Start_Date__c;
                    //System.debug('rateStartDate:' + rateStartDate);
                    Date rateEndDate = (rateCard.End_Date__c <= acc.End_Date__c) ? rateCard.End_Date__c : acc.End_Date__c;
                    //System.debug('rateEndDate:' + rateEndDate);
                    Integer daysInRange = rateStartDate.daysBetween(rateEndDate);
                    //System.debug('days in range: ' + daysInRange);
                    Date rateCardStart = rateCard.Start_Date__c;
                    Date rateCardEnd = rateCard.End_Date__c;
                    Integer daysDifference = rateCardStart.daysBetween(rateCardEnd) + 1;
                    //System.debug('days in the rate card:' + daysDifference);
                    if (daysInRange > 0){
                        calcRate += (rateCard.Rate__c / daysDifference) * daysInRange;
                        //System.debug(calcRate);
                    }
                }
                acc.Rate__c = calcRate;
            }


        
            
        }
        
		        
    }
}
