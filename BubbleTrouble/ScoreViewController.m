//
//  ScoreViewController.m
//  BubbleTrouble
//
//  Created by Walter Chan on 16/05/2017.
//  Copyright © 2017 Walter Chan. All rights reserved.
//

#import "ScoreViewController.h"

@interface ScoreViewController () {
    NSArray *_spicker;
}

@end

@implementation ScoreViewController

@synthesize sentNumber;
@synthesize sentName;
@synthesize spicker;

//For Plist, unable to do, because of time constraints.
//@synthesize players;
//@synthesize names;
//@synthesize score;

- (void)viewDidLoad {
    [super viewDidLoad];
    //Filled the Picker View with Data.
    _spicker = @[@"Walter - 100", @"Walter - 64", @"Placeholder - 58", @"ForFinalProject - 42", @"NotWalter - 2", @"DidntTry - 0"];
    self.spicker.dataSource = self;
    self.spicker.delegate = self;
    
    //Following is Unused Picker code.
//    NSBundle *bundle = [NSBundle mainBundle];
//    NSString *plistPath =[bundle pathForResource:@"score" ofType:@"plist"];
//    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
//    self.players=dictionary;
//    [dictionary release];
//    NSArray *component = [self.players allKeys];
//    NSArray *sorted =[component sortedArrayUsingSelector:@selector(compare:)];
//    self.score=sorted;
//    NSString *selectedName = [self.names objectAtIndex:0];
//    NSArray *array = [players objectForKey:selectedName];
//    self.score = array;

    //Set current name, with current score.
    _nameLabel.text = sentName;
    _scoreLabel.text = sentNumber;
    // Do any additional setup after loading the view.
}

- (NSString *)pathOfFile {
    // I also tried to use NSUserDefault, but I also didn't have the time to research.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [paths objectAtIndex:0];
    return [documentFolder stringByAppendingString:@"score.plist"];
}

- (void)applicationWillTermimate:(NSNotification *)notification {
    // Also part of NSUserDefault
    NSMutableArray *array = [[NSMutableArray alloc]init];
    [array writeToFile:[self pathOfFile] atomically:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Below is Default Picker View Code.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    // Part of Picker View
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _spicker.count;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _spicker[row];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
