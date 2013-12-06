//
//  Quest.m
//  SampleGame
//
//  Created by Carlotta Tatti on 29/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "Quest.h"

@implementation Quest

- (id)initWithDictionary:(NSDictionary *)levelDict {
    self = [super init];
    if (self) {
        _questStatus = kQuestNotStarted;
        _questDescription = levelDict[@"description"];
        
        _amount = [levelDict[@"amount"] intValue];
        
        NSString *objectType = levelDict[@"objectType"];
        if ([objectType isEqualToString:@"item"]) {
            _objectType = kQuestObjectItem;
        }
        if ([objectType isEqualToString:@"place"]) {
            _objectType = kQuestObjectPlace;
        }
        if ([objectType isEqualToString:@"enemy"]) {
            _objectType = kQuestObjectEnemy;
        }
        
        NSString *actionType = levelDict[@"actionType"];
        if ([actionType isEqualToString:@"collect"]) {
            _actionType = kQuestActionCollect;
        }
        if ([actionType isEqualToString:@"reach"]) {
            _actionType = kQuestActionReach;
        }
    }
    return self;
}

- (NSString *)description {
    return _questDescription;
}

@end
