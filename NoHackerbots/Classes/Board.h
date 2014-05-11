//
//  Board.h
//  NoHackerbots
//
//  Created by Jake Boxer on 5/10/14.
//  Copyright (c) 2014 Jake Boxer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Board : NSObject

@property (nonatomic, copy) NSArray *tileSprites;

+ (Board *)board;
- (BOOL)robotCanMoveToSquare:(CGPoint)square;
- (CGPoint)squareForRobot;

@end
