//
//  BootcampTableViewController.m
//  KIFBootcamp
//
//  Created by DX200 on 12/21/15.
//  Copyright © 2015 PIvotal Labs. All rights reserved.
//

#import "BootcampTableViewController.h"
#import <Parse/Parse.h>
#import "Constants.h"
#import "Pivot.h"
#import "DetailsViewController.h"

@interface BootcampTableViewController ()

@property NSArray *pivots;

@end

@implementation BootcampTableViewController

- (instancetype)init {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"ETT Pivots";
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [self init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class]  forCellReuseIdentifier:@"cellReuse"];
    [self loadPivotsFromParse];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView setAccessibilityLabel:@"Test label"];
    [self setAccessibilityLabel:@"ETT Pivots Page"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pivots.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Pivot *pivot = self.pivots[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuse" forIndexPath:indexPath];
    cell.textLabel.text = pivot.fullName;
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


- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    DetailsViewController *detailViewController = [[DetailsViewController alloc] init];
    
    // Pass the selected object to the new view controller.
    detailViewController.pivot = self.pivots[indexPath.row];
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


#pragma mark - Parse Data

- (Pivot *)pivotFromParseObject:(PFObject *)parseObject {   
    Pivot *pivot = [[Pivot alloc] initWithName:parseObject[kPivotNameKey] projects:parseObject[kPivotProjectsKey] jobTitle:parseObject[kPivotJobKey]];
    return pivot;
}

#pragma mark - Private

- (void)loadPivotsFromParse {
    __weak typeof(self) weakSelf = self;
    PFQuery *query = [PFQuery queryWithClassName:kParseClassPivot];
    [query findObjectsInBackgroundWithBlock:^(NSArray *pivots, NSError *error) {
        NSMutableArray *fetchedPivots = [NSMutableArray array];
        [pivots enumerateObjectsUsingBlock:^(PFObject *pivot, NSUInteger idx, BOOL * _Nonnull stop) {
            Pivot *pivotObject = [self pivotFromParseObject:pivot];
            [fetchedPivots addObject:pivotObject];
        }];
        weakSelf.pivots = fetchedPivots;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
        });
    }];
}


@end
