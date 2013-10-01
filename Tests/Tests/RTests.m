//
//  RTests.m
//
//  Created by Heiko Dreyer on 09/30/13.
//
//

#import <SenTestingKit/SenTestingKit.h>
#import "Definitions.h"

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
    
    _completed = NO;
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
    
    while(!_completed);
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
    
    while(!_completed);
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)testProjectsRetrieval
{
    [_client projects: nil archived: NO withCallback: ^(NSError *error, id result) {
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
    
    while(!_completed);
}


///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)testArchivedProjectsRetrieval
{
    [_client projects: nil archived: YES withCallback: ^(NSError *error, id result) {
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
    
    while(!_completed);
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)testCustomersRetrieval
{
    [_client customers: nil archived: NO withCallback: ^(NSError *error, id result) {
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
    
    while(!_completed);
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)testServicesRetrieval
{
    [_client services: nil archived: NO withCallback: ^(NSError *error, id result) {
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
    
    while(!_completed);
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)testTimeEntriesRetrieval
{
    [_client timeEntries: nil withCallback: ^(NSError *error, id result) {
        STAssertNil(error, @"No Errors should occur - Check connection or whatever");
        STAssertNotNil(result, @"Call should have a result");
        STAssertTrue([result isKindOfClass: [NSArray class]], @"Time Entries result is not an array");
        
        if([result count] > 0)
        {
            NSString *firstKey = (NSString *)[result[0] allKeys][0];
            STAssertTrue([firstKey isEqualToString: @"time_entries"], @"Dictionaries should contain time entries");
        }
        
        _completed = YES;
    }];
    
    while(!_completed);
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)testUsersRetrieval
{
    [_client users: nil archived: NO withCallback: ^(NSError *error, id result) {
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
    
    while(!_completed);
}

@end
