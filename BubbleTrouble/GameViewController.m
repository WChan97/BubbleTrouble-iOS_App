//
//  GameViewController.m
//  BubbleTrouble
//
//  Created by Walter Chan on 5/5/17.
//  Copyright © 2017 Walter Chan. All rights reserved.
//

#import "GameViewController.h"
#import "ScoreViewController.h"
#import "MyScene.h"
#import "Level.h"

@interface GameViewController ()

@property (strong, nonatomic) Level *level;
@property (strong, nonatomic) MyScene *scene;

@end

NSUInteger totalScore;
NSUInteger timeLeft;
NSTimer *timer;
NSTimer *refreshBubble;
NSTimer *refreshLabel;

@implementation GameViewController

@synthesize scoreLabel;
@synthesize sentNumber;
@synthesize timeLabel;
@synthesize sentName;
@synthesize nameLabel;



- (void)viewDidLoad {
    [super viewDidLoad];
    SKView *skView = (SKView *)self.view;
    skView.multipleTouchEnabled = NO;
    
    self.scene = [MyScene sceneWithSize:skView.bounds.size];
    self.scene.scaleMode = SKSceneScaleModeAspectFill;
    self.level = [[Level alloc] init];
    self.scene.level = self.level;
    
    [skView presentScene:self.scene];
    [self beginGame];
}

- (void)viewDidUnload {
    [timer invalidate];
    [refreshBubble invalidate];
    [refreshLabel invalidate];
    [self.scene removeAllBubbleSprites];
}

- (void)beginGame {
    nameLabel.text = sentName;
    totalScore = 0;
    timeLeft = [sentNumber intValue];
    
    [self updateLabels];
    [self shuffle];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timekeep) userInfo:nil repeats:YES];
    refreshBubble =[NSTimer scheduledTimerWithTimeInterval:1.75 target:self selector:@selector(reloadBubble) userInfo:nil repeats:YES];
    refreshLabel = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(labelRefresh) userInfo:nil repeats:YES];

}
//Timers
- (void)timekeep {
    timeLeft--;
    if(timeLeft <= 0) {
        [timer invalidate];
        [self.scene removeAllBubbleSprites];
        // When the timer ends. Close the game and remove all the bubbles.
        // Display an alert, and show score.
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Times Up!" message:[NSString stringWithFormat:@"You have scored %li points!", (long)totalScore] preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){;}];[alert addAction: action];
        
        //Present it
        [self presentViewController:alert animated:YES completion:nil]; 
    }
}

- (void)reloadBubble {
    [self shuffle];
    if(timeLeft <= 0) {
        [refreshBubble invalidate];
    }
}

- (void)labelRefresh {
    [self updateLabels];
    if(timeLeft <= 0) {
        [refreshLabel invalidate];
    }
}
//End Timers


- (void)shuffle {
    // Refresh with new bubbles
    [self.scene removeAllBubbleSprites];
    NSSet *newBubbles = [self.level shuffle];
    [self.scene addSpritesForBubbles:newBubbles];
}

- (void)updateLabels {
    // Update the labels in the view.
    self.timeLabel.text = [NSString stringWithFormat:@"%ld", (long)timeLeft];
    totalScore = [self.level sendScore];
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld", (long)totalScore];
}



- (BOOL)shouldAutorotate {
    // Because I used the game template, shifting view and keeping it constant is difficult. So I removed it.
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}
- (IBAction)backButton:(id)sender {
    [timer invalidate];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Segue to Score
    ScoreViewController *destination = segue.destinationViewController;
    destination.sentName = sentName;
    destination.sentNumber = [NSString stringWithFormat:@"%li", (long)totalScore];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
