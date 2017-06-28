//
//  SweetsViewController.m
//  SweetsSdk
//
//  Created by vast-z on 06/27/2017.
//  Copyright (c) 2017 vast-z. All rights reserved.
//

#import "SweetsViewController.h"
#import "SweetsSdk.h"


@interface SweetsViewController ()

@end

@implementation SweetsViewController

@synthesize tokenTextView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"ViewDidAppear");
    NSString* retMsg = [SweetsSdk getReturnMsg];
    if(retMsg) {
        NSLog(@"Sweets return message: %@", retMsg);
    }
}

- (IBAction)clickEvent:(id)sender {
    [self presentViewController: [SweetsSdk sweetsViewControllerWithToken:[tokenTextView text]] animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
