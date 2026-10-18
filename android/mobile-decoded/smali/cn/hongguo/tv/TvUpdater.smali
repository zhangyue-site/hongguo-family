.class Lcn/hongguo/tv/TvUpdater;
.super Ljava/lang/Object;
.source "TvUpdater.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/hongguo/tv/TvUpdater$Modern26;
    }
.end annotation


# static fields
.field static final DAY:J = 0x5265c00L

.field static final INSTALL:I = 0x2045

.field static final SOURCE_PERMISSION:I = 0x2044


# instance fields
.field final a:Lcn/hongguo/tv/MainActivity;

.field abi:Ljava/lang/String;

.field final automatic:Ljava/lang/Runnable;

.field busy:Z

.field cancel:Landroid/widget/Button;

.field check:Landroid/widget/Button;

.field client:Lcn/hongguo/tv/UpdateClient;

.field final current:Ljava/lang/String;

.field destroyed:Z

.field download:Landroid/widget/Button;

.field downloading:Z

.field info:Landroid/widget/TextView;

.field job:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation
.end field

.field latest:Lcn/hongguo/tv/UpdateRelease;

.field notes:Landroid/widget/TextView;

.field page:Landroid/widget/LinearLayout;

.field pendingInstall:Z

.field percent:I

.field progress:Landroid/widget/ProgressBar;

.field reminder:Landroid/app/AlertDialog;

.field reminders:Landroid/widget/Button;

.field serial:I

.field status:Ljava/lang/String;

.field final worker:Ljava/util/concurrent/ThreadPoolExecutor;


# direct methods
.method constructor <init>(Lcn/hongguo/tv/MainActivity;)V
    .locals 11

    .line 15
    const-string v0, "update_download_version"

    const-string v1, ""

    const-string v2, "update_release"

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    new-instance v10, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v8, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v9, Ljava/util/concurrent/ArrayBlockingQueue;

    const/4 v3, 0x1

    invoke-direct {v9, v3}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    const/4 v4, 0x0

    const/4 v5, 0x1

    const-wide/16 v6, 0xf

    move-object v3, v10

    invoke-direct/range {v3 .. v9}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    iput-object v10, p0, Lcn/hongguo/tv/TvUpdater;->worker:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 13
    const-string v3, "\u5c1a\u672a\u68c0\u67e5\u66f4\u65b0"

    iput-object v3, p0, Lcn/hongguo/tv/TvUpdater;->status:Ljava/lang/String;

    .line 15
    iput-object p1, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    new-instance p1, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda8;

    invoke-direct {p1, p0}, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda8;-><init>(Lcn/hongguo/tv/TvUpdater;)V

    iput-object p1, p0, Lcn/hongguo/tv/TvUpdater;->automatic:Ljava/lang/Runnable;

    :try_start_0
    iget-object p1, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    invoke-static {p1}, Lcn/hongguo/tv/UpdateClient;->version(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p1, "0.0.0"

    :goto_0
    iput-object p1, p0, Lcn/hongguo/tv/TvUpdater;->current:Ljava/lang/String;

    :try_start_1
    iget-object p1, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    invoke-static {p1}, Lcn/hongguo/tv/UpdateClient;->architecture(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcn/hongguo/tv/TvUpdater;->abi:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p1

    :goto_1
    new-instance p1, Ljava/io/File;

    iget-object v3, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    invoke-static {v3}, Lcn/hongguo/tv/UpdateClient;->directory(Landroid/content/Context;)Ljava/io/File;

    move-result-object v3

    const-string v4, "update.part"

    invoke-direct {p1, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 16
    const/4 p1, 0x0

    :try_start_2
    iget-object v3, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v3, v3, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v3, v2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcn/hongguo/tv/UpdateRelease;->restore(Ljava/lang/String;)Lcn/hongguo/tv/UpdateRelease;

    move-result-object v3

    iput-object v3, p0, Lcn/hongguo/tv/TvUpdater;->latest:Lcn/hongguo/tv/UpdateRelease;

    iget-object v3, p0, Lcn/hongguo/tv/TvUpdater;->latest:Lcn/hongguo/tv/UpdateRelease;

    iget-object v3, v3, Lcn/hongguo/tv/UpdateRelease;->abi:Ljava/lang/String;

    iget-object v4, p0, Lcn/hongguo/tv/TvUpdater;->abi:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcn/hongguo/tv/TvUpdater;->latest:Lcn/hongguo/tv/UpdateRelease;

    iget-object v3, v3, Lcn/hongguo/tv/UpdateRelease;->version:Ljava/lang/String;

    iget-object v4, p0, Lcn/hongguo/tv/TvUpdater;->current:Ljava/lang/String;

    invoke-static {v3, v4}, Lcn/hongguo/tv/UpdateRelease;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    if-gtz v3, :cond_1

    :cond_0
    iput-object p1, p0, Lcn/hongguo/tv/TvUpdater;->latest:Lcn/hongguo/tv/UpdateRelease;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v3

    .line 17
    :cond_1
    :goto_2
    :try_start_3
    iget-object v3, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v3, v3, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v3, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    iget-object v3, p0, Lcn/hongguo/tv/TvUpdater;->current:Ljava/lang/String;

    invoke-static {v3, v1}, Lcn/hongguo/tv/UpdateRelease;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-ltz v1, :cond_2

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->clearFiles()V

    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, v1, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u5df2\u66f4\u65b0\u81f3 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->current:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcn/hongguo/tv/TvUpdater;->status:Ljava/lang/String;

    iput-object p1, p0, Lcn/hongguo/tv/TvUpdater;->latest:Lcn/hongguo/tv/UpdateRelease;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_3

    :catch_3
    move-exception p1

    .line 18
    :cond_2
    :goto_3
    return-void
.end method

.method static brief(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 39
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x1c2

    if-le v0, v1, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "\u2026"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_0
    return-object p0
.end method

.method static safeError(Ljava/lang/Exception;)Ljava/lang/String;
    .locals 2

    .line 57
    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x64

    if-ge v0, v1, :cond_0

    const-string v0, "://"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "\\"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, ".*[\\u4e00-\\u9fff].*"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string p0, "\u4e0b\u8f7d\u5931\u8d25\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u540e\u91cd\u8bd5"

    :goto_0
    return-object p0
.end method

.method static size(J)Ljava/lang/String;
    .locals 3

    .line 38
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    long-to-double p0, p0

    const-wide v1, 0x412e848000000000L    # 1000000.0

    div-double/2addr p0, v1

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    const/4 p1, 0x1

    new-array p1, p1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, p1, v1

    const-string p0, "%.2f MB"

    invoke-static {v0, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method activityResult(II)V
    .locals 1

    .line 67
    const/16 v0, 0x2044

    if-ne p1, v0, :cond_1

    iget-boolean v0, p0, Lcn/hongguo/tv/TvUpdater;->pendingInstall:Z

    if-eqz v0, :cond_1

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcn/hongguo/tv/TvUpdater;->pendingInstall:Z

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->installAllowed()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->download()V

    goto :goto_1

    :cond_0
    const-string p1, "\u5c1a\u672a\u5141\u8bb8\u5b89\u88c5\uff0c\u66f4\u65b0\u5305\u5df2\u4fdd\u7559\uff0c\u53ef\u7a0d\u540e\u91cd\u8bd5"

    :goto_0
    iput-object p1, p0, Lcn/hongguo/tv/TvUpdater;->status:Ljava/lang/String;

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->render()V

    goto :goto_1

    :cond_1
    const/16 v0, 0x2045

    if-ne p1, v0, :cond_3

    if-nez p2, :cond_2

    const-string p1, "\u5b89\u88c5\u5c1a\u672a\u5b8c\u6210\uff0c\u53ef\u70b9\u51fb\u5b89\u88c5\u66f4\u65b0\u91cd\u8bd5"

    goto :goto_0

    :cond_2
    const-string p1, "\u8bf7\u4ee5\u7cfb\u7edf\u5b89\u88c5\u7ed3\u679c\u4e3a\u51c6"

    goto :goto_0

    :cond_3
    :goto_1
    return-void
.end method

.method cancelWork()V
    .locals 2

    .line 58
    iget-boolean v0, p0, Lcn/hongguo/tv/TvUpdater;->busy:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcn/hongguo/tv/TvUpdater;->serial:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lcn/hongguo/tv/TvUpdater;->serial:I

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->client:Lcn/hongguo/tv/UpdateClient;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->client:Lcn/hongguo/tv/UpdateClient;

    invoke-virtual {v0}, Lcn/hongguo/tv/UpdateClient;->cancel()V

    :cond_1
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->job:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->job:Ljava/util/concurrent/Future;

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :cond_2
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->worker:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->purge()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/hongguo/tv/TvUpdater;->busy:Z

    iput-boolean v0, p0, Lcn/hongguo/tv/TvUpdater;->downloading:Z

    const-string v0, "\u5df2\u53d6\u6d88\u4e0b\u8f7d\uff0c\u53ef\u91cd\u65b0\u5c1d\u8bd5"

    iput-object v0, p0, Lcn/hongguo/tv/TvUpdater;->status:Ljava/lang/String;

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->render()V

    return-void
.end method

.method check(Z)V
    .locals 2
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;
    const-string v1, "个人适配版请手动安装更新；原版入口见关于与帮助"
    const/4 p1, 0x1
    invoke-static {v0, v1, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object v0
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    return-void
.end method

.method clearFiles()V
    .locals 3

    .line 68
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    invoke-static {v1}, Lcn/hongguo/tv/UpdateClient;->directory(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    const-string v2, "update.part"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    invoke-static {v0}, Lcn/hongguo/tv/UpdateClient;->apk(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    return-void
.end method

.method createClient()Lcn/hongguo/tv/UpdateClient;
    .locals 2

    .line 19
    :try_start_0
    new-instance v0, Lcn/hongguo/tv/UpdateClient;

    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->abi:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcn/hongguo/tv/UpdateClient;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method destroy()V
    .locals 2

    .line 69
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/hongguo/tv/TvUpdater;->destroyed:Z

    iget v1, p0, Lcn/hongguo/tv/TvUpdater;->serial:I

    add-int/2addr v1, v0

    iput v1, p0, Lcn/hongguo/tv/TvUpdater;->serial:I

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->client:Lcn/hongguo/tv/UpdateClient;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->client:Lcn/hongguo/tv/UpdateClient;

    invoke-virtual {v0}, Lcn/hongguo/tv/UpdateClient;->cancel()V

    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->worker:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdownNow()Ljava/util/List;

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->automatic:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->reminder:Landroid/app/AlertDialog;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->reminder:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcn/hongguo/tv/TvUpdater;->page:Landroid/widget/LinearLayout;

    return-void
.end method

.method download()V
    .locals 5

    .line 54
    iget-boolean v0, p0, Lcn/hongguo/tv/TvUpdater;->busy:Z

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lcn/hongguo/tv/TvUpdater;->destroyed:Z

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->newer()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_1

    const-string v0, "\u8bf7\u5148\u9000\u51fa\u64ad\u653e\uff0c\u518d\u4e0b\u8f7d\u66f4\u65b0"

    iput-object v0, p0, Lcn/hongguo/tv/TvUpdater;->status:Ljava/lang/String;

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->render()V

    return-void

    :cond_1
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->latest:Lcn/hongguo/tv/UpdateRelease;

    iget v1, p0, Lcn/hongguo/tv/TvUpdater;->serial:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iput v1, p0, Lcn/hongguo/tv/TvUpdater;->serial:I

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->createClient()Lcn/hongguo/tv/UpdateClient;

    move-result-object v3

    iput-object v3, p0, Lcn/hongguo/tv/TvUpdater;->client:Lcn/hongguo/tv/UpdateClient;

    iget-object v3, p0, Lcn/hongguo/tv/TvUpdater;->client:Lcn/hongguo/tv/UpdateClient;

    iput-boolean v2, p0, Lcn/hongguo/tv/TvUpdater;->busy:Z

    iput-boolean v2, p0, Lcn/hongguo/tv/TvUpdater;->downloading:Z

    const/4 v2, 0x0

    iput v2, p0, Lcn/hongguo/tv/TvUpdater;->percent:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u6b63\u5728\u4e0b\u8f7d "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, v0, Lcn/hongguo/tv/UpdateRelease;->version:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "\u2026"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcn/hongguo/tv/TvUpdater;->status:Ljava/lang/String;

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->render()V

    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->page:Landroid/widget/LinearLayout;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v2, v2, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v2, v2, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    iget-object v2, v2, Lcn/hongguo/tv/MainActivity$Screen;->view:Landroid/view/View;

    iget-object v4, p0, Lcn/hongguo/tv/TvUpdater;->page:Landroid/widget/LinearLayout;

    if-ne v2, v4, :cond_2

    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->cancel:Landroid/widget/Button;

    invoke-virtual {v2}, Landroid/widget/Button;->requestFocusFromTouch()Z

    .line 55
    :cond_2
    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->worker:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v4, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda18;

    invoke-direct {v4, p0, v3, v0, v1}, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda18;-><init>(Lcn/hongguo/tv/TvUpdater;Lcn/hongguo/tv/UpdateClient;Lcn/hongguo/tv/UpdateRelease;I)V

    invoke-virtual {v2, v4}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lcn/hongguo/tv/TvUpdater;->job:Ljava/util/concurrent/Future;

    .line 56
    return-void

    .line 54
    :cond_3
    :goto_0
    return-void
.end method

.method dueCheck(J)Z
    .locals 5

    .line 21
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "update_attempt_at"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    cmp-long v4, v0, v2

    if-lez v4, :cond_1

    cmp-long v2, p1, v0

    if-ltz v2, :cond_1

    sub-long/2addr p1, v0

    const-wide/32 v0, 0x5265c00

    cmp-long v2, p1, v0

    if-ltz v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method dueReminder(J)Z
    .locals 8

    .line 22
    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->newer()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v2, "update_reminders"

    const/4 v3, 0x1

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->latest:Lcn/hongguo/tv/UpdateRelease;

    iget-object v0, v0, Lcn/hongguo/tv/UpdateRelease;->version:Ljava/lang/String;

    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v2, v2, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v4, "update_ignored"

    const-string v5, ""

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v2, "update_reminded_at"

    const-wide/16 v6, 0x0

    invoke-interface {v0, v2, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->latest:Lcn/hongguo/tv/UpdateRelease;

    iget-object v0, v0, Lcn/hongguo/tv/UpdateRelease;->version:Ljava/lang/String;

    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v2, v2, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v4, "update_reminded_version"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    cmp-long v0, p1, v6

    if-ltz v0, :cond_1

    sub-long/2addr p1, v6

    const-wide/32 v4, 0x5265c00

    cmp-long v0, p1, v4

    if-ltz v0, :cond_2

    :cond_1
    const/4 v1, 0x1

    :cond_2
    :goto_0
    return v1
.end method

.method installAllowed()Z
    .locals 2

    .line 59
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_1

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    invoke-static {v0}, Lcn/hongguo/tv/TvUpdater$Modern26;->allowed(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method synthetic lambda$check$2$cn-hongguo-tv-TvUpdater(ILcn/hongguo/tv/UpdateRelease;Z)V
    .locals 3

    .line 28
    iget-boolean v0, p0, Lcn/hongguo/tv/TvUpdater;->destroyed:Z

    if-nez v0, :cond_2

    iget v0, p0, Lcn/hongguo/tv/TvUpdater;->serial:I

    if-eq p1, v0, :cond_0

    goto :goto_2

    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcn/hongguo/tv/TvUpdater;->busy:Z

    iput-object p2, p0, Lcn/hongguo/tv/TvUpdater;->latest:Lcn/hongguo/tv/UpdateRelease;

    :try_start_0
    iget-object p1, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "update_release"

    invoke-virtual {p2}, Lcn/hongguo/tv/UpdateRelease;->saved()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "update_checked_at"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-interface {p1, v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    :goto_0
    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->newer()Z

    move-result p1

    if-eqz p1, :cond_1

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u53d1\u73b0\u65b0\u7248\u672c "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p2, p2, Lcn/hongguo/tv/UpdateRelease;->version:Ljava/lang/String;

    goto :goto_1

    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u6682\u65e0\u53ef\u7528\u66f4\u65b0\uff08\u516c\u5f00\u7248\u672c "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p2, p2, Lcn/hongguo/tv/UpdateRelease;->version:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "\uff09"

    :goto_1
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcn/hongguo/tv/TvUpdater;->status:Ljava/lang/String;

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->render()V

    if-nez p3, :cond_2

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->maybeRemind()V

    :cond_2
    :goto_2
    return-void
.end method

.method synthetic lambda$check$3$cn-hongguo-tv-TvUpdater(I)V
    .locals 2

    .line 28
    iget-boolean v0, p0, Lcn/hongguo/tv/TvUpdater;->destroyed:Z

    if-nez v0, :cond_2

    iget v0, p0, Lcn/hongguo/tv/TvUpdater;->serial:I

    if-eq p1, v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcn/hongguo/tv/TvUpdater;->busy:Z

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u68c0\u67e5\u5931\u8d25\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u540e\u91cd\u8bd5"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->newer()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\uff1b\u4fdd\u7559\u4e0a\u6b21\u53d1\u73b0\u7684\u7248\u672c "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->latest:Lcn/hongguo/tv/UpdateRelease;

    iget-object v1, v1, Lcn/hongguo/tv/UpdateRelease;->version:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-string v0, ""

    :goto_0
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcn/hongguo/tv/TvUpdater;->status:Ljava/lang/String;

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->render()V

    :cond_2
    :goto_1
    return-void
.end method

.method synthetic lambda$check$4$cn-hongguo-tv-TvUpdater(Lcn/hongguo/tv/UpdateClient;IZ)V
    .locals 2

    .line 28
    :try_start_0
    invoke-virtual {p1}, Lcn/hongguo/tv/UpdateClient;->latest()Lcn/hongguo/tv/UpdateRelease;

    move-result-object p1

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    new-instance v1, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0, p2, p1, p3}, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda6;-><init>(Lcn/hongguo/tv/TvUpdater;ILcn/hongguo/tv/UpdateRelease;Z)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object p1, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    new-instance p3, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda7;

    invoke-direct {p3, p0, p2}, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda7;-><init>(Lcn/hongguo/tv/TvUpdater;I)V

    invoke-virtual {p1, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_0
    return-void
.end method

.method synthetic lambda$download$13$cn-hongguo-tv-TvUpdater(II)V
    .locals 1

    .line 55
    iget-boolean v0, p0, Lcn/hongguo/tv/TvUpdater;->destroyed:Z

    if-nez v0, :cond_2

    iget v0, p0, Lcn/hongguo/tv/TvUpdater;->serial:I

    if-eq p1, v0, :cond_0

    goto :goto_1

    :cond_0
    iput p2, p0, Lcn/hongguo/tv/TvUpdater;->percent:I

    const/16 p1, 0x64

    if-ge p2, p1, :cond_1

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u6b63\u5728\u4e0b\u8f7d "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "%"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    const-string p1, "\u6b63\u5728\u6821\u9a8c\u5b89\u88c5\u5305\u2026"

    :goto_0
    iput-object p1, p0, Lcn/hongguo/tv/TvUpdater;->status:Ljava/lang/String;

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->render()V

    :cond_2
    :goto_1
    return-void
.end method

.method synthetic lambda$download$14$cn-hongguo-tv-TvUpdater(II)V
    .locals 2

    .line 55
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    new-instance v1, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, p1, p2}, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda5;-><init>(Lcn/hongguo/tv/TvUpdater;II)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method synthetic lambda$download$15$cn-hongguo-tv-TvUpdater(ILcn/hongguo/tv/UpdateRelease;)V
    .locals 1

    .line 55
    iget-boolean v0, p0, Lcn/hongguo/tv/TvUpdater;->destroyed:Z

    if-nez v0, :cond_1

    iget v0, p0, Lcn/hongguo/tv/TvUpdater;->serial:I

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcn/hongguo/tv/TvUpdater;->busy:Z

    iput-boolean p1, p0, Lcn/hongguo/tv/TvUpdater;->downloading:Z

    iget-object p1, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "update_download_version"

    iget-object p2, p2, Lcn/hongguo/tv/UpdateRelease;->version:Ljava/lang/String;

    invoke-interface {p1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    const-string p1, "\u4e0b\u8f7d\u548c\u6821\u9a8c\u5b8c\u6210\uff0c\u53ef\u4ee5\u5b89\u88c5"

    iput-object p1, p0, Lcn/hongguo/tv/TvUpdater;->status:Ljava/lang/String;

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->render()V

    iget-object p1, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-boolean p1, p1, Lcn/hongguo/tv/MainActivity;->activityVisible:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity$Screen;->view:Landroid/view/View;

    iget-object p2, p0, Lcn/hongguo/tv/TvUpdater;->page:Landroid/widget/LinearLayout;

    if-ne p1, p2, :cond_1

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->requestInstall()V

    :cond_1
    :goto_0
    return-void
.end method

.method synthetic lambda$download$16$cn-hongguo-tv-TvUpdater(ILcn/hongguo/tv/UpdateClient;Ljava/lang/Exception;)V
    .locals 1

    .line 55
    iget-boolean v0, p0, Lcn/hongguo/tv/TvUpdater;->destroyed:Z

    if-nez v0, :cond_2

    iget v0, p0, Lcn/hongguo/tv/TvUpdater;->serial:I

    if-eq p1, v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcn/hongguo/tv/TvUpdater;->busy:Z

    iput-boolean p1, p0, Lcn/hongguo/tv/TvUpdater;->downloading:Z

    iget-boolean p1, p2, Lcn/hongguo/tv/UpdateClient;->cancelled:Z

    if-eqz p1, :cond_1

    const-string p1, "\u5df2\u53d6\u6d88\u4e0b\u8f7d"

    goto :goto_0

    :cond_1
    invoke-static {p3}, Lcn/hongguo/tv/TvUpdater;->safeError(Ljava/lang/Exception;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    iput-object p1, p0, Lcn/hongguo/tv/TvUpdater;->status:Ljava/lang/String;

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->render()V

    :cond_2
    :goto_1
    return-void
.end method

.method synthetic lambda$download$17$cn-hongguo-tv-TvUpdater(Lcn/hongguo/tv/UpdateClient;Lcn/hongguo/tv/UpdateRelease;I)V
    .locals 2

    .line 55
    :try_start_0
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    new-instance v1, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda14;

    invoke-direct {v1, p0, p3}, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda14;-><init>(Lcn/hongguo/tv/TvUpdater;I)V

    invoke-virtual {p1, v0, p2, v1}, Lcn/hongguo/tv/UpdateClient;->download(Landroid/content/Context;Lcn/hongguo/tv/UpdateRelease;Lcn/hongguo/tv/UpdateClient$Progress;)Ljava/io/File;

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    new-instance v1, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda15;

    invoke-direct {v1, p0, p3, p2}, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda15;-><init>(Lcn/hongguo/tv/TvUpdater;ILcn/hongguo/tv/UpdateRelease;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    new-instance v1, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda16;

    invoke-direct {v1, p0, p3, p1, p2}, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda16;-><init>(Lcn/hongguo/tv/TvUpdater;ILcn/hongguo/tv/UpdateClient;Ljava/lang/Exception;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_0
    return-void
.end method

.method synthetic lambda$maybeRemind$5$cn-hongguo-tv-TvUpdater(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 35
    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->page()V

    return-void
.end method

.method synthetic lambda$maybeRemind$6$cn-hongguo-tv-TvUpdater(Lcn/hongguo/tv/UpdateRelease;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 35
    iget-object p2, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p2, p2, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    const-string p3, "update_ignored"

    iget-object p1, p1, Lcn/hongguo/tv/UpdateRelease;->version:Ljava/lang/String;

    invoke-interface {p2, p3, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method synthetic lambda$maybeRemind$7$cn-hongguo-tv-TvUpdater(Landroid/content/DialogInterface;)V
    .locals 0

    .line 36
    const/4 p1, 0x0

    iput-object p1, p0, Lcn/hongguo/tv/TvUpdater;->reminder:Landroid/app/AlertDialog;

    return-void
.end method

.method synthetic lambda$maybeRemind$8$cn-hongguo-tv-TvUpdater(Landroid/content/DialogInterface;)V
    .locals 1

    .line 36
    iget-object p1, p0, Lcn/hongguo/tv/TvUpdater;->reminder:Landroid/app/AlertDialog;

    const/4 v0, -0x2

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Button;->requestFocusFromTouch()Z

    return-void
.end method

.method synthetic lambda$new$0$cn-hongguo-tv-TvUpdater()V
    .locals 3

    .line 15
    iget-boolean v0, p0, Lcn/hongguo/tv/TvUpdater;->destroyed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-boolean v0, v0, Lcn/hongguo/tv/MainActivity;->activityVisible:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "update_reminders"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcn/hongguo/tv/TvUpdater;->dueCheck(J)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/TvUpdater;->check(Z)V

    :cond_0
    return-void
.end method

.method synthetic lambda$page$10$cn-hongguo-tv-TvUpdater()V
    .locals 0

    .line 42
    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->download()V

    return-void
.end method

.method synthetic lambda$page$11$cn-hongguo-tv-TvUpdater()V
    .locals 0

    .line 42
    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->cancelWork()V

    return-void
.end method

.method synthetic lambda$page$12$cn-hongguo-tv-TvUpdater()V
    .locals 4

    .line 43
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, v1, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v2, "update_reminders"

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    xor-int/2addr v1, v3

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->automatic:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_0
    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->render()V

    return-void
.end method

.method synthetic lambda$page$9$cn-hongguo-tv-TvUpdater()V
    .locals 1

    .line 42
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/TvUpdater;->check(Z)V

    return-void
.end method

.method synthetic lambda$requestInstall$18$cn-hongguo-tv-TvUpdater(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 63
    const/4 p1, 0x1

    :try_start_0
    iput-boolean p1, p0, Lcn/hongguo/tv/TvUpdater;->pendingInstall:Z

    iget-object p1, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    invoke-static {p1}, Lcn/hongguo/tv/TvUpdater$Modern26;->settings(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcn/hongguo/tv/TvUpdater;->pendingInstall:Z

    const-string p1, "\u65e0\u6cd5\u6253\u5f00\u6388\u6743\u9875\uff0c\u8bf7\u5728\u7cfb\u7edf\u8bbe\u7f6e\u4e2d\u5141\u8bb8\u672c\u5e94\u7528\u5b89\u88c5\u66f4\u65b0"

    iput-object p1, p0, Lcn/hongguo/tv/TvUpdater;->status:Ljava/lang/String;

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->render()V

    :goto_0
    return-void
.end method

.method synthetic lambda$resume$1$cn-hongguo-tv-TvUpdater()V
    .locals 0

    .line 23
    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->maybeRemind()V

    return-void
.end method

.method launchInstaller()V
    .locals 3

    .line 66
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcn/hongguo/tv/UpdateProvider;->uri()Landroid/net/Uri;

    move-result-object v1

    const-string v2, "application/vnd.android.package-archive"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "TV update"

    invoke-static {}, Lcn/hongguo/tv/UpdateProvider;->uri()Landroid/net/Uri;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/content/ClipData;->newRawUri(Ljava/lang/CharSequence;Landroid/net/Uri;)Landroid/content/ClipData;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setClipData(Landroid/content/ClipData;)V

    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    const/16 v2, 0x2045

    invoke-virtual {v1, v0, v2}, Lcn/hongguo/tv/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method maybeRemind()V
    .locals 5

    .line 31
    iget-boolean v0, p0, Lcn/hongguo/tv/TvUpdater;->destroyed:Z

    if-nez v0, :cond_4

    iget-boolean v0, p0, Lcn/hongguo/tv/TvUpdater;->busy:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->reminder:Landroid/app/AlertDialog;

    if-nez v0, :cond_4

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-boolean v0, v0, Lcn/hongguo/tv/MainActivity;->activityVisible:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v0}, Lcn/hongguo/tv/MainActivity;->hasWindowFocus()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-nez v0, :cond_4

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    if-nez v0, :cond_0

    goto/16 :goto_0

    .line 32
    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity$Screen;->name:Ljava/lang/String;

    const-string v1, "\u9996\u9875"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity$Screen;->name:Ljava/lang/String;

    const-string v1, "\u6f2b\u5267"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity$Screen;->name:Ljava/lang/String;

    const-string v1, "AI\u5267"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcn/hongguo/tv/TvUpdater;->dueReminder(J)Z

    move-result v0

    if-nez v0, :cond_3

    :cond_2
    return-void

    .line 33
    :cond_3
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->latest:Lcn/hongguo/tv/UpdateRelease;

    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, v1, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "update_reminded_version"

    iget-object v3, v0, Lcn/hongguo/tv/UpdateRelease;->version:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "update_reminded_at"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 34
    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcn/hongguo/tv/MainActivity;->dialog(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u53d1\u73b0\u65b0\u7248\u672c "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcn/hongguo/tv/UpdateRelease;->version:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u5f53\u524d "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcn/hongguo/tv/TvUpdater;->current:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " \u2192 "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcn/hongguo/tv/UpdateRelease;->version:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n\u5b89\u88c5\u5305 "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, v0, Lcn/hongguo/tv/UpdateRelease;->bytes:J

    invoke-static {v3, v4}, Lcn/hongguo/tv/TvUpdater;->size(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcn/hongguo/tv/UpdateRelease;->notes:Ljava/lang/String;

    invoke-static {v3}, Lcn/hongguo/tv/TvUpdater;->brief(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n\n\u8986\u76d6\u5b89\u88c5\u4fdd\u7559\u6536\u85cf\u3001\u5386\u53f2\u548c\u8bbe\u7f6e\u3002"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda1;-><init>(Lcn/hongguo/tv/TvUpdater;)V

    .line 35
    const-string v3, "\u67e5\u770b\u66f4\u65b0"

    invoke-virtual {v1, v3, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u7a0d\u540e\u63d0\u9192"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0, v0}, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda2;-><init>(Lcn/hongguo/tv/TvUpdater;Lcn/hongguo/tv/UpdateRelease;)V

    const-string v0, "\u5ffd\u7565\u6b64\u7248\u672c"

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcn/hongguo/tv/TvUpdater;->reminder:Landroid/app/AlertDialog;

    .line 36
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->reminder:Landroid/app/AlertDialog;

    new-instance v1, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda3;-><init>(Lcn/hongguo/tv/TvUpdater;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->reminder:Landroid/app/AlertDialog;

    new-instance v1, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0}, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda4;-><init>(Lcn/hongguo/tv/TvUpdater;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->reminder:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 37
    return-void

    .line 31
    :cond_4
    :goto_0
    return-void
.end method

.method newer()Z
    .locals 3

    .line 20
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->latest:Lcn/hongguo/tv/UpdateRelease;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->latest:Lcn/hongguo/tv/UpdateRelease;

    iget-object v1, v1, Lcn/hongguo/tv/UpdateRelease;->version:Ljava/lang/String;

    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->current:Ljava/lang/String;

    invoke-static {v1, v2}, Lcn/hongguo/tv/UpdateRelease;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-lez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    :catch_0
    move-exception v1

    return v0
.end method

.method page()V
    .locals 10

    .line 41
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    const-string v1, "\u5e94\u7528\u66f4\u65b0"

    invoke-virtual {v0, v1}, Lcn/hongguo/tv/MainActivity;->shell(Ljava/lang/String;)Landroid/widget/LinearLayout;

    move-result-object v0

    iput-object v0, p0, Lcn/hongguo/tv/TvUpdater;->page:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->page:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Lcn/hongguo/tv/MainActivity;->body(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v3, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v3}, Lcn/hongguo/tv/MainActivity;->ink()I

    move-result v3

    const-string v4, ""

    const/16 v5, 0x11

    invoke-virtual {v2, v4, v5, v3}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v2

    iput-object v2, p0, Lcn/hongguo/tv/TvUpdater;->info:Landroid/widget/TextView;

    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->info:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v2, Landroid/widget/ProgressBar;

    iget-object v3, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    const/4 v5, 0x0

    const v6, 0x1010078

    invoke-direct {v2, v3, v5, v6}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v2, p0, Lcn/hongguo/tv/TvUpdater;->progress:Landroid/widget/ProgressBar;

    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->progress:Landroid/widget/ProgressBar;

    const/16 v3, 0x64

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setMax(I)V

    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->progress:Landroid/widget/ProgressBar;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v5, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    const/high16 v6, 0x41400000    # 12.0f

    invoke-virtual {v5, v6}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v5

    const/4 v6, -0x1

    invoke-direct {v3, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 42
    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v2}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v2

    iget-object v3, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    new-instance v5, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda9;

    invoke-direct {v5, p0}, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda9;-><init>(Lcn/hongguo/tv/TvUpdater;)V

    const-string v7, "\u68c0\u67e5\u66f4\u65b0"

    const/4 v8, 0x0

    invoke-virtual {v3, v7, v5, v8}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v3

    iput-object v3, p0, Lcn/hongguo/tv/TvUpdater;->check:Landroid/widget/Button;

    iget-object v3, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    new-instance v5, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda10;

    invoke-direct {v5, p0}, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda10;-><init>(Lcn/hongguo/tv/TvUpdater;)V

    const-string v7, "\u4e0b\u8f7d\u5e76\u5b89\u88c5"

    invoke-virtual {v3, v7, v5, v8}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v3

    iput-object v3, p0, Lcn/hongguo/tv/TvUpdater;->download:Landroid/widget/Button;

    iget-object v3, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    new-instance v5, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda11;

    invoke-direct {v5, p0}, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda11;-><init>(Lcn/hongguo/tv/TvUpdater;)V

    const-string v7, "\u53d6\u6d88\u4e0b\u8f7d"

    invoke-virtual {v3, v7, v5, v8}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v3

    iput-object v3, p0, Lcn/hongguo/tv/TvUpdater;->cancel:Landroid/widget/Button;

    iget-object v3, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v5, p0, Lcn/hongguo/tv/TvUpdater;->check:Landroid/widget/Button;

    invoke-virtual {v3, v2, v5}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    iget-object v3, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v5, p0, Lcn/hongguo/tv/TvUpdater;->download:Landroid/widget/Button;

    invoke-virtual {v3, v2, v5}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    iget-object v3, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v5, p0, Lcn/hongguo/tv/TvUpdater;->cancel:Landroid/widget/Button;

    invoke-virtual {v3, v2, v5}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 43
    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    new-instance v3, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda12;

    invoke-direct {v3, p0}, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda12;-><init>(Lcn/hongguo/tv/TvUpdater;)V

    invoke-virtual {v2, v4, v3, v8}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, p0, Lcn/hongguo/tv/TvUpdater;->reminders:Landroid/widget/Button;

    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->reminders:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 44
    new-instance v2, Landroid/widget/ScrollView;

    iget-object v3, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    invoke-direct {v2, v3}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/ScrollView;->setFocusable(Z)V

    const-string v5, "\u66f4\u65b0\u8bf4\u660e\uff0c\u4e0a\u4e0b\u952e\u6eda\u52a8"

    invoke-virtual {v2, v5}, Landroid/widget/ScrollView;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v5, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v7, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v7}, Lcn/hongguo/tv/MainActivity;->muted()I

    move-result v7

    const/16 v9, 0xf

    invoke-virtual {v5, v4, v9, v7}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v4

    iput-object v4, p0, Lcn/hongguo/tv/TvUpdater;->notes:Landroid/widget/TextView;

    iget-object v4, p0, Lcn/hongguo/tv/TvUpdater;->notes:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v4, v6, v8, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 45
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->page:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Lcn/hongguo/tv/MainActivity;->pageUi(Landroid/view/View;)Lcn/hongguo/tv/MainActivity$PageUi;

    move-result-object v0

    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->check:Landroid/widget/Button;

    iput-object v2, v0, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->page:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lcn/hongguo/tv/TvUpdater;->check:Landroid/widget/Button;

    invoke-virtual {v0, v2, v1, v4, v3}, Lcn/hongguo/tv/MainActivity;->show(Landroid/view/View;Ljava/lang/String;Landroid/view/View;Z)V

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->render()V

    iget-boolean v0, p0, Lcn/hongguo/tv/TvUpdater;->busy:Z

    if-nez v0, :cond_0

    invoke-virtual {p0, v3}, Lcn/hongguo/tv/TvUpdater;->check(Z)V

    .line 46
    :cond_0
    return-void
.end method

.method pause()V
    .locals 2

    .line 24
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->automatic:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-boolean v0, p0, Lcn/hongguo/tv/TvUpdater;->downloading:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->cancelWork()V

    :cond_0
    return-void
.end method

.method render()V
    .locals 6

    .line 47
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->page:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity$Screen;->view:Landroid/view/View;

    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->page:Landroid/widget/LinearLayout;

    if-eq v0, v1, :cond_0

    goto/16 :goto_5

    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->cancel:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->hasFocus()Z

    move-result v0

    .line 48
    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->info:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u5f53\u524d\u7248\u672c "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcn/hongguo/tv/TvUpdater;->current:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcn/hongguo/tv/TvUpdater;->status:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->progress:Landroid/widget/ProgressBar;

    iget-boolean v2, p0, Lcn/hongguo/tv/TvUpdater;->downloading:Z

    const/16 v3, 0x8

    const/4 v4, 0x0

    if-eqz v2, :cond_1

    const/4 v2, 0x0

    goto :goto_0

    :cond_1
    const/16 v2, 0x8

    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->progress:Landroid/widget/ProgressBar;

    iget v2, p0, Lcn/hongguo/tv/TvUpdater;->percent:I

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setProgress(I)V

    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->check:Landroid/widget/Button;

    iget-boolean v2, p0, Lcn/hongguo/tv/TvUpdater;->busy:Z

    const/4 v5, 0x1

    xor-int/2addr v2, v5

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->download:Landroid/widget/Button;

    iget-boolean v2, p0, Lcn/hongguo/tv/TvUpdater;->busy:Z

    if-nez v2, :cond_2

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->newer()Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v2, 0x1

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    :goto_1
    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->download:Landroid/widget/Button;

    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    invoke-static {v2}, Lcn/hongguo/tv/UpdateClient;->apk(Landroid/content/Context;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_3

    const-string v2, "\u5b89\u88c5\u66f4\u65b0"

    goto :goto_2

    :cond_3
    const-string v2, "\u4e0b\u8f7d\u5e76\u5b89\u88c5"

    :goto_2
    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->cancel:Landroid/widget/Button;

    iget-boolean v2, p0, Lcn/hongguo/tv/TvUpdater;->downloading:Z

    if-eqz v2, :cond_4

    const/4 v3, 0x0

    :cond_4
    invoke-virtual {v1, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 49
    if-eqz v0, :cond_5

    iget-boolean v0, p0, Lcn/hongguo/tv/TvUpdater;->downloading:Z

    if-nez v0, :cond_5

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->check:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->requestFocusFromTouch()Z

    .line 50
    :cond_5
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->reminders:Landroid/widget/Button;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u65b0\u7248\u672c\u63d0\u9192\uff1a"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v2, v2, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v3, "update_reminders"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_6

    const-string v2, "\u5f00"

    goto :goto_3

    :cond_6
    const-string v2, "\u5173"

    :goto_3
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 51
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->notes:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->newer()Z

    move-result v1

    if-eqz v1, :cond_7

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u65b0\u7248\u672c "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->latest:Lcn/hongguo/tv/UpdateRelease;

    iget-object v2, v2, Lcn/hongguo/tv/UpdateRelease;->version:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u00b7 "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->latest:Lcn/hongguo/tv/UpdateRelease;

    iget-wide v2, v2, Lcn/hongguo/tv/UpdateRelease;->bytes:J

    invoke-static {v2, v3}, Lcn/hongguo/tv/TvUpdater;->size(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater;->latest:Lcn/hongguo/tv/UpdateRelease;

    iget-object v2, v2, Lcn/hongguo/tv/UpdateRelease;->notes:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n\n\u4e0b\u8f7d\u540e\u6838\u9a8c\u539f\u7248\u7b7e\u540d\uff0c\u5b89\u88c5\u9700\u5728\u7cfb\u7edf\u754c\u9762\u786e\u8ba4\u3002"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_4

    :cond_7
    const-string v1, "\u6bcf\u5929\u6253\u5f00\u5e94\u7528\u65f6\u68c0\u67e5\u4e00\u6b21\uff0c\u4ec5\u5728\u9996\u9875\u63d0\u9192\uff0c\u64ad\u653e\u65f6\u6682\u7f13\u3002\n\n\u66f4\u65b0\u6765\u81ea\u539f\u53d1\u884c\u4ed3\u5e93\u7684 TV \u7248\u672c\uff1b\u8986\u76d6\u5b89\u88c5\u4fdd\u7559\u8bb0\u5f55\u3002\u7f51\u7edc\u4e0d\u53ef\u7528\u65f6\u53ef\u7a0d\u540e\u624b\u52a8\u91cd\u8bd5\u3002"

    :goto_4
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    return-void

    .line 47
    :cond_8
    :goto_5
    return-void
.end method

.method requestInstall()V
    .locals 3

    .line 61
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-boolean v0, v0, Lcn/hongguo/tv/MainActivity;->activityVisible:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    invoke-static {v0}, Lcn/hongguo/tv/UpdateClient;->apk(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 62
    :cond_0
    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->installAllowed()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcn/hongguo/tv/MainActivity;->dialog(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u5141\u8bb8\u5b89\u88c5\u672c\u5e94\u7528\u7684\u66f4\u65b0"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u8bf7\u5728\u7cfb\u7edf\u8bbe\u7f6e\u4e2d\u5141\u8bb8\u201c\u7ea2\u679c\u7535\u89c6\u7aef\u201d\u5b89\u88c5\u5e94\u7528\uff0c\u8fd4\u56de\u540e\u7ee7\u7eed\u5b89\u88c5\u3002\u672c\u64cd\u4f5c\u4e0d\u4f1a\u5378\u8f7d\u6216\u6e05\u9664\u89c2\u770b\u8bb0\u5f55\u3002"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda13;

    invoke-direct {v1, p0}, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda13;-><init>(Lcn/hongguo/tv/TvUpdater;)V

    .line 63
    const-string v2, "\u53bb\u8bbe\u7f6e"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u7a0d\u540e"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void

    .line 64
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->launchInstaller()V

    const-string v0, "\u5df2\u6253\u5f00\u7cfb\u7edf\u5b89\u88c5\u5668\uff0c\u8bf7\u786e\u8ba4\u5b89\u88c5"

    iput-object v0, p0, Lcn/hongguo/tv/TvUpdater;->status:Ljava/lang/String;

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->render()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v0, "\u65e0\u6cd5\u6253\u5f00\u5b89\u88c5\u5668\uff0c\u8bf7\u4ece\u8bbe\u7f6e\u4e2d\u7684\u539f\u7248\u5165\u53e3\u624b\u52a8\u5b89\u88c5"

    iput-object v0, p0, Lcn/hongguo/tv/TvUpdater;->status:Ljava/lang/String;

    invoke-virtual {p0}, Lcn/hongguo/tv/TvUpdater;->render()V

    .line 65
    :goto_0
    return-void

    .line 61
    :cond_2
    :goto_1
    return-void
.end method

.method resume()V
    .locals 4

    .line 23
    iget-boolean v0, p0, Lcn/hongguo/tv/TvUpdater;->destroyed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->automatic:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater;->automatic:Ljava/lang/Runnable;

    const-wide/16 v2, 0x1770

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    new-instance v1, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda0;-><init>(Lcn/hongguo/tv/TvUpdater;)V

    const-wide/16 v2, 0x320

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
