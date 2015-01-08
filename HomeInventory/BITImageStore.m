//
//  BITImageStore.m
//  HomeInventory
//
//  Created by David Kerins on 2015-01-07.
//  Copyright (c) 2015 David Kerins. All rights reserved.
//

#import "BITImageStore.h"

@interface BITImageStore ()

@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end

@implementation BITImageStore

+ (instancetype)sharedStore
{
    static BITImageStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

//No one calls init
- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[BITImageStore sharedStore]" userInfo:nil];
    return nil;
}
// Private init
- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _dictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)setImage:(UIImage *)image forKey:(NSString *)key
{
    //[self.dictionary setObject:image forKey:key];
    // Same as above
    self.dictionary[key] = image;
}

- (UIImage *)imageForKey:(NSString *)key
{
    //return [self.dictionary objectForKey:key];
    //Same as above
    return self.dictionary[key];
}

- (void)deleteImageForKey:(NSString *)key
{
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
}

@end
