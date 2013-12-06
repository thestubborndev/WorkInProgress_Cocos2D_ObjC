//
//  Character.h
//  SampleGame
//
//  Created by Carlotta Tatti on 02/12/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "GameObject.h"
#import "Health.h"

@interface Character : GameObject

- (void)moveToward:(CGPoint)target;

@end