//
//  MyScene.m
//  BubbleTrouble
//
//  Created by Walter Chan on 8/05/2017.
//  Copyright © 2017 Walter Chan. All rights reserved.
//
//
//
// References:
// 1# https://www.raywenderlich.com/66877/how-to-make-a-game-like-candy-crush-part-1
// This site was used to assist me in the creation of Bubble Trouble.
// 2# https://www.youtube.com/watch?v=lRmuxppYQ4o&list=PLfWck3bE7kW9iDy3x8VhrDLYy4UjVvyfY
// This helped me in creating a timer

#import "MyScene.h"
#import "Bubble.h"
#import "Level.h"

static const CGFloat TileWidth = 100.0;
static const CGFloat TileHeight = 120.0;

@interface MyScene ()

@property (strong, nonatomic) SKNode *gameLayer;
@property (strong, nonatomic) SKNode *bubblesLayer;
@property (assign, nonatomic) NSInteger tapFromColumn;
@property (assign, nonatomic) NSInteger tapFromRow;
@property (strong, nonatomic) SKSpriteNode *selectionSprite;

@end

@implementation MyScene

- (void)didMoveToView: (SKView *)view {
    self.anchorPoint = CGPointMake(0.5, 0.5);
    //Background
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"Background"];
    [self addChild:background];
    //Bubbles
    self.gameLayer = [SKNode node];
    [self addChild:self.gameLayer];
    CGPoint layerPosition = CGPointMake(-TileWidth*NumColumns/2, -TileHeight*NumRows/2);
    self.bubblesLayer = [SKNode node];
    self.bubblesLayer.position = layerPosition;
    [self.gameLayer addChild:self.bubblesLayer];
    //Hightlight
    self.tapFromColumn = self.tapFromRow = NSNotFound;
    self.selectionSprite = [SKSpriteNode node];
}

- (void)addSpritesForBubbles:(NSSet *)bubbles {
    for (Bubble *bubble in bubbles) {
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:[bubble spriteName]];
        //This sometimes gets an "Thread 1: EXC_BAD_ACCESS (code=1, address=0x100)
        //C'mon, I can figure it out, I got this.
        //It appears when I tap too fast.
        //It also appears when there are too many bubbles to create.
        //At the same time, it rarely appears on Xcode 8.
        
        sprite.position = [self pointForColumn:bubble.column row:bubble.row];
        [self.bubblesLayer addChild:sprite];
        bubble.sprite = sprite;
        bubble.sprite.alpha = 0;
        bubble.sprite.xScale = bubble.sprite.yScale = 0.5;
        [bubble.sprite runAction:[SKAction sequence:@[
                                                      [SKAction waitForDuration:0.05 withRange:0.15],
                                                      [SKAction group:@[[SKAction fadeInWithDuration:0.1],
                                                                        [SKAction scaleTo:1.75 duration:0.1]]]]]];
    }
}

- (void)removeAllBubbleSprites {
    [self.bubblesLayer removeAllChildren];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self.bubblesLayer];
    NSInteger column, row;
    
    if ([self convertPoint:location toColumn:&column row:&row]) {
        Bubble *bubble = [self.level bubbleAtColumn:column row:row];
        
        if (bubble != nil) {
            
            [self.level calculateScore:bubble.bubbleType];
            [self showSelectionIndicatorForBubble:bubble];
            self.tapFromColumn = column;
            self.tapFromRow = row;
            [self.level removeBubble:column row:row];
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.selectionSprite.parent != nil && self.tapFromColumn != NSNotFound) {
        [self hideSelectionIndicator];
    }
    
    self.tapFromColumn = self.tapFromRow = NSNotFound;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchesEnded:touches withEvent:event];
}

- (void)showSelectionIndicatorForBubble:(Bubble *)bubble {
    if (self.selectionSprite.parent != nil) {
        [self.selectionSprite removeFromParent];
    }
    
    // Below used to handle Highlighting sprites, It was used to assist me in the construction of popping the bubbles.
    //SKTexture *texture = [SKTexture textureWithImageNamed:[bubble poppedSpriteName]];
    //self.selectionSprite.size = texture.size;
    //[self.selectionSprite runAction:[SKAction setTexture:texture]];
    //[bubble.sprite addChild:self.selectionSprite];
    //self.selectionSprite.alpha = 1.0;
    // End Highlight
    
    if (bubble.sprite != nil) {
        SKAction *scaleAction = [SKAction scaleTo:0.1 duration:0.2];
        scaleAction.timingMode = SKActionTimingEaseOut;
        [bubble.sprite runAction:[SKAction sequence:@[scaleAction, [SKAction removeFromParent]]]];
    }
    
    bubble.sprite = nil;
}

- (void)hideSelectionIndicator {
    [self.selectionSprite runAction:[SKAction sequence:@[
    [SKAction fadeOutWithDuration:0.1],
    [SKAction removeFromParent]]]];
}

- (CGPoint)pointForColumn:(NSInteger)column row:(NSInteger)row {
    return CGPointMake(column*TileWidth + TileWidth/2, row*TileHeight + TileHeight/2);
}

- (BOOL)convertPoint:(CGPoint)point toColumn:(NSInteger *)column row:(NSInteger *)row {
    NSParameterAssert(column);
    NSParameterAssert(row);
    
    if (point.x >= 0 && point.x < NumColumns*TileWidth &&
        point.y >= 0 && point.y < NumRows*TileHeight) {
        
        *column = point.x / TileWidth;
        *row = point.y / TileHeight;
        return YES;
        
    }
    else {
        *column = NSNotFound;
        *row = NSNotFound;
        return NO;
    }
}

@end
