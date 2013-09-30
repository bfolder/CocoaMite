//
//  CocoaMite.h
//
//  Created by Heiko Dreyer on 09/30/13.
//  Copyright (c) 2013 boxedfolder.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CocoaMite : NSObject

///---------------------------------------------------------------------------------------
/// @name Creating & Setting up CocoaMite Clients
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
/// @name General Methods
///---------------------------------------------------------------------------------------

///---------------------------------------------------------------------------------------
/// @name Retrieving Methods
///---------------------------------------------------------------------------------------

///---------------------------------------------------------------------------------------
/// @name Creating Methods
///---------------------------------------------------------------------------------------

///---------------------------------------------------------------------------------------
/// @name Updating Methods
///---------------------------------------------------------------------------------------

@end
