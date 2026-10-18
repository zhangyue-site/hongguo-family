.class public final Lcn/hongguo/tv/UpdateProvider;
.super Landroid/content/ContentProvider;
.source "UpdateProvider.java"


# static fields
.field static final AUTHORITY:Ljava/lang/String; = "cn.hongguo.tv.update"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    return-void
.end method

.method static require(Landroid/net/Uri;)V
    .locals 1

    .line 8
    invoke-static {}, Lcn/hongguo/tv/UpdateProvider;->uri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/lang/SecurityException;

    const-string v0, "Unknown update resource"

    invoke-direct {p0, v0}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static uri()Landroid/net/Uri;
    .locals 1

    .line 7
    const-string v0, "content://cn.hongguo.tv.update/update.apk"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0

    .line 15
    new-instance p1, Ljava/lang/SecurityException;

    const-string p2, "Read only"

    invoke-direct {p1, p2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 0

    .line 10
    invoke-static {p1}, Lcn/hongguo/tv/UpdateProvider;->require(Landroid/net/Uri;)V

    const-string p1, "application/vnd.android.package-archive"

    return-object p1
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 0

    .line 13
    new-instance p1, Ljava/lang/SecurityException;

    const-string p2, "Read only"

    invoke-direct {p1, p2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public onCreate()Z
    .locals 1

    .line 9
    const/4 v0, 0x1

    return v0
.end method

.method public openFile(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 11
    invoke-static {p1}, Lcn/hongguo/tv/UpdateProvider;->require(Landroid/net/Uri;)V

    const-string p1, "r"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcn/hongguo/tv/UpdateProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcn/hongguo/tv/UpdateClient;->apk(Landroid/content/Context;)Ljava/io/File;

    move-result-object p1

    const/high16 p2, 0x10000000

    invoke-static {p1, p2}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object p1

    return-object p1

    :cond_0
    new-instance p1, Ljava/lang/SecurityException;

    const-string p2, "Read only"

    invoke-direct {p1, p2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 3

    .line 12
    invoke-static {p1}, Lcn/hongguo/tv/UpdateProvider;->require(Landroid/net/Uri;)V

    const-string p1, "_size"

    const-string p3, "_display_name"

    const/4 p4, 0x0

    if-nez p2, :cond_0

    const/4 p2, 0x2

    new-array p2, p2, [Ljava/lang/String;

    aput-object p3, p2, p4

    const/4 p5, 0x1

    aput-object p1, p2, p5

    :cond_0
    new-instance p5, Landroid/database/MatrixCursor;

    invoke-direct {p5, p2}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    array-length v0, p2

    new-array v0, v0, [Ljava/lang/Object;

    :goto_0
    array-length v1, p2

    if-ge p4, v1, :cond_3

    aget-object v1, p2, p4

    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "HongguoTV-update.apk"

    goto :goto_1

    :cond_1
    aget-object v1, p2, p4

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lcn/hongguo/tv/UpdateProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcn/hongguo/tv/UpdateClient;->apk(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_1
    aput-object v1, v0, p4

    add-int/lit8 p4, p4, 0x1

    goto :goto_0

    :cond_3
    invoke-virtual {p5, v0}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    return-object p5
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0

    .line 14
    new-instance p1, Ljava/lang/SecurityException;

    const-string p2, "Read only"

    invoke-direct {p1, p2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
