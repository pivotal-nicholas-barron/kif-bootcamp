//
//  Pivot.m
//  KIFBootcamp
//
//  Created by DX200 on 12/21/15.
//  Copyright © 2015 PIvotal Labs. All rights reserved.
//

#import "Pivot.h"

@implementation Pivot

- (instancetype)initWithName:(NSString *)name
                    projects:(NSNumber *)projectsLeading
                    jobTitle:(NSString *)jobTitle {
    Pivot *pivot = [super init];
    if (pivot) {
        pivot.fullName = name;
        pivot.projectsLeading = projectsLeading;
        pivot.jobTitle = jobTitle;
    }
    return pivot;
}

@end
