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
 *  Retrieves your account
 */
-(void)currentAccountWithCallback: (void (^)(NSError *error, id result))callback;

/**
 *  Retrieves the user signed in to the mite.api at the moment.
 */
-(void)currentUserWithCallback: (void (^)(NSError *error, id result))callback;

/**
 *  Retrieves all Customers sorted by name.
 *  Customers can not be edited by time trackers. Time trackers can only read customers of projects they were granted access to.
 *
 *  You can limit the output by using the parameters 'id', 'name', 'limit' or 'page'.
 */
-(void)customersWithParameters: (NSDictionary *)parameters archived: (BOOL)yesNo callback: (void (^)(NSError *error, id result))callback;

/**
 *  Retrieves all Projects sorted by name.
 *  Projects can not be edited by time trackers. Time trackers can only read projects they were granted access to.
 *
 *  You can limit the output by using the parameters 'id', 'name', 'limit' or 'page'.
 */
-(void)projectsWithParameters: (NSDictionary *)parameters archived: (BOOL)yesNo callback: (void (^)(NSError *error, id result))callback;

/**
 *  Retrieves all Services sorted by name.
 *  Services can not be edited by time trackers. Time trackers can only read projects they were granted access to.
 *
 *  You can limit the output by using the parameters 'id', 'name', 'limit' or 'page'.
 */
-(void)servicesWithParameters: (NSDictionary *)parameters archived: (BOOL)yesNo callback: (void (^)(NSError *error, id result))callback;

/**
 *  Retrieves all Users sorted by name.
 *  This resource can be read by all users except time trackers. 
 *  And, unlike other objects, users can only be read, not created or edited over the mite.api.
 *
 *  You can limit the output by using the parameters 'id', 'name', 'limit' or 'page'.
 */
-(void)usersWithParameters: (NSDictionary *)parameters archived: (BOOL)yesNo callback: (void (^)(NSError *error, id result))callback;

/**
 *  Retrieves all time entries for all users, sorted in reverse chronological order ('date_at').
 *  A user of role time tracker can only access his own time entries.
 * 
 *  Time entries can be filtered with the following parameters (As key/value pairs in the dictionary):
 *
 *  'id' -> Retrieve a single customer
 *  'customer_id' -> ID of the customer
 *  'project_id' -> ID of the project
 *  'service_id' -> ID of the service
 *  'user_id' -> ID of the user
 *  'billable' -> true or false
 *  'note' -> Search within the notes of time entries
 *  'at' -> today, yesterday, this_week, last_week, this_month, last_month or dates formatted YYYY-MM-DD
 *  'from', 'to' -> both formatted YYYY-MM-DD
 *  'locked' -> true or false
 *
 *  They can also grouped by the parameter 'grouped_by' with values 'customer', 'project', 'service', 'user', 'day', 'week', 'month' or 'year'.
 */
-(void)timeEntriesWithParameters: (NSDictionary *)parameters callback: (void (^)(NSError *error, id result))callback;

/**
 *  Retrieves all bookmarks, sorted by name.
 *  
 *  The parameter 'id' retrieves a single bookmark
 */
-(void)timeEntryBookmarksWithParameters: (NSDictionary *)parameters callback: (void (^)(NSError *error, id result))callback;

/**
 *  Retrieves the current time tracker.
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
