//
//  RequestProtocol.h
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/28.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RequestProtocol <NSObject>
- (void)cancel;
- (void)resume;
- (void)pasue;
- (NSString *)currentNetworkStatusString;
@end
