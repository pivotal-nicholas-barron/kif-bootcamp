//
//  KIFBootcampTests.m
//  KIFBootcampTests
//
//  Created by Pivotal on 2016-03-08.
//  Copyright © 2016 PIvotal Labs. All rights reserved.
//

#import <KIF/KIF.h>
#import "Nocilla.h"

@interface KIFBootcampTests : KIFTestCase



@end

@implementation KIFBootcampTests

- (void)beforeAll {
    NSLog(@"Starting app, creating static variables and running tests...");
    [[LSNocilla sharedInstance] start];
    [self changeNetworkRequest];
}

- (void) afterAll {
    NSLog(@"Tests finished. Stopping Nocilla...");
    [[LSNocilla sharedInstance] clearStubs];
    [[LSNocilla sharedInstance] stop];
    NSLog(@"Nocilla stopped.");
}

- (void)beforeEach {
    NSLog(@"Starting test");
}

- (void)afterEach {
    if([tester tryFindingViewWithAccessibilityLabel:@"DETAILS" error:noErr]){
        NSLog(@"On Details page, navigating back to home...");
        [tester tapViewWithAccessibilityLabel:@"Navigation"];
    }
}

- (void)test01_whenAPivotIsSelected_thenTitleAndNumProjectsIsShown {
    [tester tapViewWithAccessibilityLabel:@"Nicholas Barron"];
    
    //Job Accessibility label updated for later task
    //[tester waitForViewWithAccessibilityLabel:@"New Hire"];
    [tester waitForViewWithAccessibilityLabel:@"Job Label"];
    
    [tester waitForViewWithAccessibilityLabel:@"0"];
}

- (void)test02_whenEachPivotIsSelectedAndCommentsAreAdded_thenSuccessDialogsAreShown {
    UITableView *table = (UITableView*)[tester waitForViewWithAccessibilityLabel:@"Pivot Table"];
    for(NSIndexPath *cellPath in table.indexPathsForVisibleRows){
        [tester tapRowAtIndexPath:cellPath inTableView:table];
        [tester enterText:@"Test" intoViewWithAccessibilityLabel:@"Comment Field"];
        [tester tapViewWithAccessibilityLabel:@"Submit Button"];
        [tester waitForViewWithAccessibilityLabel:@"Comment Added"];
        [tester tapViewWithAccessibilityLabel:@"OK"];
        [tester tapViewWithAccessibilityLabel:@"Navigation"];
    }
}

- (void)test03_whenPivotIsSelectedUsingObjectMethods_thenDetailsPageIsOpened {
    UITableView *table = (UITableView*)[tester waitForViewWithAccessibilityLabel:@"Pivot Table"];
    [tester tapRowAtIndexPath:[NSIndexPath indexPathForRow:-1 inSection:-1] inTableView:table];
    [tester waitForViewWithAccessibilityLabel:@"DETAILS"];
}

- (void)changeNetworkRequest {
    //Test with 500 for KIFBootcamp
    stubRequest(@"GET", @"https://api.parse.com").andReturn(500);
}
@end
