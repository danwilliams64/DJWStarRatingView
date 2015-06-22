//
//  DJWViewController.m
//  DJWStarRatingView
//
//  Created by Daniel Williams on 12/04/2014.
//  Copyright (c) 2014 Daniel Williams. All rights reserved.
//

#import "DJWViewController.h"

@interface DJWViewController ()

@property (nonatomic, assign) UILabel *starRatingValue;

@end

@implementation DJWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
     
    DJWStarRatingView *anotherStarRatingView = [[DJWStarRatingView alloc] initWithStarSize:CGSizeMake(40, 40) numberOfStars:5 rating:2.0 fillColor:[UIColor whiteColor] unfilledColor:[UIColor clearColor] strokeColor:[UIColor whiteColor]];
    [self.view addSubview:anotherStarRatingView];
    anotherStarRatingView.center = self.view.center;
    anotherStarRatingView.editable = YES;
    anotherStarRatingView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    anotherStarRatingView.delegate = self;
    
    UILabel *starRatingValue = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width / 2 - 100, self.view.bounds.size.height / 2 + 20, 200, 40) ];
    [self.view addSubview:starRatingValue];
    starRatingValue.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    self.starRatingValue = starRatingValue;
    self.starRatingValue.textColor = [UIColor whiteColor];
    self.starRatingValue.textAlignment = NSTextAlignmentCenter;
}

- (void)djwStarRatingChangedValue:(DJWStarRatingView *)view
{
    self.starRatingValue.text = [NSString stringWithFormat:@"Value updated to %.1f", view.rating];
}

@end
