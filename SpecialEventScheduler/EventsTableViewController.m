//
//  EventsTableViewController.m
//  SpecialEventScheduler
//
//  Created by Nathan Bisson on 2015-02-25.
//  Copyright (c) 2015 Nathan Bisson. All rights reserved.
//

#import "EventsTableViewController.h"
#import "Schedule.h"
#import "NewViewController.h"//;

@interface EventsTableViewController ()

@end

@implementation EventsTableViewController

-(IBAction)unwindCancel:(UIStoryboardSegue *)segue {
    NewViewController *source = [segue sourceViewController];
    Schedule *item = source.eventItem;
    
    if(item != nil) {
        [self.eventItems addObject:item];
        [self.tableView reloadData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.eventItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)loadInitialData {
    Schedule *event1 = [[Schedule alloc] init];
    event1.eventName = @"My Event";
    event1.eventDescription = @"A Cool Event";
    event1.eventDate = [NSDate date];
    [self.eventItems addObject:event1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.eventItems count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    Schedule *eventItem = [self.eventItems objectAtIndex:indexPath.row];
    
    //CREATE A MESSAGE STRING WITH THE DESC AND DATE!!!
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    NSString *dateString = [dateFormatter stringFromDate:eventItem.eventDate];
    NSString *alertMessageOne = [eventItem.eventDescription stringByAppendingString:@"\n Date: "];
    NSString *alertMessageTwo = [alertMessageOne stringByAppendingString:dateString];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:eventItem.eventName message:alertMessageTwo delegate:self cancelButtonTitle:@"Close" otherButtonTitles:@"Yes", nil];
    [alert show];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    Schedule *eventItem = [self.eventItems objectAtIndex:indexPath.row];
    
    
    NSLog(@"%@",eventItem.eventName);
    NSLog(@"%@",eventItem.eventDescription);
    NSLog(@"%@",eventItem.eventDate);
    cell.textLabel.text = eventItem.eventName;
    cell.detailTextLabel.text = eventItem.eventDescription;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
