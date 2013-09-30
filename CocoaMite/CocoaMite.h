//
//  CocoaMite.h
//
//  Created by Heiko Dreyer on 09/30/13.
//  Copyright (c) 2013 boxedfolder.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CocoaMite : NSObject

///---------------------------------------------------------------------------------------
/// @name Creating CocoaMite Clients
///---------------------------------------------------------------------------------------

/**
 * Creates a new CocoaMite instance from an existing API Key.
 */
-(id)initWithApiKey: (NSString *)apiKey;

/**
 * Creates a new CocoaMite instance from an active username and password.
 */
-(id)initWithUsername: (NSString *)username password: (NSString *)password;

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
