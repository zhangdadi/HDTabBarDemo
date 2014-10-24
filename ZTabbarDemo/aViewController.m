//
//  aViewController.m
//  ZTabbarDemo
//
//  Created by 张达棣 on 14-5-21.
//  Copyright (c) 2014年 张达棣. All rights reserved.
//

#import "aViewController.h"
#import "ZTabbarController.h"
#import "CViewController.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface aViewController ()

@end

@implementation aViewController

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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"aViewController=dealloc");
}


- (IBAction)buttonClick:(id)sender {
    [self presentViewController:[[CViewController alloc] init] animated:YES completion:nil];
}




@end
