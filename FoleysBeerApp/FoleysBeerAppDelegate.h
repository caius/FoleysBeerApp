//
//  FoleysBeerAppAppDelegate.h
//  FoleysBeerApp
//
//  Created by Caius Durling on 01/10/2011.
//  Copyright 2011 Swedishcampground Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Cellar;

@interface FoleysBeerAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain, readonly) Cellar *cellar;

@end
