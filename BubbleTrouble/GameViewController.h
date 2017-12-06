//
//  GameViewController.h
//  BubbleTrouble
//
//  Created by Walter Chan on 5/5/17.
//  Copyright © 2017 Walter Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <GameplayKit/GameplayKit.h>

@interface GameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) NSString *sentName;
@property (weak, nonatomic) NSString *sentNumber;

- (void) shuffle;

@end
