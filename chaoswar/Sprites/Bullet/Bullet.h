//
//  Bullet.h
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SpriteDelegate.h"

@interface Bullet : CCSprite <BulletDelegate> {

}

+ (id) bullet;

@end
