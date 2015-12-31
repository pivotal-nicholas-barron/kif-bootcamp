//
//  DetailsViewController.m
//  KIFBootcamp
//
//  Created by DX200 on 12/21/15.
//  Copyright © 2015 PIvotal Labs. All rights reserved.
//

#import "DetailsViewController.h"
#import "Pivot.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobLabel;
@property (weak, nonatomic) IBOutlet UILabel *projectsLabel;

@end

@implementation DetailsViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"DETAILS";
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameLabel.text = self.pivot.fullName;
    self.jobLabel.text = self.pivot.jobTitle;
    self.projectsLabel.text = [NSString stringWithFormat:@"%@", self.pivot.projectsLeading ];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
