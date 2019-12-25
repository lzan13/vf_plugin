#import "VFPlugin.h"
#import "VFCommonPlugin.h"

@implementation VFPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    [VFCommonPlugin registerWithRegistrar:registrar];
}

@end

