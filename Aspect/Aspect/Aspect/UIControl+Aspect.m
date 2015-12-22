//
//  UIControl+Aspect.m
//  ElongTrain
//
//  Created by xieguangqian on 15/12/22.
//  Copyright © 2015年 elong. All rights reserved.
//

#import "UIControl+Aspect.h"
#import <objc/runtime.h>
#import "Aspects.h"

@implementation UIControl (Aspect)


+(void) load
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self changeAddTarget];
    });
}

+(void) changeAddTarget
{
    Class class = [self class];
    
    SEL originalSelector = @selector(sendAction:to:forEvent:);
    SEL swizzledSelector = @selector(cimc_sendAction:to:forEvent:);
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    if(class_addMethod(class , originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))){
        
        class_replaceMethod(class , swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        
    }else{
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

-(void)cimc_sendAction:(SEL)action to:(id) target forEvent:(UIEvent *)event
{
    
    //TODO:   添加打点代码
    NSLog(@"%d", self.tag);
    NSLog(@"%@,   %@", NSStringFromClass([target class]), NSStringFromSelector(action));
    
 
}

@end
