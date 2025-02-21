//
//  GeometryHelper.h
//  Mahjong obj-c
//
//  Created by Aleksandr Tsvihun on 19.02.2025.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GeometryHelper : NSObject

+ (void)configArrayRandomNumbers:(NSMutableArray *)randomNumbers
                      subNumbers:(NSMutableArray *)subNumbers;
+ (CGRect)calculateFrameForTile:(CGRect)frame;
+ (CGFloat)retreatFromFrame;

@end

NS_ASSUME_NONNULL_END
