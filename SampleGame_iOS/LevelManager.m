//
//  LevelManager.m
//  SampleGame
//
//  Created by Carlotta Tatti on 28/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "LevelManager.h"

@interface LevelManager ()
@property (strong, nonatomic) NSArray *allLevels;
@property (nonatomic) NSUInteger currentLevelIndex;
@end

@implementation LevelManager

+ (LevelManager *)sharedInstance {
    static dispatch_once_t onceToken;
    static LevelManager *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[LevelManager alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        Level *level1 = [[Level alloc] initWithDictionary:@{@"mapName": @"darkforest.tmx"}];
        Level *level2 = [[Level alloc] initWithDictionary:@{@"mapName": @"darkforest.tmx"}];
        Level *level3 = [[Level alloc] initWithDictionary:@{@"mapName": @"darkforest.tmx"}];
        
        _currentLevelIndex = 0;

        _allLevels = [[NSArray alloc] initWithObjects:level1, level2, level3, nil];
    }
    return self;
}

- (Level *)currentLevel {
    return [_allLevels objectAtIndex:_currentLevelIndex];
}

- (void)loadNextLevel {
    _currentLevelIndex++;
}

- (void)loadPreviousLevel {
    _currentLevelIndex--;
}

- (void)loadLevelAtIndex:(NSUInteger)levelIndex {
    if (levelIndex < _allLevels.count)
        _currentLevelIndex = levelIndex;
    else
        NSAssert(levelIndex >= _allLevels.count, @"Can't load a level with an index higher than the available levels");
}

@end
