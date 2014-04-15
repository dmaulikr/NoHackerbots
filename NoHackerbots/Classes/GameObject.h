//
//  GameObject.h
//  NoHackerbots
//
//  Created by Jake Boxer on 4/15/14.
//  Copyright (c) 2014 Jake Boxer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameObject : NSObject

@property (nonatomic, strong) CCSprite *sprite;

+ (GameObject *)gameObject;

@end
