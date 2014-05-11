//
//  Board.m
//  NoHackerbots
//
//  Created by Jake Boxer on 5/10/14.
//  Copyright (c) 2014 Jake Boxer. All rights reserved.
//

#import "cocos2d.h"
#import "cocos2d-ui.h"

#import "Board.h"


@implementation Board

@synthesize tileSprites;

+ (Board *)board {
    return [[self alloc] init];
}

- (id)init {
    self = [super init];
    if (!self) return nil;

    NSInteger boardWidth = 10;
    NSInteger boardHeight = 10;

    NSMutableArray *sprites = [NSMutableArray arrayWithCapacity:boardWidth * boardHeight];

    // Create the tile sprites for the floor
    for (NSInteger row = 0; row < boardHeight; row++) {
        CGFloat yPosition = row * 32.0f;

        for (NSInteger column = 0; column < boardWidth; column++) {
            CGFloat xPosition = column * 32.0f;

            CCSprite *tile = [CCSprite spriteWithImageNamed:@"floor.png"];
            tile.anchorPoint = CGPointZero; // Anchor at the bottom left
            tile.position = ccp(xPosition, yPosition);
            [sprites addObject:tile];
        }
    }

    self.tileSprites = sprites;

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
