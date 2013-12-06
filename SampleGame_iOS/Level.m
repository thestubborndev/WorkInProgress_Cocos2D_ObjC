//
//  Level.m
//  SampleGame
//
//  Created by Carlotta Tatti on 28/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "Level.h"

@interface Level()
@end

@implementation Level

- (id)initWithDictionary:(NSDictionary *)levelDict {
    self = [super init];
    if (self) {
        self.tileMap = [CCTMXTiledMap tiledMapWithTMXFile:levelDict[@"mapName"]];
        
        _objectsGroup = [_tileMap objectGroupNamed:@"PlayerSpawnPoint"];
        NSAssert(_objectsGroup != nil, @"tile map has no 'PlayerSpawnPoint' object layer");

        _backgroundLayer = [_tileMap layerNamed:@"Background"];
        NSAssert(_backgroundLayer != nil, @"tile map has no 'Background' layer");
        
        _npcLayer = [_tileMap layerNamed:@"NPC"];
        NSAssert(_npcLayer != nil, @"tile map has no 'NPC' layer");
        
        _metadataLayer = [_tileMap layerNamed:@"Metadata"];
        NSAssert(_metadataLayer != nil, @"tile map has no 'Metadata' layer");
        _metadataLayer.visible = NO;
        
        NSDictionary *spawnPointDict = [_objectsGroup objectNamed:@"SpawnPoint"];
        int x = [spawnPointDict[@"x"] intValue];
        int y = [spawnPointDict[@"y"] intValue];
        self.playerSpawnPoint = ccp(x, y);
        
        CCTMXObjectGroup *monsterSpawnPointsGroup = [_tileMap objectGroupNamed:@"MonsterSpawnPoints"];
        NSAssert(_objectsGroup != nil, @"tile map has no 'MonsterSpawnPoints' object layer");
        self.monsterSpawnPoints = monsterSpawnPointsGroup.objects;
    }
    return self;
}

- (BOOL)hasProperty:(NSString *)property atTile:(CGPoint)point {
    int tileGid;
    if ([property isEqual:kPropertyCollidable]) {
        tileGid = [self.metadataLayer tileGIDAt:point];
    }
    
    if ([property isEqual:kPropertyNPC]) {
        tileGid = [self.npcLayer tileGIDAt:point];
    }
    
    if (tileGid) {
        CCSprite *tile = [self.metadataLayer tileAt:point];
        tile.color = ccORANGE;
        NSDictionary *properties = [self.tileMap propertiesForGID:tileGid];
        if (properties) {
            NSString *p = properties[property];
            if (p && [p isEqualToString:@"true"]) {
                return YES;
            }
        }
    }
    
    return NO;
}

/**
 * Given a point on the map, returns the tile coordinate for that point.
 */
- (CGPoint)tileCoordForPosition:(CGPoint)position {
    int x = position.x / (_tileMap.tileSize.width);
    int y = ((_tileMap.mapSize.height * _tileMap.tileSize.height) - position.y) / (_tileMap.tileSize.height);
    return ccp(x, y);
}

/**
 * Given a tile coordinate, returns the position on screen
 */
- (CGPoint)positionForTileCoord:(CGPoint)tileCoord {
    int x = (tileCoord.x * _tileMap.tileSize.width) + _tileMap.tileSize.width;
    int y = (_tileMap.mapSize.height * _tileMap.tileSize.height) - (tileCoord.y * _tileMap.tileSize.height) - _tileMap.tileSize.height;
    return ccp(x, y);
}

@end
