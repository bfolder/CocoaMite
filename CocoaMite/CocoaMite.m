//
//  CocoaMite.m
//
//  Created by Heiko Dreyer on 09/30/13.
//  Copyright (c) 2013 boxedfolder.com. All rights reserved.
//

#import "CocoaMite.h"
#import "AFHTTPRequestOperation.h"

#define CocoaMiteErrorDomain @"CocoaMiteErrorDomain"
#define CocoaMiteDefaultAgentName @"CocoaMite"

@interface CocoaMite ()

-(NSString *)_userAgent;
-(NSOperationQueue *)_operationQueue;

-(void)_basicRetrievalWithDomain: (NSString *)domain
                        archived: (BOOL)yesNo
                      parameters: (NSDictionary *)parameters
                        callback: (void(^)(NSError *error, id result))callback;

-(void)_callMethod: (NSString *)method
          withPath: (NSString *)path
        parameters: (NSDictionary *)parameters
              data: (NSDictionary *)data
          callback: (void (^)(NSError *error, id result))callback;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////

@implementation CocoaMite
{
    NSOperationQueue *_queue;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Setup

-(id)initWithApiKey: (NSString *)apiKey subdomain: (NSString *)subdomain
{
    if(self = [super init])
    {
        _apiKey = apiKey;
        _subdomain = subdomain;
    }
    
    return self;
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(id)initWithEmail: (NSString *)email password: (NSString *)password subdomain: (NSString *)subdomain
{
    if(self = [super init])
    {
        _email = email;
        _password = password;
        _subdomain = subdomain;
    }
    
    return self;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Retrieve

-(void)currentAccountWithCallback: (void (^)(NSError *error, id result))callback
{
    [self _callMethod: @"GET"
             withPath: @"account.json"
           parameters: nil
                 data: nil
             callback: callback];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)currentUserWithCallback: (void (^)(NSError *error, id result))callback;
{
    [self _callMethod: @"GET"
             withPath: @"myself.json"
           parameters: nil
                 data: nil
             callback: callback];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)customersWithParameters: (NSDictionary *)parameters archived: (BOOL)yesNo callback: (void (^)(NSError *error, id result))callback
{
    [self _basicRetrievalWithDomain:  @"customers" archived: yesNo parameters: parameters callback: callback];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)projectsWithParameters: (NSDictionary *)parameters archived: (BOOL)yesNo callback: (void (^)(NSError *error, id result))callback
{
    [self _basicRetrievalWithDomain: @"projects" archived: yesNo parameters: parameters callback: callback];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)servicesWithParameters: (NSDictionary *)parameters archived: (BOOL)yesNo callback: (void (^)(NSError *error, id result))callback
{
    [self _basicRetrievalWithDomain: @"services" archived: yesNo parameters: parameters callback: callback];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)timeEntriesWithParameters: (NSDictionary *)parameters callback: (void (^)(NSError *error, id result))callback
{
    [self _basicRetrievalWithDomain: @"time_entries" archived: NO parameters: parameters callback: callback];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)timeEntryBookmarksWithParameters: (NSDictionary *)parameters callback: (void (^)(NSError *error, id result))callback
{
    [self _basicRetrievalWithDomain: @"bookmarks" archived: NO parameters: parameters callback: callback];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)currentTrackerWithCallback: (void (^)(NSError *error, id result))callback
{
    [self _callMethod: @"GET"
             withPath: @"tracker.json"
           parameters: nil
                 data: nil
             callback: callback];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)usersWithParameters: (NSDictionary *)parameters archived: (BOOL)yesNo callback: (void (^)(NSError *error, id result))callback
{
    [self _basicRetrievalWithDomain: @"users" archived: yesNo parameters: parameters callback: callback];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Create

-(void)addCustomer: (NSDictionary *)data withCallback: (void (^)(NSError *error, id result))callback
{
    [self _callMethod: @"POST"
             withPath: @"customers.json"
           parameters: nil
                 data: @{@"customer": data}
             callback: callback];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)addProject: (NSDictionary *)data withCallback: (void (^)(NSError *error, id result))callback
{
    [self _callMethod: @"POST"
             withPath: @"projects.json"
           parameters: nil
                 data: @{@"project": data}
             callback: callback];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)addService: (NSDictionary *)data withCallback: (void (^)(NSError *error, id result))callback
{
    [self _callMethod: @"POST"
             withPath: @"services.json"
           parameters: nil
                 data: @{@"service": data}
             callback: callback];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)addTimeEntry: (NSDictionary *)data withCallback: (void (^)(NSError *error, id result))callback
{
    [self _callMethod: @"POST"
             withPath: @"time_entries.json"
           parameters: nil
                 data: @{@"time_entry": data}
             callback: callback];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)startTrackerOnEntry: (NSInteger)timeEntryId withCallback: (void (^)(NSError *error, id result))callback
{
    [self _callMethod: @"PUT"
             withPath: [NSString stringWithFormat: @"tracker/%i.json", timeEntryId]
           parameters: nil
                 data: nil
             callback: callback];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Update

-(void)updateCustomer: (NSInteger)customerId withData: (NSDictionary *)data callback: (void (^)(NSError *error, id result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)updateProject: (NSInteger)projectId withData: (NSDictionary *)data callback: (void (^)(NSError *error, id result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)updateService: (NSInteger)serviceId withData: (NSDictionary *)data callback: (void (^)(NSError *error, id result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)updateTimeEntry: (NSInteger)timeEntryId withData: (NSDictionary *)data callback: (void (^)(NSError *error, id result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Destroy

-(void)removeCustomer: (NSInteger)customerId withCallback: (void (^)(NSError *error, id result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)removeProject: (NSInteger)projectId withCallback: (void (^)(NSError *error, id result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)removeService: (NSInteger)serviceId withCallback: (void (^)(NSError *error, id result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)removeTimeEntry: (NSInteger)timeEntryId withCallback: (void (^)(NSError *error, id result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)stopTracker: (NSInteger)trackerId withCallback: (void (^)(NSError *error, id result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Private

-(void)_callMethod: (NSString *)method
          withPath: (NSString *)path
        parameters: (NSDictionary *)parameters
              data: (NSDictionary *)data
          callback: (void (^)(NSError *error, id result))callback
{
    NSData *requestData = nil;
    NSError *error = nil;
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat: @"https://%@.mite.yo.lk/%@", _subdomain, path]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url
                                                           cachePolicy: NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval: 60.0];

    if(data)
        requestData = [NSJSONSerialization dataWithJSONObject: data options: NSJSONWritingPrettyPrinted error: &error];
    
    if(error)
    {
        callback(error, nil);
        return;
    }
    
    NSURLCredential *credential = nil;
    
    if(_apiKey)
        [request setValue: _apiKey forHTTPHeaderField: @"X-MiteApiKey"];
    else
        credential = [[NSURLCredential alloc] initWithUser: _email password: _password persistence: NSURLCredentialPersistenceNone];
    
    if(requestData)
        [request setHTTPBody: requestData];
    
    [request setValue: [self _userAgent] forHTTPHeaderField: @"User-Agent"];
    [request setValue: @"application/json" forHTTPHeaderField: @"Accept"];
    [request setValue: @"application/json" forHTTPHeaderField: @"Content-Type"];
    [request setValue:@"utf-8" forHTTPHeaderField: @"Accept-Charset"];
    [request setValue: [NSString stringWithFormat: @"%lu", (unsigned long)[requestData length]] forHTTPHeaderField: @"Content-Length"];
    [request setHTTPMethod: method];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest: request];
    if(credential)
        [operation setCredential: credential];
    
    [operation setCompletionBlockWithSuccess: ^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error = nil;
        AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializerWithReadingOptions: NSJSONReadingMutableContainers];
        NSDictionary *JSON = [serializer responseObjectForResponse: operation.response data: operation.responseData error: &error];
        
        if(error)
        {
            NSString *errorString = [[NSString alloc] initWithData: operation.responseData encoding: NSUTF8StringEncoding];
            error = [NSError errorWithDomain: CocoaMiteErrorDomain code: 0 userInfo: @{@"message": errorString}];
        }
        
        callback(error, JSON);
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        callback(error, [[NSString alloc] initWithData: operation.responseData encoding: NSUTF8StringEncoding]);
    }];
    
    [[self _operationQueue] addOperation: operation];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)_basicRetrievalWithDomain: (NSString *)domain
                        archived: (BOOL)yesNo
                      parameters: (NSDictionary *)parameters
                        callback: (void(^)(NSError *error, id result))callback;
{
    NSMutableDictionary *dict = [parameters mutableCopy];
    NSString *aId = dict[@"id"];
    
    if(aId)
    {
        domain = [NSString stringWithFormat: @"%@/%@", domain, parameters[@"id"]];
        dict[@"id"] = nil;
        parameters = dict;
    }
    else if(yesNo)
        domain = [NSString stringWithFormat: @"%@/archived", domain];
    
    [self _callMethod: @"GET"
             withPath: [NSString stringWithFormat: @"%@.json", domain]
           parameters: parameters
                 data: nil
             callback: callback];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(NSOperationQueue *)_operationQueue
{
    if(!_queue)
        _queue = [[NSOperationQueue alloc] init], _queue.maxConcurrentOperationCount = 1;
    
    return _queue;
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(NSString *)_userAgent
{
    if(!_agentName)
        _agentName = CocoaMiteDefaultAgentName;
    
    return _agentName;
}

@end
