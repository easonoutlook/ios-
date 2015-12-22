//
//  eLongAspect.m
//  ElongTrain
//
//  Created by xieguangqian on 15/12/22.
//  Copyright © 2015年 elong. All rights reserved.
//

#import "eLongAspect.h"

@implementation eLongAspect

-(void) clickEventWithClass:(Class) kclass
                   selector:(SEL)selector
                      event:(NSString *)event
                       page:(NSString *)page
{
    [kclass aspect_hookSelector:selector withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo,BOOL animated){
        
   //添加打点代码
        
    }error:nil];
}


-(void) clickEventWithClass:(Class) kclass
                   selector:(SEL) selector
               eventHandler:(void (^)(id<AspectInfo> aspectInfo))eventHandler
{
    [kclass aspect_hookSelector:selector withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated){
        
        if(eventHandler){
            
        }else{
            
        }
        
    }error:nil];
}

@end
