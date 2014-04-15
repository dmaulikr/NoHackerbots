//
//  GameObject.m
//  NoHackerbots
//
//  Created by Jake Boxer on 4/15/14.
//  Copyright (c) 2014 Jake Boxer. All rights reserved.
//

#import "GameObject.h"

@implementation GameObject

@synthesize sprite;

+ (GameObject *)gameObject
{
    return [[self alloc] init];
}

@end
