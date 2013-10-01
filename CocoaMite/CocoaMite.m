//
//  CocoaMite.m
//
//  Created by Heiko Dreyer on 09/30/13.
//  Copyright (c) 2013 boxedfolder.com. All rights reserved.
//

#import "CocoaMite.h"
#import "NSString+Base64.h"

#define CocoaMiteErrorDomain @"CocoaMiteErrorDomain"
#define DEFAULT_AGENT_NAME @"CocoaMite"

@interface CocoaMite ()

-(NSString *)_userAgent;
-(NSOperationQueue *)_operationQueue;

-(void)_basicRetrievalWithDomain: (NSString *)domain
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

-(void)customers: (NSDictionary *)parameters withCallback: (void (^)(NSError *error, id result))callback
{
    [self _basicRetrievalWithDomain: @"customers" parameters: parameters callback: callback];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)projects: (NSDictionary *)parameters withCallback: (void (^)(NSError *error, id result))callback
{
    [self _basicRetrievalWithDomain: @"projects" parameters: parameters callback: callback];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)services: (NSDictionary *)parameters withCallback: (void (^)(NSError *error, id result))callback
{
    [self _basicRetrievalWithDomain: @"services" parameters: parameters callback: callback];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)timeEntries: (NSDictionary *)parameters withCallback: (void (^)(NSError *error, id result))callback
{
    [self _basicRetrievalWithDomain: @"time_entries" parameters: parameters callback: callback];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)timeEntryBookmarks: (NSDictionary *)parameters withCallback: (void (^)(NSError *error, id result))callback
{
    [self _basicRetrievalWithDomain: @"bookmarks" parameters: parameters callback: callback];
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
///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Create

-(void)addCustomer: (NSDictionary *)data withCallback: (void (^)(NSError *error, id result))callback
{
    [self _callMethod: @"POST"
             withPath: @"customers.json"
           parameters: nil
                 data: data
             callback: callback];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)addProject: (NSDictionary *)data withCallback: (void (^)(NSError *error, id result))callback
{
    [self _callMethod: @"POST"
             withPath: @"projects.json"
           parameters: nil
                 data: data
             callback: callback];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)addService: (NSDictionary *)data withCallback: (void (^)(NSError *error, id result))callback
{
    [self _callMethod: @"POST"
             withPath: @"services.json"
           parameters: nil
                 data: data
             callback: callback];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)addTimeEntry: (NSDictionary *)data withCallback: (void (^)(NSError *error, id result))callback
{
    [self _callMethod: @"POST"
             withPath: @"time_entries.json"
           parameters: nil
                 data: data
             callback: callback];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)startTrackerOnEntry: (NSInteger)timeEntryId withCallback: (void (^)(NSError *error, id result))callback
{
    
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
    
    if(_apiKey)
        [request setValue: _apiKey forHTTPHeaderField: @"X-MiteApiKey"];
    else
    {
        NSString *credentials = [NSString stringWithFormat: @"%@:%@", _email, _password];
        NSString *auth = [NSString stringWithFormat: @"Basic %@", [credentials base64String]];
        [request setValue: auth forHTTPHeaderField: @"Authorization"];
    }
    
    if(requestData)
        [request setHTTPBody: requestData];
    
    [request setValue: [self _userAgent] forHTTPHeaderField: @"User-Agent"];
    [request setValue: @"application/json" forHTTPHeaderField: @"Accept"];
    [request setValue: @"application/json" forHTTPHeaderField: @"Content-Type"];
    [request setValue: [NSString stringWithFormat: @"%d", [requestData length]] forHTTPHeaderField: @"Content-Length"];
    [request setHTTPMethod: method];
    
    [NSURLConnection sendAsynchronousRequest: request
                                       queue: [self _operationQueue]
                           completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
                               
                               NSError *jsonError;
                               id result = [NSJSONSerialization JSONObjectWithData: data
                                                                             options: NSJSONReadingMutableContainers
                                                                               error: &jsonError];
                               
                               if(jsonError)
                               {
                                   NSString *errorString = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                   error = [NSError errorWithDomain: CocoaMiteErrorDomain code: 401 userInfo: @{@"message": errorString}];
                               }
                               
                               callback(error, result);
    }];

}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)_basicRetrievalWithDomain: (NSString *)domain
                      parameters: (NSDictionary *)parameters
                        callback: (void(^)(NSError *error, id result))callback;
{
    NSString *path = [NSString stringWithFormat: @"%@.json", domain];
    
    if(parameters[@"id"])
    {
        path = [NSString stringWithFormat: @"%@/%@.json", domain, parameters[@"id"]];
        NSMutableDictionary *dict = [parameters mutableCopy];
        dict[@"id"] = nil;
        parameters = dict;
    }
    
    [self _callMethod: @"GET"
             withPath: path
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
    if(_agentName)
        return _agentName;
    
    return DEFAULT_AGENT_NAME;
}

@end
