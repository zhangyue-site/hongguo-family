.class final Lcn/hongguo/tv/AppOrigin;
.super Ljava/lang/Object;
.source "AppOrigin.java"


# static fields
.field static final AUTHOR:Ljava/lang/String; = "\u6e20\u9053\u6709\u6570"

.field static final CERT_SHA256:Ljava/lang/String; = "c996ebad47f3f9881abbba3947a5a3374800cfe20b500c3a5f554569dc71a5ac"

.field static final RELEASES:Ljava/lang/String; = "https://github.com/waligoraamodio288-rgb/hongguo-desktop-releases"

.field static final SITE:Ljava/lang/String; = "https://channel-ai-practice-wj.waligoraamodio288.chatgpt.site/"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static matches([Landroid/content/pm/Signature;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 16
    const/4 v0, 0x0

    if-eqz p0, :cond_2

    array-length v1, p0

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    goto :goto_1

    .line 17
    :cond_0
    const-string v1, "SHA-256"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    aget-object p0, p0, v0

    invoke-virtual {p0}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p0

    .line 18
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x40

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    array-length v2, p0

    :goto_0
    if-ge v0, v2, :cond_1

    aget-byte v3, p0, v0

    and-int/lit16 v4, v3, 0xff

    ushr-int/lit8 v4, v4, 0x4

    const/16 v5, 0x10

    invoke-static {v4, v5}, Ljava/lang/Character;->forDigit(II)C

    move-result v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    and-int/lit8 v3, v3, 0xf

    invoke-static {v3, v5}, Ljava/lang/Character;->forDigit(II)C

    move-result v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 19
    :cond_1
    const-string p0, "c996ebad47f3f9881abbba3947a5a3374800cfe20b500c3a5f554569dc71a5ac"

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 16
    :cond_2
    :goto_1
    return v0
.end method

.method static status(I)Ljava/lang/String;
    .locals 1

    .line 24
    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    const-string p0, "\u5b89\u88c5\u7b7e\u540d\u4e0e\u539f\u53d1\u884c\u7248\u672c\u4e00\u81f4"

    goto :goto_0

    :cond_0
    if-nez p0, :cond_1

    const-string p0, "个人手机适配版，使用独立签名；非原作者发行"

    goto :goto_0

    :cond_1
    const-string p0, "\u6682\u65f6\u65e0\u6cd5\u8bfb\u53d6\u5b89\u88c5\u7b7e\u540d"

    :goto_0
    return-object p0
.end method

.method static verify(Landroid/content/Context;)I
    .locals 2

    .line 22
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const/16 v1, 0x40

    invoke-virtual {v0, p0, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    iget-object p0, p0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    invoke-static {p0}, Lcn/hongguo/tv/AppOrigin;->matches([Landroid/content/pm/Signature;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    const/4 p0, -0x1

    return p0
.end method
