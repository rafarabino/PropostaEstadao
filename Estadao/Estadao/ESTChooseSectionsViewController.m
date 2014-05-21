//
//  ESTChooseSectionsViewController.m
//  Estadao
//
//  Created by Natan Rolnik on 21/05/14.
//  Copyright (c) 2014 natanrolnik. All rights reserved.
//

#import "ESTChooseSectionsViewController.h"
#import <MDCSwipeToChoose/MDCSwipeToChoose.h>

@interface ESTChooseSectionsViewController () <MDCSwipeToChooseDelegate>

@end

@implementation ESTChooseSectionsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for (UIView *subview in [self.view subviews]) {
        if (subview.tag == 5) {
            subview.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1];
        }
    }
    
    MDCSwipeToChooseViewOptions *options = [MDCSwipeToChooseViewOptions new];
    options.likedText = @"Sim";
    options.likedColor = [UIColor colorWithRed:0.01 green:0.43 blue:0.72 alpha:1];
    options.nopeColor = [UIColor colorWithRed:0.69 green:0.24 blue:0.16 alpha:1];
    options.nopeText = @"Não";
    options.delegate = self;
    
    NSArray *cartões = @[@"CartaoEsportes", @"CartaoInternacional", @"CartaoPolitica"];
    
    for (int i = 0; i < [cartões count]; i++) {
        NSString *nome = cartões[i];
        MDCSwipeToChooseView *view = [[MDCSwipeToChooseView alloc] initWithFrame:CGRectMake(204, 160, 360, 275) options:options];
        view.imageView.image = [UIImage imageNamed:nome];
        view.imageView.contentMode = UIViewContentModeScaleAspectFit;
        view.tag = i;
        
        [self.view addSubview:view];
    }
    
    self.view.clipsToBounds = YES;
}

// This is called then a user swipes the view fully left or right.
- (void)view:(UIView *)view wasChosenWithDirection:(MDCSwipeDirection)direction {
    if (view.tag == 0) {
        [self performSegueWithIdentifier:@"ContentApprove" sender:nil];
    }
}

@end
