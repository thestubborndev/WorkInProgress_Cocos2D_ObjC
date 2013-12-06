//
//  Player.m
//  SampleGame
//
//  Created by Carlotta Tatti on 28/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "Player.h"
#import "Pathfinder.h"
#import "LevelManager.h"

@interface Player ()
@end

@implementation Player

- (id)init {
    self = [super initWithFile:@"cell.png"];
    if (self) {
        self.scale = 0.25;
        self.anchorPoint = ccp(0, 0);
        
        self.inventory = [[Inventory alloc] init];
    }
    return self;
}

- (void)attack:(Monster *)monster {
    
}

- (void)interact:(NPC *)npc {
    
}

/**
 * @param item The item to collect
 */
- (void)collectItem:(Item *)item {
    [_inventory addItem:item];
}

/**
* @param item The item to drop
*/
- (void)dropItem:(Item *)item {
    [_inventory removeItem:item];
}

/**
 * @param item The item to use
 */
- (void)useItem:(Item *)item {
    [_inventory removeItem:item];
}

@end
