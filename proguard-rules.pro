-optimizations !code/simplification/arithmetic,!code/simplification/cast,!field/*,!class/merging/*,!code/allocation/variable
-optimizationpasses 5
-allowaccessmodification
-dontpreverify
-dontobfuscate
-dontusemixedcaseclassnames
-dontskipnonpubliclibraryclasses
-verbose

-keepattributes Signature,*Annotation*,EnclosingMethod
-keep public class com.google.vending.licensing.ILicensingService
-keep public class com.android.vending.licensing.ILicensingService

# For native methods, see http://proguard.sourceforge.net/manual/examples.html#native
-keepclasseswithmembernames class * {
    native <methods>;
}
# keep setters in Views so that animations can still work.
# see http://proguard.sourceforge.net/manual/examples.html#beans
-keepclassmembers public class * extends android.view.View {
   void set*(***);
   *** get*();
}
# We want to keep methods in Activity that could be used in the XML attribute onClick
-keepclassmembers class * extends android.app.Activity {
   public void *(android.view.View);
}
# For enumeration classes, see http://proguard.sourceforge.net/manual/examples.html#enumerations
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}
-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}
-keepclassmembers class **.R$* {
    public static <fields>;
}

###############################
#Spotify Android SDK specifics#
###############################
-keep class com.spotify.** { *; }

###########################
#Support library specifics#
###########################
-keep class android.support.v7.** {
    *;
}
-keep interface android.support.v7.** {
    *;
}
-keep class android.support.v8.renderscript.** {
    *;
}
-dontwarn android.support.v4.**
-dontwarn android.support.v7.**
-dontwarn android.support.v8.**

####################
#Signpost specifics#
####################
-dontwarn oauth.signpost.**

################
#ACRA specifics#
################
# Restore some Source file names and restore approximate line numbers in the stack traces,
# otherwise the stack traces are pretty useless
-keepattributes SourceFile,LineNumberTable
# keep this class so that logging will show 'ACRA' and not a obfuscated name like 'a'.
# Note: if you are removing log messages elsewhere in this file then this isn't necessary
-keep class org.acra.ACRA {
    *;
}
# keep this around for some enums that ACRA needs
-keep class org.acra.ReportingInteractionMode {
    *;
}
-keepnames class org.acra.sender.HttpSender$** {
    *;
}
-keepnames class org.acra.ReportField {
    *;
}
# keep this otherwise it is removed by ProGuard
-keep public class org.acra.ErrorReporter {
    public void addCustomData(java.lang.String,java.lang.String);
    public void putCustomData(java.lang.String,java.lang.String);
    public void removeCustomData(java.lang.String);
}
# keep this otherwise it is removed by ProGuard
-keep public class org.acra.ErrorReporter {
    public void handleSilentException(java.lang.Throwable);
}

##################
#Deezer specifics#
##################
-keep class com.deezer.** { *; }
