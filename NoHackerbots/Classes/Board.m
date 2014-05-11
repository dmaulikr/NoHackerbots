//
//  Board.m
//  NoHackerbots
//
//  Created by Jake Boxer on 5/10/14.
//  Copyright (c) 2014 Jake Boxer. All rights reserved.
//

#import "Board.h"

@implementation Board

+ (Board *)board {
    return [[self alloc] init];
}

- (id)init {
    self = [super init];
    if (!self) return nil;

    return self;
}

#pragma mark Robot movement calculation methods

- (BOOL)robotCanMoveToSquare:(CGPoint)square {
    return NO;
}

- (CGPoint)squareForRobot {
    return CGPointZero;
}

@end
