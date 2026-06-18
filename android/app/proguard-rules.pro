# Mengamankan class GetX agar tidak di-minify
-keep class com.getx.** { *; }

# Mengamankan network library yang digunakan Supabase
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-keep class retrofit2.** { *; }
-dontwarn okhttp3.**
-dontwarn okio.**