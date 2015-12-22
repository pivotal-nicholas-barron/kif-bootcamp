//
//  Pivot.m
//  KIFBootcamp
//
//  Created by DX200 on 12/21/15.
//  Copyright © 2015 PIvotal Labs. All rights reserved.
//

#import "Pivot.h"

@implementation Pivot

- (instancetype)initWithName:(NSString *)name {
    Pivot *pivot = [super init];
    if (pivot) {
        pivot.fullName = name;
    }
    return pivot;
}

@end
