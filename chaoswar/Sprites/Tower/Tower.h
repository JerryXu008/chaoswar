//
//  Tower.h
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Enemy.h"
#import "Bullet.h"
#import "GameController.h"
#import "SpriteDelegate.h"

@interface Tower : CCSprite <BulletDelegate> {
    int range;
	Enemy *enemy;
    Bullet *bullet;
	CCSprite *spriteRange;
	NSMutableArray *bullets;
    int isdelete;
}
@property int isdelete;
@property (nonatomic, assign) int range;
@property (nonatomic, retain) Enemy *enemy;
@property (nonatomic, retain) Bullet *bullet;
@property (nonatomic, retain) CCSprite *spriteRange;
@property (nonatomic, retain) NSMutableArray *bullets;

- (Enemy*) getClosestEnemy;

@end

@interface MachineGunTower : Tower {
    
}

@end
