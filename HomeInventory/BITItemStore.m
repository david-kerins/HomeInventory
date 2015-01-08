//
//  BITItemStore.m
//  HomeInventory
//
//  Created by David Kerins on 2015-01-06.
//  Copyright (c) 2015 David Kerins. All rights reserved.
//

#import "BITItemStore.h"
#import "BITItem.h"
#import "BITImageStore.h"


//Class extension
@interface BITItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation BITItemStore

// Class methods
+ (instancetype)sharedStore
{
    static BITItemStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

// Initialization methods

// Throw exeption if "init" is called
- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[BITItemStore sharedStore]" userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

// Getters and Setters

- (NSArray *)allItems{
    return self.privateItems;
}

// Instance methods

- (BITItem *)createItem
{
    BITItem *item = [BITItem randomItem];
    [self.privateItems addObject:item];
    
    return item;
}

- (void)removeItem:(BITItem *)item
{
    NSString *key = item.itemKey;
    [[BITImageStore sharedStore] deleteImageForKey:key];
    
    [self.privateItems removeObjectIdenticalTo:item];
}

- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    if (fromIndex == toIndex) {
        return;
    }
    BITItem *item = self.privateItems[fromIndex];
    // Remove item from current location
    [self.privateItems removeObjectAtIndex:fromIndex];
    // Insert item into new location
    [self.privateItems insertObject:item atIndex:toIndex];
    
}
@end