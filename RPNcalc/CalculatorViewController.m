//
//  CalculatorViewController.m
//  RPNcalc
//
//  Created by Quang Minh Nguyen on 13/06/2026.
//  Copyright (c) 2026 Quang Minh Nguyen. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorModel.h"

@interface CalculatorViewController()
@property (nonatomic, strong) CalculatorModel *model;
@property (nonatomic) BOOL userIsEnteringNumber;
@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize userIsEnteringNumber = _userIsEnteringNumber;
@synthesize model = _model;

- (CalculatorModel *)model {
    if (!_model) _model = [[CalculatorModel alloc] init];
    return _model;
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = [sender currentTitle];
    
//    UILabel *myDisplay = self.display;
//    NSString *currentText = self.display.text;
//    NSString *newText = [currentText stringByAppendingString:digit];
//    myDisplay.text = newText;
    
    if (self.userIsEnteringNumber){
        self.display.text = [self.display.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.userIsEnteringNumber = YES;
    }
    
//    NSLog(@"digit pressed = %@", digit);
}
- (IBAction)enterPressed {
    [self.model pushOperand:[self.display.text doubleValue]];
    self.userIsEnteringNumber = NO;
}

- (IBAction)operationPressed:(UIButton *)sender {
    if (self.userIsEnteringNumber) [self enterPressed];
    double result = [self.model performOperation:sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    self.display.text = resultString;
}




@end
