# shared_preferences_android 2.5.1's Pigeon JNI backend resolves these
# methods by their exact JVM names/descriptors from Dart, outside R8's call graph.
# A class-level @Keep on the registrar alone did not retain suspend methods in
# the cloud release build. Keep only this legacy API boundary used by
# SharedPreferences.getInstance(), rather than the whole plugin or Kotlin runtime.
# includedescriptorclasses also retains kotlin.coroutines.Continuation's name.
-keep,includedescriptorclasses class io.flutter.plugins.sharedpreferences.SharedPreferencesApiRegistrar {
    public <init>();
    public io.flutter.plugins.sharedpreferences.SharedPreferencesApiRegistrar getInstance(java.lang.String);
    public java.lang.Object remove(java.lang.String, kotlin.coroutines.Continuation);
    public java.lang.Object setBool(java.lang.String, boolean, kotlin.coroutines.Continuation);
    public java.lang.Object setString(java.lang.String, java.lang.String, kotlin.coroutines.Continuation);
    public java.lang.Object setInt(java.lang.String, long, kotlin.coroutines.Continuation);
    public java.lang.Object setDouble(java.lang.String, double, kotlin.coroutines.Continuation);
    public java.lang.Object setEncodedStringList(java.lang.String, java.lang.String, kotlin.coroutines.Continuation);
    public java.lang.Object setDeprecatedStringList(java.lang.String, java.util.List, kotlin.coroutines.Continuation);
    public java.lang.Object clear(java.lang.String, java.util.List, kotlin.coroutines.Continuation);
    public java.lang.Object getAll(java.lang.String, java.util.List, kotlin.coroutines.Continuation);
}

# Pigeon's JNI codec also reads kotlin.Unit.INSTANCE dynamically.
-keep class kotlin.Unit {
    public static final kotlin.Unit INSTANCE;
}

# Keep the exception boundary too, so failed writes surface as PlatformException
# rather than a second missing-class/method error while decoding the failure.
-keep class io.flutter.plugins.sharedpreferences.FlutterError {
    public java.lang.String getCode();
    public java.lang.String getMessage();
    public java.lang.Object getDetails();
}
