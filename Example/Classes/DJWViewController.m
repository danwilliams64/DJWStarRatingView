//
//  DJWViewController.m
//  DJWStarRatingView
//
//  Created by Daniel Williams on 12/04/2014.
//  Copyright (c) 2014 Daniel Williams. All rights reserved.
//

#import "DJWViewController.h"
#import "DJWStarRatingView.h"

@interface DJWViewController ()

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
}

@end
