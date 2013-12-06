//
//  Character.m
//  SampleGame
//
//  Created by Carlotta Tatti on 02/12/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "Character.h"
#import "LevelManager.h"
#import "Pathfinder.h"

@interface Character ()
@property (strong, nonatomic) NSMutableArray *path;
@property (strong, nonatomic) NSTimer *timer;
@end

@implementation Character

/**
 * @param target The position to move toward
 */
- (void)moveToward:(CGPoint)target {
    Level *level = [[LevelManager sharedInstance] currentLevel];
    CGPoint startTileCoord = [level tileCoordForPosition:self.position];
    
    if ((startTileCoord.x >= 0 && startTileCoord.y >= 0) && (startTileCoord.x < level.tileMap.mapSize.width && startTileCoord.y < level.tileMap.mapSize.height)) {
        if ((target.x >= 0 && target.y >= 0) && (target.x < level.tileMap.mapSize.width && target.y < level.tileMap.mapSize.height)) {
            CCSprite *touchedTile = [level.backgroundLayer tileAt:target];
            touchedTile.color = ccBLUE;
            
            [[Logger sharedInstance] log:[NSString stringWithFormat:@"Start tile coord is: X: %f, Y: %f", startTileCoord.x, startTileCoord.y] sender:self];
            [[Logger sharedInstance] log:[NSString stringWithFormat:@"Target tile coord is: X: %f, Y: %f", target.x, target.y] sender:self];
            
            _path = [NSMutableArray arrayWithArray:[[Pathfinder sharedInstance] findPathFrom:startTileCoord to:target]].mutableCopy;
            _timer = [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(step:) userInfo:nil repeats:YES];
        }
    }
}

/** Perform a step along the generated path */
- (void)step:(NSTimer *)timer {
    Level *level = [[LevelManager sharedInstance] currentLevel];
    
    PathfindingNode *node = _path.lastObject;
    
    CCSprite *tile = [level.backgroundLayer tileAt:ccp(node.x, node.y)];
    tile.color = ccORANGE;
    [_path removeObject:node];
    
    self.position = tile.position;
    
    if (_path.count == 0)
        [_timer invalidate];
}

@end
