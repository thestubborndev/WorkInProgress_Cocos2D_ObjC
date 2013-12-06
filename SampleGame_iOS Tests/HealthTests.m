//
//  HealthTests.m
//  SampleGame
//
//  Created by Carlotta Tatti on 02/12/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "Kiwi.h"
#import "Health.h"

SPEC_BEGIN(HealthTests)
describe(@"The Health component", ^{
    context(@"when created", ^{
        Health *health = [[Health alloc] init];
        it(@"is not nil", ^{
            [[health shouldNot] beNil];
        });
        it(@"returns 100 for maximum health", ^{
            [[theValue([health maxHealth]) should] equal:theValue(100)];
        });
        it(@"returns 100 for current health", ^{
            [[theValue([health currHealth]) should] equal:theValue(100)];
        });
        it(@"is alive", ^{
            [[theValue([health alive]) should] equal:theValue(YES)];
        });
    });
    context(@"after taking a damage of 10", ^{
        Health *health = [[Health alloc] init];
        [health takeDamage:10];
        it(@"returns 100 for maximum health", ^{
            [[theValue([health maxHealth]) should] equal:theValue(100)];
        });
        it(@"returns 90 for current health", ^{
            [[theValue([health currHealth]) should] equal:theValue(90)];
        });
    });
});
SPEC_END
