//
//  UIDevice+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 11/28/10.
//  Copyright 2010 Opetopic. All rights reserved.
//

#import "UIDevice+Opetopic.h"
#import "NSString+Opetopic.h"
#import <mach/mach.h>
#import <mach/mach_host.h>
#import <sys/sysctl.h>

@implementation UIDevice (Opetopic)

+(NSString*) deviceString {
    
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *answer = malloc(size);
    sysctlbyname("hw.machine", answer, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:answer encoding: NSUTF8StringEncoding];
    free(answer);
    return platform;
}

+(OPDeviceType) deviceType {
    
#if TARGET_IPHONE_SIMULATOR
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? OPDeviceTypeiPhoneSimulator : OPDeviceTypeiPadSimulator;
#endif
    
    NSString *platform = [[self class] deviceString];
    
    if ([platform isEqualToString:@"iPhone1,1"])    return OPDeviceTypeiPhone;
    if ([platform isEqualToString:@"iPhone1,2"])    return OPDeviceTypeiPhone3G;
    if ([platform hasPrefix:@"iPhone2"])            return OPDeviceTypeiPhone3GS;
    if ([platform hasPrefix:@"iPhone3"])            return OPDeviceTypeiPhone4;
    if ([platform hasPrefix:@"iPhone4"])            return OPDeviceTypeiPhone4S;
    if ([platform hasPrefix:@"iPhone5"])            return OPDeviceTypeiPhone5;
    
    if ([platform hasPrefix:@"iPod1"])              return OPDeviceTypeiPod1;
    if ([platform hasPrefix:@"iPod2"])              return OPDeviceTypeiPod2;
    if ([platform hasPrefix:@"iPod3"])              return OPDeviceTypeiPod3;
    if ([platform hasPrefix:@"iPod4"])              return OPDeviceTypeiPod4;
    if ([platform hasPrefix:@"iPod5"])              return OPDeviceTypeiPod5;
    
    if ([platform hasPrefix:@"iPad1"])              return OPDeviceTypeiPad;
    if ([platform hasPrefix:@"iPad2"])              return OPDeviceTypeiPad2;
    if ([platform hasPrefix:@"iPad3"])              return OPDeviceTypeiPad3;
    if ([platform hasPrefix:@"iPad4"])              return OPDeviceTypeiPad4;
    
    return OPDeviceTypeUnknown;
}

+(BOOL) isGameCenterReady {
	
    // Check for presence of GKLocalPlayer API.
    Class gcClass = (NSClassFromString(@"GKLocalPlayer"));
	
    // The device must be running running iOS 4.1 or later.
    NSString *reqSysVer = @"4.1";
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    BOOL osVersionSupported = ([currSysVer compare:reqSysVer options:NSNumericSearch] != NSOrderedAscending);
	
    return (gcClass && osVersionSupported);
}

+(BOOL) isRetina {
	return ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) || ([UIScreen instancesRespondToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] > 1.0f));
}

+(BOOL) isPhone {
	return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone;
}

+(BOOL) isPad {
	return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

+(BOOL) isFast {
	return [[self class] deviceType] >= MAX(OPDeviceTypeiPad3, MAX(OPDeviceTypeiPhone4S, OPDeviceTypeiPod5));
}

+(BOOL) hasFacetime {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"facetime://"]];
}

+(BOOL) hasTelephony {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://"]];
}

+(BOOL) isAtLeastiOS5 {
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0f;
}

+(BOOL) isAtLeastiOS6 {
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0f;
}

+(double) freeMemory {
#ifdef DEBUG
    mach_port_t host_port;
    mach_msg_type_number_t host_size;
    vm_size_t pagesize;
    host_port = mach_host_self();
    host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    host_page_size(host_port, &pagesize);
    vm_statistics_data_t vm_stat;
    
    if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
        NSLog(@"Failed to fetch vm statistics");
        return 0;
    }
    
    /* Stats in bytes */
    natural_t mem_free = vm_stat.free_count * pagesize;
    return mem_free / 1024.0;
#else
    return 0.0;
#endif
}

+(double) appMemoryUsage {
#ifdef DEBUG
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    
    if(kernReturn == KERN_SUCCESS) 
        return vmStats.wire_count/1024.0;
    else return 0.0;
#else
    return 0.0;
#endif
}

-(NSString*) universalUniqueIDString {
    return [UIDevice instancesRespondToSelector:@selector(identifierForVendor)] ? [[[UIDevice currentDevice] identifierForVendor] UUIDString] : nil;
}

@end
