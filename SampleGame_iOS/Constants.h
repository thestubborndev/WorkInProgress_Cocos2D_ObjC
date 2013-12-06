//
//  Constants.h
//  SampleGame
//
//  Created by Carlotta Tatti on 29/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#ifndef AStar_Constants_h
#define AStar_Constants_h

#define kPropertyCollidable @"collidable"
#define kPropertyNPC @"npc"

typedef enum {
    kItemTypeTool,
    kItemTypeWeapon,
    kItemTypeFood,
    kItemTypeSpecial
} ItemType;

typedef enum {
    kEnemyTypeForestGiant,
    kEnemyTypeSwampGhost
} EnemyType;

typedef enum {
    kQuestNotStarted,
    kQuestStarted,
    kQuestCompleted,
    kQuestFailed
} QuestStatus;

typedef enum {
    kQuestActionCollect,
    kQuestActionReach,
    kQuestKill
} QuestActionType;

typedef enum {
    kQuestObjectPlace,
    kQuestObjectItem,
    kQuestObjectEnemy
} QuestObjectType;

#endif
