//
//  Pivot.h
//  KIFBootcamp
//
//  Created by DX200 on 12/21/15.
//  Copyright © 2015 PIvotal Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pivot : NSObject

@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSNumber *projectsLeading;
@property (nonatomic, strong) NSString *jobTitle;

- (instancetype)initWithName:(NSString *)name
                    projects:(NSNumber *)projectsLeading
                    jobTitle:(NSString *)jobTitle;


@end
