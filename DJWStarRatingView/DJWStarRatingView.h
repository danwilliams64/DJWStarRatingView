//
//  DJWStarRatingView.h
//  DJWStarRatingView
//
//  Created by Daniel Williams on 12/04/2014.
//  Copyright (c) 2014 Daniel Williams. All rights reserved.
//

@import UIKit;

@interface DJWStarRatingView : UIView

/**
 *  The individual size for each star.
 */
@property (nonatomic, assign) CGSize starSize;

/**
 *  The total number of stars to show.
 */
@property (nonatomic, assign) NSInteger numberOfStars;

/**
 *  The rating for the view to display. E.g. `3.0` or `4.5`. Fractional component must be either `0` or `5`.
 */
@property (nonatomic, assign) float rating;

/**
 *  The fill color of the stars.
 */
@property (nonatomic, strong) UIColor *fillColor;

/**
 *  The unfilled color of the stars.
 */
@property (nonatomic, strong) UIColor *unfilledColor;

/**
 *  The color of the star's stroke.
 */
@property (nonatomic, strong) UIColor *strokeColor;

/**
 *  The width of the stroke around the stars. Defaults to `1.0`.
 */
@property (nonatomic, assign) CGFloat lineWidth;

/**
 *  The space between each star. Defaults to 5 percent of the width alocated to each star.
 */
@property (nonatomic, assign) CGFloat padding;

/**
 *  If `YES` the user can change the rating by tapping on the view.
 */
@property (nonatomic, assign) BOOL editable;

/**
 *  Allow the user to change the rating by tapping, if the view's editable property is `YES`. Defaults to `YES`.
 */
@property (nonatomic, assign) BOOL allowsTapWhenEditable;

/**
 *  Allow the user to change the rating by swiping, if the view's editable property is `YES`. Defaults to `YES`.
 */
@property (nonatomic, assign) BOOL allowsSwipeWhenEditable;

/**
 *  An instance of DJWStarRatingView. The designated initializer for this class.
 *
 *  @param starSize      size of individual star
 *  @param numberOfStars total number of stars for the view to display
 *  @param rating        rating to display
 *  @param fillColor     color to fill the stars
 *  @param strokeColor   color to stroke the outline of the stars
 *
 *  @return DJWStarRatingView instance.
 */
- (instancetype)initWithStarSize:(CGSize)starSize
                   numberOfStars:(NSInteger)numberOfStars
                          rating:(float)rating
                       fillColor:(UIColor *)fillColor
                   unfilledColor:(UIColor *)unfilledColor
                     strokeColor:(UIColor *)strokeColor;

@end
