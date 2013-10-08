//
//  DTests.m
//
//  Created by Heiko Dreyer on 10/01/13.
//
//

#import <SenTestingKit/SenTestingKit.h>
#import "Defines.h"

@interface DTests : SenTestCase
{
    CocoaMite *_client;
    BOOL __block _completed;
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////

@implementation DTests

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

-(void)testCustomerDeletion
{
    [_client addCustomer: @{@"name": @"Customer 1"} withCallback: ^(NSError *error, id result) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
        STAssertNil(error, @"No Errors should occur - Check connection or whatever");
        STAssertNotNil(result, @"Call should have a result");
        STAssertNotNil(result[@"customer"], @"Customer dictionary missing");
#pragma clang diagnostic pop
        
        [_client removeCustomer: [result[@"customer"][@"id"] integerValue] withCallback: ^(NSError *error, id result) {
            STAssertNil(error, @"No Errors should occur - Check connection or whatever");
            STAssertNil(result, @"Call should have no result");
            _completed = YES;
        }];
    }];
    
    while(!_completed)
        [[NSRunLoop currentRunLoop] runMode: NSDefaultRunLoopMode
                                 beforeDate: [NSDate dateWithTimeIntervalSinceNow: 10]];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)testProjectDeletion
{
    [_client addProject: @{@"name": @"Project 1"} withCallback: ^(NSError *error, id result) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
        STAssertNil(error, @"No Errors should occur - Check connection or whatever");
        STAssertNotNil(result, @"Call should have a result");
        STAssertNotNil(result[@"project"], @"Project dictionary missing");
#pragma clang diagnostic pop
        
        [_client removeProject: [result[@"project"][@"id"] integerValue] withCallback: ^(NSError *error, id result) {
            STAssertNil(error, @"No Errors should occur - Check connection or whatever");
            STAssertNil(result, @"Call should have no result");
            _completed = YES;
        }];
    }];
    
    while(!_completed)
        [[NSRunLoop currentRunLoop] runMode: NSDefaultRunLoopMode
                                 beforeDate: [NSDate dateWithTimeIntervalSinceNow: 10]];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)testServiceDeletion
{
    [_client addService: @{@"name": @"Service 1"} withCallback: ^(NSError *error, id result) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
        STAssertNil(error, @"No Errors should occur - Check connection or whatever");
        STAssertNotNil(result, @"Call should have a result");
        STAssertNotNil(result[@"service"], @"Service dictionary missing");
#pragma clang diagnostic pop
        
        [_client removeService: [result[@"service"][@"id"] integerValue] withCallback: ^(NSError *error, id result) {
            STAssertNil(error, @"No Errors should occur - Check connection or whatever");
            STAssertNil(result, @"Call should have no result");
            _completed = YES;
        }];
    }];
    
    while(!_completed)
        [[NSRunLoop currentRunLoop] runMode: NSDefaultRunLoopMode
                                 beforeDate: [NSDate dateWithTimeIntervalSinceNow: 10]];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)testTimeEntryDeletion
{
    [_client addTimeEntry: @{@"minutes": @"55", @"note": @"Entry 1"} withCallback: ^(NSError *error, id result) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
        STAssertNil(error, @"No Errors should occur - Check connection or whatever");
        STAssertNotNil(result, @"Call should have a result");
        STAssertNotNil(result[@"time_entry"], @"TimeEntry dictionary missing");
#pragma clang diagnostic pop
        [_client removeTimeEntry: [result[@"time_entry"][@"id"] integerValue] withCallback: ^(NSError *error, id result) {
            STAssertNil(error, @"No Errors should occur - Check connection or whatever");
            STAssertNil(result, @"Call should have no result");
            _completed = YES;
        }];
    }];
    
    while(!_completed)
        [[NSRunLoop currentRunLoop] runMode: NSDefaultRunLoopMode
                                 beforeDate: [NSDate dateWithTimeIntervalSinceNow: 10]];
}
///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)testStopTracker
{
    [_client addTimeEntry: @{@"minutes": @"55", @"note": @"Entry 1"} withCallback: ^(NSError *error, id result) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
        STAssertNil(error, @"No Errors should occur - Check connection or whatever");
        STAssertNotNil(result, @"Call should have a result");
        STAssertNotNil(result[@"time_entry"], @"TimeEntry dictionary missing");
#pragma clang diagnostic pop
        
        NSInteger anId = [result[@"time_entry"][@"id"] integerValue];
        
        [_client startTrackerOnEntry: anId withCallback: ^(NSError *error, id result) {
            STAssertNil(error, @"No Errors should occur - Check connection or whatever");
            STAssertNotNil(result, @"Call should have a result");
            STAssertNotNil(result[@"tracker"], @"Tracker dictionary missing");
            
            [_client stopTrackerOnEntry: anId withCallback: ^(NSError *error, id result) {
                STAssertNil(error, @"No Errors should occur - Check connection or whatever");
                STAssertNotNil(result, @"Call should have a result");
                STAssertNotNil(result[@"tracker"], @"Tracker dictionary missing");
                _completed = YES;
            }];
        }];
    }];
    
    while(!_completed)
        [[NSRunLoop currentRunLoop] runMode: NSDefaultRunLoopMode
                                 beforeDate: [NSDate dateWithTimeIntervalSinceNow: 10]];
}


@end
