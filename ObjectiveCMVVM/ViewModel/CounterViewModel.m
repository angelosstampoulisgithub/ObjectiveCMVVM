//
//  CounterViewModel.m
//  ObjectiveCMVVM
//
//  Created by Angelos Staboulis on 11/1/26.
//

#import "CounterViewModel.h"
#import "CounterModel.h"

@interface CounterViewModel ()
@property (nonatomic, strong) CounterModel *model;
@end

@implementation CounterViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _model = [[CounterModel alloc] init];
        _model.count = 0;
    }
    return self;
}

- (void)increment {
    self.model.count += 1;

    if (self.onCountChanged) {
        self.onCountChanged([self currentCountText]);
    }
}

- (NSString *)currentCountText {
    return [NSString stringWithFormat:@"Count: %ld", (long)self.model.count];
}

@end
