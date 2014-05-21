//
//  ESTContentViewController.m
//  Estadao
//
//  Created by Natan Rolnik on 22/05/14.
//  Copyright (c) 2014 natanrolnik. All rights reserved.
//

#import "ESTContentViewController.h"
#import <MDCSwipeToChoose/MDCSwipeToChoose.h>
#import "ESTSwipeToChooseView.h"

@interface ESTContentViewController () <MDCSwipeToChooseDelegate>
{
    IBOutlet UIView *esporte1View;
    IBOutlet UIView *esporte2View;
    IBOutlet UIView *politica1View;
    IBOutlet UIView *politica2View;
    IBOutlet UIImageView *fullScreenNews;
    NSDictionary *dictionary;
    CGRect buttonNewsFrame;
    CGRect fullNewsFrame;
}

- (IBAction)expandNews:(id)sender;

@end

@implementation ESTContentViewController

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
    // Do any additional setup after loading the view.

    fullNewsFrame = fullScreenNews.frame;
    fullScreenNews.hidden = YES;
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeNews)];
    [fullScreenNews addGestureRecognizer:tapGestureRecognizer];
    fullScreenNews.userInteractionEnabled = YES;
    
    MDCSwipeToChooseViewOptions *options = [MDCSwipeToChooseViewOptions new];
    options.likedText = nil;
    options.nopeText = nil;
    options.delegate = self;
    options.likedColor = [UIColor clearColor];
    options.nopeColor = [UIColor clearColor];
    [options setOnPan:^(MDCPanState *state){
        [self.view bringSubviewToFront:state.view];
    }];
    
    dictionary = @{@"esporte1": [UIImage imageNamed:@"EsporteArrastar1.jpg"], @"esporte2": [UIImage imageNamed:@"EsporteArrastar2.jpg"], @"politica1": [UIImage imageNamed:@"PoliticaArrastar1.jpg"], @"politica2": [UIImage imageNamed:@"PoliticaArrastar2.jpg"]};
    
    for (NSString *key in [dictionary allKeys]) {
        UIView *backgroundView = [self viewForKey:key];
        backgroundView.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1];
        
        ESTSwipeToChooseView *view = [[ESTSwipeToChooseView alloc] initWithFrame:backgroundView.frame options:options];
        view.imageView.image = [dictionary objectForKey:key];
        view.imageView.contentMode = UIViewContentModeScaleAspectFit;
        view.backgroundView = backgroundView;
        
        [self.view addSubview:view];
    }
}

- (void)view:(UIView *)view wasChosenWithDirection:(MDCSwipeDirection)direction
{
    ESTSwipeToChooseView *swipeView = (ESTSwipeToChooseView *)view;
    [UIView animateWithDuration:0.35 animations:^{
        swipeView.backgroundView.alpha = 0;
    }];
}

- (BOOL)view:(UIView *)view shouldBeChosenWithDirection:(MDCSwipeDirection)direction
{
    [self.view bringSubviewToFront:view];
    
    return YES;
}

- (NSString *)keyForView:(UIView *)view
{
    if (view == esporte1View) {
        return @"esporte1";
    }
    if (view == esporte2View) {
        return @"esporte2";
    }
    if (view == politica1View) {
        return @"politica1";
    }
    if (view == politica2View) {
        return @"politica2";
    }
    
    return nil;
}

- (UIView *)viewForKey:(NSString *)key
{
    if ([@"esporte1" isEqualToString:key]) {
        return esporte1View;
    }
    if ([@"esporte2" isEqualToString:key]) {
        return esporte2View;
    }
    if ([@"politica1" isEqualToString:key]) {
        return politica1View;
    }
    if ([@"politica2" isEqualToString:key]) {
        return politica2View;
    }
    
    return nil;
}

- (IBAction)expandNews:(id)sender
{
    UIButton *buttonSender = sender;
    
    buttonNewsFrame = buttonSender.frame;
    
    [self.view bringSubviewToFront:fullScreenNews];
    
    fullScreenNews.frame = buttonNewsFrame;
    fullScreenNews.hidden = NO;
    fullScreenNews.alpha = 0.5;
    
    [UIView animateWithDuration:0.45 animations:^{
        fullScreenNews.alpha = 1;
        fullScreenNews.frame = fullNewsFrame;
    }];
}

- (void)closeNews
{
    [UIView animateWithDuration:0.45 animations:^{
        fullScreenNews.alpha = 0.5;
        fullScreenNews.frame = buttonNewsFrame;
    } completion:^(BOOL finished) {
        fullScreenNews.alpha = 0;
    }];
}

@end
