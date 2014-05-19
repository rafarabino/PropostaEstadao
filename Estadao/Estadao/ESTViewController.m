//
//  ESTViewController.m
//  Estadao
//
//  Created by Natan Rolnik on 19/05/14.
//  Copyright (c) 2014 natanrolnik. All rights reserved.
//

#import "ESTViewController.h"
#import "AMSmoothAlertView.h"
#import <MDCSwipeToChoose/MDCSwipeToChoose.h>

@interface ESTViewController () <MDCSwipeToChooseDelegate>
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
    
    if (firstDidAppear) {
        AMSmoothAlertView *alert = [[AMSmoothAlertView alloc] initDropAlertWithTitle:@"Bem-vindo!" andText:@"Ao novo Estadão! Vamos escolher o portal de notícias que é a sua cara?" andCancelButton:YES forAlertType:AlertInfo];
        [alert setCompletionBlock:^(AMSmoothAlertView *alertView, UIButton *button){
            if ([[button titleForState:UIControlStateNormal] isEqualToString:@"Começar"]) {
                [self startMan];
            }
        }];
        
        [alert show];
        firstDidAppear = NO;
    }

}

- (void)startMan
{
    MDCSwipeToChooseViewOptions *options = [MDCSwipeToChooseViewOptions new];
    options.likedText = @"Sim";
    options.likedColor = [UIColor blueColor];
    options.nopeColor = [UIColor redColor];
    options.nopeText = @"Não";
    options.delegate = self;
    
    NSArray *cartões = @[@"CartaoEsportes", @"CartaoInternacional", @"CartaoPolitica"];
    
    for (int i = 0; i < [cartões count]; i++) {
        NSString *nome = cartões[i];
        MDCSwipeToChooseView *view = [[MDCSwipeToChooseView alloc] initWithFrame:CGRectMake(210, 200, 350, 200)
                                                                         options:options];
        view.imageView.image = [UIImage imageNamed:nome];
        view.imageView.contentMode = UIViewContentModeScaleAspectFit;
        view.tag = i;
        
        [self.view addSubview:view];
    }
}

// This is called then a user swipes the view fully left or right.
- (void)view:(UIView *)view wasChosenWithDirection:(MDCSwipeDirection)direction {
    if (view.tag == 0) {
        NSLog(@"Finished");
    }
}


@end
