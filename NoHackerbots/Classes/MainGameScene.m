//
//  HelloWorldScene.m
//  NoHackerbots
//
//  Created by Jake Boxer on 4/15/14.
//  Copyright Jake Boxer 2014. All rights reserved.
//
// -----------------------------------------------------------------------

#import "MainGameScene.h"
#import "IntroScene.h"

// -----------------------------------------------------------------------
#pragma mark - MainGameScene
// -----------------------------------------------------------------------

@interface MainGameScene ()

@property (nonatomic, strong) CCSprite *block;
@property (nonatomic, strong) CCSprite *selectedBlock;

@end

@implementation MainGameScene

@synthesize block;
@synthesize selectedBlock;

// -----------------------------------------------------------------------
#pragma mark - Create & Destroy
// -----------------------------------------------------------------------

+ (MainGameScene *)scene
{
    return [[self alloc] init];
}

// -----------------------------------------------------------------------

- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
    if (!self) return nil;
    
    // Enable touch handling on scene node
    self.userInteractionEnabled = YES;
    
    // Create a colored background (Dark Grey)
    CCNodeColor *background = [CCNodeColor nodeWithColor:[CCColor colorWithRed:0.0 green:0.3f blue:0.0f alpha:1.0f]];
    [self addChild:background z:-2];

//    
//    // Animate sprite with action
//    CCActionRotateBy* actionSpin = [CCActionRotateBy actionWithDuration:1.5f angle:360];
//    [_sprite runAction:[CCActionRepeatForever actionWithAction:actionSpin]];
//    
    // Create a back button
    CCButton *backButton = [CCButton buttonWithTitle:@"[ Menu ]" fontName:@"Verdana-Bold" fontSize:18.0f];
    backButton.positionType = CCPositionTypeNormalized;
    backButton.position = ccp(0.85f, 0.95f); // Top Right of screen
    [backButton setTarget:self selector:@selector(onBackClicked:)];
    [self addChild:backButton];

    // Create the floor
    for (NSInteger row = 0; row < 10; row++) {
        CGFloat yPosition = row * 32.0f;

        for (NSInteger column = 0; column < 10; column++) {
            CGFloat xPosition = column * 32.0f;

            CCSprite *tile = [CCSprite spriteWithImageNamed:@"floor.png"];
            tile.anchorPoint = CGPointZero; // Anchor at the bottom left
            tile.position = ccp(xPosition, yPosition);
            [self addChild:tile];
        }
    }

    // Create the block
    self.block = [CCSprite spriteWithImageNamed:@"block.png"];
    self.block.anchorPoint = CGPointZero; // Anchor at the bottom left
    self.block.position = ccp(9.0f * 32.0f, 4.0f * 32.0f);
    [self addChild:self.block];

    // done
	return self;
}

// -----------------------------------------------------------------------

- (void)dealloc
{
    // clean up code goes here
}

// -----------------------------------------------------------------------
#pragma mark - Enter & Exit
// -----------------------------------------------------------------------

- (void)onEnter
{
    // always call super onEnter first
    [super onEnter];
    
    // In pre-v3, touch enable and scheduleUpdate was called here
    // In v3, touch is enabled by setting userInterActionEnabled for the individual nodes
    // Per frame update is automatically enabled, if update is overridden
    
}

// -----------------------------------------------------------------------

- (void)onExit
{
    // always call super onExit last
    [super onExit];
}

// -----------------------------------------------------------------------
#pragma mark - Touch Handler
// -----------------------------------------------------------------------

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [touch locationInNode:self];

    if (CGRectContainsPoint(self.block.boundingBox, touchLocation)) {
        self.selectedBlock = self.block;
    }
}

- (void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [touch locationInNode:self];

    if (self.selectedBlock != nil) {
        CGFloat newX = touchLocation.x;
        newX = MIN(newX, 9.0f * 32.0f);
        newX = MAX(newX, 0.0f);

        self.selectedBlock.position = ccp(newX, self.selectedBlock.position.y);
    }
}

- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    self.selectedBlock = nil;
}

// -----------------------------------------------------------------------
#pragma mark - Button Callbacks
// -----------------------------------------------------------------------

- (void)onBackClicked:(id)sender
{
    // back to intro scene with transition
    [[CCDirector sharedDirector] replaceScene:[IntroScene scene]
                               withTransition:[CCTransition transitionPushWithDirection:CCTransitionDirectionRight duration:1.0f]];
}

// -----------------------------------------------------------------------
#pragma mark - Map Helpers
// -----------------------------------------------------------------------

@end
