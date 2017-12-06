//
//  Bubble.m
//  BubbleTrouble
//
//  Created by Walter Chan on 8/05/2017.
//  Copyright © 2017 Walter Chan. All rights reserved.
//

#import "Bubble.h"

@implementation Bubble

- (NSString *)spriteName {
    //Sprite Names
    static NSString * const spriteNames[] = {
        @"Red",
        @"Pink",
        @"Green",
        @"Blue",
        @"Black",
        @"Empty", //Empty is included for an empty location.
    };
    
    return spriteNames[self.bubbleType - 1];
}

- (NSString *)poppedSpriteName {
    // Highlights were used initially, but was removed (due to memory errors) and is replaced with shriking bubbles.
    static NSString * const poppedSpriteNames[] = {
        @"RedPop",
        @"PinkPop",
        @"GreenPop",
        @"BluePop",
        @"BlackPop",
        @"EmptyPop",
    };
    
    return poppedSpriteNames[self.bubbleType - 1];
}

- (NSString *)description {
    // Logs the location and type of the bubble.
    // Not really needed, but kept it in as it helped find the bubble initially.
    return [NSString stringWithFormat:@"type:%ld square:(%ld,%ld)", (long)self.bubbleType,
            (long)self.column, (long)self.row];
}

@end
