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
 *  Creates a new customer. All parameters are optional, except of the name.
 *
 *  'note' -> Default: '' (empty string)
 *  'archived' -> true or false - default: false
 *  'hourly_rate' -> in cent (a hundredth of the base unit, irrespective of the curreny) - default: 0
 *  'hourly_rates_per_service' -> List of rates per service - default: [] (empty array)
 *  'active_hourly_rate' -> nil, hourly_rate or hourly_rates_per_service - default: nil
 */
-(void)addCustomer: (NSDictionary *)data withCallback: (void (^)(NSError *error, id result))callback;

/**
 *  Creates a new project. All parameters are optional, except of the name.
 *
 *  'note' -> Default: '' (empty string)
 *  'budget' -> in minutes or cents (depends on budget_type) - default: 0 (no budget specified
 *  'budget_type' -> minutes (default) or cents
 *  'archived' -> true or false - default: false
 *  'customer_id' -> default: nil
 *  'hourly_rate' -> in cent (a hundredth of the base unit, irrespective of the curreny) - default: 0
 *  'hourly_rates_per_service' -> List of rates per service - default: [] (empty array)
 *  'active_hourly_rate' -> nil, hourly_rate or hourly_rates_per_service - default: nil
 */
-(void)addProject: (NSDictionary *)data withCallback: (void (^)(NSError *error, id result))callback;

/**
 *  Creates a new service. All parameters are optional, except of the name.
 *
 *  'note' -> Default: '' (empty string)
 *  'hourly_rate' -> in cent (a hundredth of the base unit, irrespective of the curreny) - default: nil
 *  'billable' -> true or false - default: false
 *  'archived' -> true or false - default: false
 */
-(void)addService: (NSDictionary *)data withCallback: (void (^)(NSError *error, id result))callback;

/**
 *  Creates a new time entry. All parameters are optional. You can specify the following parameters:
 *  
 *  'date_at' -> Date of the time entry, formatted YYYY-MM-DD. Default: today
 *  'minutes' -> Default: 0
 *  'note' -> Default: '' (empty string)
 *  'user_id' -> This can only be set by administrators or the account owner. Default: ID of the current user
 *  'project_id' -> Default: nil
 *  'service_id' -> Default: nil
 *  'locked' -> This can only be set by administrators or the account owner. Default: false
 *
 *  IMPORTANT: A locked time entry can not be updated or deleted.
 *  Administrators or the account owner can force an update or destruction by passing an force parameter – for example to unlock the entry.
 */
-(void)addTimeEntry: (NSDictionary *)data withCallback: (void (^)(NSError *error, id result))callback;

/**
 *  Starts the time tracker on the time entry with the given ID.
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
 *  Deletes the customer with given id.
 */
-(void)removeCustomer: (NSInteger)customerId withCallback: (void (^)(NSError *error, id result))callback;

/**
 *  Deletes the project with given id.
 */
-(void)removeProject: (NSInteger)projectId withCallback: (void (^)(NSError *error, id result))callback;

/**
 *  Deletes the service with given id.
 */
-(void)removeService: (NSInteger)serviceId withCallback: (void (^)(NSError *error, id result))callback;

/**
 *  Deletes the time entry with given id.
 */
-(void)removeTimeEntry: (NSInteger)timeEntryId withCallback: (void (^)(NSError *error, id result))callback;

/**
 *  Stops tracker on entry with provided id.
 */
-(void)stopTrackerOnEntry: (NSInteger)timeEntryId withCallback: (void (^)(NSError *error, id result))callback;

@end
