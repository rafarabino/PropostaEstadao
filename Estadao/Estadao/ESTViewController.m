//
//  ESTViewController.m
//  Estadao
//
//  Created by Natan Rolnik on 19/05/14.
//  Copyright (c) 2014 natanrolnik. All rights reserved.
//

#import "ESTViewController.h"
#import "AMSmoothAlertView.h"
#import "ESTChooseSectionsViewController.h"

@interface ESTViewController ()
{
    BOOL firstDidAppear;
}
@end

@implementation ESTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    firstDidAppear = YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    AMSmoothAlertView *alert = [[AMSmoothAlertView alloc] initDropAlertWithTitle:@"Mudamos!" andText:@"Vamos escolher o portal de notícias que é a sua cara?" andCancelButton:YES forAlertType:AlertInfo];
    [alert setCompletionBlock:^(AMSmoothAlertView *alertView, UIButton *button){
        if ([[button titleForState:UIControlStateNormal] isEqualToString:@"Começar"]) {
            [self startMan];
        }
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alert show];
    });
}

- (void)startMan
{
    [self performSegueWithIdentifier:@"ChooseSections" sender:nil];
}

@end