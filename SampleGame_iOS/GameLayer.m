//
//  GameLayer.m
//  SampleGame
//
//  Created by Carlotta Tatti on 28/11/13.
//  Copyright 2013 Carlotta Tatti. All rights reserved.
//

#import "GameLayer.h"
#import "PathfindingNode.h"
#import "Pathfinder.h"
#import "Player.h"
#import "LevelManager.h"
#import "QuestManager.h"
#import "SimpleAudioEngine.h"
#import "Sorter.h"

@interface GameLayer()
@property (strong, nonatomic) Level *level;
@property (strong, nonatomic) Player *player;
@property (strong, nonatomic) QuestManager *questManager;
@end

@implementation GameLayer {
    CGSize winSize;
}

// on "init" you need to initialize your instance
- (id)init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
    self = [super init];
	if (self) {
		winSize = [[CCDirector sharedDirector] winSize];
        
        self.touchMode = kCCTouchesOneByOne;
        self.touchEnabled = YES;
        
        self.level = [[LevelManager sharedInstance] currentLevel];
        [self addChild:self.level.tileMap z:-1];

        self.player = [[Player alloc] init];
        self.player.position = self.level.playerSpawnPoint;
        [self addChild:self.player];

        self.questManager = [[QuestManager alloc] init];
        
        [self scheduleUpdate];
    }
	return self;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    return YES;
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [touch locationInView: [touch view]];
    touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
    touchLocation = [self convertToNodeSpace:touchLocation];
    
    [[Logger sharedInstance] log:[NSString stringWithFormat:@"Mouse click at X: %f Y: %f", touchLocation.x, touchLocation.y] sender:self];
    
    CGPoint tileCoord = [self.level tileCoordForPosition:touchLocation];
    [self.player moveToward:tileCoord];
}

- (void)setViewpointCenter:(CGPoint)position {
    int x = MAX(position.x, winSize.width / 2);
    int y = MAX(position.y, winSize.height / 2);
    x = MIN(x, (_level.tileMap.mapSize.width * _level.tileMap.tileSize.width)
            - winSize.width / 2);
    y = MIN(y, (_level.tileMap.mapSize.height * _level.tileMap.tileSize.height)
            - winSize.height/2);
    CGPoint actualPosition = ccp(x, y);
    
    CGPoint centerOfView = ccp(winSize.width/2, winSize.height/2);
    CGPoint viewPoint = ccpSub(centerOfView, actualPosition);
    self.position = viewPoint;
}

#pragma mark -
#pragma mark Update methods

- (void)update:(ccTime)delta {
    [self setViewpointCenter:self.player.position];
}

@end
