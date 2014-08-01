//
//  DJWStarRatingView.m
//  DJWStarRatingView
//
//  Created by Daniel Williams on 12/04/2014.
//  Copyright (c) 2014 Daniel Williams. All rights reserved.
//

#import "DJWStarRatingView.h"

@interface DJWStarRatingView()

@end

@implementation DJWStarRatingView

@synthesize padding = _padding;
@synthesize lineWidth = _lineWidth;

- (instancetype)initWithStarSize:(CGSize)starSize
                   numberOfStars:(NSInteger)numberOfStars
                          rating:(float)rating
                       fillColor:(UIColor *)fillColor
                   unfilledColor:(UIColor *)unfilledColor
                     strokeColor:(UIColor *)strokeColor
{
    if (self = [super initWithFrame:CGRectZero]) {
        _starSize = starSize;
        _numberOfStars = numberOfStars;
        _rating = rating;
        _fillColor = fillColor;
        _unfilledColor = unfilledColor;
        _strokeColor = strokeColor;
        
        _allowsSwipeWhenEditable = YES;
        _allowsTapWhenEditable = YES;
        _allowsHalfIntegralRatings = YES;
        
        self.backgroundColor = [UIColor clearColor];
        self.frame = CGRectMake(0, 0, self.intrinsicContentSize.width, self.intrinsicContentSize.height);
        [self setNeedsDisplay];
        
        [self initializeGestureRecognizers];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initializeGestureRecognizers];
    }
    return self;
}

- (void)initializeGestureRecognizers
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(processGestureRecogniser:)];
    [self addGestureRecognizer:tapGesture];
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(processGestureRecogniser:)];
    [self addGestureRecognizer:panGesture];
}

#pragma mark - Target / Action

- (void)processGestureRecogniser:(UIGestureRecognizer *)gesture
{
    if (!self.editable) return;
    
    if ([gesture isKindOfClass:[UITapGestureRecognizer class]] && !self.allowsTapWhenEditable) return;
    if ([gesture isKindOfClass:[UIPanGestureRecognizer class]] && !self.allowsSwipeWhenEditable) return;
    
    CGPoint point = [gesture locationInView:self];
    self.rating = [self ratingAtPoint:point];
}

- (float)ratingAtPoint:(CGPoint)point
{
    CGFloat x = point.x;
    CGFloat starWidthWithPadding = _starSize.width + self.padding;
    
    CGFloat rating = (x / starWidthWithPadding) + 1;
    CGFloat fractional = fmodf(rating, 1);
    fractional = roundf(fractional * 2.0) / 2.0;
    
    if (!self.allowsHalfIntegralRatings) fractional = 0.5;
    
    rating = (int)rating;
    rating = rating + fractional - 0.5;
    return rating;
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect
{
    CGPoint drawPoint = CGPointMake([self padding], 0);
    
    // Draw Stars
    for (int i = 0; i < self.numberOfStars; i++) {
        CGRect starRect = CGRectMake(drawPoint.x, drawPoint.y, self.starSize.width, self.starSize.height);
        [self drawStarAtPoint:drawPoint inFrame:starRect forStarNumber:i];
        drawPoint.x = drawPoint.x + (self.starSize.width + [self padding]);
    }
}

- (void)drawStarAtPoint:(CGPoint)point inFrame:(CGRect)frame forStarNumber:(NSInteger)starNumber
{
    CGContextRef context = UIGraphicsGetCurrentContext();

    // Star Drawing
    UIBezierPath* starPath = [UIBezierPath bezierPath];
    [starPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.00000 * CGRectGetHeight(frame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.60940 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.34942 * CGRectGetHeight(frame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.97553 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.34549 * CGRectGetHeight(frame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.67702 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.55752 * CGRectGetHeight(frame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.79389 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.90451 * CGRectGetHeight(frame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.68613 * CGRectGetHeight(frame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.20611 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.90451 * CGRectGetHeight(frame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.32298 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.55752 * CGRectGetHeight(frame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.02447 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.34549 * CGRectGetHeight(frame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.39060 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.34942 * CGRectGetHeight(frame))];
    [starPath closePath];
    CGContextSaveGState(context);
    [starPath addClip];
    
    [self gradientFillForStar:CGPathGetBoundingBox(starPath.CGPath) forStarNumber:starNumber];
    CGContextRestoreGState(context);
    
    [self.strokeColor setStroke];
    starPath.lineWidth = self.lineWidth;
    [starPath stroke];
}

- (void)gradientFillForStar:(CGRect)starBounds forStarNumber:(NSInteger)starNumber
{
    CGFloat fillPercentage = [self fillPercentageForStarNumber:starNumber];
    
    UIColor *startColor = self.fillColor;
    UIColor *endColor = self.unfilledColor;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)startColor.CGColor,
                               (id)endColor.CGColor,
                               (id)endColor.CGColor, nil];
    CGFloat gradientLocations[] = {fillPercentage, fillPercentage, fillPercentage};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    CGContextDrawLinearGradient(context, gradient,
                                CGPointMake(CGRectGetMinX(starBounds), CGRectGetMidY(starBounds)),
                                CGPointMake(CGRectGetMaxX(starBounds), CGRectGetMidY(starBounds)),
                                0);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

- (CGFloat)fillPercentageForStarNumber:(NSInteger)starNumber
{
    float star = (float)starNumber + 1;
    if (star <= self.rating) {
        return 1.0;
    } else if ((float)(star - 0.5) == self.rating) {
        return 0.5;
    } else {
        return 0;
    }
}

- (CGSize)intrinsicContentSize
{
    CGSize starSize = self.starSize;
    starSize = CGSizeMake(starSize.width + 1, starSize.width + 1);
    
    CGFloat width = (starSize.width * self.numberOfStars) + ([self padding] * self.numberOfStars);
    
    return CGSizeMake(width, starSize.height);
}

#pragma mark - Getters

- (CGFloat)lineWidth
{
    if (!_lineWidth) {
        _lineWidth = 1.0;
    }
    return _lineWidth;
}

- (CGFloat)padding
{
    if (!_padding) {
        _padding = self.starSize.width / 5.0;
    }
    return _padding;
}

#pragma mark - Setters

- (void)setStarSize:(CGSize)starSize
{
    _starSize = starSize;
    [self setNeedsDisplay];
}

- (void)setNumberOfStars:(NSInteger)numberOfStars
{
    _numberOfStars = numberOfStars;
    [self setNeedsDisplay];
}

- (void)setRating:(float)rating
{
    _rating = rating;
    [self setNeedsDisplay];
}

- (void)setFillColor:(UIColor *)fillColor
{
    _fillColor = fillColor;
    [self setNeedsDisplay];
}

- (void)setStrokeColor:(UIColor *)strokeColor
{
    _strokeColor = strokeColor;
    [self setNeedsDisplay];
}

- (void)setLineWidth:(CGFloat)lineWidth
{
    _lineWidth = lineWidth;
    [self setNeedsDisplay];
}

- (void)setPadding:(CGFloat)padding
{
    _padding = padding;
    [self setNeedsDisplay];
}

@end
