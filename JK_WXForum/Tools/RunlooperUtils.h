//
//  RunlooperUtils.h
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/28.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RunlooperUtils : NSObject

- (void)addRunloopObserver:(void *)object action:(void *)action;
-(void)removeRunloopObserver:(void *)object action:(void *)action;
@end
