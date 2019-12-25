package com.vmloft.develop.library.flutter.vf_plugin;

import android.content.Context;
import android.util.Log;

import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

/**
 * VFPlugin 通用插件
 *
 * Create by lzan13 2019/12/04 5:41
 */
public class VFCommonPlugin implements MethodChannel.MethodCallHandler {

    private final Context mContext;
    private MethodChannel mChannel;

    /**
     * 注册 MethodChannel
     */
    public static void registerWith(PluginRegistry.Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "com.vmloft.develop.library.flutter.plugin.vf_common_plugin");
        channel.setMethodCallHandler(new VFCommonPlugin(registrar.context(), channel));
    }

    public VFCommonPlugin(Context context, MethodChannel channel) {
        mContext = context;
        mChannel = channel;
    }

    /**
     * Native -> Flutter 无返回值调用
     *
     * @param method 方法名
     * @param params 参数
     */
    public void invokeMethod(String method, Object params) {
        invokeMethod(method, params, null);
    }

    /**
     * Native -> Flutter 有返回值调用
     *
     * @param method 方法名
     * @param params 参数
     * @param result 返回数据
     */
    public void invokeMethod(String method, Object params, MethodChannel.Result result) {
        if (mChannel != null) {
            if (result == null) {
                mChannel.invokeMethod(method, params);
            } else {
                mChannel.invokeMethod(method, params, result);
            }
        }
    }

    /**
     * Flutter 层调用 Native 层方法
     *
     * @param call   方法数据信息，包括方法名，参数等
     * @param result 返回值处理
     */
    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        Log.d("lzan13", "-lz- " + call.method);
        switch (call.method) {
            case "loadData":
                loadData(result);
                break;
            case  "putData":
                putData(call, result);
                break;
            default:
                Log.d("lzan13", "-lz- notImplemented ");
                result.notImplemented();
                break;
        }
    }

    /**
     * flutter 回调 native 加载数据
     */
    private void loadData(final MethodChannel.Result result) {
        result.success(null);
    }

    /**
     * flutter 回调 native 传递数据
     */
    private void putData(MethodCall call, MethodChannel.Result result){
        Map<String, Object> args = (Map<String, Object>) call.arguments;
        if (args == null) {
            return;
        }
        String key = (String) args.get("key");
        switch (key) {
            case "test":
                result.success(null);
                break;
        }
    }

}
