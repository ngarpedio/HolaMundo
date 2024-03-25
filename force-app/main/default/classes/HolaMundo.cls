public with sharing class HolaMundo {
    public static String holaMundo(){
        return 'Hola Mundo';
    }

   public static String getField(){
        return [SELECT Id, Apodo__c FROM Contact LIMIT 1][0].Apodo__c;
    }
}
