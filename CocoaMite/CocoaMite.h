//
//  CocoaMite.h
//
//  Created by Heiko Dreyer on 09/30/13.
//  Copyright (c) 2013 boxedfolder.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CocoaMite : NSObject

///---------------------------------------------------------------------------------------
/// @name Setup
///---------------------------------------------------------------------------------------

/**
 *  API Key - Returns nil if none is set.
 */
@property (nonatomic, readonly, strong) NSString *apiKey;

/**
 *  Email - Returns nil if none is set.
 */
@property (nonatomic, readonly, strong) NSString *email;

/**
 *  Password - Returns nil if none is set.
 */
@property (nonatomic, readonly, strong) NSString *password;

/**
 *  Subdomain - Returns nil if none is set.
 */
@property (nonatomic, readonly, strong) NSString *subdomain;

/**
 *  User agent name - Defaults to 'CocoaMite'.
 */
@property (nonatomic, strong) NSString *agentName;

/**
 * Creates a new CocoaMite instance from an existing API Key.
 */
-(id)initWithApiKey: (NSString *)apiKey subdomain: (NSString *)subdomain;

/**
 * Creates a new CocoaMite instance from an active username and password.
 */
-(id)initWithEmail: (NSString *)email password: (NSString *)password subdomain: (NSString *)subdomain;

///---------------------------------------------------------------------------------------
/// @name Retrieve
///---------------------------------------------------------------------------------------

/**
 *
 */
-(void)currentAccountWithCallback: (void (^)(NSError *error, id result))callback;

/**
 *
 */
-(void)currentUserWithCallback: (void (^)(NSError *error, id result))callback;

/**
 *
 */
-(void)customers: (NSDictionary *)parameters withCallback: (void (^)(NSError *error, id result))callback;

/**
 *
 */
-(void)projects: (NSDictionary *)parameters withCallback: (void (^)(NSError *error, id result))callback;

/**
 *
 */
-(void)services: (NSDictionary *)parameters withCallback: (void (^)(NSError *error, id result))callback;

/**
 *
 */
-(void)timeEntries: (NSDictionary *)parameters withCallback: (void (^)(NSError *error, id result))callback;

/**
 *
 */
-(void)timeEntryBookmarks: (NSDictionary *)parameters withCallback: (void (^)(NSError *error, id result))callback;

/**
 *
 */
-(void)currentTrackerWithCallback: (void (^)(NSError *error, id result))callback;

///---------------------------------------------------------------------------------------
/// @name Create
///---------------------------------------------------------------------------------------

/**
 *
 */
-(void)addCustomer: (NSDictionary *)data withCallback: (void (^)(NSError *error, id result))callback;

/**
 *
 */
-(void)addProject: (NSDictionary *)data withCallback: (void (^)(NSError *error, id result))callback;

/**
 *
 */
-(void)addService: (NSDictionary *)data withCallback: (void (^)(NSError *error, id result))callback;

/**
 *
 */
-(void)addTimeEntry: (NSDictionary *)data withCallback: (void (^)(NSError *error, id result))callback;

/**
 *
 */
-(void)startTrackerOnEntry: (NSInteger)timeEntryId withCallback: (void (^)(NSError *error, id result))callback;

///---------------------------------------------------------------------------------------
/// @name Update
///---------------------------------------------------------------------------------------

/**
 *
 */
-(void)updateCustomer: (NSInteger)customerId withData: (NSDictionary *)data callback: (void (^)(NSError *error, id result))callback;

/**
 *
 */
-(void)updateProject: (NSInteger)projectId withData: (NSDictionary *)data callback: (void (^)(NSError *error, id result))callback;

/**
 *
 */
-(void)updateService: (NSInteger)serviceId withData: (NSDictionary *)data callback: (void (^)(NSError *error, id result))callback;

/**
 *
 */
-(void)updateTimeEntry: (NSInteger)timeEntryId withData: (NSDictionary *)data callback: (void (^)(NSError *error, id result))callback;

///---------------------------------------------------------------------------------------
/// @name Destroy
///---------------------------------------------------------------------------------------

/**
 *
 */
-(void)removeCustomer: (NSInteger)customerId withCallback: (void (^)(NSError *error, id result))callback;

/**
 *
 */
-(void)removeProject: (NSInteger)projectId withCallback: (void (^)(NSError *error, id result))callback;

/**
 *
 */
-(void)removeService: (NSInteger)serviceId withCallback: (void (^)(NSError *error, id result))callback;

/**
 *
 */
-(void)removeTimeEntry: (NSInteger)timeEntryId withCallback: (void (^)(NSError *error, id result))callback;

/**
 *
 */
-(void)stopTracker: (NSInteger)trackerId withCallback: (void (^)(NSError *error, id result))callback;

@end
