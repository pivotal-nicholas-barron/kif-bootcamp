//
//  KIFBootcampTests.m
//  KIFBootcampTests
//
//  Created by Pivotal on 2016-03-08.
//  Copyright © 2016 PIvotal Labs. All rights reserved.
//

#import <KIF/KIF.h>

@interface KIFBootcampTests : KIFTestCase

@end

@implementation KIFBootcampTests

- (void)beforeEach {
    }

- (void)afterEach {
}

- (void)test01_whenAPivotIsSelected_thenTitleAndNumProjectsIsShown {
    [tester tapViewWithAccessibilityLabel:@"Nicholas Barron"];
    [tester waitForViewWithAccessibilityLabel:@"New Hire"];
    [tester waitForViewWithAccessibilityLabel:@"0"];
}

- (void)test02_whenEachPivotIsSelectedAndCommentsAreAdded_thenSuccessDialogsAreShown {
    UINavigationItem *pivotPageNavItem = (UINavigationItem*)[tester waitForViewWithAccessibilityLabel:@"ETT Pivots Page"];
    UITableView *table = (UITableView*)[tester waitForViewWithAccessibilityLabel:@"Test label"];
    for(NSIndexPath *cellPath in table.indexPathsForVisibleRows){
        [tester tapRowAtIndexPath:cellPath inTableView:table];
        [tester enterText:@"Test" intoViewWithAccessibilityLabel:@"Comment Field"];
        [tester tapViewWithAccessibilityLabel:@"Submit Button"];
        [tester waitForViewWithAccessibilityLabel:@"Comment Added"];
        [tester tapViewWithAccessibilityLabel:@"OK"];
        [tester tapViewWithAccessibilityLabel:pivotPageNavItem.title];
    }
}

@end
