//
//  Health.m
//  SampleGame
//
//  Created by Carlotta Tatti on 02/12/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "Health.h"

#define kHealValue 10
#define kDamageValue 10

@implementation Health

- (id)init {
    self = [super init];
    if (self) {
        self.maxHealth = 100;
        self.currHealth = self.maxHealth;
        self.alive = YES;
    }
    return self;
}

- (void)takeDamage:(int)damageAmount {
    self.currHealth = self.currHealth - kDamageValue;
    if (self.currHealth <= 0)
        self.alive = NO;
}

- (void)heal:(int)healAmount {
    self.currHealth = self.currHealth + kHealValue;
    if (self.currHealth > 100)
        self.currHealth = 100;
}

- (void)die {
    //TODO: Implement Character death
}

@end
