//
//  ViewController.m
//  ObjectiveCMVVM
//
//  Created by Angelos Staboulis on 11/1/26.
//

#import "ViewController.h"
#import "CounterViewModel.h"
@interface ViewController ()
@property (nonatomic, strong) UILabel *countLabel;
@property (nonatomic, strong) UIButton *incrementButton;
@property (nonatomic, strong) CounterViewModel *viewModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = UIColor.whiteColor;

    [self setupUI];
    [self setupViewModel];
}

- (void)setupUI {
    self.countLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 40)];
    self.countLabel.textAlignment = NSTextAlignmentCenter;
    self.countLabel.font = [UIFont systemFontOfSize:24];
    [self.view addSubview:self.countLabel];

    self.incrementButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.incrementButton.frame = CGRectMake(100, 280, self.view.bounds.size.width - 200, 44);
    [self.incrementButton setTitle:@"Increment" forState:UIControlStateNormal];
    [self.incrementButton addTarget:self
                              action:@selector(didTapIncrement)
                    forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.incrementButton];
}

- (void)setupViewModel {
    self.viewModel = [[CounterViewModel alloc] init];

    __weak typeof(self) weakSelf = self;
    self.viewModel.onCountChanged = ^(NSString *countText) {
        weakSelf.countLabel.text = countText;
    };

    // Initial value
    self.countLabel.text = [self.viewModel currentCountText];
}

- (void)didTapIncrement {
    [self.viewModel increment];
}


@end
