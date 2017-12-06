//
//  Bubble.h
//  BubbleTrouble
//
//  Created by Walter Chan on 8/05/2017.
//  Copyright © 2017 Walter Chan. All rights reserved.
//

@import SpriteKit;

static const NSUInteger NumBubbleTypes = 6;

@interface Bubble : NSObject

@property (assign, nonatomic) NSInteger column;
@property (assign, nonatomic) NSInteger row;
@property (assign, nonatomic) NSUInteger bubbleType;
@property (strong, nonatomic) SKSpriteNode *sprite;

- (NSString *)spriteName;
- (NSString *)poppedSpriteName;

@end
