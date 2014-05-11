//
//  Robot.m
//  NoHackerbots
//
//  Created by Jake Boxer on 4/17/14.
//  Copyright (c) 2014 Jake Boxer. All rights reserved.
//

#import "Board.h"
#import "Robot.h"

@implementation Robot

@synthesize currentRuleIndex;
@synthesize rules;

+ (Robot *)robot {
    return [[self alloc] init];
}

- (id)init {
    self = [super init];
    if (!self) return nil;

    self.sprite = [CCSprite spriteWithImageNamed:@"robot.png"];
    self.sprite.anchorPoint = CGPointZero; // Anchor at the bottom left

    self.rules = @[@"Can go forward."];
    self.currentRuleIndex = 0;

    return self;
}

- (NSString *)currentRule {
    return [self.rules objectAtIndex:self.currentRuleIndex];
}

- (CGPoint)nextSquareOnBoard:(Board *)board {
    // We want to ask where the robot's first choice to move next would be.
    // If it's not valid, ask the next choice. Repeat until a valid move is
    // discovered, or all moves for the rule are invalid.
    //
    // Once all moves for the current rule are invalid, proceed to the next
    // rule. Repeat above.
    //
    // If the last rule has all invalid moves, the robot is stuck and loses.

    CGPoint nextSquare = ccpAdd([board squareForRobot], ccp(0, 1));

    if (![board robotCanMoveToSquare:nextSquare]) {
        nextSquare = CGPointZero;
    }

    return nextSquare;
}

@end
