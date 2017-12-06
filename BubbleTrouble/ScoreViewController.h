//
//  ScoreViewController.h
//  BubbleTrouble
//
//  Created by Walter Chan on 16/05/2017.
//  Copyright © 2017 Walter Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
//{
//    IBOutlet UIPickerView *spicker;
//    NSDictionary *players;
//    NSArray *names;
//    NSArray *score;
//}

@property (nonatomic, weak) UIPickerView *spicker;

//Originally I intended to place a plist into a Picker, but I don't have the time.
//@property (nonatomic, retain) NSDictionary *players;
//@property (nonatomic, retain) NSArray *names;
//@property (nonatomic, retain) NSArray *score;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) NSString *sentName;
@property (weak, nonatomic) NSString *sentNumber;

@end
