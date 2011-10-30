//
//  Cellar.h
//  FoleysBeerApp
//
//  Created by Caius Durling on 08/10/2011.
//  Copyright 2011 Swedishcampground Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cellar : NSObject

@property (retain, readonly) NSArray *stock;
@property (retain, readonly) NSArray *selectedStock;

@end
