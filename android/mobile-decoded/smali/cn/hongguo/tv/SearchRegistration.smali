.class final Lcn/hongguo/tv/SearchRegistration;
.super Ljava/lang/Object;
.source "SearchRegistration.java"


# instance fields
.field private final context:Landroid/content/Context;

.field private final prefs:Landroid/content/SharedPreferences;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/SearchRegistration;->context:Landroid/content/Context;

    const-string v0, "catalog-registration-v1"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lcn/hongguo/tv/SearchRegistration;->prefs:Landroid/content/SharedPreferences;

    return-void
.end method

.method private send(Ljava/lang/String;[BLjava/util/Map;)Lorg/json/JSONObject;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[B",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 48
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljavax/net/ssl/HttpsURLConnection;

    invoke-static {p1}, Lcn/hongguo/tv/LegacyTls;->configure(Ljava/net/HttpURLConnection;)V

    const/16 v0, 0x2710

    invoke-virtual {p1, v0}, Ljavax/net/ssl/HttpsURLConnection;->setConnectTimeout(I)V

    const/16 v0, 0x3a98

    invoke-virtual {p1, v0}, Ljavax/net/ssl/HttpsURLConnection;->setReadTimeout(I)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljavax/net/ssl/HttpsURLConnection;->setInstanceFollowRedirects(Z)V

    invoke-virtual {p1, v0}, Ljavax/net/ssl/HttpsURLConnection;->setUseCaches(Z)V

    .line 49
    :try_start_0
    invoke-interface {p3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v2, v1}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string p3, "Accept-Encoding"

    const-string v1, "identity"

    invoke-virtual {p1, p3, v1}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p3, "POST"

    invoke-virtual {p1, p3}, Ljavax/net/ssl/HttpsURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/4 p3, 0x1

    invoke-virtual {p1, p3}, Ljavax/net/ssl/HttpsURLConnection;->setDoOutput(Z)V

    array-length v1, p2

    invoke-virtual {p1, v1}, Ljavax/net/ssl/HttpsURLConnection;->setFixedLengthStreamingMode(I)V

    .line 50
    invoke-virtual {p1}, Ljavax/net/ssl/HttpsURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_6

    :try_start_1
    invoke-virtual {v1, p2}, Ljava/io/OutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    if-eqz v1, :cond_1

    :try_start_2
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    :cond_1
    invoke-virtual {p1}, Ljavax/net/ssl/HttpsURLConnection;->getResponseCode()I

    move-result p2

    const/16 v1, 0xc8

    if-ne p2, v1, :cond_6

    .line 51
    invoke-virtual {p1}, Ljavax/net/ssl/HttpsURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_6

    :try_start_3
    invoke-static {p2}, Lcn/hongguo/tv/AppSearchCatalog;->readBounded(Ljava/io/InputStream;)[B

    move-result-object v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    if-eqz p2, :cond_2

    :try_start_4
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V

    .line 52
    :cond_2
    const-string p2, "gzip"

    invoke-virtual {p1}, Ljavax/net/ssl/HttpsURLConnection;->getContentEncoding()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_3

    array-length p2, v1

    if-le p2, p3, :cond_4

    aget-byte p2, v1, v0

    and-int/lit16 p2, p2, 0xff

    const/16 v0, 0x1f

    if-ne p2, v0, :cond_4

    aget-byte p2, v1, p3

    and-int/lit16 p2, p2, 0xff

    const/16 p3, 0x8b

    if-ne p2, p3, :cond_4

    :cond_3
    new-instance p2, Ljava/util/zip/GZIPInputStream;

    new-instance p3, Ljava/io/ByteArrayInputStream;

    invoke-direct {p3, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p2, p3}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_6

    :try_start_5
    invoke-static {p2}, Lcn/hongguo/tv/AppSearchCatalog;->readBounded(Ljava/io/InputStream;)[B

    move-result-object v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V

    .line 53
    :cond_4
    new-instance p2, Lorg/json/JSONObject;

    new-instance p3, Ljava/lang/String;

    const-string v0, "UTF-8"

    invoke-direct {p3, v1, v0}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-direct {p2, p3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_6

    .line 54
    invoke-virtual {p1}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    .line 53
    return-object p2

    .line 52
    :catchall_0
    move-exception p3

    :try_start_7
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception p2

    :try_start_8
    invoke-virtual {p3, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw p3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_6

    .line 51
    :catchall_2
    move-exception p3

    if-eqz p2, :cond_5

    :try_start_9
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    goto :goto_2

    :catchall_3
    move-exception p2

    :try_start_a
    invoke-virtual {p3, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_5
    :goto_2
    throw p3

    .line 50
    :cond_6
    new-instance p2, Ljava/io/IOException;

    const-string p3, "\u641c\u7d22\u767b\u8bb0\u6682\u4e0d\u53ef\u7528"

    invoke-direct {p2, p3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :cond_7
    :goto_3
    throw p2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    :catchall_4
    move-exception p2

    if-eqz v1, :cond_7

    :try_start_b
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    goto :goto_3

    :catchall_5
    move-exception p3

    :try_start_c
    invoke-virtual {p2, p3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_6

    goto :goto_3

    .line 54
    :catchall_6
    move-exception p2

    invoke-virtual {p1}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    throw p2
.end method

.method static valid(Ljava/lang/String;)Z
    .locals 1

    .line 7
    if-eqz p0, :cond_0

    const-string v0, "[1-9][0-9]{7,23}"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method declared-synchronized activate()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    monitor-enter p0

    .line 11
    :try_start_0
    invoke-virtual {p0}, Lcn/hongguo/tv/SearchRegistration;->ready()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    .line 13
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcn/hongguo/tv/SearchRegistration;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "attempted"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_8

    .line 14
    iget-object v0, p0, Lcn/hongguo/tv/SearchRegistration;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "attempted"

    const/4 v3, 0x1

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v4, p0, Lcn/hongguo/tv/SearchRegistration;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    .line 16
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    const-string v6, "display_name"

    const-string v7, "\u7ea2\u679c\u514d\u8d39\u77ed\u5267"

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "aid"

    const/16 v7, 0x21d6

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "channel"

    const-string v7, "69310258a"

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "package"

    const-string v7, "com.phoenix.read"

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "version_code"

    .line 17
    const v7, 0x120cc

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "app_version"

    const-string v7, "7.3.9.32"

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "sdk_version"

    const-string v7, "3.7.0-rc.34-fanqie-xiaoshuo"

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "sdk_target_version"

    const/16 v7, 0x1d

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "git_hash"

    const-string v7, "3a88f4e"

    .line 18
    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "release_build"

    const-string v7, "b5e187f"

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "os"

    const-string v7, "Android"

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "os_version"

    sget-object v7, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "os_api"

    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "device_model"

    sget-object v7, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 19
    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "device_brand"

    sget-object v7, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "device_manufacturer"

    sget-object v7, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "cpu_abi"

    iget-object v7, p0, Lcn/hongguo/tv/SearchRegistration;->context:Landroid/content/Context;

    .line 20
    invoke-static {v7}, Lcn/hongguo/tv/UpdateClient;->architecture(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "density_dpi"

    iget v7, v4, Landroid/util/DisplayMetrics;->densityDpi:I

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "display_density"

    const-string v7, "mdpi"

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "resolution"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget v8, v4, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "x"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v4, v4, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v6, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "language"

    .line 21
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "timezone"

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/TimeZone;->getRawOffset()I

    move-result v6

    const v7, 0x36ee80

    div-int/2addr v6, v7

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "access"

    const-string v6, "wifi"

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "carrier"

    const-string v6, ""

    .line 22
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "mcc_mnc"

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "rom"

    sget-object v6, Landroid/os/Build;->ID:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "rom_version"

    sget-object v6, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "cdid"

    .line 23
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "sig_hash"

    const-string v6, "56a962410c494bbaf0b58dba20cae56f"

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "openudid"

    .line 24
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "-"

    const-string v8, ""

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0x10

    invoke-virtual {v6, v2, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "clientudid"

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "region"

    const-string v6, "CN"

    .line 25
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "tz_name"

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "tz_offset"

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/TimeZone;->getRawOffset()I

    move-result v6

    div-int/lit16 v6, v6, 0x3e8

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "sim_region"

    const-string v6, ""

    .line 26
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "sim_serial_number"

    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "oaid_may_support"

    invoke-virtual {v4, v5, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "req_id"

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "device_platform"

    const-string v6, "android"

    .line 27
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "custom"

    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    const-string v8, "account_region_src"

    const-string v9, "fallback"

    invoke-virtual {v6, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v6

    const-string v8, "host_bit"

    const-string v9, "armeabi-v7a"

    iget-object v10, p0, Lcn/hongguo/tv/SearchRegistration;->context:Landroid/content/Context;

    invoke-static {v10}, Lcn/hongguo/tv/UpdateClient;->architecture(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    const/16 v10, 0x20

    if-eqz v9, :cond_1

    const/16 v9, 0x20

    goto :goto_0

    :cond_1
    const/16 v9, 0x40

    :goto_0
    invoke-virtual {v6, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v6

    const-string v8, "account_region"

    const-string v9, "cn"

    invoke-virtual {v6, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v6

    const-string v8, "dragon_device_type"

    const-string v9, "pad"

    invoke-virtual {v6, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "pre_installed_channel"

    const-string v6, ""

    .line 28
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "apk_first_install_time"

    iget-object v6, p0, Lcn/hongguo/tv/SearchRegistration;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    iget-object v8, p0, Lcn/hongguo/tv/SearchRegistration;->context:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v6

    iget-wide v8, v6, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    invoke-virtual {v4, v5, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "is_system_app"

    .line 29
    invoke-virtual {v4, v5, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "sdk_flavor"

    const-string v6, "china"

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "guest_mode"

    invoke-virtual {v4, v5, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v4

    .line 30
    new-instance v5, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v5}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance v6, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v6, v5}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    :try_start_2
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    const-string v9, "magic_tag"

    const-string v11, "ss_app_log"

    invoke-virtual {v8, v9, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v8

    const-string v9, "header"

    invoke-virtual {v8, v9, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v8, "_gen_time"

    invoke-virtual {v4, v8, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v8, "UTF-8"

    invoke-virtual {v4, v8}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/util/zip/GZIPOutputStream;->write([B)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-virtual {v6}, Ljava/util/zip/GZIPOutputStream;->close()V

    .line 31
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    new-array v5, v10, [B

    new-instance v6, Ljava/security/SecureRandom;

    invoke-direct {v6}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v6, v5}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 32
    const-string v6, "4dd4c2e6b83162090e52b3c7a6733ba41cb2462b829ab58a196b39db57177524f49baf7f08e8d68d26a72e37c1a95a2f1f05a51892aef2949732b62a38aadd58"

    .line 33
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    div-int/lit8 v8, v8, 0x2

    new-array v9, v8, [B

    const/4 v11, 0x0

    :goto_1
    if-ge v11, v8, :cond_2

    mul-int/lit8 v12, v11, 0x2

    add-int/lit8 v13, v12, 0x2

    invoke-virtual {v6, v12, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12, v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v12

    int-to-byte v12, v12

    aput-byte v12, v9, v11

    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 34
    :cond_2
    const-string v6, "SHA-512"

    invoke-static {v6}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/security/MessageDigest;->update([B)V

    invoke-virtual {v6, v9}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v8

    .line 35
    const-string v9, "AES/CBC/PKCS5Padding"

    invoke-static {v9}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v9

    new-instance v11, Ljavax/crypto/spec/SecretKeySpec;

    invoke-static {v8, v2, v7}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v12

    const-string v13, "AES"

    invoke-direct {v11, v12, v13}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    new-instance v12, Ljavax/crypto/spec/IvParameterSpec;

    invoke-static {v8, v7, v10}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v7

    invoke-direct {v12, v7}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    invoke-virtual {v9, v3, v11, v12}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 36
    new-instance v7, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v7}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-virtual {v6, v4}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v6

    invoke-virtual {v7, v6}, Ljava/io/ByteArrayOutputStream;->write([B)V

    invoke-virtual {v7, v4}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 37
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/4 v6, 0x6

    new-array v6, v6, [B

    fill-array-data v6, :array_0

    invoke-virtual {v4, v6}, Ljava/io/ByteArrayOutputStream;->write([B)V

    invoke-virtual {v4, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V

    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    invoke-virtual {v9, v5}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    invoke-static {v8, v2}, Ljava/util/Arrays;->fill([BB)V

    .line 38
    new-instance v5, Ljava/util/TreeMap;

    invoke-direct {v5}, Ljava/util/TreeMap;-><init>()V

    const-string v6, "Content-Type"

    const-string v7, "application/octet-stream;tt-data=a"

    invoke-virtual {v5, v6, v7}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "log-encode-type"

    const-string v7, "gzip"

    invoke-virtual {v5, v6, v7}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "x-ss-dp"

    const-string v7, "8662"

    invoke-virtual {v5, v6, v7}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "x-ss-req-ticket"

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v6, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "x-vc-bdturing-sdk-version"

    const-string v1, "4.0.3.cn"

    invoke-virtual {v5, v0, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "lc"

    const-string v1, "101"

    invoke-virtual {v5, v0, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "sdk-version"

    const-string v1, "2"

    invoke-virtual {v5, v0, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "passport-sdk-version"

    const-string v1, "5051452"

    invoke-virtual {v5, v0, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "x-neptune"

    const-string v1, "-8|50:51:59:30:40:47:49:39"

    invoke-virtual {v5, v0, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    const-string v0, "User-Agent"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "com.phoenix.read/73932 (Linux; U; Android "

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v6, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v6, "; zh_CN; "

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v6, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v6, ")"

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v0, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MD5"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v1

    array-length v6, v1

    const/4 v7, 0x0

    :goto_2
    if-ge v7, v6, :cond_3

    aget-byte v8, v1, v7

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "%02X"

    and-int/lit16 v8, v8, 0xff

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    new-array v11, v3, [Ljava/lang/Object;

    aput-object v8, v11, v2

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_3
    const-string v1, "x-ss-stub"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v1, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    const-string v0, "https://log5-applog-lf.fqnovel.com/service/2/device_register/?tt_data=a&cronet_version=8d40f833_2026-03-03&ttnet_version=4.2.243.31-douyin&use_store_region_cookie=1"

    invoke-direct {p0, v0, v4, v5}, Lcn/hongguo/tv/SearchRegistration;->send(Ljava/lang/String;[BLjava/util/Map;)Lorg/json/JSONObject;

    move-result-object v0

    .line 42
    if-eqz v0, :cond_6

    .line 43
    const-string v1, "device_id_str"

    const-string v2, "device_id"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "install_id_str"

    const-string v3, "install_id"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 44
    invoke-static {v1}, Lcn/hongguo/tv/SearchRegistration;->valid(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-static {v0}, Lcn/hongguo/tv/SearchRegistration;->valid(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 45
    iget-object v2, p0, Lcn/hongguo/tv/SearchRegistration;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "device"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "install"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    if-eqz v0, :cond_4

    .line 46
    monitor-exit p0

    return-void

    .line 45
    :cond_4
    :try_start_4
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u65e0\u6cd5\u4fdd\u5b58\u641c\u7d22\u8bbe\u7f6e"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 44
    :cond_5
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u641c\u7d22\u767b\u8bb0\u672a\u5b8c\u6210"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 42
    :cond_6
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u641c\u7d22\u767b\u8bb0\u6682\u4e0d\u53ef\u7528"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 30
    :catchall_0
    move-exception v0

    :try_start_5
    invoke-virtual {v6}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception v1

    :try_start_6
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_3
    throw v0

    .line 14
    :cond_7
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u65e0\u6cd5\u4fdd\u5b58\u641c\u7d22\u8bbe\u7f6e"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 13
    :cond_8
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u641c\u7d22\u767b\u8bb0\u672a\u5b8c\u6210\uff0c\u8bf7\u7a0d\u540e\u8054\u7cfb\u53cd\u9988\uff1b\u4e0d\u4f1a\u81ea\u52a8\u91cd\u590d\u767b\u8bb0"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 10
    :catchall_2
    move-exception v0

    monitor-exit p0

    throw v0

    :array_0
    .array-data 1
        0x74t
        0x63t
        0x5t
        0x10t
        0x0t
        0x0t
    .end array-data
.end method

.method identity()[Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 9
    invoke-virtual {p0}, Lcn/hongguo/tv/SearchRegistration;->ready()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/SearchRegistration;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "device"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcn/hongguo/tv/SearchRegistration;->prefs:Landroid/content/SharedPreferences;

    const-string v3, "install"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u8bf7\u5148\u542f\u7528\u641c\u7d22"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method ready()Z
    .locals 3

    .line 8
    iget-object v0, p0, Lcn/hongguo/tv/SearchRegistration;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "device"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcn/hongguo/tv/SearchRegistration;->valid(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/SearchRegistration;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "install"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcn/hongguo/tv/SearchRegistration;->valid(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
