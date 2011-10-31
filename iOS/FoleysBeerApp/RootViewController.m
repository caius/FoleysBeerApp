//
//  RootViewController.m
//  FoleysBeerApp
//
//  Created by Caius Durling on 01/10/2011.
//  Copyright 2011 Swedishcampground Software. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

@synthesize beers = _beers;
@synthesize drunkBeers = _drunkBeers;

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.drunkBeers = [NSMutableArray array];
  
  [[LRResty client] get:FoleyBeerJSONURL withBlock:^(LRRestyResponse *r) {
//    NSLog(@"Got google, %@", [r asString]);
    NSLog(@"Got json response");
    
    NSDictionary *data = [NSDictionary dictionaryWithJSONString:[r asString] error:nil];
    self.beers = [data objectForKey:@"current"];
    NSLog(@"%d beers saved", [self.beers count]);
    
    [self.tableView reloadData];
    
//    NSLog(@"Table row height: %@", self.tableView.rowHeight);
      
  }];
  
}

- (IBAction) clearSelections:(id)sender
{
  
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
  return self.beers.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSLog(@"cellForRowAtIndexPath");
  static NSString *CellIdentifier = @"Cell";

  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
  }

  // Configure the cell.
  NSDictionary *beer = [self.beers objectAtIndex:indexPath.row];
  if (beer) {
    // Figure out if it's already been selected
//    if ([self.drunkBeers indexOfObject:[beer objectForKey:@"beer"]] != NSNotFound) {
//      [beer setValue:[NSNumber numberWithBool:YES] forKey:@"drunk"];
//    }
    
//    if ([[beer objectForKey:@"drunk"] isEqualToNumber:[NSNumber numberWithBool:YES]]) {
//      [[cell textLabel] setTextColor:[UIColor blueColor]];
//    }
    
    NSString *beerName = [NSString stringWithFormat:@"%@ - %@", [beer objectForKey:@"brewer"], [beer objectForKey:@"beer"]];
    NSString *beerSummary = [NSString stringWithFormat:@"%@", [beer objectForKey:@"abv"]];
    [[cell textLabel] setText:beerName];
    [[cell detailTextLabel] setText:beerSummary];
    
    [[cell imageView] setImage:[self emptyPintImage]];
    [[cell imageView] setHighlightedImage:[self fullPintImage]];
  }
    
  return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *c = [self.tableView cellForRowAtIndexPath:indexPath];
  if ([[[c textLabel] textColor] isEqual:[UIColor blueColor]]) {
    [[c textLabel] setTextColor:[UIColor blackColor]];
    [[c imageView] setHighlighted:NO];
  } else {
    [[c textLabel] setTextColor:[UIColor blueColor]];
    [[c imageView] setHighlighted:YES];
  }
  
  [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
  
//  [self.tableView reloadData];
}

- (UIImage*) emptyPintImage
{
  return [UIImage imageNamed:@"empty_pint_glass.png"];
}

- (UIImage*) fullPintImage
{
  return [UIImage imageNamed:@"full_pint_glass.png"];
}

@end
