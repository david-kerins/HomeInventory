//
//  BITItemStore.h
//  HomeInventory
//
//  Created by David Kerins on 2015-01-06.
//  Copyright (c) 2015 David Kerins. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BITItem;

@interface BITItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

// Class methods for singleton dataSource
+ (instancetype)sharedStore;

// Instance methods
- (BITItem *)createItem;
- (void)removeItem:(BITItem *)item;
- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
