//
//  Health.h
//  SampleGame
//
//  Created by Carlotta Tatti on 02/12/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Health : NSObject

@property (nonatomic) float currHealth;
@property (nonatomic) float maxHealth;
@property (nonatomic) BOOL alive;

- (void)takeDamage:(int)damageAmount;
- (void)heal:(int)healAmount;

@end
