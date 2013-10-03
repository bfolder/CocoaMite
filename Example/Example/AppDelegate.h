//
//  AppDelegate.h
//  Example
//
//  Created by Heiko Dreyer on 30.09.13.
//  Copyright (c) 2013 boxedfolder.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CocoaMite;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic, readonly) CocoaMite *client;
@property (strong, nonatomic) UIWindow *window;

@end
