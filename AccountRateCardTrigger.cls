trigger AccountRateCardTrigger on Account (before insert, before update) {
    AccountRateCard.calculateRate(trigger.new);
}
