//
//  Popped.m
//  BubbleTrouble
//
//  Created by Walter Chan on 12/5/17.
//  Copyright © 2017 Walter Chan. All rights reserved.
//

#import "Popped.h"

@implementation Popped {
    NSMutableArray *_bubbles;
}

- (void)addBubble:(Bubble *)bubble {
    if (_bubbles == nil) {
        _bubbles = [NSMutableArray array];
    }
    [_bubbles addObject:bubble];
}

- (NSArray *)bubbles {
    return _bubbles;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"bubbles:%@", self.bubbles];
}

@end
