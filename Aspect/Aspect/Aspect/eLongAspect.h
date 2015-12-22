//
//  eLongAspect.h
//  ElongTrain
//
//  Created by xieguangqian on 15/12/22.
//  Copyright © 2015年 elong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Aspects.h"

@interface eLongAspect : NSObject


-(void) clickEventWithClass:(Class) kclass
                   selector:(SEL)selector
                      event:(NSString *)event
                       page:(NSString *)page;

-(void) clickEventWithClass:(Class) kclass
                   selector:(SEL) selector
               eventHandler:(void (^)(id<AspectInfo> aspectInfo))eventHandler;

@end
