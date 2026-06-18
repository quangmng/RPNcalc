//
//  CalculatorModel.m
//  RPNcalc
//
//  Created by Quang Minh Nguyen on 13/06/2026.
//  Copyright (c) 2026 Quang Minh Nguyen. All rights reserved.
//

#import "CalculatorModel.h"

// private interface
@interface CalculatorModel()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorModel

@synthesize operandStack = _operandStack;

- (NSMutableArray *)operandStack {
    if (_operandStack == nil) _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}

- (void)setOperandStack:(NSMutableArray *)operandStack {
    _operandStack = operandStack;
}

- (void)pushOperand:(double)operand {
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

- (double)popOperand {
    NSNumber *operandObject = [self.operandStack lastObject];
    if (operandObject) [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}

- (double)performOperation:(NSString *)operation {
    double result = 0;
    
    if ([operation isEqualToString:@"+"]) {
        result = [self popOperand] + [self popOperand];
    } else if ([@"*" isEqualToString:operation]) {
        result = [self popOperand] * [self popOperand];
    }
    // calculate result (add local var to do calc)
    else if ([@"/" isEqualToString:operation]) {
        double divisor = [self popOperand];
        if (divisor) result = [self popOperand] / divisor;
    } else if ([@"-" isEqualToString:operation]) {
        double subtractend = [self popOperand];
        result = [self popOperand] - subtractend;
    }
    
    [self pushOperand:result];
    return result;
}





@end
