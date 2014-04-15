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
#pragma mark - HelloWorldScene
// -----------------------------------------------------------------------

@implementation MainGameScene
{
    CCTiledMap *_map;
}

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

    // Add the map
    _map = [CCTiledMap tiledMapWithFile:@"001.tmx"];
    CGPoint availableSpace = ccp(self.contentSize.width - _map.contentSize.width,
                                 self.contentSize.height - _map.contentSize.height);
    _map.position = ccpMult(availableSpace, 0.5f);
    [self addChild:_map z:-1];

    CCLOG(@"mapSize: %@", NSStringFromCGSize(_map.mapSize));
    CCLOG(@"tileSize: %@", NSStringFromCGSize(_map.tileSize));
    CCLOG(@"scaleFactor: %f", [CCDirector sharedDirector].contentScaleFactor);

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
    CGPoint touchLoc = [touch locationInNode:self];
    
    // Log touch location
    CCLOG(@"Move sprite to @ %@",NSStringFromCGPoint(touchLoc));
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
- (CGPoint)tilePositionFromLocation:(CGPoint)location tileMap:(CCTiledMap *)tileMap
{
    // Get the proper offset for the tilemap position
    CGPoint position = ccpSub(location, tileMap.position);

    CGFloat halfMapWidth = tileMap.mapSize.width * 0.5f;
    CGFloat mapHeight = tileMap.mapSize.height;
    CGFloat mapPointWidth = tileMap.tileSize.width / [CCDirector sharedDirector].contentScaleFactor;
    CGFloat mapPointHeight = tileMap.tileSize.height / [CCDirector sharedDirector].contentScaleFactor;

    CGPoint positionDividedByTileSize = ccp(position.x / mapPointWidth, position.y / mapPointHeight);
    CGFloat inverseTileY = mapHeight - positionDividedByTileSize.y;

    CGFloat tilePositionX = floorf(inverseTileY + positionDividedByTileSize.x - halfMapWidth);
    CGFloat tilePositionY = floorf(inverseTileY - positionDividedByTileSize.x + halfMapWidth);

    // Make sure tile position is within boundaries
    tilePositionX = MAX(0.0f,                       tilePositionX);
    tilePositionX = MIN(tileMap.mapSize.width - 1,  tilePositionX);
    tilePositionY = MAX(0.0f,                       tilePositionY);
    tilePositionY = MIN(tileMap.mapSize.height - 1, tilePositionY);

    return ccp(tilePositionX, tilePositionY);
}
@end
