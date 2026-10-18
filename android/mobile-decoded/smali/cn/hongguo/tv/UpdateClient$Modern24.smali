.class Lcn/hongguo/tv/UpdateClient$Modern24;
.super Ljava/lang/Object;
.source "UpdateClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/hongguo/tv/UpdateClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Modern24"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static minimum(Landroid/content/pm/PackageInfo;)I
    .locals 0

    .line 60
    iget-object p0, p0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget p0, p0, Landroid/content/pm/ApplicationInfo;->minSdkVersion:I

    return p0
.end method
