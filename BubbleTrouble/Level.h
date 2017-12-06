//
//  Level.h
//  BubbleTrouble
//
//  Created by Walter Chan on 8/05/2017.
//  Copyright © 2017 Walter Chan. All rights reserved.
//

#import "Bubble.h"
#import "MainViewController.h"

// The main reason I couldn't implement Max Bubbles, is because the values below are static, and unchangable.
// Thus I am unable to change the grid that the bubbles reside in.
static const NSInteger NumColumns = 3;
static const NSInteger NumRows = 5;

@interface Level : NSObject

- (NSSet *)shuffle;

- (Bubble *)bubbleAtColumn:(NSInteger)column row:(NSInteger)row;

- (void)removeBubble:(NSInteger)column row:(NSInteger)row;

- (void)calculateScore:(NSInteger)bubbleType;

- (NSInteger)sendScore;

@end
