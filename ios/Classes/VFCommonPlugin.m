#import "VFCommonPlugin.h"

@implementation VFCommonPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"com.vmloft.develop.library.flutter.plugin.vf_common_plugin"
                                     binaryMessenger:[registrar messenger]];

    VFCommonPlugin* instance = [[VFCommonPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
    instance.methodChannel = channel;
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSLog(@"收到 flutter -> native 回调 ");
}

@end
