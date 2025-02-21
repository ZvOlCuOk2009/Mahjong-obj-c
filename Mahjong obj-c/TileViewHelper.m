//
//  TileViewHelper.m
//  Mahjong obj-c
//
//  Created by Aleksandr Tsvihun on 19.02.2025.
//

#import "TileViewHelper.h"

@implementation TileViewHelper

+ (UIView *)createTileViewWithNumber:(NSNumber *)number rect:(CGRect)rect
                               withX:(CGFloat)x withY:(CGFloat)y
{

    UIView *tileView = [[UIView alloc] init];
    tileView.frame = CGRectMake(x, y, rect.size.width, rect.size.height);

    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:tileView.bounds];
    tileView.backgroundColor = [UIColor systemIndigoColor];
    tileView.layer.cornerRadius = 20;
    tileView.layer.shadowColor = [UIColor blackColor].CGColor;
    tileView.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
    tileView.layer.shadowOpacity = 0.5f;
    tileView.layer.shadowPath = shadowPath.CGPath;
    tileView.layer.borderColor = [UIColor whiteColor].CGColor;
    tileView.layer.borderWidth = 2;
    tileView.layer.masksToBounds = NO;
    tileView.tag = [number integerValue];

    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, (rect.size.height / 2) / 2, rect.size.width, rect.size.height / 2);
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:60];
    label.textAlignment = 1;
    [tileView addSubview:label];
    label.text = [number stringValue];;
    return tileView;
}

@end
