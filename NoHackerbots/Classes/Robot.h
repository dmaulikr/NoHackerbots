//
//  Robot.h
//  NoHackerbots
//
//  Created by Jake Boxer on 4/17/14.
//  Copyright (c) 2014 Jake Boxer. All rights reserved.
//

#import "GameObject.h"

@interface Robot : GameObject

@property (nonatomic, assign) NSInteger currentRuleIndex;
@property (nonatomic, readonly) NSString *currentRule;
@property (nonatomic, copy) NSArray *rules;

+ (Robot *)robot;

@end
