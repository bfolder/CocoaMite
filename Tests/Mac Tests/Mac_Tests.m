//
//  Mac_Tests.m
//  Mac Tests
//
//  Created by Heiko Dreyer on 30.09.13.
//
//

#import <SenTestingKit/SenTestingKit.h>

@interface Mac_Tests : SenTestCase

@end

@implementation Mac_Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    STFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
