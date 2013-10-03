//
//  RTests.m
//
//  Created by Heiko Dreyer on 09/30/13.
//
//

#import <SenTestingKit/SenTestingKit.h>
#import "Defines.h"

@interface RTests : SenTestCase
{
    CocoaMite *_client;
    BOOL __block _completed;
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////

@implementation RTests

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)setUp
{
    [super setUp];
    
    _client = [[CocoaMite alloc] initWithApiKey: API_KEY subdomain: SUBDOMAIN];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)tearDown
{
    [super tearDown];
    
    _client = nil;
}
///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)testCurrentAccount
{
    [_client currentAccountWithCallback: ^(NSError *error, id result) {
        STAssertNil(error, @"No Errors should occur - Check connection or whatever");
        STAssertNotNil(result, @"Call should have a result");
        STAssertNotNil(result[@"account"], @"Account dictionary missing");
        
        _completed = YES;
    }];
    
    while(!_completed)
        [[NSRunLoop currentRunLoop] runMode: NSDefaultRunLoopMode
                                 beforeDate: [NSDate dateWithTimeIntervalSinceNow: 10]];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)testCurrentUser
{
    [_client currentUserWithCallback: ^(NSError *error, id result) {
        STAssertNil(error, @"No Errors should occur - Check connection or whatever");
        STAssertNotNil(result, @"Call should have a result");
        STAssertNotNil(result[@"user"], @"User dictionary missing");
        
        _completed = YES;
    }];
    
    while(!_completed)
        [[NSRunLoop currentRunLoop] runMode: NSDefaultRunLoopMode
                                 beforeDate: [NSDate dateWithTimeIntervalSinceNow: 10]];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)testProjectsRetrieval
{
    [_client projectsWithParameters: nil archived: NO callback: ^(NSError *error, id result) {
        STAssertNil(error, @"No Errors should occur - Check connection or whatever");
        STAssertNotNil(result, @"Call should have a result");
        STAssertTrue([result isKindOfClass: [NSArray class]], @"Projects result is not an array");
        
        if([result count] > 0)
        {
            NSString *firstKey = (NSString *)[result[0] allKeys][0];
            STAssertTrue([firstKey isEqualToString: @"project"], @"Dictionaries should contain projects");
        }
        
        _completed = YES;
    }];
    
    while(!_completed)
        [[NSRunLoop currentRunLoop] runMode: NSDefaultRunLoopMode
                                 beforeDate: [NSDate dateWithTimeIntervalSinceNow: 10]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)testArchivedProjectsRetrieval
{
    [_client projectsWithParameters: nil archived: NO callback: ^(NSError *error, id result) {
        STAssertNil(error, @"No Errors should occur - Check connection or whatever");
        STAssertNotNil(result, @"Call should have a result");
        STAssertTrue([result isKindOfClass: [NSArray class]], @"Archived projects result is not an array");
        
        if([result count] > 0)
        {
            NSString *firstKey = (NSString *)[result[0] allKeys][0];
            STAssertTrue([firstKey isEqualToString: @"project"], @"Dictionaries should contain projects");
        }
        
        _completed = YES;
    }];
    
    while(!_completed)
        [[NSRunLoop currentRunLoop] runMode: NSDefaultRunLoopMode
                                 beforeDate: [NSDate dateWithTimeIntervalSinceNow: 10]];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)testCustomersRetrieval
{
    [_client customersWithParameters: nil archived: NO callback: ^(NSError *error, id result) {
        STAssertNil(error, @"No Errors should occur - Check connection or whatever");
        STAssertNotNil(result, @"Call should have a result");
        STAssertTrue([result isKindOfClass: [NSArray class]], @"Customers result is not an array");
        
        if([result count] > 0)
        {
            NSString *firstKey = (NSString *)[result[0] allKeys][0];
            STAssertTrue([firstKey isEqualToString: @"customer"], @"Dictionaries should contain customers");
        }
        
        _completed = YES;
    }];
    
    while(!_completed)
        [[NSRunLoop currentRunLoop] runMode: NSDefaultRunLoopMode
                                 beforeDate: [NSDate dateWithTimeIntervalSinceNow: 10]];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)testServicesRetrieval
{
    [_client servicesWithParameters: nil archived: NO callback: ^(NSError *error, id result) {
        STAssertNil(error, @"No Errors should occur - Check connection or whatever");
        STAssertNotNil(result, @"Call should have a result");
        STAssertTrue([result isKindOfClass: [NSArray class]], @"Services result is not an array");
        
        if([result count] > 0)
        {
            NSString *firstKey = (NSString *)[result[0] allKeys][0];
            STAssertTrue([firstKey isEqualToString: @"service"], @"Dictionaries should contain services");
        }
        
        _completed = YES;
    }];
    
    while(!_completed)
        [[NSRunLoop currentRunLoop] runMode: NSDefaultRunLoopMode
                                 beforeDate: [NSDate dateWithTimeIntervalSinceNow: 10]];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)testTimeEntriesRetrieval
{
    [_client timeEntriesWithParameters: nil callback: ^(NSError *error, id result) {
        STAssertNil(error, @"No Errors should occur - Check connection or whatever");
        STAssertNotNil(result, @"Call should have a result");
        STAssertTrue([result isKindOfClass: [NSArray class]], @"Time Entries result is not an array");
        
        if([result count] > 0)
        {
            NSString *firstKey = (NSString *)[result[0] allKeys][0];
            STAssertTrue([firstKey isEqualToString: @"time_entry"], @"Dictionaries should contain time entries");
        }
        
        _completed = YES;
    }];
    
    while(!_completed)
        [[NSRunLoop currentRunLoop] runMode: NSDefaultRunLoopMode
                                 beforeDate: [NSDate dateWithTimeIntervalSinceNow: 10]];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)testUsersRetrieval
{
    [_client usersWithParameters: nil archived: NO callback: ^(NSError *error, id result) {
        STAssertNil(error, @"No Errors should occur - Check connection or whatever");
        STAssertNotNil(result, @"Call should have a result");
        STAssertTrue([result isKindOfClass: [NSArray class]], @"Users result is not an array");
        
        if([result count] > 0)
        {
            NSString *firstKey = (NSString *)[result[0] allKeys][0];
            STAssertTrue([firstKey isEqualToString: @"user"], @"Dictionaries should contain users");
        }
        
        _completed = YES;
    }];
    
    while(!_completed)
        [[NSRunLoop currentRunLoop] runMode: NSDefaultRunLoopMode
                                 beforeDate: [NSDate dateWithTimeIntervalSinceNow: 10]];
}

@end
