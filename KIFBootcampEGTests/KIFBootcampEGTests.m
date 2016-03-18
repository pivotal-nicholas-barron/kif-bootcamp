//
//  KIFBootcampEGTests.m
//  KIFBootcampEGTests
//
//  Created by Pivotal on 2016-03-16.
//  Copyright © 2016 PIvotal Labs. All rights reserved.
//

@import EarlGrey;
#import <XCTest/XCTest.h>

@interface KIFBootcampEGTests : XCTestCase

@end

@implementation KIFBootcampEGTests

- (void)setUp {
    [super setUp];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    id<GREYMatcher> PivotListMatcher = grey_allOf(grey_accessibilityLabel(@"Nicholas Barron"), nil);
    id<GREYMatcher> PivotDetailMatcher = grey_allOf(grey_accessibilityLabel(@"Name Label"), nil);
    [[EarlGrey selectElementWithMatcher:PivotListMatcher] performAction:grey_tap()];
    [[EarlGrey selectElementWithMatcher:PivotDetailMatcher]assertWithMatcher:grey_sufficientlyVisible()];
}

@end
