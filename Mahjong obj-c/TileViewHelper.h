//
//  TileViewHelper.h
//  Mahjong obj-c
//
//  Created by Aleksandr Tsvihun on 19.02.2025.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TileViewHelper : NSObject

+ (UIView *)createTileView:(int)i number:(NSNumber *)number rect:(CGRect)rect
                     withX:(CGFloat)x withY:(CGFloat)y;

@end

NS_ASSUME_NONNULL_END
