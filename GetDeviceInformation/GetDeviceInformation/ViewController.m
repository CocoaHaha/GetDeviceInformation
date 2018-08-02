#import "ViewController.h"
#import "DDYBatteryInfo.h"
#import "DDYSystemInfo.h"
#import "DDYTestViewController.h"
#import "UIColor+SDColor.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *takeButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"take" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor lightGrayColor]];
        [button addTarget:self action:@selector(handleTake) forControlEvents:UIControlEventTouchUpInside];
        [button setFrame:CGRectMake(100, 100, 120, 44)];
        button;
    });
    [self.view addSubview:takeButton];
    
    UIButton *infoButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"info" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor lightGrayColor]];
        [button addTarget:self action:@selector(handleInfo) forControlEvents:UIControlEventTouchUpInside];
        [button setFrame:CGRectMake(100, 165, 120, 44)];
        button;
    });
    [self.view addSubview:infoButton];
}

- (void)handleTake {
    DDYBatteryInfo *info = [[DDYBatteryInfo alloc] init];
    NSLog(@"gasGaugeEnabled:%@", @(info.gasGaugeEnabled));
    NSLog(@"maxCapacity:%@", @(info.maxCapacity));
    NSLog(@"currentCapacity:%@", @(info.currentCapacity));
    NSLog(@"rawCurrentCapacity:%@", @(info.rawCurrentCapacity));
    NSLog(@"capacity:%@", @(info.capacity));
    NSLog(@"rawCapacity:%@", @(info.rawCapacity));
    NSLog(@"voltage:%@", @(info.voltage));
    NSLog(@"isCharging:%@", @(info.isCharging));
    NSLog(@"isPluggedIn:%@", @(info.isPluggedIn));
    NSLog(@"isCritical:%@", @(info.isCritical));
    NSLog(@"chargingCurrent:%@", @(info.chargingCurrent));
    NSLog(@"batteryTemp:%@", @(info.batteryTemp));
    NSLog(@"cycleCount:%@", @(info.cycleCount));
    NSLog(@"designCapacity:%@", @(info.designCapacity));
    NSLog(@"current:%@", @(info.current));
    NSLog(@"fullyCharged:%@", @(info.fullyCharged));
    NSLog(@"draining:%@", @(info.draining));
    NSLog(@"updateTime:%@", @(info.updateTime));
    NSLog(@"adapterInfo:%@", info.adapterInfo);
    NSLog(@"connectedStatus:%@", info.connectedStatus);
    
    
}

- (void)handleInfo {
    
    NSLog(@"设备名称:%@", [DDYSystemInfo ddy_DeviceName]);
    NSLog(@"iOS系统版本: %@", [DDYSystemInfo ddy_SystemVersion]);
    NSLog(@"是否越狱:%@", [DDYSystemInfo ddy_JailBreak] ? @"是" : @"否");
    NSLog(@"设备颜色 %@",[DDYSystemInfo ddy_DeviceColor:@"DeviceColor"]);
    NSLog(@"设备外壳颜色 %@",[DDYSystemInfo ddy_DeviceColor:@"DeviceEnclosureColor"]);
    
    NSString * outsideColor =[DDYSystemInfo ddy_DeviceColor:@"DeviceEnclosureColor"];
    
//    NSString * inColor =[DDYSystemInfo ddy_DeviceColor:@"DeviceColor"];
    
    self.view.backgroundColor = [UIColor colorWithHexString:outsideColor];
    
    [self.navigationController pushViewController:[DDYTestViewController new] animated:YES];
}

@end
