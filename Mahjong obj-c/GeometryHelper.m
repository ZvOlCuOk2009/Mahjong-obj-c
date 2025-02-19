//
//  GeometryHelper.m
//  Mahjong obj-c
//
//  Created by Aleksandr Tsvihun on 19.02.2025.
//

#import "GeometryHelper.h"
#import <CoreGraphics/CoreGraphics.h>

static CGFloat widthBorder = 30;

@implementation GeometryHelper

+ (CGRect)calculateTileFrame:(CGRect)frameView;
{
    return CGRectMake(widthBorder, widthBorder, [self calculateWidthForFrame:frameView], [self calculateHeightForFrame:frameView]);
}

+ (CGFloat)calculateWidthForFrame:(CGRect)frameView
{
    return (frameView.size.width - [self retreatFromFrame]) / 4;
}

+ (CGFloat)calculateHeightForFrame:(CGRect)frameView
{
    return (frameView.size.height - [self retreatFromFrame]) / 5;
}

+ (CGFloat)retreatFromFrame
{
    return widthBorder * 2;
}

@end
