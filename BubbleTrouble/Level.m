//
//  Level.m
//  BubbleTrouble
//
//  Created by Walter Chan on 8/05/2017.
//  Copyright © 2017 Walter Chan. All rights reserved.
//

#import "Level.h"
#import "MainViewController.h"

@implementation Level {
    // Implement the bubble object
    Bubble *_bubbles[NumColumns][NumRows];
}

NSInteger combo = 99;
NSInteger score;

- (Bubble *)bubbleAtColumn:(NSInteger)column row:(NSInteger)row {
    NSAssert1(column >= 0 && column < NumColumns, @"Invalid column: %ld", (long)column);
    NSAssert1(row >= 0 && row < NumRows, @"Invalid row: %ld", (long)row);
    // Find out what the bubble is at this location
    return _bubbles[column][row];
}

- (NSSet *)shuffle {
    return [self createInitialBubbles];
}

- (NSSet *)createInitialBubbles {
    NSMutableSet *set = [NSMutableSet set];
    //Create a set for bubbles
    for (NSInteger row = 0; row < NumRows; row++) {
        //Create for each row
        for (NSInteger column = 0; column < NumColumns; column++) {
            //Create for each column of row
            NSInteger generator = arc4random_uniform(200);
            // Generates a number from 1-200;
            NSUInteger bubbleType = 0;
            if (generator > 0 && generator <= 40) {
                bubbleType = 1;
                //Red
            }
            else if (generator > 40 && generator <= 70) {
                bubbleType = 2;
                //Pink
            }
            else if (generator > 70 && generator <= 85) {
                bubbleType = 3;
                //Green
            }
            else if (generator > 85 && generator <= 95) {
                bubbleType = 4;
                //Blue
            }
            else if (generator > 95 && generator <= 100) {
                bubbleType = 5;
                //Black
            }
            else if (generator > 100 && generator <= 200) {
                bubbleType = 6;
                //Empty Bubble
            }
            //Create that bubble, and set it.
            Bubble *bubble = [self createBubbleAtColumn:column row:row withType:bubbleType];
            [set addObject:bubble];
        }
    }
    //After creating it, return the set of bubbles.
    return set;
}

- (Bubble *)createBubbleAtColumn:(NSInteger)column row:(NSInteger)row withType:(NSUInteger)bubbleType {
    Bubble *bubble = [[Bubble alloc] init];
    bubble.bubbleType = bubbleType;
    bubble.column = column;
    bubble.row = row;
    _bubbles[column][row] = bubble;
    //Combine the location with the bubble type.
    return bubble;
}

- (void)removeBubble:(NSInteger)column row:(NSInteger)row {
    // Remove the bubble that was fed in.
    Bubble *bubble = [[Bubble alloc] init];
    bubble.bubbleType = 0;
    bubble.column = column;
    bubble.row = row;
    _bubbles[column][row] = nil;
}

- (void)calculateScore:(NSInteger)bubbleType {
    //Red
    //Pink
    //Green
    //Blue
    //Black
    // Empty is missing because nothing should happen if you tap it.
    if (bubbleType == 1) {
        if (combo != 1) {
            score = score + 1;
        }
        else {
            score = score + 2;
        }
        combo = 1;
    }
    if (bubbleType == 2) {
        if (combo != 2) {
            score = score + 2;
        }
        else {
            score = score + 3;
        }
        combo = 2;
    }
    if (bubbleType == 3) {
        if (combo != 3) {
            score = score + 5;
        }
        else {
            score = score + 8;
        }
        combo = 3;
    }
    if (bubbleType == 4) {
        if (combo != 4) {
            score = score + 8;
        }
        else {
            score = score + 12;
        }
        combo = 4;
    }
    if (bubbleType == 5) {
        if (combo != 5) {
            score = score + 10;
        }
        else {
            score = score + 15;
        }
        combo = 5;
    }
}

- (NSInteger)sendScore {
    return score;
}

@end
