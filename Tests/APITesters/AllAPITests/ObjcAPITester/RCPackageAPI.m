//
//  Copyright RevenueCat Inc. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  RCPackageAPI.m
//
//  Created by Madeline Beyl on 8/13/21.

#import "RCPackageAPI.h"

@import StoreKit;
@import RevenueCat;

@implementation RCPackageAPI

+ (void)checkAPI {
    RCPackage *p;
    RCStoreProduct *storeProduct = p.storeProduct;
    NSString *i = p.identifier;
    RCPackageType t = p.packageType;
    NSString *oid = p.offeringIdentifier;
    RCPresentedOfferingContext *poc = p.presentedOfferingContext;
    NSString *lps = p.localizedPriceString;
    NSString *lips = p.localizedIntroductoryPriceString;

    NSLog(p, storeProduct, i, t, oid, poc, lps, lips);

    RCPackage *package __unused = [[RCPackage alloc] initWithIdentifier:i
                                                            packageType:RCPackageTypeAnnual
                                                           storeProduct:storeProduct
                                                     offeringIdentifier:oid
                                                         webCheckoutUrl:[NSURL URLWithString:@"https://revenuecat.com"]];
}

+ (void)checkEnums {
    RCPackageType type = RCPackageTypeUnknown;
    switch(type) {
        case RCPackageTypeUnknown:
        case RCPackageTypeCustom:
        case RCPackageTypeLifetime:
        case RCPackageTypeAnnual:
        case RCPackageTypeSixMonth:
        case RCPackageTypeThreeMonth:
        case RCPackageTypeTwoMonth:
        case RCPackageTypeMonthly:
        case RCPackageTypeWeekly:
            NSLog(@"%ld", (long)type);
    }
}

@end
