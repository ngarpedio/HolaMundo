@IsTest
public with sharing class ATestClass {
    @IsTest
    static void methodName(){
        
        Test.startTest(); 
        Assert.areEqual(true, true);
        Test.stopTest();
        
    }
}