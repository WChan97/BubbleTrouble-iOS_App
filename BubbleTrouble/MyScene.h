//
//  MyScene.h
//  BubbleTrouble
//
//  Created by Walter Chan on 8/05/2017.
//  Copyright © 2017 Walter Chan. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class Level;
// MyScene is in Level.m

@interface MyScene : SKScene

@property (strong, nonatomic) Level *level;
// Declare Level, as a level for Scene.

// These add and remove child nodes for the sprites.
- (void)addSpritesForBubbles:(NSSet *)bubbles;
- (void)removeAllBubbleSprites;

@end
