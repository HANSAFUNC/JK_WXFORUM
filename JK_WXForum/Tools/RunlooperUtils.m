//
//  RunlooperUtils.m
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/28.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import "RunlooperUtils.h"

@implementation RunlooperUtils

static CFRunLoopObserverRef defaultModeObserver = NULL;
- (void)addRunloopObserver:(void *)object action:(void *)action{
    
    CFRunLoopRef runloop = CFRunLoopGetCurrent();
    CFRunLoopObserverContext contenxt = {
        0,
        object,
        NULL,
        NULL,
        NULL
    };
    
    defaultModeObserver = CFRunLoopObserverCreate(NULL,
                                                  kCFRunLoopBeforeWaiting, YES, NSIntegerMax-999, action, &contenxt);
    CFRunLoopAddObserver(runloop, defaultModeObserver, kCFRunLoopDefaultMode);
    CFRelease(defaultModeObserver);
    
    
}

-(void)removeRunloopObserver:(void *)object action:(void *)action {
    CFRunLoopRef runloop = CFRunLoopGetCurrent();
    CFRunLoopRemoveObserver(runloop, defaultModeObserver, kCFRunLoopDefaultMode);
}

static void callBackFromRunloop(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    
    
    NSLog(@"p------");
    UIViewController * vc = (__bridge UIViewController *)info;
    NSLog(@"%@",[vc description]);
    
}


@end
