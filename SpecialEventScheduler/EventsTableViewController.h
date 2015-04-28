//
//  EventsTableViewController.h
//  SpecialEventScheduler
//
//  Created by Nathan Bisson on 2015-02-25.
//  Copyright (c) 2015 Nathan Bisson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsTableViewController : UITableViewController

@property NSMutableArray *eventItems;

- (IBAction)unwindCancel:(UIStoryboardSegue *)segue;

@end
