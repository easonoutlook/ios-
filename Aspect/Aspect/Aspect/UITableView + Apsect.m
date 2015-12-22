//
//  UITableView + Apsect.m
//  ElongTrain
//
//  Created by xieguangqian on 15/12/22.
//  Copyright © 2015年 elong. All rights reserved.
//

#import "UITableView + Apsect.h"
#import "Aspects.h"
#import <objc/runtime.h>
#import <objc/message.h>


@implementation UITableView(Apsect)


+(void) load
{
    Class class = [self class];
    
    SEL originalSelector = @selector(setDelegate:);
    SEL swizzleSelector = @selector(cimc_setDelegate:);
    
    Method  originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzleMethod = class_getInstanceMethod(class, swizzleSelector);
    
    
    if(class_addMethod(class , originalSelector, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod))){
        
        class_replaceMethod(class , swizzleSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        
    }else{
        method_exchangeImplementations(originalMethod, swizzleMethod);
    }
}

-(void) cimc_setDelegate:(id<UITableViewDelegate>) delegate
{
    [self cimc_setDelegate:delegate];
    
    Class class = [delegate class];
    
    if(class_addMethod(class , NSSelectorFromString(@"cimc_didSelectRowAtIndexPath"), (IMP)cimc_didSelectRowAtIndexPath, [@"v@:@@" UTF8String])){
        
        Method dis_originalMethod = class_getInstanceMethod(class, NSSelectorFromString(@"cimc_didSelectRowAtIndexPath"));
        Method dis_swiizzledMethod = class_getInstanceMethod(class , @selector(tableView:didSelectRowAtIndexPath:));
        
        method_exchangeImplementations(dis_originalMethod, dis_swiizzledMethod);
    }

}

void cimc_didSelectRowAtIndexPath(id self, SEL _cmd, id tableView, id indexpath)
{
    
    //TODO:   添加打点代码
    
    NSLog(@"%@", NSStringFromClass([self class]));
    
    SEL selector = NSSelectorFromString(@"cimc_didSelectRowAtIndexPath");
    ((void(*)(id ,SEL,id, id))objc_msgSend)(self, selector, tableView, indexpath);
}

@end
