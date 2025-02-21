//
//  ViewController.m
//  Mahjong obj-c
//
//  Created by Aleksandr Tsvihun on 19.02.2025.
//

#import "ViewController.h"
#import "GeometryHelper.h"
#import "TileViewHelper.h"

@interface ViewController ()

- (IBAction)testButton:(id)sender;

@property (strong, nonatomic) UIView *touchView;

@end

@implementation ViewController

NSMutableArray *randomNumbers;
NSMutableArray *subNumbers;
UIView *firstTile;
UIView *secondTile;
NSInteger firstTap;
NSInteger secondTap;
CGRect firstRectangle;
CGRect secondRectangle;

- (void)viewDidLoad {
    [super viewDidLoad];
    randomNumbers = [NSMutableArray new];
    [GeometryHelper configArrayRandomNumbers:randomNumbers subNumbers:subNumbers];
    [self addTilesToScene];
}

- (void)addTilesToScene
{
    CGRect rectView = [GeometryHelper calculateFrameForTile:self.view.frame];
    
    CGFloat x = 0.0;
    CGFloat y = 0.0;
    [self resetTaps];
    
    for (int i = 0; i < randomNumbers.count; i++) {
        if ((i % 4) == 0) {
            x = rectView.origin.x;
        } else {
            x = x + rectView.size.width;
        }

        if (i < 4) {
            y = rectView.origin.y;
        } else if (((i % 4) == 0 && i == 4) || i == 8 || i == 12 || i == 16) {
            y = y + rectView.size.height;
        } else if ((i % 4) == 0 || i > 4) {
            y = y;
        }
        
        UIView *tileView = [TileViewHelper createTileViewWithNumber:[randomNumbers objectAtIndex:i]
                                                               rect:rectView
                                                              withX:x withY:y];

        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                        initWithTarget:self
                                                        action:@selector
                                                        (tapGestureTap:)];
        [tileView addGestureRecognizer:tapGestureRecognizer];
        [self.view addSubview:tileView];
    }
}

- (void)tapGestureTap:(UITapGestureRecognizer *)gestureTap
{
    UIView *tileView = gestureTap.view;
    self.touchView = tileView;
    tileView.backgroundColor = [UIColor grayColor];
    [self performSelector:@selector(returnColor)
               withObject:nil
               afterDelay:0.1];
    
    [self logicForRemovingTiles:tileView touchView:self.touchView];
}

- (void)logicForRemovingTiles:(UIView *)tileView touchView:(UIView *)touchView
{
    CGRect zeroRect = CGRectMake(0, 0, 0, 0);
    if (CGRectEqualToRect(firstRectangle, zeroRect)) {
        firstRectangle = tileView.frame;
    } else if (CGRectEqualToRect(firstRectangle, tileView.frame)) {
        firstRectangle = tileView.frame;
        return;
    } else {
        firstRectangle = tileView.frame;
    }

    NSString *tag = [NSString stringWithFormat:@"%li", (long)tileView.tag];

    if (firstTile == nil && secondTile == nil) {
        firstTap = [tag integerValue];
        firstTile = tileView;
    } else if (firstTile != nil && firstTap != [tag integerValue]) {
        firstTap = [tag integerValue];
        firstTile = tileView;
    } else if (firstTile != nil && firstTap == [tag integerValue]) {
        secondTap = [tag integerValue];
        secondTile = tileView;
    }

    if (firstTap == secondTap) {
        [firstTile removeFromSuperview];
        [secondTile removeFromSuperview];
        firstRectangle = CGRectMake(0, 0, 0, 0);
        [self resetTaps];
        firstTile = nil;
        secondTile = nil;
        touchView = nil;
    } else if (secondTile != nil) {
        firstTap = [tag integerValue];
        secondTile = nil;
        secondTap = 0;
    }
}

- (void)resetTaps
{
    firstTap = 10000;
    secondTap = 10000;
}

- (void)returnColor
{
    self.touchView.backgroundColor = [UIColor systemIndigoColor];
}

- (IBAction)testButton:(id)sender
{
    for (int i = 0; i < self.view.subviews.count; i++) {
        UIView *view = [self.view.subviews objectAtIndex:i];
        if ([view isKindOfClass:[UIView class]] && ![view isKindOfClass:[UIButton class]]) {
            [view removeFromSuperview];
        }
    }
    [randomNumbers removeAllObjects];
    [subNumbers removeAllObjects];
    [GeometryHelper configArrayRandomNumbers:randomNumbers subNumbers:subNumbers];
    [self addTilesToScene];
}

@end
