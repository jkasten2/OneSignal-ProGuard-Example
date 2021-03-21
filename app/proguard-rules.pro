# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

# Require when disabling R8
-ignorewarnings


# proguard default
# 3,045,087 bytes (2,974KB)


# Remove Android logging
# 3,034,251 bytes (2,964KB)

-assumenosideeffects class android.util.Log {
    public static boolean isLoggable(java.lang.String, int);
    public static int v(...);
    public static int i(...);
    public static int w(...);
    public static int d(...);
    public static int e(...);
}

# Remove OneSignal logging
# 3,031,202 bytes (2,961KB)
# TODO: Way to clean up extra unused strings after log methods are removed?
-assumenosideeffects class com.onesignal.OneSignal {
    static void Log(...);
}

# Switched to proguard (from R8)
# 2,756,421 bytes (2,692KB)

# No external side effects for string methods
# 2,739,768 bytes (2,676KB)
-assumenoexternalsideeffects class java.lang.StringBuilder {
    public java.lang.StringBuilder();
    public java.lang.StringBuilder(int);
    public java.lang.StringBuilder(java.lang.String);
    public java.lang.StringBuilder append(java.lang.Object);
    public java.lang.StringBuilder append(java.lang.String);
    public java.lang.StringBuilder append(java.lang.StringBuffer);
    public java.lang.StringBuilder append(char[]);
    public java.lang.StringBuilder append(char[], int, int);
    public java.lang.StringBuilder append(boolean);
    public java.lang.StringBuilder append(char);
    public java.lang.StringBuilder append(int);
    public java.lang.StringBuilder append(long);
    public java.lang.StringBuilder append(float);
    public java.lang.StringBuilder append(double);
    public java.lang.String toString();
}

-assumenoexternalreturnvalues public final class java.lang.StringBuilder {
    public java.lang.StringBuilder append(java.lang.Object);
    public java.lang.StringBuilder append(java.lang.String);
    public java.lang.StringBuilder append(java.lang.StringBuffer);
    public java.lang.StringBuilder append(char[]);
    public java.lang.StringBuilder append(char[], int, int);
    public java.lang.StringBuilder append(boolean);
    public java.lang.StringBuilder append(char);
    public java.lang.StringBuilder append(int);
    public java.lang.StringBuilder append(long);
    public java.lang.StringBuilder append(float);
    public java.lang.StringBuilder append(double);
}


#  (2,738,702 bytes) 2,675KB ( saves ~1KB)
-assumenosideeffects class com.onesignal.GenerateNotification {
  private static void addBackgroundImage(...);
}

# Remove badger library
# 2,729,726 (2,666KB) (saves ~9KB)
-assumenosideeffects class com.onesignal.shortcutbadger.* {*;}

# Remove all .toString() for OneSignal classes
# 2,726,261 bytes (2,663KB) (saves 3KB)
-assumenosideeffects class com.onesignal.* {
    *** toString();
}

# Eable shrinkResources in app/build.gradle
# 2,678,810 bytes (2,617KB) (saves 46KB)

# Support only Android 5.0 and newer
# ONLY works for R8, added in proguard 6.1.0 but doesn't work most likely due to Android rules
# saves... ~20KB
-assumevalues public class android.os.Build$VERSION {
    public static int SDK_INT return 21..2147483647;
}


# Remove Amazon FireOS support
# TOOD: Not working for some reason (maybe becuase of the keep rule OneSignal provides?)

# Seems there isn't a way to undo (AKA unkeep) something.
# Need to remove keep line from .aar file
# -keep class !com.onesignal.ADMMessageHandlerJob, *

# TODO: Need to remove keep line from .aar file for this to work
-assumenosideeffects class com.onesignal.ADMMessageHandlerJob {*;}
-assumenosideeffects class com.onesignal.ADMMessageHandler {*;}
-assumenoexternalreturnvalues class com.onesignal.ADMMessageHandlerJob {*;}
-assumenoexternalreturnvalues class com.onesignal.ADMMessageHandler {*;}
-whyareyoukeeping class com.onesignal.ADMMessageHandler


# put all classes at the top level, probably not worth it
# 2,738,326 bytes (2,675KB) - Saves about ~1KB
#-repackageclasses