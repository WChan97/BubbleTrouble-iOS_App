//
//  MainViewController.m
//  BubbleTrouble
//
//  Created by Walter Chan on 15/05/2017.
//  Copyright © 2017 Walter Chan. All rights reserved.
//

#import "MainViewController.h"
#import "GameViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize nameEnter;
@synthesize sliderTime;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)sliderTimeChanged:(id)sender{
    //Change SliderLables value.
    _sliderLabel.text =[NSString stringWithFormat:@"Time: %.fs", self.sliderTime.value];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Segue for GameViewController
    // I found that it segues to all the other view though, so that's an issue.
    GameViewController *destination = segue.destinationViewController;
    destination.sentName = nameEnter.text;
    destination.sentNumber = [NSString stringWithFormat:@"%.f", self.sliderTime.value];
}

@end
