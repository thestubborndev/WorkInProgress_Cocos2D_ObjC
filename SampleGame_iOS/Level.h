//
//  Level.h
//  SampleGame
//
//  Created by Carlotta Tatti on 28/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Level : NSObject

@property (strong, nonatomic) CCTMXTiledMap *tileMap;
@property (strong, nonatomic) CCTMXLayer *npcLayer;
@property (strong, nonatomic) CCTMXLayer *metadataLayer;
@property (strong, nonatomic) CCTMXLayer *backgroundLayer;
@property (strong, nonatomic) CCTMXObjectGroup *objectsGroup;

@property (strong, nonatomic) NSMutableArray *monsterSpawnPoints;

@property (nonatomic) CGPoint playerSpawnPoint;

- (id)initWithDictionary:(NSDictionary *)levelDict;

- (BOOL)hasProperty:(NSString *)property atTile:(CGPoint)point;

- (CGPoint)tileCoordForPosition:(CGPoint)position;
- (CGPoint)positionForTileCoord:(CGPoint)position;

@end
