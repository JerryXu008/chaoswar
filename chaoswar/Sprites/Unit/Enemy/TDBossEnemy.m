//
//  TDBossEnemy.m
//  chaoswar
//
//  Created by Mac on 11-10-13.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "TDBossEnemy.h"


@implementation TDBossEnemy

@synthesize atAni = _atAni;

-(id) init
{
	if( (self=[super init])) {
	}
	return self;
}

- (CCAnimation*) getAnimation:(int)level kind:(NSString*)kind
{
    CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
    NSMutableArray *animArray = [NSMutableArray array];
    CCSpriteFrame *frame = nil;
    int i = 1;
    do {
        frame = [cache spriteFrameByName:[NSString stringWithFormat:@"bs%02d%@%04d.png", level, kind, i]];
        i++;
        if (frame != nil) {
            [animArray addObject:frame];
        }
    } while (frame != nil);
    return [CCAnimation animationWithFrames:animArray delay:0.05f];
}

- (void) addAnimate:(int)level
{
    self.mvuAni = [self getAnimation:level kind:@"mvu"];
    self.mvdAni = [self getAnimation:level kind:@"mvd"];
    self.mvlAni = [self getAnimation:level kind:@"mvc"];
    self.mvrAni = [self getAnimation:level kind:@"mvc"];
    self.ddAni = [self getAnimation:level kind:@"dd"];
    [self.mvuAni setName:[NSString stringWithFormat:@"bs%02dmvu", level]];
    [self.mvdAni setName:[NSString stringWithFormat:@"bs%02dmvd", level]];
    [self.mvlAni setName:[NSString stringWithFormat:@"bs%02dmvl", level]];
    [self.mvrAni setName:[NSString stringWithFormat:@"bs%02dmvr", level]];
    [self.ddAni setName:[NSString stringWithFormat:@"bs%02ddd", level]];
    [self addAnimation:self.mvuAni];
    [self addAnimation:self.mvdAni];
    [self addAnimation:self.mvlAni];
    [self addAnimation:self.mvrAni];
    [self addAnimation:self.ddAni];
}

- (void) dealloc
{
	[super dealloc];
}

@end

@implementation TDBossEnemy1

+ (id) getSprite {
    TDBossEnemy1 *enemy = [TDBossEnemy1 spriteWithSpriteFrameName:@"bs01mvc0001.png"];
    if (enemy) {
        [enemy setScale:0.65];
        enemy.maxHP = 100;
        enemy.currentHP = enemy.maxHP;
        enemy.moveSpeed = 20;
        enemy.attacttime = 1.2;
        enemy.attactRange = 0;     
        enemy.attact = 8;
        enemy.attactMode = 0;
        enemy.defenceMode = 0;
    }
    return enemy;
}

- (void) initAnimate
{
    [self addAnimate:1]; 
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDBossEnemy2

+ (id) getSprite {
    TDBossEnemy2 *enemy = [TDBossEnemy2 spriteWithSpriteFrameName:@"bs02mvc0001.png"];
    if (enemy) {
        [enemy setScale:0.65];
        enemy.maxHP = 60;
        enemy.currentHP = enemy.maxHP;
        enemy.moveSpeed = 40;
        enemy.attacttime = 1.2;
        enemy.attactRange = 0;     
        enemy.attact = 8;
        enemy.attactMode = 0;
        enemy.defenceMode = 0;
    }
    return enemy;
}

- (void) initAnimate
{
    [self addAnimate:2]; 
}

- (void) dealloc
{  
    [super dealloc];
}

@end
