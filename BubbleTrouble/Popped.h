//
//  Popped.h
//  BubbleTrouble
//
//  Created by Walter Chan on 12/5/17.
//  Copyright © 2017 Walter Chan. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class Bubble;

@interface Popped : NSObject

@property (strong, nonatomic, readonly) NSArray *bubbles;

- (void)addBubble:(Bubble *)bubble;

@end
