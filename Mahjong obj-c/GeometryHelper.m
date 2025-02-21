//
//  GeometryHelper.m
//  Mahjong obj-c
//
//  Created by Aleksandr Tsvihun on 19.02.2025.
//

#import "GeometryHelper.h"
#import <CoreGraphics/CoreGraphics.h>

static CGFloat widthBorder = 30;
static int staticNumber = 10;

@implementation GeometryHelper

+ (void)configArrayRandomNumbers:(NSMutableArray *)randomNumbers
                      subNumbers:(NSMutableArray *)subNumbers
{
    subNumbers = [NSMutableArray new];
    for (int i = 0; i < staticNumber; i++) {
        NSNumber *number = [NSNumber numberWithInteger:(arc4random_uniform(staticNumber))];
        if ([randomNumbers containsObject:number]) {
//            i = i - 1;
            i--;
            if ([subNumbers containsObject:number]) {
//                i = i - i;
                i--;
            } else {
                [subNumbers addObject:number];
            }
        } else {
            [randomNumbers addObject:number];
        }
        if ([randomNumbers count] == staticNumber && [subNumbers count] == staticNumber) {
            [randomNumbers addObjectsFromArray:subNumbers];
            return;
        }
    }
}

+ (CGRect)calculateFrameForTile:(CGRect)frameView
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
