# DJWStarRatingView

A view that represents a given rating using stars. Uses custom drawing to allow their appearance at any size. The view also allows for editing, using either tapping, panning, or both.

## Demo

![Screenshot](https://raw.githubusercontent.com/danwilliams64/DJWStarRatingView/master/Screenshots/DJWStarRatingView.gif)

## Usage

Create a new instance of DJWStarRatingView, utilising the designated initialiser:

```objective-c
- (instancetype)initWithStarSize:(CGSize)starSize
                   numberOfStars:(NSInteger)numberOfStars
                          rating:(float)rating
                       fillColor:(UIColor *)fillColor
                   unfilledColor:(UIColor *)unfilledColor
                     strokeColor:(UIColor *)strokeColor;
```

```rating``` value's decimal part can either be ```.0``` or ```.5```.



## Installation

Simply add `DJWStarRatingView` to your Podfile if you're using Cocoapods. Alternatively, add `DJWStarRatingView.h` and `DJWStarRatingView.m` to your project. Included in this repository is a demo application, showing the project in action.
