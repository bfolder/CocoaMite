//
//  UTests.m
//
//  Created by Heiko Dreyer on 10/01/13.
//
//

#import <SenTestingKit/SenTestingKit.h>
#import "Defines.h"

@interface UTests : SenTestCase
{
    CocoaMite *_client;
    BOOL __block _completed;
    
    // Getting rid of test data
    NSString *_createdProjectId;
    NSString *_createdCustomerId;
    NSString *_createdServiceId;
    NSString *_createdTimeEntryId;
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////

@implementation UTests

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
    
    if(_createdProjectId)
        [_client removeProject: [_createdProjectId integerValue] withCallback: nil];
    
    if(_createdServiceId)
        [_client removeService: [_createdServiceId integerValue] withCallback: nil];
    
    if(_createdCustomerId)
        [_client removeCustomer: [_createdCustomerId integerValue] withCallback: nil];
    
    if(_createdTimeEntryId)
        [_client removeTimeEntry: [_createdTimeEntryId integerValue] withCallback: nil];
    
    _client = nil;
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)testCustomerUpdate
{
    [_client addCustomer: @{@"name": @"Customer 1"} withCallback: ^(NSError *error, id result) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
        STAssertNil(error, @"No Errors should occur - Check connection or whatever");
        STAssertNotNil(result, @"Call should have a result");
        STAssertNotNil(result[@"customer"], @"Customer dictionary missing");
        _createdCustomerId = result[@"customer"][@"id"];
#pragma clang diagnostic pop
        
        [_client updateCustomer: [_createdCustomerId integerValue] withData: @{@"name": @"Customer 1, renamed"} callback: ^(NSError *error, id result) {
            STAssertNil(error, @"No Errors should occur - Check connection or whatever");
            STAssertNil(result, @"Call should have a result");
            
            _completed = YES;
        }];
    }];
    
    while(!_completed)
        [[NSRunLoop currentRunLoop] runMode: NSDefaultRunLoopMode
                                 beforeDate: [NSDate dateWithTimeIntervalSinceNow: 10]];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)testServiceUpdate
{
    [_client addService: @{@"name": @"Service 1"} withCallback: ^(NSError *error, id result) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
        STAssertNil(error, @"No Errors should occur - Check connection or whatever");
        STAssertNotNil(result, @"Call should have a result");
        STAssertNotNil(result[@"service"], @"Service dictionary missing");
        _createdServiceId = result[@"service"][@"id"];
#pragma clang diagnostic pop
        
        [_client updateService: [_createdServiceId integerValue] withData: @{@"name": @"Service 1, renamed"} callback: ^(NSError *error, id result) {
            STAssertNil(error, @"No Errors should occur - Check connection or whatever");
            STAssertNil(result, @"Call should have a result");
            
            _completed = YES;
        }];
    }];
    
    while(!_completed)
        [[NSRunLoop currentRunLoop] runMode: NSDefaultRunLoopMode
                                 beforeDate: [NSDate dateWithTimeIntervalSinceNow: 10]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)testProjectUpdate
{
    [_client addProject: @{@"name": @"Project 1"} withCallback: ^(NSError *error, id result) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
        STAssertNil(error, @"No Errors should occur - Check connection or whatever");
        STAssertNotNil(result, @"Call should have a result");
        STAssertNotNil(result[@"project"], @"Project dictionary missing");
        _createdProjectId = result[@"project"][@"id"];
#pragma clang diagnostic pop
        [_client updateProject: [_createdProjectId integerValue] withData: @{@"name": @"Project 1, renamed"} callback: ^(NSError *error, id result) {
            STAssertNil(error, @"No Errors should occur - Check connection or whatever");
            STAssertNil(result, @"Call should have a result");
            
            _completed = YES;
        }];
    }];
    
    while(!_completed)
        [[NSRunLoop currentRunLoop] runMode: NSDefaultRunLoopMode
                                 beforeDate: [NSDate dateWithTimeIntervalSinceNow: 10]];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)testTimeEntryUpdate
{
    [_client addTimeEntry: @{@"minutes": @"55", @"note": @"Entry 1"} withCallback: ^(NSError *error, id result) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
        STAssertNil(error, @"No Errors should occur - Check connection or whatever");
        STAssertNotNil(result, @"Call should have a result");
        STAssertNotNil(result[@"time_entry"], @"TimeEntry dictionary missing");
        _createdTimeEntryId = result[@"time_entry"][@"id"];
#pragma clang diagnostic pop
        [_client updateTimeEntry: [_createdTimeEntryId integerValue] withData: @{@"minutes": @"25", @"note": @"Entry 1, updated"}callback: ^(NSError *error, id result) {
            STAssertNil(error, @"No Errors should occur - Check connection or whatever");
            STAssertNil(result, @"Call should have a result");
            
            _completed = YES;
        }];
    }];
    
    while(!_completed)
        [[NSRunLoop currentRunLoop] runMode: NSDefaultRunLoopMode
                                 beforeDate: [NSDate dateWithTimeIntervalSinceNow: 10]];
}

@end

