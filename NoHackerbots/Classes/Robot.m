//
//  Robot.m
//  NoHackerbots
//
//  Created by Jake Boxer on 4/17/14.
//  Copyright (c) 2014 Jake Boxer. All rights reserved.
//

#import "Robot.h"

@implementation Robot

+ (Robot *)robot {
    return [[self alloc] init];
}

- (id)init {
    self = [super init];
    if (!self) return nil;

    self.sprite = [CCSprite spriteWithImageNamed:@"robot.png"];
    self.sprite.anchorPoint = CGPointZero; // Anchor at the bottom left
}

@end
