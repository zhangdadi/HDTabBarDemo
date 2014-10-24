//
//  CViewController.m
//  ZTabbarDemo
//
//  Created by 张达棣 on 14-5-22.
//  Copyright (c) 2014年 张达棣. All rights reserved.
//

#import "CViewController.h"

@interface CViewController ()

@end

@implementation CViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"%@", self.tabBarController);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
