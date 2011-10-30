//
//  RootViewController.h
//  FoleysBeerApp
//
//  Created by Caius Durling on 01/10/2011.
//  Copyright 2011 Swedishcampground Software. All rights reserved.
//

#import <UIKit/UIKit.h>

#define FoleyBeerJSONURL @"http://mrfoleys.caius.name/index.json"

@interface RootViewController : UITableViewController

@property (copy) NSArray *beers;
@property (assign) NSMutableArray *drunkBeers;

@end
