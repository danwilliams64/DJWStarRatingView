//
//  DJWViewController.m
//  DJWStarRatingView
//
//  Created by Daniel Williams on 12/04/2014.
//  Copyright (c) 2014 Daniel Williams. All rights reserved.
//

#import "DJWViewController.h"

@interface DJWViewController ()

@property (nonatomic, assign) UILabel *starRatingValueFromDelegate;

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
    
    
    UILabel *starRatingValueFromBlock = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width / 2 - 310 / 2, self.view.bounds.size.height / 2 + 20, 310, 40) ];
    [self.view addSubview:starRatingValueFromBlock];
    starRatingValueFromBlock.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    starRatingValueFromBlock.textColor = [UIColor whiteColor];
    starRatingValueFromBlock.textAlignment = NSTextAlignmentCenter;
    
    anotherStarRatingView.ratingChanged = ^(float newValue) {
        starRatingValueFromBlock.text = [NSString stringWithFormat:@"Block: Value updated to %.1f", newValue];
    };

    anotherStarRatingView.delegate = self;
    
    UILabel *starRatingValueFromDelegate = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width / 2 - 310 / 2, self.view.bounds.size.height / 2 + 40, 310, 40) ];
    [self.view addSubview:starRatingValueFromDelegate];
    starRatingValueFromDelegate.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    self.starRatingValueFromDelegate = starRatingValueFromDelegate;
    self.starRatingValueFromDelegate.textColor = [UIColor whiteColor];
    self.starRatingValueFromDelegate.textAlignment = NSTextAlignmentCenter;
}

- (void)djwStarRatingChangedValue:(DJWStarRatingView *)view
{
    self.starRatingValueFromDelegate.text = [NSString stringWithFormat:@"Delegate: Value updated to %.1f", view.rating];
}

@end
