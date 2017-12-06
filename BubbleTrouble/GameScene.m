//
//  GameScene.m
//  BubbleTrouble
//
//  Created by Walter Chan on 5/5/17.
//  Copyright © 2017 Walter Chan. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene {
    SKShapeNode *_spinnyNode;
    SKLabelNode *_label;
}

- (void)didMoveToView:(SKView *)view {
    // Setup your scene here
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"Background.png"];
    [self addChild:background];
    background.position = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
}

-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end
