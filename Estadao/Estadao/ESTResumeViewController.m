//
//  ESTResumeViewController.m
//  Estadao
//
//  Created by Natan Rolnik on 22/05/14.
//  Copyright (c) 2014 natanrolnik. All rights reserved.
//

#import "ESTResumeViewController.h"

@interface ESTResumeViewController ()

- (IBAction)cancel:(id)sender;

@end

@implementation ESTResumeViewController

- (IBAction)cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
