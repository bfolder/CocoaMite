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
 *  Username - Returns nil if none is set.
 */
@property (nonatomic, readonly, strong) NSString *username;

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
-(id)initWithUsername: (NSString *)username password: (NSString *)password subdomain: (NSString *)subdomain;

///---------------------------------------------------------------------------------------
/// @name Retrieve
///---------------------------------------------------------------------------------------

/**
 *
 */
-(void)currentAccountWithCallback: (void (^)(NSError *error, NSDictionary *result))callback;

/**
 *
 */
-(void)currentUserWithCallback: (void (^)(NSError *error, NSDictionary *result))callback;

/**
 *
 */
-(void)customers: (NSDictionary *)filters withCallback: (void (^)(NSError *error, NSDictionary *result))callback;

/**
 *
 */
-(void)projects: (NSDictionary *)filters withCallback: (void (^)(NSError *error, NSDictionary *result))callback;

/**
 *
 */
-(void)services: (NSDictionary *)filters withCallback: (void (^)(NSError *error, NSDictionary *result))callback;

/**
 *
 */
-(void)timeEntries: (NSDictionary *)filters withCallback: (void (^)(NSError *error, NSDictionary *result))callback;

/**
 *
 */
-(void)timeEntryBookmarks: (NSDictionary *)filters withCallback: (void (^)(NSError *error, NSDictionary *result))callback;

/**
 *
 */
-(void)currentTrackerWithCallback: (void (^)(NSError *error, NSDictionary *result))callback;

///---------------------------------------------------------------------------------------
/// @name Create
///---------------------------------------------------------------------------------------

/**
 *
 */
-(void)addCustomer: (NSDictionary *)data withCallback: (void (^)(NSError *error, NSDictionary *result))callback;

/**
 *
 */
-(void)addProject (NSDictionary *)data withCallback: (void (^)(NSError *error, NSDictionary *result))callback;

/**
 *
 */
-(void)addService: (NSDictionary *)data withCallback: (void (^)(NSError *error, NSDictionary *result))callback;

/**
 *
 */
-(void)addTimeEntry: (NSDictionary *)data withCallback: (void (^)(NSError *error, NSDictionary *result))callback;

/**
 *
 */
-(void)startTrackerOnEntry: (NSInteger)timeEntryId withCallback: (void (^)(NSError *error, NSDictionary *result))callback;

///---------------------------------------------------------------------------------------
/// @name Update
///---------------------------------------------------------------------------------------

/**
 *
 */
-(void)updateCustomer: (NSInteger)customerId withData: (NSDictionary *)data andCallback: (void (^)(NSError *error, NSDictionary *result))callback;

/**
 *
 */
-(void)updateProject: (NSInteger)projectId withData: (NSDictionary *)data andCallback: (void (^)(NSError *error, NSDictionary *result))callback;

/**
 *
 */
-(void)updateService (NSInteger)serviceId withData: (NSDictionary *)data andCallback: (void (^)(NSError *error, NSDictionary *result))callback;

/**
 *
 */
-(void)updateTimeEntry: (NSInteger)timeEntryId withData: (NSDictionary *)data andCallback: (void (^)(NSError *error, NSDictionary *result))callback;


///---------------------------------------------------------------------------------------
/// @name Destroy
///---------------------------------------------------------------------------------------

/**
 *
 */
-(void)removeCustomer: (NSInteger)customerId withData: (NSDictionary *)data andCallback: (void (^)(NSError *error, NSDictionary *result))callback;

/**
 *
 */
-(void)removeProject: (NSInteger)projectId withData: (NSDictionary *)data andCallback: (void (^)(NSError *error, NSDictionary *result))callback;

/**
 *
 */
-(void)removeService: (NSInteger)serviceId withData: (NSDictionary *)data andCallback: (void (^)(NSError *error, NSDictionary *result))callback;

/**
 *
 */
-(void)removeTimeEntry: (NSInteger)timeEntryId withData: (NSDictionary *)data andCallback: (void (^)(NSError *error, NSDictionary *result))callback;

/**
 *
 */
-(void)stopTracker: (NSInteger)trackerId withCallback: (void (^)(NSError *error, NSDictionary *result))callback;

@end
