//
//  MainViewController.h
//  BubbleTrouble
//
//  Created by Walter Chan on 15/05/2017.
//  Copyright © 2017 Walter Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UISlider *sliderTime;
@property (weak, nonatomic) IBOutlet UITextField *nameEnter;

@end
