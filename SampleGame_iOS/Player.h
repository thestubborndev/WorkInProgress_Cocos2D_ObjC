//
//  Player.h
//  SampleGame
//
//  Created by Carlotta Tatti on 28/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Inventory.h"
#import "Character.h"
#import "Monster.h"
#import "NPC.h"
#import "Weapon.h"

@interface Player : Character

@property (strong, nonatomic) Inventory *inventory;
@property (strong, nonatomic) Weapon *currentWeapon;

- (void)collectItem:(Item *)item;
- (void)dropItem:(Item *)item;
- (void)useItem:(Item *)item;

- (void)attack:(Monster *)monster;
- (void)interact:(NPC *)npc;

@end
