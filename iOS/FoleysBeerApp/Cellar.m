//
//  Cellar.m
//  FoleysBeerApp
//
//  Created by Caius Durling on 08/10/2011.
//  Copyright 2011 Swedishcampground Software. All rights reserved.
//

#import "Cellar.h"

@interface Cellar ()

@property (retain, readwrite) NSArray *stock;
@property (retain, readwrite) NSArray *selectedStock;

@end

@implementation Cellar

@synthesize stock = _stock,
            selectedStock = _selectedStock;

- (id)init
{
    self = [super init];
    if (self) {
      self.stock = [NSMutableArray array];
      self.selectedStock = [NSMutableArray array];
    }
    
    return self;
}

@end
