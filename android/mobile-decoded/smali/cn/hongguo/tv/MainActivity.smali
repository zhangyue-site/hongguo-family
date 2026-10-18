.class public Lcn/hongguo/tv/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/hongguo/tv/MainActivity$Modern21;,
        Lcn/hongguo/tv/MainActivity$Screen;,
        Lcn/hongguo/tv/MainActivity$PageUi;,
        Lcn/hongguo/tv/MainActivity$Done;,
        Lcn/hongguo/tv/MainActivity$Modern26;,
        Lcn/hongguo/tv/MainActivity$Modern23;
    }
.end annotation


# static fields
.field static final INK:I

.field static final MUTED:I

.field static final PINK:I


# instance fields
.field activityVisible:Z

.field api:Lcn/hongguo/tv/Api;

.field final back:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Lcn/hongguo/tv/MainActivity$Screen;",
            ">;"
        }
    .end annotation
.end field

.field final beginHold:Ljava/lang/Runnable;

.field buffering:Z

.field catalog:Lcn/hongguo/tv/Catalog;

.field catalogMode:Ljava/lang/String;

.field chrome:Landroid/widget/LinearLayout;

.field clock:Landroid/widget/TextView;

.field confirmConsumed:Z

.field confirmEligible:Z

.field confirmFromHidden:Z

.field controlsVisible:Z

.field coverIo:Ljava/util/concurrent/ThreadPoolExecutor;

.field covers:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field current:Lorg/json/JSONObject;

.field ended:Z

.field episode:I

.field episodes:Lorg/json/JSONArray;

.field failure:Ljava/lang/String;

.field forwardButton:Landroid/widget/Button;

.field volatile generation:I

.field heldConfirmKey:I

.field final hideChrome:Ljava/lang/Runnable;

.field holdHint:Landroid/widget/TextView;

.field host:Landroid/widget/FrameLayout;

.field io:Ljava/util/concurrent/ThreadPoolExecutor;

.field lastProgressWrite:J

.field lastTransitionMs:J

.field mediaGeneration:I

.field mediaIo:Ljava/util/concurrent/ThreadPoolExecutor;

.field mediaJob:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation
.end field

.field memory:Lcn/hongguo/tv/MemoryProfile;

.field nextButton:Landroid/widget/Button;

.field overlayReturnFocus:Landroid/view/View;

.field pauseButton:Landroid/widget/Button;

.field pendingSeek:J

.field playback:Landroid/widget/FrameLayout;

.field player:Landroid/media/MediaPlayer;

.field prefetchDisabledUntil:J

.field prefetchJob:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation
.end field

.field prefetchKey:Ljava/lang/String;

.field prefs:Landroid/content/SharedPreferences;

.field prepared:Z

.field qualityNote:Ljava/lang/String;

.field rateButton:Landroid/widget/Button;

.field recommendationSaveAt:J

.field recommendationTicket:I

.field recommendations:Lcn/hongguo/tv/Recommendations;

.field released:Z

.field resuming:Z

.field rewindButton:Landroid/widget/Button;

.field screen:Lcn/hongguo/tv/MainActivity$Screen;

.field seek:Landroid/widget/SeekBar;

.field seekPreview:I

.field sleepDeadline:J

.field final sleepStop:Ljava/lang/Runnable;

.field speed:F

.field final stallTimeout:Ljava/lang/Runnable;

.field status:Landroid/widget/TextView;

.field surface:Landroid/view/SurfaceView;

.field temporaryOwner:Landroid/media/MediaPlayer;

.field temporarySpeed:Z

.field final ticker:Ljava/lang/Runnable;

.field transitionStartedAt:J

.field final ui:Landroid/os/Handler;

.field updates:Lcn/hongguo/tv/TvUpdater;

.field videoHeight:I

.field videoWidth:I

.field wantPlaying:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 10
    const/16 v0, 0x72

    const/16 v1, 0x99

    const/16 v2, 0xfb

    invoke-static {v2, v0, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    sput v0, Lcn/hongguo/tv/MainActivity;->PINK:I

    const/16 v0, 0x19

    const/16 v1, 0x1c

    const/16 v2, 0x18

    invoke-static {v2, v0, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    sput v0, Lcn/hongguo/tv/MainActivity;->INK:I

    const/16 v0, 0x66

    const/16 v1, 0x6d

    const/16 v2, 0x61

    invoke-static {v2, v0, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    sput v0, Lcn/hongguo/tv/MainActivity;->MUTED:I

    return-void
.end method

.method public constructor <init>()V
    .locals 5

    .line 9
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 18
    const/4 v0, -0x1

    iput v0, p0, Lcn/hongguo/tv/MainActivity;->recommendationTicket:I

    .line 19
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    check-cast v2, Ljava/util/concurrent/ThreadPoolExecutor;

    iput-object v2, p0, Lcn/hongguo/tv/MainActivity;->mediaIo:Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v2, 0x0

    iput v2, p0, Lcn/hongguo/tv/MainActivity;->mediaGeneration:I

    const-string v3, ""

    iput-object v3, p0, Lcn/hongguo/tv/MainActivity;->prefetchKey:Ljava/lang/String;

    .line 20
    new-instance v4, Ljava/util/ArrayDeque;

    invoke-direct {v4}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v4, p0, Lcn/hongguo/tv/MainActivity;->back:Ljava/util/ArrayDeque;

    .line 21
    iput v2, p0, Lcn/hongguo/tv/MainActivity;->generation:I

    const-string v4, "short"

    iput-object v4, p0, Lcn/hongguo/tv/MainActivity;->catalogMode:Ljava/lang/String;

    .line 23
    iput v0, p0, Lcn/hongguo/tv/MainActivity;->seekPreview:I

    .line 24
    new-instance v0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda26;

    invoke-direct {v0, p0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda26;-><init>(Lcn/hongguo/tv/MainActivity;)V

    iput-object v0, p0, Lcn/hongguo/tv/MainActivity;->sleepStop:Ljava/lang/Runnable;

    .line 25
    iput-boolean v2, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    iput-boolean v2, p0, Lcn/hongguo/tv/MainActivity;->ended:Z

    iput-boolean v1, p0, Lcn/hongguo/tv/MainActivity;->controlsVisible:Z

    iput-boolean v2, p0, Lcn/hongguo/tv/MainActivity;->released:Z

    iput-boolean v2, p0, Lcn/hongguo/tv/MainActivity;->resuming:Z

    iput-boolean v2, p0, Lcn/hongguo/tv/MainActivity;->buffering:Z

    iput-boolean v2, p0, Lcn/hongguo/tv/MainActivity;->activityVisible:Z

    iput-boolean v2, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    .line 26
    iput v1, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcn/hongguo/tv/MainActivity;->speed:F

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcn/hongguo/tv/MainActivity;->pendingSeek:J

    iput-object v3, p0, Lcn/hongguo/tv/MainActivity;->failure:Ljava/lang/String;

    iput-wide v0, p0, Lcn/hongguo/tv/MainActivity;->lastProgressWrite:J

    .line 28
    new-instance v0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda27;

    invoke-direct {v0, p0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda27;-><init>(Lcn/hongguo/tv/MainActivity;)V

    iput-object v0, p0, Lcn/hongguo/tv/MainActivity;->beginHold:Ljava/lang/Runnable;

    .line 47
    new-instance v0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda28;

    invoke-direct {v0, p0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda28;-><init>(Lcn/hongguo/tv/MainActivity;)V

    iput-object v0, p0, Lcn/hongguo/tv/MainActivity;->hideChrome:Ljava/lang/Runnable;

    .line 48
    new-instance v0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda29;

    invoke-direct {v0, p0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda29;-><init>(Lcn/hongguo/tv/MainActivity;)V

    iput-object v0, p0, Lcn/hongguo/tv/MainActivity;->stallTimeout:Ljava/lang/Runnable;

    .line 49
    new-instance v0, Lcn/hongguo/tv/MainActivity$1;

    invoke-direct {v0, p0}, Lcn/hongguo/tv/MainActivity$1;-><init>(Lcn/hongguo/tv/MainActivity;)V

    iput-object v0, p0, Lcn/hongguo/tv/MainActivity;->ticker:Ljava/lang/Runnable;

    .line 233
    iput-object v3, p0, Lcn/hongguo/tv/MainActivity;->qualityNote:Ljava/lang/String;

    return-void
.end method

.method static synthetic lambda$button$7(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 67
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$detail$50()V
    .locals 0

    .line 146
    return-void
.end method

.method static synthetic lambda$home$23(ILcn/hongguo/tv/MainActivity$PageUi;Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 113
    invoke-virtual {p4}, Landroid/view/KeyEvent;->getAction()I

    move-result p2

    const/4 p4, 0x0

    if-eqz p2, :cond_0

    return p4

    :cond_0
    const/16 p2, 0x15

    const/4 v0, 0x1

    if-ne p3, p2, :cond_1

    if-nez p0, :cond_1

    iget-object p0, p1, Lcn/hongguo/tv/MainActivity$PageUi;->activeRail:Landroid/view/View;

    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->requestFocusFromTouch()Z

    return v0

    :cond_1
    const/16 p0, 0x14

    if-ne p3, p0, :cond_2

    iget-object p0, p1, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    if-eqz p0, :cond_2

    iget-object p0, p1, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    goto :goto_0

    :cond_2
    return p4
.end method

.method static synthetic lambda$home$27(Lorg/json/JSONObject;Lorg/json/JSONObject;)I
    .locals 3

    .line 117
    const-string v0, "updated"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v1

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide p0

    invoke-static {v1, v2, p0, p1}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic lambda$manageSaved$61(Lorg/json/JSONObject;Lorg/json/JSONObject;)I
    .locals 3

    .line 188
    const-string v0, "updated"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v1

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide p0

    invoke-static {v1, v2, p0, p1}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic lambda$manageSaved$62()V
    .locals 0

    .line 188
    return-void
.end method

.method static synthetic lambda$manageSaved$64(Landroid/app/AlertDialog;Landroid/content/DialogInterface;)V
    .locals 0

    .line 188
    const/4 p1, -0x2

    invoke-virtual {p0, p1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Button;->requestFocusFromTouch()Z

    return-void
.end method

.method static synthetic lambda$maybePrefetch$72(Lcn/hongguo/tv/Api;Ljava/lang/String;II)V
    .locals 0

    .line 221
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Lcn/hongguo/tv/Api;->prefetch(Ljava/lang/String;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    :goto_0
    return-void
.end method

.method static synthetic lambda$renderCards$35(Landroid/view/View;Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 134
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    if-nez p1, :cond_0

    const/16 p1, 0x13

    if-ne p2, p1, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->requestFocusFromTouch()Z

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method static synthetic lambda$renderEpisodePage$56(Landroid/view/View;Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 171
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    const/4 p3, 0x0

    if-eqz p1, :cond_0

    return p3

    :cond_0
    const/16 p1, 0x14

    if-ne p2, p1, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->requestFocusFromTouch()Z

    const/4 p0, 0x1

    return p0

    :cond_1
    return p3
.end method

.method static synthetic lambda$search$43(Landroid/widget/Button;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 142
    invoke-virtual {p0}, Landroid/widget/Button;->performClick()Z

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$settings$59()V
    .locals 0

    .line 175
    return-void
.end method

.method static synthetic lambda$shell$19(Ljava/util/ArrayList;ILcn/hongguo/tv/MainActivity$PageUi;Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 2

    .line 99
    invoke-virtual {p5}, Landroid/view/KeyEvent;->getAction()I

    move-result p3

    const/4 p5, 0x0

    if-eqz p3, :cond_0

    return p5

    :cond_0
    const/16 p3, 0x15

    const/4 v0, 0x1

    if-ne p4, p3, :cond_1

    return v0

    :cond_1
    const/16 p3, 0x13

    if-eq p4, p3, :cond_5

    const/16 v1, 0x14

    if-ne p4, v1, :cond_2

    goto :goto_1

    :cond_2
    const/16 p0, 0x16

    if-ne p4, p0, :cond_4

    iget-object p0, p2, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    if-eqz p0, :cond_3

    iget-object p0, p2, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p0

    if-eqz p0, :cond_3

    iget-object p0, p2, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    goto :goto_0

    :cond_3
    iget-object p0, p2, Lcn/hongguo/tv/MainActivity$PageUi;->top:Landroid/view/View;

    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->requestFocusFromTouch()Z

    return v0

    :cond_4
    return p5

    :cond_5
    :goto_1
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p2

    sub-int/2addr p2, v0

    if-ne p4, p3, :cond_6

    const/4 p3, -0x1

    goto :goto_2

    :cond_6
    const/4 p3, 0x1

    :goto_2
    add-int/2addr p1, p3

    invoke-static {p2, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {p5, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    goto :goto_0
.end method

.method static synthetic lambda$shell$20(Lcn/hongguo/tv/MainActivity$PageUi;Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 100
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    if-nez p1, :cond_0

    const/16 p1, 0x15

    if-ne p2, p1, :cond_0

    iget-object p0, p0, Lcn/hongguo/tv/MainActivity$PageUi;->activeRail:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->requestFocusFromTouch()Z

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method static synthetic lambda$wireGrid$37(ILjava/util/ArrayList;ILcn/hongguo/tv/MainActivity$PageUi;Landroid/view/View;Landroid/view/View;Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 4

    .line 138
    invoke-virtual {p8}, Landroid/view/KeyEvent;->getAction()I

    move-result p8

    const/4 v0, 0x0

    if-eqz p8, :cond_0

    return v0

    :cond_0
    const/16 p8, 0x15

    const/4 v1, 0x3

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-ne p7, p8, :cond_1

    const/4 p7, 0x0

    goto :goto_0

    :cond_1
    const/16 p8, 0x16

    if-ne p7, p8, :cond_2

    const/4 p7, 0x1

    goto :goto_0

    :cond_2
    const/16 p8, 0x13

    if-ne p7, p8, :cond_3

    const/4 p7, 0x2

    goto :goto_0

    :cond_3
    const/16 p8, 0x14

    if-ne p7, p8, :cond_4

    const/4 p7, 0x3

    goto :goto_0

    :cond_4
    const/4 p7, -0x1

    :goto_0
    if-gez p7, :cond_5

    return v0

    :cond_5
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p8

    invoke-static {p0, p8, p2, p7}, Lcn/hongguo/tv/FocusGraph;->move(IIII)I

    move-result p8

    if-nez p7, :cond_6

    rem-int v0, p0, p2

    if-nez v0, :cond_6

    if-eqz p3, :cond_6

    iput-object p6, p3, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    iget-object p0, p3, Lcn/hongguo/tv/MainActivity$PageUi;->activeRail:Landroid/view/View;

    goto :goto_1

    :cond_6
    if-ne p7, v2, :cond_7

    if-ge p0, p2, :cond_7

    if-eqz p4, :cond_7

    invoke-virtual {p4}, Landroid/view/View;->requestFocusFromTouch()Z

    goto :goto_2

    :cond_7
    if-ne p7, v1, :cond_8

    div-int/2addr p0, p2

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p3

    sub-int/2addr p3, v3

    div-int/2addr p3, p2

    if-ne p0, p3, :cond_8

    if-eqz p5, :cond_8

    invoke-virtual {p5}, Landroid/view/View;->requestFocusFromTouch()Z

    goto :goto_2

    :cond_8
    invoke-virtual {p1, p8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    :goto_1
    invoke-virtual {p0}, Landroid/view/View;->requestFocusFromTouch()Z

    :goto_2
    return v3
.end method

.method static time(J)Ljava/lang/String;
    .locals 5

    .line 235
    const-wide/16 v0, 0x3e8

    div-long/2addr p0, v0

    const-wide/16 v0, 0x0

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p0

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-wide/16 v1, 0x3c

    div-long v3, p0, v1

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    rem-long/2addr p0, v1

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    const/4 p1, 0x2

    new-array p1, p1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object v3, p1, v1

    const/4 v1, 0x1

    aput-object p0, p1, v1

    const-string p0, "%02d:%02d"

    invoke-static {v0, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 5

    .line 68
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v1, 0x42500000    # 52.0f

    invoke-virtual {p0, v1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v1

    const/4 v2, -0x2

    invoke-direct {v0, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v1, 0x40a00000    # 5.0f

    invoke-virtual {p0, v1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v2

    const/high16 v3, 0x40800000    # 4.0f

    invoke-virtual {p0, v3}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v4

    invoke-virtual {p0, v1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v1

    invoke-virtual {p0, v3}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v3

    invoke-virtual {v0, v2, v4, v1, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {p1, p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method applySpeed()V
    .locals 3

    .line 261
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-ge v0, v1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-eqz v0, :cond_2

    :try_start_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    iget-boolean v2, p0, Lcn/hongguo/tv/MainActivity;->temporarySpeed:Z

    if-eqz v2, :cond_1

    const/high16 v2, 0x40000000    # 2.0f

    goto :goto_0

    :cond_1
    iget v2, p0, Lcn/hongguo/tv/MainActivity;->speed:F

    :goto_0
    invoke-static {v1, v2}, Lcn/hongguo/tv/MainActivity$Modern23;->speed(Landroid/media/MediaPlayer;F)V

    if-nez v0, :cond_2

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u8be5\u8bbe\u5907\u6682\u4e0d\u652f\u6301\u6b64\u500d\u901f"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_2
    :goto_1
    return-void
.end method

.method bg(II)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 62
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->themedFill(I)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 p1, 0x41000000    # 8.0f

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    if-eqz p2, :cond_0

    const/high16 p1, 0x40400000    # 3.0f

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result p1

    invoke-virtual {v0, p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    :cond_0
    return-object v0
.end method

.method body(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;
    .locals 1

    .line 81
    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->pageUi(Landroid/view/View;)Lcn/hongguo/tv/MainActivity$PageUi;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, v0, Lcn/hongguo/tv/MainActivity$PageUi;->body:Landroid/widget/LinearLayout;

    :goto_0
    return-object p1
.end method

.method bucket(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3

    .line 144
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v2, "{}"

    invoke-interface {v1, p1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    return-object p1
.end method

.method button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;
    .locals 4

    .line 67
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    const/high16 p1, 0x41880000    # 17.0f

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextSize(F)V

    if-eqz p3, :cond_0

    const/4 p1, -0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->ink()I

    move-result p1

    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextColor(I)V

    const/high16 p1, 0x41800000    # 16.0f

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v1

    const/high16 v2, 0x41200000    # 10.0f

    invoke-virtual {p0, v2}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v3

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result p1

    invoke-virtual {p0, v2}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v2

    invoke-virtual {v0, v1, v3, p1, v2}, Landroid/widget/Button;->setPadding(IIII)V

    const/high16 p1, 0x42400000    # 48.0f

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    invoke-virtual {p0, v0, p3}, Lcn/hongguo/tv/MainActivity;->focusStyle(Landroid/view/View;Z)V

    invoke-static {v0}, Lcn/hongguo/tv/MainActivity$Modern21;->buttonStyle(Landroid/view/View;)V

    new-instance p1, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda2;

    invoke-direct {p1, p2}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda2;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method cancelConfirmHold()V
    .locals 2

    .line 35
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->beginHold:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->confirmEligible:Z

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcn/hongguo/tv/MainActivity;->confirmConsumed:Z

    iget-boolean v1, p0, Lcn/hongguo/tv/MainActivity;->temporarySpeed:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->temporaryOwner:Landroid/media/MediaPlayer;

    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->temporarySpeed:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcn/hongguo/tv/MainActivity;->temporaryOwner:Landroid/media/MediaPlayer;

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-ne v1, v0, :cond_0

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->applySpeed()V

    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->holdHint:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->holdHint:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_1
    return-void
.end method

.method cancelMedia()V
    .locals 2

    .line 230
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelPrefetch()V

    iget v0, p0, Lcn/hongguo/tv/MainActivity;->mediaGeneration:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lcn/hongguo/tv/MainActivity;->mediaGeneration:I

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->mediaJob:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->mediaJob:Ljava/util/concurrent/Future;

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcn/hongguo/tv/MainActivity;->mediaJob:Ljava/util/concurrent/Future;

    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->mediaIo:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->getQueue()Ljava/util/concurrent/BlockingQueue;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->clear()V

    return-void
.end method

.method cancelMediaForEpisode(I)V
    .locals 3

    .line 223
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->current:Lorg/json/JSONObject;

    const-string v2, "id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->qualityCeiling()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 224
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->prefetchJob:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->prefetchJob:Ljava/util/concurrent/Future;

    invoke-interface {v0}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->prefetchKey:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 226
    iget p1, p0, Lcn/hongguo/tv/MainActivity;->mediaGeneration:I

    const/4 v0, 0x1

    add-int/2addr p1, v0

    iput p1, p0, Lcn/hongguo/tv/MainActivity;->mediaGeneration:I

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->mediaJob:Ljava/util/concurrent/Future;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->mediaJob:Ljava/util/concurrent/Future;

    invoke-interface {p1, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z

    const/4 p1, 0x0

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity;->mediaJob:Ljava/util/concurrent/Future;

    goto :goto_0

    .line 227
    :cond_0
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelMedia()V

    .line 228
    :cond_1
    :goto_0
    return-void
.end method

.method cancelPrefetch()V
    .locals 2

    .line 219
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->prefetchJob:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->prefetchJob:Ljava/util/concurrent/Future;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcn/hongguo/tv/MainActivity;->prefetchJob:Ljava/util/concurrent/Future;

    :cond_0
    const-string v0, ""

    iput-object v0, p0, Lcn/hongguo/tv/MainActivity;->prefetchKey:Ljava/lang/String;

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->mediaIo:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->purge()V

    return-void
.end method

.method catalogItems(Ljava/lang/String;Ljava/lang/String;Lcn/hongguo/tv/Api;Z)Lcn/hongguo/tv/Catalog$Result;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 121
    :try_start_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->catalog:Lcn/hongguo/tv/Catalog;

    invoke-virtual {v0, p1, p2, p4}, Lcn/hongguo/tv/Catalog;->searchPage(Ljava/lang/String;Ljava/lang/String;Z)Lcn/hongguo/tv/Catalog$Result;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p4

    instance-of v0, p4, Ljava/lang/InterruptedException;

    if-nez v0, :cond_1

    instance-of v0, p4, Ljava/io/InterruptedIOException;

    if-eqz v0, :cond_0

    instance-of v0, p4, Ljava/net/SocketTimeoutException;

    if-eqz v0, :cond_1

    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "ai"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p3, :cond_1

    invoke-virtual {p3}, Lcn/hongguo/tv/Api;->ready()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p3}, Lcn/hongguo/tv/Api;->independent()Z

    move-result v0

    if-nez v0, :cond_1

    new-instance p4, Lcn/hongguo/tv/Catalog$Result;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/catalog?q="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lcn/hongguo/tv/Api;->q(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "&mode="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {p2}, Lcn/hongguo/tv/Api;->q(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcn/hongguo/tv/Api;->json(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "items"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    const/4 p2, 0x0

    invoke-direct {p4, p1, p2, p2}, Lcn/hongguo/tv/Catalog$Result;-><init>(Lorg/json/JSONArray;ZZ)V

    return-object p4

    :cond_1
    throw p4
.end method

.method catalogItems(Ljava/lang/String;Ljava/lang/String;Lcn/hongguo/tv/Api;)Lorg/json/JSONArray;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 120
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcn/hongguo/tv/MainActivity;->catalogItems(Ljava/lang/String;Ljava/lang/String;Lcn/hongguo/tv/Api;Z)Lcn/hongguo/tv/Catalog$Result;

    move-result-object p1

    iget-object p1, p1, Lcn/hongguo/tv/Catalog$Result;->items:Lorg/json/JSONArray;

    return-object p1
.end method

.method categories()V
    .locals 14

    .line 143
    const-string v0, "\u6309\u9898\u6750\u627e\u5267"

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->shell(Ljava/lang/String;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->body(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->column()Landroid/widget/LinearLayout;

    move-result-object v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iget-object v4, p0, Lcn/hongguo/tv/MainActivity;->catalogMode:Ljava/lang/String;

    const-string v5, "ai"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    sget-object v4, Lcn/hongguo/tv/AiCatalog;->GENRES:[Ljava/lang/String;

    goto :goto_0

    :cond_0
    sget-object v4, Lcn/hongguo/tv/Recommendations;->GENRES:[Ljava/lang/String;

    :goto_0
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_1
    array-length v8, v4

    if-ge v7, v8, :cond_2

    rem-int/lit8 v8, v7, 0x4

    if-nez v8, :cond_1

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_1
    aget-object v8, v4, v7

    new-instance v9, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda89;

    invoke-direct {v9, p0, v8}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda89;-><init>(Lcn/hongguo/tv/MainActivity;Ljava/lang/String;)V

    invoke-virtual {p0, v8, v9, v5}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v8

    const/high16 v9, 0x41a00000    # 20.0f

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setTextSize(F)V

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v10, 0x42900000    # 72.0f

    invoke-virtual {p0, v10}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v10

    const/high16 v11, 0x3f800000    # 1.0f

    invoke-direct {v9, v5, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    const/high16 v10, 0x40c00000    # 6.0f

    invoke-virtual {p0, v10}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v11

    const/high16 v12, 0x41000000    # 8.0f

    invoke-virtual {p0, v12}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v13

    invoke-virtual {p0, v10}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v10

    invoke-virtual {p0, v12}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v12

    invoke-virtual {v9, v11, v13, v10, v12}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v6, v8, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_2
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->pageUi(Landroid/view/View;)Lcn/hongguo/tv/MainActivity$PageUi;

    move-result-object v1

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    iput-object v2, v1, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    const-string v2, "\u5206\u7c7b"

    const/4 v4, 0x1

    invoke-virtual {p0, v0, v2, v1, v4}, Lcn/hongguo/tv/MainActivity;->show(Landroid/view/View;Ljava/lang/String;Landroid/view/View;Z)V

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->pageUi(Landroid/view/View;)Lcn/hongguo/tv/MainActivity$PageUi;

    move-result-object v0

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity$PageUi;->top:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {p0, v3, v1, v0}, Lcn/hongguo/tv/MainActivity;->wireGrid(Ljava/util/ArrayList;ILandroid/view/View;)V

    return-void
.end method

.method changeQuality(I)V
    .locals 3

    .line 229
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "quality"

    invoke-static {p1}, Lcn/hongguo/tv/PlaybackQuality;->index(I)I

    move-result p1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelPrefetch()V

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz p1, :cond_2

    iget-boolean p1, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result p1

    int-to-long v0, p1

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lcn/hongguo/tv/MainActivity;->pendingSeek:J

    :goto_0
    iget-boolean p1, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->closeSettingsOverlay()V

    iget v2, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    invoke-virtual {p0, v2, v0, v1}, Lcn/hongguo/tv/MainActivity;->playEpisode(IJ)V

    iput-boolean p1, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->pauseButton:Landroid/widget/Button;

    if-eqz p1, :cond_1

    const-string p1, "\u6682\u505c"

    goto :goto_1

    :cond_1
    const-string p1, "\u64ad\u653e"

    :goto_1
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :cond_2
    return-void
.end method

.method chooseSection(Ljava/lang/String;)V
    .locals 2

    .line 83
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->back:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->clear()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    const-string v1, "\u9996\u9875"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "short"

    :goto_0
    iput-object v1, p0, Lcn/hongguo/tv/MainActivity;->catalogMode:Ljava/lang/String;

    :cond_0
    invoke-virtual {p0, p1, v0}, Lcn/hongguo/tv/MainActivity;->home(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    const-string v1, "\u6f2b\u5267"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "manju"

    goto :goto_0

    :cond_2
    const-string v1, "AI\u5267"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "ai"

    goto :goto_0

    :cond_3
    const-string v1, "\u8bbe\u7f6e"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->settings()V

    goto :goto_1

    :cond_4
    const-string v1, "\u641c\u7d22"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->search()V

    goto :goto_1

    :cond_5
    const-string v1, "\u5206\u7c7b"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->categories()V

    :goto_1
    return-void
.end method

.method closeEpisodeOverlay()V
    .locals 2

    .line 291
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    const-string v1, "episode-overlay"

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    :cond_0
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->showControls()V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->overlayReturnFocus:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->overlayReturnFocus:Landroid/view/View;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->surface:Landroid/view/SurfaceView;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->overlayReturnFocus:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->overlayReturnFocus:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestFocusFromTouch()Z

    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcn/hongguo/tv/MainActivity;->overlayReturnFocus:Landroid/view/View;

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->scheduleHide()V

    return-void
.end method

.method closeSettingsOverlay()V
    .locals 2

    .line 183
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    const-string v1, "settings-overlay"

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    :cond_1
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->showControls()V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->overlayReturnFocus:Landroid/view/View;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->overlayReturnFocus:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->overlayReturnFocus:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestFocusFromTouch()Z

    :cond_2
    const/4 v0, 0x0

    iput-object v0, p0, Lcn/hongguo/tv/MainActivity;->overlayReturnFocus:Landroid/view/View;

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->scheduleHide()V

    return-void
.end method

.method column()Landroid/widget/LinearLayout;
    .locals 2

    .line 64
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    return-object v0
.end method

.method commitSeekPreview()V
    .locals 5

    .line 287
    iget v0, p0, Lcn/hongguo/tv/MainActivity;->seekPreview:I

    if-gez v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcn/hongguo/tv/MainActivity;->seekPreview:I

    const/4 v1, -0x1

    iput v1, p0, Lcn/hongguo/tv/MainActivity;->seekPreview:I

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-eqz v1, :cond_1

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Lcn/hongguo/tv/MainActivity;->seekToPosition(J)V

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity;->clock:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v0, v1}, Lcn/hongguo/tv/MainActivity;->time(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " / "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v1

    int-to-long v3, v1

    invoke-static {v3, v4}, Lcn/hongguo/tv/MainActivity;->time(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->scheduleHide()V

    return-void
.end method

.method confirmGesture(Landroid/view/KeyEvent;)Z
    .locals 4

    .line 37
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v1, 0x17

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq v0, v1, :cond_1

    const/16 v1, 0x42

    if-eq v0, v1, :cond_1

    const/16 v1, 0xa0

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 38
    :goto_1
    if-nez v1, :cond_2

    return v2

    .line 39
    :cond_2
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-ne v1, v3, :cond_6

    iget v1, p0, Lcn/hongguo/tv/MainActivity;->heldConfirmKey:I

    if-ne v1, v0, :cond_6

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->confirmEligible:Z

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->confirmConsumed:Z

    if-nez v0, :cond_3

    invoke-virtual {p1}, Landroid/view/KeyEvent;->isCanceled()Z

    move-result p1

    if-nez p1, :cond_3

    const/4 p1, 0x1

    goto :goto_2

    :cond_3
    const/4 p1, 0x0

    :goto_2
    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->confirmFromHidden:Z

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelConfirmHold()V

    iput v2, p0, Lcn/hongguo/tv/MainActivity;->heldConfirmKey:I

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz p1, :cond_5

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->openPlayerControls()V

    goto :goto_3

    :cond_4
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->togglePause()V

    :cond_5
    :goto_3
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->scheduleHide()V

    return v3

    .line 40
    :cond_6
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_a

    .line 41
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v1

    if-lez v1, :cond_7

    iget v1, p0, Lcn/hongguo/tv/MainActivity;->heldConfirmKey:I

    if-ne v1, v0, :cond_7

    return v3

    .line 42
    :cond_7
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result p1

    if-nez p1, :cond_8

    iget p1, p0, Lcn/hongguo/tv/MainActivity;->heldConfirmKey:I

    if-eqz p1, :cond_8

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelConfirmHold()V

    iput v2, p0, Lcn/hongguo/tv/MainActivity;->heldConfirmKey:I

    .line 43
    :cond_8
    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz p1, :cond_a

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->playerOverlay()Landroid/view/View;

    move-result-object p1

    if-nez p1, :cond_a

    iget-boolean p1, p0, Lcn/hongguo/tv/MainActivity;->controlsVisible:Z

    if-eqz p1, :cond_9

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object p1

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->seek:Landroid/widget/SeekBar;

    if-ne p1, v1, :cond_a

    :cond_9
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelConfirmHold()V

    iput v0, p0, Lcn/hongguo/tv/MainActivity;->heldConfirmKey:I

    iput-boolean v3, p0, Lcn/hongguo/tv/MainActivity;->confirmEligible:Z

    iput-boolean v2, p0, Lcn/hongguo/tv/MainActivity;->confirmConsumed:Z

    iget-boolean p1, p0, Lcn/hongguo/tv/MainActivity;->controlsVisible:Z

    xor-int/2addr p1, v3

    iput-boolean p1, p0, Lcn/hongguo/tv/MainActivity;->confirmFromHidden:Z

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->hideChrome:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->beginHold:Ljava/lang/Runnable;

    const-wide/16 v1, 0x258

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return v3

    .line 45
    :cond_a
    return v2
.end method

.method currentUi()Lcn/hongguo/tv/MainActivity$PageUi;
    .locals 1

    .line 80
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity$Screen;->view:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->pageUi(Landroid/view/View;)Lcn/hongguo/tv/MainActivity$PageUi;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method darkTheme()Z
    .locals 3

    .line 11
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v2, "dark_theme"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    return v1
.end method

.method detail(Lorg/json/JSONObject;)V
    .locals 10

    .line 145
    const-string v0, "title"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->shell(Ljava/lang/String;)Landroid/widget/LinearLayout;

    move-result-object v6

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v0

    const/16 v1, 0x30

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/high16 v1, 0x41000000    # 8.0f

    invoke-virtual {p0, v1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v2

    const/high16 v3, 0x41800000    # 16.0f

    invoke-virtual {p0, v3}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v3

    invoke-virtual {p0, v1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v1

    const/high16 v4, 0x41900000    # 18.0f

    invoke-virtual {p0, v4}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v4

    invoke-virtual {v0, v2, v3, v1, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v1, Landroid/widget/ImageView;

    invoke-direct {v1, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x432c0000    # 172.0f

    invoke-virtual {p0, v3}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v3

    const/high16 v4, 0x43720000    # 242.0f

    invoke-virtual {p0, v4}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v5

    invoke-direct {v2, v3, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->column()Landroid/widget/LinearLayout;

    move-result-object v2

    const/high16 v3, 0x41c00000    # 24.0f

    invoke-virtual {p0, v3}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v3

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v5, v5, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/16 v3, 0x11

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->muted()I

    move-result v7

    const-string v8, "\u6b63\u5728\u8bfb\u53d6\u5267\u96c6\u2026"

    invoke-virtual {p0, v8, v3, v7}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v7

    const/4 v3, 0x5

    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v3, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x1

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v3, v8, v5, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v7, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v8

    invoke-virtual {v2, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0, v4}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v4

    invoke-direct {v3, v5, v4, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v6}, Lcn/hongguo/tv/MainActivity;->body(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda22;

    invoke-direct {v0, p0, p1}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda22;-><init>(Lcn/hongguo/tv/MainActivity;Lorg/json/JSONObject;)V

    const-string v2, "\u91cd\u65b0\u8bfb\u53d6"

    invoke-virtual {p0, v2, v0, v5}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v2

    new-instance v3, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda23;

    invoke-direct {v3, p0, p1}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda23;-><init>(Lcn/hongguo/tv/MainActivity;Lorg/json/JSONObject;)V

    const-string v4, "\u6362\u4e00\u90e8"

    invoke-virtual {p0, v4, v3, v5}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    invoke-virtual {p0, v2, v0}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    invoke-virtual {p0, v6}, Lcn/hongguo/tv/MainActivity;->body(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p0, v6}, Lcn/hongguo/tv/MainActivity;->pageUi(Landroid/view/View;)Lcn/hongguo/tv/MainActivity$PageUi;

    move-result-object v2

    iput-object v0, v2, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    const-string v2, "\u8be6\u60c5"

    const/4 v3, 0x1

    invoke-virtual {p0, v6, v2, v0, v3}, Lcn/hongguo/tv/MainActivity;->show(Landroid/view/View;Ljava/lang/String;Landroid/view/View;Z)V

    const-string v0, "id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v1}, Lcn/hongguo/tv/MainActivity;->loadCover(Ljava/lang/String;Landroid/widget/ImageView;)V

    .line 146
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/episodes?id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcn/hongguo/tv/Api;->q(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v9, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda24;

    move-object v1, v9

    move-object v2, p0

    move-object v3, p1

    move-object v4, v7

    move-object v5, v8

    invoke-direct/range {v1 .. v6}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda24;-><init>(Lcn/hongguo/tv/MainActivity;Lorg/json/JSONObject;Landroid/widget/TextView;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;)V

    invoke-virtual {p0, v0, v7, v9}, Lcn/hongguo/tv/MainActivity;->request(Ljava/lang/String;Landroid/widget/TextView;Lcn/hongguo/tv/MainActivity$Done;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p1, "\u77ed\u5267\u8d44\u6599\u6709\u8bef"

    invoke-virtual {v7, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 147
    :goto_0
    return-void
.end method

.method dialog(Z)Landroid/app/AlertDialog$Builder;
    .locals 1

    .line 16
    new-instance v0, Landroid/app/AlertDialog$Builder;

    if-nez p1, :cond_1

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->darkTheme()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const p1, 0x1030073

    goto :goto_1

    :cond_1
    :goto_0
    const p1, 0x103006f

    :goto_1
    invoke-direct {v0, p0, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    return-object v0
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 14

    .line 293
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 294
    :goto_0
    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->confirmGesture(Landroid/view/KeyEvent;)Z

    move-result v4

    if-eqz v4, :cond_1

    return v3

    .line 295
    :cond_1
    if-eqz v1, :cond_2

    iget v4, p0, Lcn/hongguo/tv/MainActivity;->heldConfirmKey:I

    if-eqz v4, :cond_2

    iget v4, p0, Lcn/hongguo/tv/MainActivity;->heldConfirmKey:I

    if-eq v0, v4, :cond_2

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelConfirmHold()V

    .line 296
    :cond_2
    const/16 v4, 0x52

    const/16 v5, 0x57

    const/16 v6, 0x55

    const/16 v7, 0x17

    const/16 v8, 0x42

    if-eqz v1, :cond_4

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v9

    if-lez v9, :cond_4

    if-eq v0, v7, :cond_3

    if-eq v0, v8, :cond_3

    if-eq v0, v6, :cond_3

    if-eq v0, v5, :cond_3

    if-ne v0, v4, :cond_4

    :cond_3
    return v3

    .line 297
    :cond_4
    iget-object v9, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz v9, :cond_1b

    .line 298
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->playerOverlay()Landroid/view/View;

    move-result-object v9

    .line 299
    const/16 v10, 0x14

    const/16 v11, 0x16

    const/16 v12, 0x13

    const/16 v13, 0x15

    if-eqz v9, :cond_c

    if-eqz v1, :cond_c

    if-lt v0, v12, :cond_c

    if-gt v0, v11, :cond_c

    .line 300
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object v1

    if-ne v0, v12, :cond_5

    const/16 v8, 0x21

    goto :goto_1

    :cond_5
    if-ne v0, v10, :cond_6

    const/16 v8, 0x82

    goto :goto_1

    :cond_6
    if-ne v0, v13, :cond_7

    const/16 v8, 0x11

    .line 301
    :cond_7
    :goto_1
    invoke-virtual {p0, v1, v9}, Lcn/hongguo/tv/MainActivity;->inside(Landroid/view/View;Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_9

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    const/4 v0, 0x2

    invoke-virtual {v9, p1, v0}, Landroid/view/View;->addFocusables(Ljava/util/ArrayList;I)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_8

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->requestFocusFromTouch()Z

    :cond_8
    return v3

    .line 302
    :cond_9
    invoke-virtual {v1, p1}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_a

    return v3

    .line 303
    :cond_a
    invoke-virtual {v1, v8}, Landroid/view/View;->focusSearch(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_b

    invoke-virtual {p0, p1, v9}, Lcn/hongguo/tv/MainActivity;->inside(Landroid/view/View;Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual {p1}, Landroid/view/View;->requestFocusFromTouch()Z

    :cond_b
    return v3

    .line 305
    :cond_c
    if-eqz v9, :cond_d

    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1

    .line 306
    :cond_d
    if-eq v0, v13, :cond_e

    if-ne v0, v11, :cond_f

    :cond_e
    iget-boolean v2, p0, Lcn/hongguo/tv/MainActivity;->controlsVisible:Z

    if-eqz v2, :cond_17

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object v2

    iget-object v9, p0, Lcn/hongguo/tv/MainActivity;->seek:Landroid/widget/SeekBar;

    if-eq v2, v9, :cond_17

    iget v2, p0, Lcn/hongguo/tv/MainActivity;->seekPreview:I

    if-ltz v2, :cond_f

    goto :goto_2

    .line 307
    :cond_f
    if-eqz v1, :cond_1b

    .line 308
    if-ne v0, v5, :cond_10

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->current:Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->recommendNext(Lorg/json/JSONObject;)V

    return v3

    :cond_10
    if-ne v0, v6, :cond_11

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->togglePause()V

    return v3

    .line 309
    :cond_11
    const/16 v1, 0x5a

    if-ne v0, v1, :cond_12

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->seekSeconds()I

    move-result p1

    mul-int/lit16 p1, p1, 0x3e8

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->seekBy(I)V

    return v3

    :cond_12
    const/16 v1, 0x59

    if-ne v0, v1, :cond_13

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->seekSeconds()I

    move-result p1

    neg-int p1, p1

    mul-int/lit16 p1, p1, 0x3e8

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->seekBy(I)V

    return v3

    :cond_13
    if-ne v0, v4, :cond_14

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->playerSettings()V

    return v3

    .line 310
    :cond_14
    iget-boolean v1, p0, Lcn/hongguo/tv/MainActivity;->controlsVisible:Z

    if-nez v1, :cond_16

    if-eq v0, v12, :cond_15

    if-eq v0, v10, :cond_15

    if-eq v0, v7, :cond_15

    if-ne v0, v8, :cond_16

    :cond_15
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->openPlayerControls()V

    return v3

    :cond_16
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->scheduleHide()V

    goto :goto_5

    .line 306
    :cond_17
    :goto_2
    if-eqz v1, :cond_19

    if-ne v0, v13, :cond_18

    const/4 p1, -0x1

    goto :goto_3

    :cond_18
    const/4 p1, 0x1

    :goto_3
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->seekSeconds()I

    move-result v0

    mul-int p1, p1, v0

    mul-int/lit16 p1, p1, 0x3e8

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->previewSeek(I)V

    goto :goto_4

    :cond_19
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    if-ne p1, v3, :cond_1a

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->commitSeekPreview()V

    :cond_1a
    :goto_4
    return v3

    .line 313
    :cond_1b
    :goto_5
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method dp(F)I
    .locals 1

    .line 51
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    return p1
.end method

.method episodePage(Lorg/json/JSONObject;Lorg/json/JSONArray;I)V
    .locals 8

    .line 151
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "title"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u00b7 \u9009\u96c6"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->shell(Ljava/lang/String;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->column()Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->body(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v1

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, -0x1

    invoke-direct {v3, v6, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v1, 0x0

    const/4 v3, 0x1

    const-string v4, "\u9009\u96c6"

    invoke-virtual {p0, v0, v4, v1, v3}, Lcn/hongguo/tv/MainActivity;->show(Landroid/view/View;Ljava/lang/String;Landroid/view/View;Z)V

    add-int/lit8 v0, p3, -0x1

    div-int/lit8 v5, v0, 0x14

    const/4 v7, 0x0

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move v6, p3

    invoke-virtual/range {v1 .. v7}, Lcn/hongguo/tv/MainActivity;->renderEpisodePage(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Lorg/json/JSONArray;IIZ)V

    return-void
.end method

.method fitVideo(II)V
    .locals 0

    .line 260
    if-lez p1, :cond_2

    if-gtz p2, :cond_0

    goto :goto_0

    :cond_0
    iput p1, p0, Lcn/hongguo/tv/MainActivity;->videoWidth:I

    iput p2, p0, Lcn/hongguo/tv/MainActivity;->videoHeight:I

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    if-nez p1, :cond_1

    return-void

    :cond_1
    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    new-instance p2, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda80;

    invoke-direct {p2, p0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda80;-><init>(Lcn/hongguo/tv/MainActivity;)V

    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    :cond_2
    :goto_0
    return-void
.end method

.method focusStyle(Landroid/view/View;Z)V
    .locals 2

    .line 66
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/View;->setFocusable(Z)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    if-eqz p2, :cond_0

    const v1, -0x33dcdbd9    # -4.2766492E7f

    goto :goto_0

    :cond_0
    const v1, -0x90808

    :goto_0
    invoke-virtual {p0, v1, v0}, Lcn/hongguo/tv/MainActivity;->bg(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda86;

    invoke-direct {v0, p0, p2}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda86;-><init>(Lcn/hongguo/tv/MainActivity;Z)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    return-void
.end method

.method hideKeyboard()V
    .locals 3

    .line 70
    const-string v0, "input_method"

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->host:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    return-void
.end method

.method home(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 103
    if-eqz p2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, p1, p2, v0}, Lcn/hongguo/tv/MainActivity;->home(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method home(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    .line 104
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcn/hongguo/tv/MainActivity;->home(Ljava/lang/String;Ljava/lang/String;ZZ)V

    return-void
.end method

.method home(Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 23

    .line 106
    move-object/from16 v12, p0

    move-object/from16 v1, p1

    move-object/from16 v0, p2

    const-string v2, "AI\u5267"

    const-string v3, "\u6f2b\u5267"

    const-string v4, "\u9996\u9875"

    if-nez v0, :cond_2

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    :cond_0
    move/from16 v7, p4

    goto :goto_1

    :cond_1
    :goto_0
    iget-object v0, v12, Lcn/hongguo/tv/MainActivity;->back:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->clear()V

    new-instance v0, Lcn/hongguo/tv/HomeFeed;

    invoke-direct {v0, v12}, Lcn/hongguo/tv/HomeFeed;-><init>(Lcn/hongguo/tv/MainActivity;)V

    move/from16 v7, p4

    invoke-virtual {v0, v7}, Lcn/hongguo/tv/HomeFeed;->show(Z)V

    return-void

    :cond_2
    move/from16 v7, p4

    .line 107
    :goto_1
    if-nez v0, :cond_3

    iget-object v5, v12, Lcn/hongguo/tv/MainActivity;->back:Ljava/util/ArrayDeque;

    invoke-virtual {v5}, Ljava/util/ArrayDeque;->clear()V

    :cond_3
    if-eqz v0, :cond_4

    move-object v5, v0

    goto :goto_2

    :cond_4
    iget-object v5, v12, Lcn/hongguo/tv/MainActivity;->catalogMode:Ljava/lang/String;

    const-string v6, "manju"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    const-string v5, "\u4e07\u5996"

    goto :goto_2

    :cond_5
    const-string v5, "\u91cd\u751f"

    .line 108
    :goto_2
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    const-string v6, "\u53d1\u73b0\u597d\u5267"

    goto :goto_3

    :cond_6
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    const-string v6, "\u6f2b\u5267\u63a2\u7d22"

    goto :goto_3

    :cond_7
    const-string v6, "\u641c\u7d22\u7ed3\u679c"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\u641c\u7d22 \u00b7 "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_3

    :cond_8
    move-object v6, v1

    .line 109
    :goto_3
    invoke-virtual {v12, v6}, Lcn/hongguo/tv/MainActivity;->shell(Ljava/lang/String;)Landroid/widget/LinearLayout;

    move-result-object v6

    invoke-virtual {v12, v6}, Lcn/hongguo/tv/MainActivity;->pageUi(Landroid/view/View;)Lcn/hongguo/tv/MainActivity$PageUi;

    move-result-object v8

    invoke-virtual {v12, v6}, Lcn/hongguo/tv/MainActivity;->body(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v9

    .line 110
    const-string v10, "\u6536\u85cf"

    invoke-virtual {v1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    const-string v15, "\u5386\u53f2"

    if-nez v11, :cond_b

    invoke-virtual {v1, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_b

    .line 111
    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v11

    const/16 v13, 0xe

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->muted()I

    move-result v14

    const-string v7, "\u9898\u6750"

    invoke-virtual {v12, v7, v13, v14}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v7

    invoke-virtual {v11, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 112
    const-string v20, "\u53e4\u88c5"

    const-string v21, "\u60ac\u7591"

    const-string v16, "\u91cd\u751f"

    const-string v17, "\u751c\u5ba0"

    const-string v18, "\u9006\u88ad"

    const-string v19, "\u90fd\u5e02"

    filled-new-array/range {v16 .. v21}, [Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    :goto_4
    move-object/from16 v16, v6

    const/4 v6, 0x6

    if-ge v14, v6, :cond_a

    aget-object v6, v13, v14

    move-object/from16 v17, v13

    new-instance v13, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda7;

    invoke-direct {v13, v12, v6}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda7;-><init>(Lcn/hongguo/tv/MainActivity;Ljava/lang/String;)V

    move-object/from16 v18, v15

    const/4 v15, 0x0

    invoke-virtual {v12, v6, v13, v15}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v13

    const/high16 v15, 0x41700000    # 15.0f

    invoke-virtual {v13, v15}, Landroid/widget/Button;->setTextSize(F)V

    const/high16 v15, 0x41200000    # 10.0f

    move-object/from16 v19, v10

    invoke-virtual {v12, v15}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v10

    invoke-virtual {v12, v15}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v15

    move-object/from16 v20, v2

    const/4 v2, 0x0

    invoke-virtual {v13, v10, v2, v15, v2}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    invoke-virtual {v12, v13, v10}, Lcn/hongguo/tv/MainActivity;->selectedStyle(Landroid/widget/Button;Z)V

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    move-object/from16 v21, v3

    const/high16 v15, 0x42200000    # 40.0f

    invoke-virtual {v12, v15}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v3

    const/high16 v15, 0x3f800000    # 1.0f

    invoke-direct {v10, v2, v3, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    const/high16 v2, 0x40400000    # 3.0f

    invoke-virtual {v12, v2}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v3

    const/high16 v15, 0x40800000    # 4.0f

    move-object/from16 v22, v4

    invoke-virtual {v12, v15}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v4

    invoke-virtual {v12, v2}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v2

    invoke-virtual {v12, v15}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v15

    invoke-virtual {v10, v3, v4, v2, v15}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v11, v13, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v7, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    iput-object v13, v8, Lcn/hongguo/tv/MainActivity$PageUi;->top:Landroid/view/View;

    :cond_9
    add-int/lit8 v14, v14, 0x1

    move-object/from16 v6, v16

    move-object/from16 v13, v17

    move-object/from16 v15, v18

    move-object/from16 v10, v19

    move-object/from16 v2, v20

    move-object/from16 v3, v21

    move-object/from16 v4, v22

    goto :goto_4

    .line 113
    :cond_a
    move-object/from16 v20, v2

    move-object/from16 v21, v3

    move-object/from16 v22, v4

    move-object/from16 v19, v10

    move-object/from16 v18, v15

    new-instance v2, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda8;

    invoke-direct {v2, v12}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda8;-><init>(Lcn/hongguo/tv/MainActivity;)V

    const-string v3, "\u5168\u90e8\u5206\u7c7b"

    const/4 v4, 0x0

    invoke-virtual {v12, v3, v2, v4}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v2

    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setTextSize(F)V

    invoke-virtual {v12, v11, v2}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    invoke-virtual {v9, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const/4 v2, 0x0

    :goto_5
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_c

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    new-instance v4, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda9;

    invoke-direct {v4, v2, v8}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda9;-><init>(ILcn/hongguo/tv/MainActivity$PageUi;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 110
    :cond_b
    move-object/from16 v20, v2

    move-object/from16 v21, v3

    move-object/from16 v22, v4

    move-object/from16 v16, v6

    move-object/from16 v19, v10

    move-object/from16 v18, v15

    .line 115
    :cond_c
    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v11

    const/16 v2, 0xd

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->muted()I

    move-result v3

    const-string v4, "\u6b63\u5728\u52a0\u8f7d\u2026"

    invoke-virtual {v12, v4, v2, v3}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v10

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    invoke-direct {v2, v6, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v11, v10, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda10;

    invoke-direct {v2, v12, v1, v0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda10;-><init>(Lcn/hongguo/tv/MainActivity;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "\u91cd\u65b0\u52a0\u8f7d"

    invoke-virtual {v12, v0, v2, v6}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v13

    const/high16 v0, 0x41500000    # 13.0f

    invoke-virtual {v13, v0}, Landroid/widget/Button;->setTextSize(F)V

    const/high16 v2, 0x42000000    # 32.0f

    invoke-virtual {v12, v2}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v4

    invoke-virtual {v13, v4}, Landroid/widget/Button;->setMinHeight(I)V

    const/high16 v4, 0x41400000    # 12.0f

    invoke-virtual {v12, v4}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v7

    invoke-virtual {v12, v4}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v8

    invoke-virtual {v13, v7, v6, v8, v6}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-virtual {v9, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 116
    new-instance v7, Landroid/widget/ScrollView;

    invoke-direct {v7, v12}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v7, v6}, Landroid/widget/ScrollView;->setClipToPadding(Z)V

    invoke-virtual {v7, v6}, Landroid/widget/ScrollView;->setFocusable(Z)V

    const/high16 v8, 0x40000

    invoke-virtual {v7, v8}, Landroid/widget/ScrollView;->setDescendantFocusability(I)V

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->column()Landroid/widget/LinearLayout;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v14, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v15, -0x1

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v14, v15, v6, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v9, v7, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v7

    new-instance v14, Landroid/view/View;

    invoke-direct {v14, v12}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, 0x1

    invoke-direct {v15, v6, v2, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v7, v14, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    move-object/from16 v2, v22

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_d

    move-object/from16 v2, v21

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_d

    move-object/from16 v2, v20

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    :cond_d
    new-instance v2, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda11;

    invoke-direct {v2, v12}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda11;-><init>(Lcn/hongguo/tv/MainActivity;)V

    const-string v4, "\u968f\u4fbf\u770b\u770b"

    const/4 v6, 0x0

    invoke-virtual {v12, v4, v2, v6}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v2

    const/high16 v4, 0x41600000    # 14.0f

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setTextSize(F)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x42200000    # 40.0f

    invoke-virtual {v12, v6}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v6

    invoke-direct {v4, v3, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_e
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x42080000    # 34.0f

    invoke-virtual {v12, v4}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v6

    invoke-direct {v2, v3, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v13, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    move-object/from16 v2, v19

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_10

    move-object/from16 v6, v18

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_f

    goto :goto_6

    :cond_f
    const/4 v3, 0x0

    goto :goto_7

    :cond_10
    move-object/from16 v6, v18

    :goto_6
    new-instance v14, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda12;

    invoke-direct {v14, v12, v1}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda12;-><init>(Lcn/hongguo/tv/MainActivity;Ljava/lang/String;)V

    const-string v15, "\u7ba1\u7406"

    const/4 v3, 0x0

    invoke-virtual {v12, v15, v14, v3}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v14

    invoke-virtual {v14, v0}, Landroid/widget/Button;->setTextSize(F)V

    const/high16 v0, 0x42000000    # 32.0f

    invoke-virtual {v12, v0}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v0

    invoke-virtual {v14, v0}, Landroid/widget/Button;->setMinHeight(I)V

    const/high16 v0, 0x41400000    # 12.0f

    invoke-virtual {v12, v0}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v15

    invoke-virtual {v12, v0}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v0

    invoke-virtual {v14, v15, v3, v0, v3}, Landroid/widget/Button;->setPadding(IIII)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v12, v4}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v4

    const/4 v15, -0x2

    invoke-direct {v0, v15, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v14, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_7
    invoke-virtual {v9, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    move/from16 v0, p3

    move-object/from16 v4, v16

    invoke-virtual {v12, v4, v1, v13, v0}, Lcn/hongguo/tv/MainActivity;->show(Landroid/view/View;Ljava/lang/String;Landroid/view/View;Z)V

    .line 117
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    goto :goto_8

    .line 118
    :cond_11
    iget v3, v12, Lcn/hongguo/tv/MainActivity;->generation:I

    iget-object v0, v12, Lcn/hongguo/tv/MainActivity;->catalogMode:Ljava/lang/String;

    iget-object v6, v12, Lcn/hongguo/tv/MainActivity;->api:Lcn/hongguo/tv/Api;

    iget-object v14, v12, Lcn/hongguo/tv/MainActivity;->io:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v15, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda14;

    move-object v1, v15

    move-object/from16 v2, p0

    move-object v4, v5

    move-object v5, v0

    move/from16 v7, p4

    move-object v9, v13

    invoke-direct/range {v1 .. v11}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda14;-><init>(Lcn/hongguo/tv/MainActivity;ILjava/lang/String;Ljava/lang/String;Lcn/hongguo/tv/Api;ZLandroid/widget/LinearLayout;Landroid/widget/Button;Landroid/widget/TextView;Landroid/widget/LinearLayout;)V

    invoke-virtual {v14, v15}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 119
    return-void

    .line 117
    :cond_12
    :goto_8
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    iget-object v5, v12, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    const-string v2, "favorites"

    goto :goto_9

    :cond_13
    const-string v2, "history"

    :goto_9
    const-string v6, "{}"

    invoke-interface {v5, v2, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v5

    :goto_a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_14

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_a

    :cond_14
    new-instance v0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda13;

    invoke-direct {v0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda13;-><init>()V

    invoke-static {v2, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_15

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/json/JSONObject;

    invoke-virtual {v4, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_b

    :catch_0
    move-exception v0

    :cond_15
    invoke-virtual {v12, v8, v4, v13}, Lcn/hongguo/tv/MainActivity;->renderCards(Landroid/widget/LinearLayout;Lorg/json/JSONArray;Landroid/view/View;)V

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-nez v0, :cond_16

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u6682\u65e0"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_c

    :cond_16
    const-string v0, ""

    :goto_c
    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-nez v0, :cond_17

    const/4 v14, 0x0

    goto :goto_d

    :cond_17
    const/16 v14, 0x8

    :goto_d
    invoke-virtual {v11, v14}, Landroid/widget/LinearLayout;->setVisibility(I)V

    return-void
.end method

.method ink()I
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->darkTheme()Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, -0x13110c

    goto :goto_0

    :cond_0
    sget v0, Lcn/hongguo/tv/MainActivity;->INK:I

    :goto_0
    return v0
.end method

.method inside(Landroid/view/View;Landroid/view/View;)Z
    .locals 1

    .line 284
    :goto_0
    if-eqz p1, :cond_2

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    instance-of v0, p1, Landroid/view/View;

    if-eqz v0, :cond_1

    check-cast p1, Landroid/view/View;

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method synthetic lambda$categories$44$cn-hongguo-tv-MainActivity(Ljava/lang/String;)V
    .locals 2

    .line 143
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u5206\u7c7b \u00b7 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcn/hongguo/tv/MainActivity;->home(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$detail$45$cn-hongguo-tv-MainActivity(Lorg/json/JSONObject;)V
    .locals 0

    .line 145
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->restore()V

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->detail(Lorg/json/JSONObject;)V

    return-void
.end method

.method synthetic lambda$detail$46$cn-hongguo-tv-MainActivity(Lorg/json/JSONObject;)V
    .locals 0

    .line 145
    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->recommendNext(Lorg/json/JSONObject;)V

    return-void
.end method

.method synthetic lambda$detail$47$cn-hongguo-tv-MainActivity(Lorg/json/JSONObject;Lorg/json/JSONArray;)V
    .locals 0

    .line 146
    invoke-virtual {p0, p1, p2}, Lcn/hongguo/tv/MainActivity;->resumeSeries(Lorg/json/JSONObject;Lorg/json/JSONArray;)V

    return-void
.end method

.method synthetic lambda$detail$48$cn-hongguo-tv-MainActivity(Lorg/json/JSONObject;Landroid/widget/Button;)V
    .locals 3

    .line 146
    const-string v0, "history"

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->bucket(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u7eed\u770b\u7b2c "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "episode"

    const/4 v2, 0x1

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u96c6 \u00b7 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "position"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v1, v2}, Lcn/hongguo/tv/MainActivity;->time(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$detail$49$cn-hongguo-tv-MainActivity(Lorg/json/JSONObject;Lorg/json/JSONArray;)V
    .locals 1

    .line 146
    invoke-virtual {p0, p1, p2}, Lcn/hongguo/tv/MainActivity;->latestEpisode(Lorg/json/JSONObject;Lorg/json/JSONArray;)I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lcn/hongguo/tv/MainActivity;->episodePage(Lorg/json/JSONObject;Lorg/json/JSONArray;I)V

    return-void
.end method

.method synthetic lambda$detail$51$cn-hongguo-tv-MainActivity(Lorg/json/JSONObject;Landroid/widget/Button;Landroid/view/View;)V
    .locals 5

    .line 146
    const-string p3, "favorites"

    :try_start_0
    invoke-virtual {p0, p3}, Lcn/hongguo/tv/MainActivity;->bucket(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    const-string p1, "\u6536\u85cf"

    :goto_0
    invoke-virtual {p2, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    :cond_0
    const-string v2, "updated"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {p1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "\u53d6\u6d88\u6536\u85cf"

    goto :goto_0

    :goto_1
    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p3, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    :goto_2
    return-void
.end method

.method synthetic lambda$detail$52$cn-hongguo-tv-MainActivity(Lorg/json/JSONObject;Landroid/widget/TextView;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 146
    const-string v0, "series"

    invoke-virtual {p5, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-static {p1, v0}, Lcn/hongguo/tv/Recommendations;->copyMetadata(Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    const-string p1, "episodes"

    invoke-virtual {p5, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    const-string p5, "history"

    invoke-virtual {p0, p5}, Lcn/hongguo/tv/MainActivity;->bucket(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p5

    const-string v1, "id"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p5, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p5

    const/4 v2, 0x1

    if-nez p5, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const-string v3, "episode"

    invoke-virtual {p5, v3, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    :goto_0
    if-lt v3, v2, :cond_2

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-le v3, v4, :cond_1

    goto :goto_1

    :cond_1
    move v2, v3

    :cond_2
    :goto_1
    if-nez p5, :cond_3

    const-wide/16 v3, 0x0

    goto :goto_2

    :cond_3
    const-string v3, "position"

    invoke-virtual {p5, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v3

    :goto_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\u5168 "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " \u96c6\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "intro"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p3}, Landroid/widget/LinearLayout;->removeAllViews()V

    if-nez p5, :cond_4

    const-string p2, "\u64ad\u653e\u7b2c 1 \u96c6"

    goto :goto_3

    :cond_4
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p5, "\u7eed\u770b\u7b2c "

    invoke-virtual {p2, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p5, " \u96c6 \u00b7 "

    invoke-virtual {p2, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-static {v3, v4}, Lcn/hongguo/tv/MainActivity;->time(J)Ljava/lang/String;

    move-result-object p5

    invoke-virtual {p2, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    :goto_3
    new-instance p5, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda17;

    invoke-direct {p5, p0, v0, p1}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda17;-><init>(Lcn/hongguo/tv/MainActivity;Lorg/json/JSONObject;Lorg/json/JSONArray;)V

    const/4 v2, 0x0

    invoke-virtual {p0, p2, p5, v2}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object p2

    iget-object p5, p0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    new-instance v3, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda18;

    invoke-direct {v3, p0, v0, p2}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda18;-><init>(Lcn/hongguo/tv/MainActivity;Lorg/json/JSONObject;Landroid/widget/Button;)V

    iput-object v3, p5, Lcn/hongguo/tv/MainActivity$Screen;->onRestore:Ljava/lang/Runnable;

    invoke-virtual {p0, p4}, Lcn/hongguo/tv/MainActivity;->pageUi(Landroid/view/View;)Lcn/hongguo/tv/MainActivity$PageUi;

    move-result-object p4

    iput-object p2, p4, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    invoke-virtual {p0, p3, p2}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    new-instance p4, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda19;

    invoke-direct {p4, p0, v0, p1}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda19;-><init>(Lcn/hongguo/tv/MainActivity;Lorg/json/JSONObject;Lorg/json/JSONArray;)V

    const-string p1, "\u9009\u96c6"

    invoke-virtual {p0, p1, p4, v2}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object p1

    invoke-virtual {p0, p3, p1}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    const-string p1, "favorites"

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->bucket(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p1, p4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_5

    const-string p1, "\u53d6\u6d88\u6536\u85cf"

    goto :goto_4

    :cond_5
    const-string p1, "\u6536\u85cf"

    :goto_4
    new-instance p4, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda20;

    invoke-direct {p4}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda20;-><init>()V

    invoke-virtual {p0, p1, p4, v2}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object p1

    new-instance p4, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda21;

    invoke-direct {p4, p0, v0, p1}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda21;-><init>(Lcn/hongguo/tv/MainActivity;Lorg/json/JSONObject;Landroid/widget/Button;)V

    invoke-virtual {p1, p4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0, p3, p1}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    invoke-virtual {p2}, Landroid/widget/Button;->requestFocusFromTouch()Z

    return-void
.end method

.method synthetic lambda$fitVideo$92$cn-hongguo-tv-MainActivity()V
    .locals 7

    .line 260
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->surface:Landroid/view/SurfaceView;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    if-nez v0, :cond_0

    goto :goto_3

    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v1

    if-lez v0, :cond_5

    if-gtz v1, :cond_1

    goto :goto_3

    :cond_1
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->scaleMode()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_2

    int-to-float v3, v0

    iget v4, p0, Lcn/hongguo/tv/MainActivity;->videoWidth:I

    int-to-float v4, v4

    div-float/2addr v3, v4

    int-to-float v4, v1

    iget v5, p0, Lcn/hongguo/tv/MainActivity;->videoHeight:I

    int-to-float v5, v5

    div-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    goto :goto_0

    :cond_2
    int-to-float v3, v0

    iget v4, p0, Lcn/hongguo/tv/MainActivity;->videoWidth:I

    int-to-float v4, v4

    div-float/2addr v3, v4

    int-to-float v4, v1

    iget v5, p0, Lcn/hongguo/tv/MainActivity;->videoHeight:I

    int-to-float v5, v5

    div-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    :goto_0
    iget-object v4, p0, Lcn/hongguo/tv/MainActivity;->surface:Landroid/view/SurfaceView;

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v6, 0x2

    if-ne v2, v6, :cond_3

    goto :goto_1

    :cond_3
    iget v0, p0, Lcn/hongguo/tv/MainActivity;->videoWidth:I

    int-to-float v0, v0

    mul-float v0, v0, v3

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    :goto_1
    if-ne v2, v6, :cond_4

    goto :goto_2

    :cond_4
    iget v1, p0, Lcn/hongguo/tv/MainActivity;->videoHeight:I

    int-to-float v1, v1

    mul-float v1, v1, v3

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    :goto_2
    const/16 v2, 0x11

    invoke-direct {v5, v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v4, v5}, Landroid/view/SurfaceView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_5
    :goto_3
    return-void
.end method

.method synthetic lambda$focusStyle$6$cn-hongguo-tv-MainActivity(ZLandroid/view/View;Z)V
    .locals 1

    .line 66
    if-eqz p3, :cond_1

    if-eqz p1, :cond_0

    const p1, -0xa4cfc0

    goto :goto_0

    :cond_0
    const p1, -0x21510

    goto :goto_0

    :cond_1
    if-eqz p1, :cond_2

    const p1, -0x33dcdbd9    # -4.2766492E7f

    goto :goto_0

    :cond_2
    const p1, -0x90808

    :goto_0
    if-eqz p3, :cond_3

    sget v0, Lcn/hongguo/tv/MainActivity;->PINK:I

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    :goto_1
    invoke-virtual {p0, p1, v0}, Lcn/hongguo/tv/MainActivity;->bg(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->memory:Lcn/hongguo/tv/MemoryProfile;

    iget-boolean p1, p1, Lcn/hongguo/tv/MemoryProfile;->lowRam:Z

    if-nez p1, :cond_5

    if-eqz p3, :cond_4

    const/high16 p1, 0x40e00000    # 7.0f

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result p1

    int-to-float p1, p1

    goto :goto_2

    :cond_4
    const/4 p1, 0x0

    :goto_2
    invoke-static {p2, p1}, Lcn/hongguo/tv/MainActivity$Modern21;->elevation(Landroid/view/View;F)V

    :cond_5
    return-void
.end method

.method synthetic lambda$home$21$cn-hongguo-tv-MainActivity(Ljava/lang/String;)V
    .locals 2

    .line 112
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u5206\u7c7b \u00b7 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcn/hongguo/tv/MainActivity;->home(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$home$22$cn-hongguo-tv-MainActivity()V
    .locals 0

    .line 113
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->categories()V

    return-void
.end method

.method synthetic lambda$home$24$cn-hongguo-tv-MainActivity(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 115
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, p1, p2, v0, v1}, Lcn/hongguo/tv/MainActivity;->home(Ljava/lang/String;Ljava/lang/String;ZZ)V

    return-void
.end method

.method synthetic lambda$home$25$cn-hongguo-tv-MainActivity()V
    .locals 1

    .line 116
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->recommendNext(Lorg/json/JSONObject;)V

    return-void
.end method

.method synthetic lambda$home$26$cn-hongguo-tv-MainActivity(Ljava/lang/String;)V
    .locals 1

    .line 116
    const-string v0, "\u6536\u85cf"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "favorites"

    goto :goto_0

    :cond_0
    const-string p1, "history"

    :goto_0
    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->manageSaved(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$home$28$cn-hongguo-tv-MainActivity(ILandroid/widget/LinearLayout;Lcn/hongguo/tv/Catalog$Result;Landroid/widget/Button;Ljava/lang/String;Landroid/widget/TextView;Landroid/widget/LinearLayout;)V
    .locals 1

    .line 118
    iget v0, p0, Lcn/hongguo/tv/MainActivity;->generation:I

    if-ne p1, v0, :cond_2

    iget-boolean p1, p0, Lcn/hongguo/tv/MainActivity;->released:Z

    if-eqz p1, :cond_0

    goto :goto_1

    :cond_0
    iget-object p1, p3, Lcn/hongguo/tv/Catalog$Result;->items:Lorg/json/JSONArray;

    invoke-virtual {p0, p2, p1, p4}, Lcn/hongguo/tv/MainActivity;->renderCards(Landroid/widget/LinearLayout;Lorg/json/JSONArray;Landroid/view/View;)V

    invoke-virtual {p3, p5}, Lcn/hongguo/tv/Catalog$Result;->note(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p6, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    const/16 p1, 0x8

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {p7, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :cond_2
    :goto_1
    return-void
.end method

.method synthetic lambda$home$29$cn-hongguo-tv-MainActivity(ILandroid/widget/TextView;)V
    .locals 1

    .line 118
    iget v0, p0, Lcn/hongguo/tv/MainActivity;->generation:I

    if-ne p1, v0, :cond_0

    iget-boolean p1, p0, Lcn/hongguo/tv/MainActivity;->released:Z

    if-nez p1, :cond_0

    const-string p1, "\u76ee\u5f55\u6682\u4e0d\u53ef\u7528\uff0c\u8bf7\u7a0d\u540e\u91cd\u65b0\u52a0\u8f7d"

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$home$30$cn-hongguo-tv-MainActivity(ILjava/lang/String;Ljava/lang/String;Lcn/hongguo/tv/Api;ZLandroid/widget/LinearLayout;Landroid/widget/Button;Landroid/widget/TextView;Landroid/widget/LinearLayout;)V
    .locals 13

    .line 118
    move-object v10, p0

    move v11, p1

    iget v0, v10, Lcn/hongguo/tv/MainActivity;->generation:I

    if-ne v11, v0, :cond_1

    iget-boolean v0, v10, Lcn/hongguo/tv/MainActivity;->released:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move-object v0, p2

    move-object/from16 v7, p3

    move-object/from16 v1, p4

    move/from16 v2, p5

    :try_start_0
    invoke-virtual {p0, p2, v7, v1, v2}, Lcn/hongguo/tv/MainActivity;->catalogItems(Ljava/lang/String;Ljava/lang/String;Lcn/hongguo/tv/Api;Z)Lcn/hongguo/tv/Catalog$Result;

    move-result-object v5

    iget-object v0, v10, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    new-instance v12, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda75;

    move-object v1, v12

    move-object v2, p0

    move v3, p1

    move-object/from16 v4, p6

    move-object/from16 v6, p7

    move-object/from16 v7, p3

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    invoke-direct/range {v1 .. v9}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda75;-><init>(Lcn/hongguo/tv/MainActivity;ILandroid/widget/LinearLayout;Lcn/hongguo/tv/Catalog$Result;Landroid/widget/Button;Ljava/lang/String;Landroid/widget/TextView;Landroid/widget/LinearLayout;)V

    invoke-virtual {v0, v12}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v0, v10, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    new-instance v1, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda76;

    move-object/from16 v2, p8

    invoke-direct {v1, p0, p1, v2}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda76;-><init>(Lcn/hongguo/tv/MainActivity;ILandroid/widget/TextView;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1
    :goto_0
    return-void
.end method

.method synthetic lambda$loadCover$38$cn-hongguo-tv-MainActivity(Landroid/graphics/Bitmap;ILjava/lang/String;Landroid/widget/ImageView;)V
    .locals 1

    .line 139
    if-nez p1, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcn/hongguo/tv/MainActivity;->generation:I

    if-ne p2, v0, :cond_2

    iget-boolean p2, p0, Lcn/hongguo/tv/MainActivity;->released:Z

    if-nez p2, :cond_2

    invoke-virtual {p4}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-virtual {p4}, Landroid/widget/ImageView;->isAttachedToWindow()Z

    move-result p2

    if-nez p2, :cond_1

    goto :goto_0

    :cond_1
    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->covers:Landroid/util/LruCache;

    invoke-virtual {p2, p3, p1}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p4, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void

    :cond_2
    :goto_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    return-void
.end method

.method synthetic lambda$loadCover$39$cn-hongguo-tv-MainActivity(ILjava/lang/String;Lcn/hongguo/tv/Api;Landroid/widget/ImageView;)V
    .locals 7

    .line 139
    iget v0, p0, Lcn/hongguo/tv/MainActivity;->generation:I

    if-ne p1, v0, :cond_2

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->released:Z

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->catalog:Lcn/hongguo/tv/Catalog;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->memory:Lcn/hongguo/tv/MemoryProfile;

    invoke-virtual {v0, p2, v1}, Lcn/hongguo/tv/Catalog;->cover(Ljava/lang/String;Lcn/hongguo/tv/MemoryProfile;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    if-eqz p3, :cond_1

    :try_start_1
    invoke-virtual {p3}, Lcn/hongguo/tv/Api;->ready()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->memory:Lcn/hongguo/tv/MemoryProfile;

    invoke-virtual {p3, p2, v0}, Lcn/hongguo/tv/Api;->cover(Ljava/lang/String;Lcn/hongguo/tv/MemoryProfile;)Landroid/graphics/Bitmap;

    move-result-object v0

    :cond_1
    move-object v2, v0

    iget-object p3, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    new-instance v6, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda90;

    move-object v0, v6

    move-object v1, p0

    move v3, p1

    move-object v4, p2

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda90;-><init>(Lcn/hongguo/tv/MainActivity;Landroid/graphics/Bitmap;ILjava/lang/String;Landroid/widget/ImageView;)V

    invoke-virtual {p3, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p1

    :cond_2
    :goto_1
    return-void
.end method

.method synthetic lambda$manageSaved$63$cn-hongguo-tv-MainActivity(Ljava/lang/String;Lorg/json/JSONObject;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 188
    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->bucket(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p3

    const-string p4, "id"

    invoke-virtual {p2, p4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p2, p1, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->back:Ljava/util/ArrayDeque;

    invoke-virtual {p2}, Ljava/util/ArrayDeque;->clear()V

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->manageSaved(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$manageSaved$65$cn-hongguo-tv-MainActivity(Lorg/json/JSONObject;Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 188
    const/4 p3, 0x0

    invoke-virtual {p0, p3}, Lcn/hongguo/tv/MainActivity;->dialog(Z)Landroid/app/AlertDialog$Builder;

    move-result-object p3

    const-string v0, "\u79fb\u9664\u8fd9\u6761\u8bb0\u5f55\uff1f"

    invoke-virtual {p3, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p3

    const-string v0, "title"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p3

    const-string v0, "\u53d6\u6d88"

    const/4 v1, 0x0

    invoke-virtual {p3, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p3

    new-instance v0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda87;

    invoke-direct {v0, p0, p2, p1}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda87;-><init>(Lcn/hongguo/tv/MainActivity;Ljava/lang/String;Lorg/json/JSONObject;)V

    const-string p1, "\u79fb\u9664"

    invoke-virtual {p3, p1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    new-instance p2, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda88;

    invoke-direct {p2, p1}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda88;-><init>(Landroid/app/AlertDialog;)V

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method synthetic lambda$manageSaved$66$cn-hongguo-tv-MainActivity(Ljava/lang/String;I)V
    .locals 1

    .line 188
    add-int/lit8 p2, p2, -0x14

    const/4 v0, 0x0

    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcn/hongguo/tv/MainActivity;->manageSaved(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic lambda$manageSaved$67$cn-hongguo-tv-MainActivity(Ljava/lang/String;ILjava/util/ArrayList;)V
    .locals 1

    .line 188
    add-int/lit8 v0, p2, 0x14

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p3

    if-ge v0, p3, :cond_0

    move p2, v0

    :cond_0
    invoke-virtual {p0, p1, p2}, Lcn/hongguo/tv/MainActivity;->manageSaved(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic lambda$manageSaved$68$cn-hongguo-tv-MainActivity(Ljava/lang/String;)V
    .locals 1

    .line 188
    const-string v0, "favorites"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "\u6536\u85cf"

    goto :goto_0

    :cond_0
    const-string p1, "\u5386\u53f2"

    :goto_0
    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->chooseSection(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$new$0$cn-hongguo-tv-MainActivity()V
    .locals 2

    .line 24
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcn/hongguo/tv/MainActivity;->sleepDeadline:J

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->stopPlayer()V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->restore()V

    :cond_0
    const-string v0, "\u5b9a\u65f6\u505c\u6b62\u5df2\u5230\uff0c\u64ad\u653e\u5df2\u7ed3\u675f"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method synthetic lambda$new$1$cn-hongguo-tv-MainActivity()V
    .locals 4

    .line 29
    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->confirmEligible:Z

    if-eqz v0, :cond_6

    iget v0, p0, Lcn/hongguo/tv/MainActivity;->heldConfirmKey:I

    if-nez v0, :cond_0

    goto/16 :goto_2

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->confirmConsumed:Z

    .line 30
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    const/4 v3, 0x0

    if-ge v1, v2, :cond_1

    const-string v0, "\u5f53\u524d\u7cfb\u7edf\u4e0d\u652f\u6301\u4e34\u65f6\u500d\u901f"

    invoke-static {p0, v0, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void

    .line 31
    :cond_1
    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_5

    iget-boolean v1, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-eqz v1, :cond_5

    iget-boolean v1, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    if-eqz v1, :cond_5

    iget-boolean v1, p0, Lcn/hongguo/tv/MainActivity;->buffering:Z

    if-nez v1, :cond_5

    iget-boolean v1, p0, Lcn/hongguo/tv/MainActivity;->resuming:Z

    if-nez v1, :cond_5

    iget-boolean v1, p0, Lcn/hongguo/tv/MainActivity;->activityVisible:Z

    if-eqz v1, :cond_5

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->hasWindowFocus()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->playerOverlay()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_2

    goto :goto_1

    .line 32
    :cond_2
    :try_start_0
    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v1

    if-nez v1, :cond_3

    return-void

    :cond_3
    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v1, v2}, Lcn/hongguo/tv/MainActivity$Modern23;->speed(Landroid/media/MediaPlayer;F)V

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    iput-object v1, p0, Lcn/hongguo/tv/MainActivity;->temporaryOwner:Landroid/media/MediaPlayer;

    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->temporarySpeed:Z

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->hideChrome:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->holdHint:Landroid/widget/TextView;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->holdHint:Landroid/widget/TextView;

    const-string v1, "2.0 \u500d\u901f \u00b7 \u677e\u5f00\u6062\u590d"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->holdHint:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    :cond_4
    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->applySpeed()V

    const-string v0, "\u8be5\u8bbe\u5907\u6682\u4e0d\u652f\u6301\u4e34\u65f6\u500d\u901f"

    invoke-static {p0, v0, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 34
    :goto_0
    return-void

    .line 31
    :cond_5
    :goto_1
    return-void

    .line 29
    :cond_6
    :goto_2
    return-void
.end method

.method synthetic lambda$new$2$cn-hongguo-tv-MainActivity()V
    .locals 2

    .line 47
    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->confirmEligible:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->hasWindowFocus()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->failure:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->buffering:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->playerOverlay()Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    iget v0, p0, Lcn/hongguo/tv/MainActivity;->seekPreview:I

    if-gez v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->chrome:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->controlsVisible:Z

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->surface:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->requestFocusFromTouch()Z

    :cond_0
    return-void
.end method

.method synthetic lambda$new$3$cn-hongguo-tv-MainActivity()V
    .locals 2

    .line 48
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->activityVisible:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelConfirmHold()V

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->resuming:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lcn/hongguo/tv/MainActivity;->pendingSeek:J

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->saveProgress()V

    :cond_1
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelMedia()V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->resuming:Z

    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->buffering:Z

    const-string v0, "\u8fde\u63a5\u6216\u7f13\u51b2\u8d85\u65f6\uff0c\u8bf7\u91cd\u8bd5"

    iput-object v0, p0, Lcn/hongguo/tv/MainActivity;->failure:Ljava/lang/String;

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->status:Landroid/widget/TextView;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->failure:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->pauseButton:Landroid/widget/Button;

    const-string v1, "\u91cd\u8bd5"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->showControls()V

    :cond_2
    :goto_0
    return-void
.end method

.method synthetic lambda$onCreate$4$cn-hongguo-tv-MainActivity(I)V
    .locals 2

    .line 60
    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->released:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->dialog(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u8bf7\u6838\u5bf9\u5b89\u88c5\u6765\u6e90"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Lcn/hongguo/tv/AppOrigin;->status(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, "\u3002\n\u539f\u7ef4\u62a4\u8005\uff1a"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, "\u6e20\u9053\u6709\u6570"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, "\n\u53ef\u5728\u8bbe\u7f6e \u2192 \u5173\u4e8e\u4e0e\u5e2e\u52a9\u67e5\u770b\u539f\u7248\u5165\u53e3\u3002"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "\u77e5\u9053\u4e86"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    :cond_0
    return-void
.end method

.method synthetic lambda$onCreate$5$cn-hongguo-tv-MainActivity()V
    .locals 3

    .line 60
    invoke-static {p0}, Lcn/hongguo/tv/AppOrigin;->verify(Landroid/content/Context;)I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    new-instance v2, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0, v0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda1;-><init>(Lcn/hongguo/tv/MainActivity;I)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method synthetic lambda$playEpisode$86$cn-hongguo-tv-MainActivity(Landroid/media/MediaPlayer;)V
    .locals 2

    .line 258
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-ne p1, v0, :cond_2

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->stallTimeout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->resuming:Z

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setOnSeekCompleteListener(Landroid/media/MediaPlayer$OnSeekCompleteListener;)V

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->activityVisible:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->applySpeed()V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->scheduleHide()V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->pauseButton:Landroid/widget/Button;

    const-string v0, "\u64ad\u653e"

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :cond_2
    :goto_0
    return-void
.end method

.method synthetic lambda$playEpisode$87$cn-hongguo-tv-MainActivity(Landroid/media/MediaPlayer;)V
    .locals 9

    .line 258
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eq p1, v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->stallTimeout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v1

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity;->clock:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-wide/16 v4, 0x0

    invoke-static {v4, v5}, Lcn/hongguo/tv/MainActivity;->time(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, " / "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    int-to-long v6, v1

    invoke-static {v6, v7}, Lcn/hongguo/tv/MainActivity;->time(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity;->seek:Landroid/widget/SeekBar;

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-virtual {v2, v1}, Landroid/widget/SeekBar;->setMax(I)V

    iget-wide v1, p0, Lcn/hongguo/tv/MainActivity;->pendingSeek:J

    invoke-static {v1, v2, v6, v7}, Lcn/hongguo/tv/FocusGraph;->resume(JJ)J

    move-result-wide v1

    iput-wide v1, p0, Lcn/hongguo/tv/MainActivity;->pendingSeek:J

    iget-wide v1, p0, Lcn/hongguo/tv/MainActivity;->pendingSeek:J

    cmp-long v3, v1, v4

    if-lez v3, :cond_2

    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->resuming:Z

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->activityVisible:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->stallTimeout:Ljava/lang/Runnable;

    const-wide/16 v2, 0x61a8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1
    new-instance v0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda79;

    invoke-direct {v0, p0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda79;-><init>(Lcn/hongguo/tv/MainActivity;)V

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setOnSeekCompleteListener(Landroid/media/MediaPlayer$OnSeekCompleteListener;)V

    iget-wide v0, p0, Lcn/hongguo/tv/MainActivity;->pendingSeek:J

    invoke-virtual {p0, v0, v1}, Lcn/hongguo/tv/MainActivity;->seekToPosition(J)V

    goto :goto_0

    :cond_2
    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->activityVisible:Z

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->applySpeed()V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->pauseButton:Landroid/widget/Button;

    const-string v1, "\u64ad\u653e"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity;->current:Lorg/json/JSONObject;

    const-string v3, "title"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u00b7 \u7b2c "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u96c6"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoHeight()I

    move-result p1

    invoke-virtual {p0, v0, p1}, Lcn/hongguo/tv/MainActivity;->fitVideo(II)V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->scheduleHide()V

    return-void
.end method

.method synthetic lambda$playEpisode$88$cn-hongguo-tv-MainActivity(Landroid/media/MediaPlayer;II)V
    .locals 1

    .line 258
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-ne p1, v0, :cond_0

    invoke-virtual {p0, p2, p3}, Lcn/hongguo/tv/MainActivity;->fitVideo(II)V

    :cond_0
    return-void
.end method

.method synthetic lambda$playEpisode$89$cn-hongguo-tv-MainActivity(Landroid/media/MediaPlayer;II)Z
    .locals 2

    .line 258
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    const/4 v1, 0x1

    if-eq p1, v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelConfirmHold()V

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->stallTimeout:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    iput-boolean p1, p0, Lcn/hongguo/tv/MainActivity;->buffering:Z

    iput-boolean p1, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u64ad\u653e\u5931\u8d25\uff0c\u8bf7\u91cd\u8bd5\u6216\u8fd4\u56de\uff08"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "/"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "\uff09"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity;->failure:Ljava/lang/String;

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->status:Landroid/widget/TextView;

    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->failure:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->showControls()V

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->pauseButton:Landroid/widget/Button;

    const-string p2, "\u91cd\u8bd5"

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return v1
.end method

.method synthetic lambda$playEpisode$90$cn-hongguo-tv-MainActivity(Landroid/media/MediaPlayer;II)Z
    .locals 5

    .line 258
    iget-object p3, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    const/4 v0, 0x0

    if-ne p1, p3, :cond_4

    const/4 p1, 0x3

    if-ne p2, p1, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iget-wide v3, p0, Lcn/hongguo/tv/MainActivity;->transitionStartedAt:J

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lcn/hongguo/tv/MainActivity;->lastTransitionMs:J

    :cond_0
    const/16 p1, 0x2bd

    const-string p3, " \u96c6"

    const-string v1, " \u00b7 \u7b2c "

    const-string v2, "title"

    if-ne p2, p1, :cond_3

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelConfirmHold()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcn/hongguo/tv/MainActivity;->buffering:Z

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->stallTimeout:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-boolean p1, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lcn/hongguo/tv/MainActivity;->activityVisible:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->stallTimeout:Ljava/lang/Runnable;

    const-wide/16 v3, 0x61a8

    invoke-virtual {p1, p2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1
    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->status:Landroid/widget/TextView;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcn/hongguo/tv/MainActivity;->current:Lorg/json/JSONObject;

    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget v1, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-boolean p3, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    if-eqz p3, :cond_2

    const-string p3, " \u00b7 \u6b63\u5728\u7f13\u51b2\u2026"

    goto :goto_0

    :cond_2
    const-string p3, " \u00b7 \u5df2\u6682\u505c"

    :goto_0
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->showControls()V

    goto :goto_1

    :cond_3
    const/16 p1, 0x2be

    if-ne p2, p1, :cond_4

    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->buffering:Z

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->stallTimeout:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->status:Landroid/widget/TextView;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcn/hongguo/tv/MainActivity;->current:Lorg/json/JSONObject;

    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget v1, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->scheduleHide()V

    :cond_4
    :goto_1
    return v0
.end method

.method synthetic lambda$playEpisode$91$cn-hongguo-tv-MainActivity(Landroid/media/MediaPlayer;)V
    .locals 5

    .line 258
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eq p1, v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelConfirmHold()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcn/hongguo/tv/MainActivity;->ended:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->saveProgress()V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->showControls()V

    iget-boolean v1, p0, Lcn/hongguo/tv/MainActivity;->activityVisible:Z

    const-wide/16 v2, 0x0

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v4, "repeat_one"

    invoke-interface {v1, v4, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    iget p1, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    invoke-virtual {p0, p1, v2, v3}, Lcn/hongguo/tv/MainActivity;->playEpisode(IJ)V

    goto :goto_0

    :cond_1
    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->activityVisible:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "autoplay"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    iget v0, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->episodes:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_2

    iget v0, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    add-int/2addr v0, p1

    invoke-virtual {p0, v0, v2, v3}, Lcn/hongguo/tv/MainActivity;->playEpisode(IJ)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->status:Landroid/widget/TextView;

    const-string v0, "\u672c\u96c6\u64ad\u653e\u7ed3\u675f"

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->pauseButton:Landroid/widget/Button;

    const-string v0, "\u91cd\u64ad"

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method synthetic lambda$prepareSource$73$cn-hongguo-tv-MainActivity(ILandroid/media/MediaPlayer;Lcn/hongguo/tv/Api$Source;)V
    .locals 1

    .line 234
    iget v0, p0, Lcn/hongguo/tv/MainActivity;->mediaGeneration:I

    if-ne p1, v0, :cond_2

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-ne p2, p1, :cond_2

    iget-boolean p1, p0, Lcn/hongguo/tv/MainActivity;->released:Z

    if-eqz p1, :cond_0

    goto :goto_1

    :cond_0
    :try_start_0
    iget-object p1, p3, Lcn/hongguo/tv/Api$Source;->qualityNote:Ljava/lang/String;

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity;->qualityNote:Ljava/lang/String;

    invoke-virtual {p2}, Landroid/media/MediaPlayer;->reset()V

    invoke-static {p2}, Lcn/hongguo/tv/MainActivity$Modern21;->audio(Landroid/media/MediaPlayer;)V

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->surface:Landroid/view/SurfaceView;

    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/media/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    const/4 p1, 0x1

    invoke-virtual {p2, p1}, Landroid/media/MediaPlayer;->setScreenOnWhilePlaying(Z)V

    iget-boolean p1, p3, Lcn/hongguo/tv/Api$Source;->local:Z

    if-eqz p1, :cond_1

    iget-object p1, p3, Lcn/hongguo/tv/Api$Source;->location:Ljava/lang/String;

    invoke-virtual {p2, p1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object p1, p3, Lcn/hongguo/tv/Api$Source;->location:Ljava/lang/String;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    iget-object p3, p3, Lcn/hongguo/tv/Api$Source;->headers:Ljava/util/Map;

    invoke-virtual {p2, p0, p1, p3}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;Ljava/util/Map;)V

    :goto_0
    invoke-virtual {p2}, Landroid/media/MediaPlayer;->prepareAsync()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    invoke-virtual {p0, p2, p1}, Lcn/hongguo/tv/MainActivity;->sourceFailure(Landroid/media/MediaPlayer;Ljava/lang/Exception;)V

    :cond_2
    :goto_1
    return-void
.end method

.method synthetic lambda$prepareSource$74$cn-hongguo-tv-MainActivity(ILandroid/media/MediaPlayer;Ljava/lang/Exception;)V
    .locals 1

    .line 234
    iget v0, p0, Lcn/hongguo/tv/MainActivity;->mediaGeneration:I

    if-ne p1, v0, :cond_0

    invoke-virtual {p0, p2, p3}, Lcn/hongguo/tv/MainActivity;->sourceFailure(Landroid/media/MediaPlayer;Ljava/lang/Exception;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$prepareSource$75$cn-hongguo-tv-MainActivity(Lcn/hongguo/tv/Api;Ljava/lang/String;IIILandroid/media/MediaPlayer;)V
    .locals 0

    .line 234
    :try_start_0
    invoke-virtual {p1, p2, p3, p4}, Lcn/hongguo/tv/Api;->media(Ljava/lang/String;II)Lcn/hongguo/tv/Api$Source;

    move-result-object p1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Thread;->isInterrupted()Z

    move-result p2

    if-eqz p2, :cond_0

    return-void

    :cond_0
    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    new-instance p3, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda36;

    invoke-direct {p3, p0, p5, p6, p1}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda36;-><init>(Lcn/hongguo/tv/MainActivity;ILandroid/media/MediaPlayer;Lcn/hongguo/tv/Api$Source;)V

    invoke-virtual {p2, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "media_source_failure:"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string p3, "HongguoTV"

    invoke-static {p3, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    new-instance p3, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda37;

    invoke-direct {p3, p0, p5, p6, p1}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda37;-><init>(Lcn/hongguo/tv/MainActivity;ILandroid/media/MediaPlayer;Ljava/lang/Exception;)V

    invoke-virtual {p2, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_0
    return-void
.end method

.method synthetic lambda$recommendNext$69$cn-hongguo-tv-MainActivity(IZLorg/json/JSONObject;ZLjava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONArray;)V
    .locals 6

    .line 211
    iget v0, p0, Lcn/hongguo/tv/MainActivity;->generation:I

    if-ne p1, v0, :cond_8

    iget-boolean p1, p0, Lcn/hongguo/tv/MainActivity;->released:Z

    if-eqz p1, :cond_0

    goto/16 :goto_3

    :cond_0
    const/4 p1, -0x1

    iput p1, p0, Lcn/hongguo/tv/MainActivity;->recommendationTicket:I

    .line 212
    if-eqz p2, :cond_1

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->recommendations:Lcn/hongguo/tv/Recommendations;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p1, p3, v0, v1}, Lcn/hongguo/tv/Recommendations;->skipped(Lorg/json/JSONObject;J)V

    .line 213
    :cond_1
    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    const-string p2, "\u8be6\u60c5"

    const/4 p3, 0x0

    if-nez p1, :cond_3

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity$Screen;->name:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    goto :goto_1

    :cond_3
    :goto_0
    const/4 p1, 0x1

    :goto_1
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->stopPlayer()V

    .line 214
    :cond_4
    if-eqz p1, :cond_6

    const/4 p1, 0x0

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    :goto_2
    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->back:Ljava/util/ArrayDeque;

    invoke-virtual {p1}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_6

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->back:Ljava/util/ArrayDeque;

    invoke-virtual {p1}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcn/hongguo/tv/MainActivity$Screen;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity$Screen;->name:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->back:Ljava/util/ArrayDeque;

    invoke-virtual {p1}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcn/hongguo/tv/MainActivity$Screen;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity$Screen;->name:Ljava/lang/String;

    const-string v0, "\u9009\u96c6"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->back:Ljava/util/ArrayDeque;

    invoke-virtual {p1}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcn/hongguo/tv/MainActivity$Screen;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity$Screen;->name:Ljava/lang/String;

    const-string v0, "\u64ad\u653e"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    :cond_5
    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->back:Ljava/util/ArrayDeque;

    invoke-virtual {p1}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    goto :goto_2

    .line 215
    :cond_6
    if-eqz p4, :cond_7

    const-string p1, "\u76ee\u5f55\u6682\u4e0d\u53ef\u7528\uff0c\u4f7f\u7528\u4e0a\u6b21\u7ed3\u679c"

    invoke-static {p0, p1, p3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :cond_7
    iput-object p5, p0, Lcn/hongguo/tv/MainActivity;->catalogMode:Ljava/lang/String;

    const/4 v3, 0x1

    const-wide/16 v4, 0x0

    move-object v0, p0

    move-object v1, p6

    move-object v2, p7

    invoke-virtual/range {v0 .. v5}, Lcn/hongguo/tv/MainActivity;->startPlayer(Lorg/json/JSONObject;Lorg/json/JSONArray;IJ)V

    .line 216
    return-void

    .line 211
    :cond_8
    :goto_3
    return-void
.end method

.method synthetic lambda$recommendNext$70$cn-hongguo-tv-MainActivity(I)V
    .locals 1

    .line 217
    iget v0, p0, Lcn/hongguo/tv/MainActivity;->generation:I

    if-ne p1, v0, :cond_0

    iget-boolean p1, p0, Lcn/hongguo/tv/MainActivity;->released:Z

    if-nez p1, :cond_0

    const/4 p1, -0x1

    iput p1, p0, Lcn/hongguo/tv/MainActivity;->recommendationTicket:I

    const-string p1, "\u6682\u65f6\u6ca1\u627e\u5230\u5408\u9002\u7684\u65b0\u5267\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5"

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :cond_0
    return-void
.end method

.method synthetic lambda$recommendNext$71$cn-hongguo-tv-MainActivity(Ljava/lang/String;ILjava/lang/String;Lcn/hongguo/tv/Recommendations;Ljava/lang/String;JLjava/lang/String;Lcn/hongguo/tv/Api;ZLorg/json/JSONObject;)V
    .locals 17

    .line 203
    move-object/from16 v10, p0

    move-object/from16 v1, p1

    move/from16 v11, p2

    move-object/from16 v8, p3

    move-object/from16 v5, p5

    :try_start_0
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 204
    const/4 v3, 0x0

    move-object v0, v1

    const/4 v4, 0x0

    const/4 v9, 0x0

    :goto_0
    const/4 v6, 0x2

    if-ge v4, v6, :cond_7

    .line 205
    iget v6, v10, Lcn/hongguo/tv/MainActivity;->generation:I

    if-ne v11, v6, :cond_6

    iget-boolean v6, v10, Lcn/hongguo/tv/MainActivity;->released:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v6, :cond_0

    goto/16 :goto_5

    .line 206
    :cond_0
    :try_start_1
    iget-object v6, v10, Lcn/hongguo/tv/MainActivity;->catalog:Lcn/hongguo/tv/Catalog;

    invoke-static {v0, v8}, Lcn/hongguo/tv/PublicCategories;->path(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_1

    const-string v0, "\u5168\u90e8"

    :cond_1
    invoke-virtual {v6, v0, v8, v3}, Lcn/hongguo/tv/Catalog;->browsePage(Ljava/lang/String;Ljava/lang/String;Z)Lcn/hongguo/tv/Catalog$Result;

    move-result-object v0

    iget-boolean v6, v0, Lcn/hongguo/tv/Catalog$Result;->stale:Z

    or-int/2addr v9, v6

    const/4 v6, 0x0

    :goto_1
    iget-object v7, v0, Lcn/hongguo/tv/Catalog$Result;->items:Lorg/json/JSONArray;

    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v6, v7, :cond_2

    iget-object v7, v0, Lcn/hongguo/tv/Catalog$Result;->items:Lorg/json/JSONArray;

    invoke-virtual {v7, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v2, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-eqz v0, :cond_2

    return-void

    .line 207
    :cond_2
    move-object/from16 v6, p4

    move-wide/from16 v12, p6

    invoke-virtual {v6, v8, v5, v12, v13}, Lcn/hongguo/tv/Recommendations;->query(Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    const-string v7, "ai"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    sget-object v7, Lcn/hongguo/tv/AiCatalog;->GENRES:[Ljava/lang/String;

    goto :goto_2

    :cond_3
    sget-object v7, Lcn/hongguo/tv/Recommendations;->GENRES:[Ljava/lang/String;

    :goto_2
    array-length v14, v7

    const/4 v15, 0x0

    :goto_3
    if-ge v15, v14, :cond_5

    aget-object v3, v7, v15

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_4

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_4

    move-object v0, v3

    goto :goto_4

    :cond_4
    add-int/lit8 v15, v15, 0x1

    const/4 v3, 0x0

    goto :goto_3

    .line 204
    :cond_5
    :goto_4
    add-int/lit8 v4, v4, 0x1

    const/4 v3, 0x0

    goto :goto_0

    .line 205
    :cond_6
    :goto_5
    return-void

    .line 209
    :cond_7
    move-object/from16 v6, p4

    move-wide/from16 v12, p6

    move-object/from16 v1, p4

    move-object/from16 v3, p3

    move-object/from16 v4, p8

    move-object/from16 v5, p5

    move-wide/from16 v6, p6

    invoke-virtual/range {v1 .. v7}, Lcn/hongguo/tv/Recommendations;->pick(Lorg/json/JSONArray;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_9

    .line 210
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/episodes?id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcn/hongguo/tv/Api;->q(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v2, p9

    invoke-virtual {v2, v1}, Lcn/hongguo/tv/Api;->json(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "series"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    invoke-static {v0, v12}, Lcn/hongguo/tv/Recommendations;->copyMetadata(Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    const-string v0, "catalog_mode"

    invoke-virtual {v12, v0, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "episodes"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-eqz v1, :cond_8

    .line 211
    iget-object v13, v10, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    new-instance v14, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda38;

    move-object v1, v14

    move-object/from16 v2, p0

    move/from16 v3, p2

    move/from16 v4, p10

    move-object/from16 v5, p11

    move v6, v9

    move-object/from16 v7, p3

    move-object v8, v12

    move-object v9, v0

    invoke-direct/range {v1 .. v9}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda38;-><init>(Lcn/hongguo/tv/MainActivity;IZLorg/json/JSONObject;ZLjava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONArray;)V

    invoke-virtual {v13, v14}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 217
    goto :goto_6

    .line 210
    :cond_8
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "No episodes"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 209
    :cond_9
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "No unseen recommendation"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 217
    :catch_1
    move-exception v0

    iget-object v0, v10, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    new-instance v1, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda39;

    invoke-direct {v1, v10, v11}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda39;-><init>(Lcn/hongguo/tv/MainActivity;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_6
    return-void
.end method

.method synthetic lambda$renderCards$31$cn-hongguo-tv-MainActivity(Lorg/json/JSONObject;Landroid/view/View;)V
    .locals 0

    .line 126
    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->detail(Lorg/json/JSONObject;)V

    return-void
.end method

.method synthetic lambda$renderCards$32$cn-hongguo-tv-MainActivity(Landroid/view/View$OnFocusChangeListener;Lcn/hongguo/tv/MainActivity$PageUi;Landroid/widget/TextView;Landroid/view/View;Z)V
    .locals 0

    .line 130
    invoke-interface {p1, p4, p5}, Landroid/view/View$OnFocusChangeListener;->onFocusChange(Landroid/view/View;Z)V

    if-eqz p5, :cond_0

    if-eqz p2, :cond_0

    iput-object p4, p2, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    :cond_0
    if-eqz p5, :cond_1

    sget p1, Lcn/hongguo/tv/MainActivity;->PINK:I

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->ink()I

    move-result p1

    :goto_0
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method

.method synthetic lambda$renderCards$33$cn-hongguo-tv-MainActivity(Landroid/widget/LinearLayout;Lorg/json/JSONArray;Landroid/view/View;I)V
    .locals 1

    .line 134
    add-int/lit8 p4, p4, -0x14

    const/4 v0, 0x0

    invoke-static {v0, p4}, Ljava/lang/Math;->max(II)I

    move-result p4

    invoke-virtual {p0, p1, p2, p3, p4}, Lcn/hongguo/tv/MainActivity;->renderCards(Landroid/widget/LinearLayout;Lorg/json/JSONArray;Landroid/view/View;I)V

    return-void
.end method

.method synthetic lambda$renderCards$34$cn-hongguo-tv-MainActivity(Landroid/widget/LinearLayout;Lorg/json/JSONArray;Landroid/view/View;I)V
    .locals 2

    .line 134
    add-int/lit8 v0, p4, 0x14

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    move p4, v0

    :cond_0
    invoke-virtual {p0, p1, p2, p3, p4}, Lcn/hongguo/tv/MainActivity;->renderCards(Landroid/widget/LinearLayout;Lorg/json/JSONArray;Landroid/view/View;I)V

    return-void
.end method

.method synthetic lambda$renderCards$36$cn-hongguo-tv-MainActivity(Landroid/view/View;ZLandroid/view/View;Ljava/util/ArrayList;)V
    .locals 1

    .line 135
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity$Screen;->view:Landroid/view/View;

    if-ne v0, p1, :cond_1

    if-nez p2, :cond_0

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object p1

    if-eq p1, p3, :cond_0

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object p1

    if-nez p1, :cond_1

    :cond_0
    const/4 p1, 0x0

    invoke-virtual {p4, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->requestFocusFromTouch()Z

    :cond_1
    return-void
.end method

.method synthetic lambda$renderEpisodePage$53$cn-hongguo-tv-MainActivity(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Lorg/json/JSONArray;IIZ)V
    .locals 7

    .line 155
    add-int/lit8 v4, p4, -0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Lcn/hongguo/tv/MainActivity;->renderEpisodePage(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Lorg/json/JSONArray;IIZ)V

    return-void
.end method

.method synthetic lambda$renderEpisodePage$54$cn-hongguo-tv-MainActivity(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Lorg/json/JSONArray;IIZ)V
    .locals 7

    .line 156
    add-int/lit8 v4, p4, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Lcn/hongguo/tv/MainActivity;->renderEpisodePage(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Lorg/json/JSONArray;IIZ)V

    return-void
.end method

.method synthetic lambda$renderEpisodePage$55$cn-hongguo-tv-MainActivity(ZILorg/json/JSONObject;Lorg/json/JSONArray;)V
    .locals 6

    .line 163
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->closeEpisodeOverlay()V

    const-wide/16 p3, 0x0

    invoke-virtual {p0, p2, p3, p4}, Lcn/hongguo/tv/MainActivity;->playEpisode(IJ)V

    goto :goto_0

    :cond_0
    const-wide/16 v4, 0x0

    move-object v0, p0

    move-object v1, p3

    move-object v2, p4

    move v3, p2

    invoke-virtual/range {v0 .. v5}, Lcn/hongguo/tv/MainActivity;->startPlayer(Lorg/json/JSONObject;Lorg/json/JSONArray;IJ)V

    :goto_0
    return-void
.end method

.method synthetic lambda$request$10$cn-hongguo-tv-MainActivity(ILcn/hongguo/tv/MainActivity$Done;Lorg/json/JSONObject;Landroid/widget/TextView;)V
    .locals 1

    .line 74
    iget v0, p0, Lcn/hongguo/tv/MainActivity;->generation:I

    if-ne p1, v0, :cond_0

    iget-boolean p1, p0, Lcn/hongguo/tv/MainActivity;->released:Z

    if-nez p1, :cond_0

    :try_start_0
    invoke-interface {p2, p3}, Lcn/hongguo/tv/MainActivity$Done;->run(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p1, "\u5185\u5bb9\u683c\u5f0f\u6682\u4e0d\u652f\u6301\uff0c\u8bf7\u91cd\u8bd5"

    invoke-virtual {p4, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    :goto_0
    return-void
.end method

.method synthetic lambda$request$11$cn-hongguo-tv-MainActivity(ILandroid/widget/TextView;Ljava/lang/Exception;)V
    .locals 1

    .line 74
    iget v0, p0, Lcn/hongguo/tv/MainActivity;->generation:I

    if-ne p1, v0, :cond_1

    iget-boolean p1, p0, Lcn/hongguo/tv/MainActivity;->released:Z

    if-nez p1, :cond_1

    invoke-virtual {p3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    const-string p1, "\u8fde\u63a5\u5931\u8d25\uff0c\u8bf7\u91cd\u8bd5"

    goto :goto_0

    :cond_0
    invoke-virtual {p3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    return-void
.end method

.method synthetic lambda$request$12$cn-hongguo-tv-MainActivity(ILcn/hongguo/tv/Api;Ljava/lang/String;Lcn/hongguo/tv/MainActivity$Done;Landroid/widget/TextView;)V
    .locals 7

    .line 74
    iget v0, p0, Lcn/hongguo/tv/MainActivity;->generation:I

    if-ne p1, v0, :cond_1

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->released:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    invoke-virtual {p2, p3}, Lcn/hongguo/tv/Api;->json(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    new-instance p3, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda15;

    move-object v1, p3

    move-object v2, p0

    move v3, p1

    move-object v4, p4

    move-object v6, p5

    invoke-direct/range {v1 .. v6}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda15;-><init>(Lcn/hongguo/tv/MainActivity;ILcn/hongguo/tv/MainActivity$Done;Lorg/json/JSONObject;Landroid/widget/TextView;)V

    invoke-virtual {p2, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    iget-object p3, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    new-instance p4, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda16;

    invoke-direct {p4, p0, p1, p5, p2}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda16;-><init>(Lcn/hongguo/tv/MainActivity;ILandroid/widget/TextView;Ljava/lang/Exception;)V

    invoke-virtual {p3, p4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1
    :goto_0
    return-void
.end method

.method synthetic lambda$restore$9$cn-hongguo-tv-MainActivity(Lcn/hongguo/tv/MainActivity$Screen;Landroid/view/View;)V
    .locals 1

    .line 71
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    if-ne v0, p1, :cond_0

    invoke-virtual {p2}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p2}, Landroid/view/View;->requestFocusFromTouch()Z

    :cond_0
    return-void
.end method

.method synthetic lambda$resumePausedPlayer$93$cn-hongguo-tv-MainActivity(Landroid/media/MediaPlayer;)V
    .locals 4

    .line 276
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-ne p1, v0, :cond_3

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-nez v0, :cond_0

    goto :goto_2

    .line 277
    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->stallTimeout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->resuming:Z

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setOnSeekCompleteListener(Landroid/media/MediaPlayer$OnSeekCompleteListener;)V

    .line 278
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity;->current:Lorg/json/JSONObject;

    const-string v3, "title"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u00b7 \u7b2c "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u96c6"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcn/hongguo/tv/MainActivity;->activityVisible:Z

    if-eqz v2, :cond_1

    iget-boolean v2, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    if-eqz v2, :cond_1

    const-string v2, ""

    goto :goto_0

    :cond_1
    const-string v2, " \u00b7 \u5df2\u6682\u505c"

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 279
    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->activityVisible:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->scheduleHide()V

    goto :goto_1

    :cond_2
    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->pauseButton:Landroid/widget/Button;

    const-string v0, "\u64ad\u653e"

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 280
    :goto_1
    return-void

    .line 276
    :cond_3
    :goto_2
    return-void
.end method

.method synthetic lambda$search$40$cn-hongguo-tv-MainActivity(Landroid/widget/EditText;)V
    .locals 0

    .line 142
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->searchFor(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$search$41$cn-hongguo-tv-MainActivity(Ljava/lang/String;)V
    .locals 0

    .line 142
    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->searchFor(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$search$42$cn-hongguo-tv-MainActivity(Ljava/lang/String;)V
    .locals 0

    .line 142
    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->searchFor(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$selectedStyle$13$cn-hongguo-tv-MainActivity(ZLandroid/view/View;Z)V
    .locals 1

    .line 84
    const/4 v0, 0x0

    if-eqz p3, :cond_0

    const p1, -0x21510

    goto :goto_0

    :cond_0
    if-eqz p1, :cond_1

    const p1, -0x20f0b

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    if-eqz p3, :cond_2

    sget v0, Lcn/hongguo/tv/MainActivity;->PINK:I

    :cond_2
    invoke-virtual {p0, p1, v0}, Lcn/hongguo/tv/MainActivity;->bg(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method synthetic lambda$settings$57$cn-hongguo-tv-MainActivity(Lcn/hongguo/tv/Api;Landroid/widget/TextView;Lorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 175
    const-string v0, "service"

    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    const-string v0, "hongguo-tv-bridge"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_0

    iget-object p3, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {p3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    const-string v0, "base"

    iget-object v1, p1, Lcn/hongguo/tv/Api;->base:Ljava/lang/String;

    invoke-interface {p3, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    const-string v0, "token"

    iget-object p1, p1, Lcn/hongguo/tv/Api;->token:Ljava/lang/String;

    invoke-interface {p3, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    const-string p1, "\u5df2\u8fde\u63a5 \u00b7 \u7535\u8111\u4f34\u968f\u670d\u52a1"

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/Exception;

    invoke-direct {p1}, Ljava/lang/Exception;-><init>()V

    throw p1
.end method

.method synthetic lambda$settings$58$cn-hongguo-tv-MainActivity(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/TextView;)V
    .locals 1

    .line 175
    :try_start_0
    new-instance v0, Lcn/hongguo/tv/Api;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v0, p1, p2}, Lcn/hongguo/tv/Api;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcn/hongguo/tv/MainActivity;->api:Lcn/hongguo/tv/Api;

    const-string p1, "/health"

    new-instance p2, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda85;

    invoke-direct {p2, p0, v0, p3}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda85;-><init>(Lcn/hongguo/tv/MainActivity;Lcn/hongguo/tv/Api;Landroid/widget/TextView;)V

    invoke-virtual {p0, p1, p3, p2}, Lcn/hongguo/tv/MainActivity;->request(Ljava/lang/String;Landroid/widget/TextView;Lcn/hongguo/tv/MainActivity$Done;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method synthetic lambda$settings$60$cn-hongguo-tv-MainActivity(Landroid/widget/Button;Landroid/view/View;)V
    .locals 2

    .line 175
    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v0, "autoplay"

    const/4 v1, 0x1

    invoke-interface {p2, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    xor-int/2addr p2, v1

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u81ea\u52a8\u8fde\u64ad\uff1a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    if-eqz p2, :cond_0

    const-string p2, "\u5f00"

    goto :goto_0

    :cond_0
    const-string p2, "\u5173"

    :goto_0
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$shell$14$cn-hongguo-tv-MainActivity(Ljava/lang/String;)V
    .locals 0

    .line 91
    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->chooseSection(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$shell$15$cn-hongguo-tv-MainActivity()V
    .locals 1

    .line 95
    const-string v0, "\u9996\u9875"

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->chooseSection(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$shell$16$cn-hongguo-tv-MainActivity()V
    .locals 1

    .line 95
    const-string v0, "\u6f2b\u5267"

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->chooseSection(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$shell$17$cn-hongguo-tv-MainActivity()V
    .locals 1

    .line 95
    const-string v0, "AI\u5267"

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->chooseSection(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$shell$18$cn-hongguo-tv-MainActivity()V
    .locals 0

    .line 96
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->search()V

    return-void
.end method

.method synthetic lambda$show$8$cn-hongguo-tv-MainActivity(Landroid/view/View;Landroid/view/View;)V
    .locals 1

    .line 69
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity$Screen;->view:Landroid/view/View;

    if-ne v0, p1, :cond_0

    invoke-virtual {p2}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p2}, Landroid/view/View;->requestFocusFromTouch()Z

    :cond_0
    return-void
.end method

.method synthetic lambda$startPlayer$76$cn-hongguo-tv-MainActivity(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 239
    sub-int/2addr p4, p2

    sub-int/2addr p8, p6

    if-ne p4, p8, :cond_0

    sub-int/2addr p5, p3

    sub-int/2addr p9, p7

    if-eq p5, p9, :cond_1

    :cond_0
    iget p1, p0, Lcn/hongguo/tv/MainActivity;->videoWidth:I

    iget p2, p0, Lcn/hongguo/tv/MainActivity;->videoHeight:I

    invoke-virtual {p0, p1, p2}, Lcn/hongguo/tv/MainActivity;->fitVideo(II)V

    :cond_1
    return-void
.end method

.method synthetic lambda$startPlayer$77$cn-hongguo-tv-MainActivity(Landroid/view/View;)V
    .locals 0

    .line 240
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->openPlayerControls()V

    return-void
.end method

.method synthetic lambda$startPlayer$78$cn-hongguo-tv-MainActivity()V
    .locals 0

    .line 245
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->togglePause()V

    return-void
.end method

.method synthetic lambda$startPlayer$79$cn-hongguo-tv-MainActivity()V
    .locals 3

    .line 245
    iget v0, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->episodes:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget v0, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    add-int/lit8 v0, v0, 0x1

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcn/hongguo/tv/MainActivity;->playEpisode(IJ)V

    :cond_0
    return-void
.end method

.method synthetic lambda$startPlayer$80$cn-hongguo-tv-MainActivity()V
    .locals 3

    .line 246
    new-instance v0, Lcn/hongguo/tv/TvSettings;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lcn/hongguo/tv/TvSettings;-><init>(Lcn/hongguo/tv/MainActivity;Z)V

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity;->rateButton:Landroid/widget/Button;

    invoke-virtual {v0, v2, v1}, Lcn/hongguo/tv/TvSettings;->rate(Landroid/widget/Button;Z)V

    return-void
.end method

.method synthetic lambda$startPlayer$81$cn-hongguo-tv-MainActivity()V
    .locals 1

    .line 247
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->current:Lorg/json/JSONObject;

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->recommendNext(Lorg/json/JSONObject;)V

    return-void
.end method

.method synthetic lambda$startPlayer$82$cn-hongguo-tv-MainActivity()V
    .locals 0

    .line 247
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->playerEpisodes()V

    return-void
.end method

.method synthetic lambda$startPlayer$83$cn-hongguo-tv-MainActivity()V
    .locals 0

    .line 247
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->playerSettings()V

    return-void
.end method

.method synthetic lambda$startPlayer$84$cn-hongguo-tv-MainActivity(ILjava/util/ArrayList;Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 2

    .line 250
    invoke-virtual {p5}, Landroid/view/KeyEvent;->getAction()I

    move-result p3

    const/4 p5, 0x0

    if-eqz p3, :cond_0

    return p5

    :cond_0
    const/16 p3, 0x13

    const/4 v0, 0x1

    if-ne p4, p3, :cond_1

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->seek:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Landroid/widget/SeekBar;->requestFocusFromTouch()Z

    return v0

    :cond_1
    const/16 p3, 0x14

    if-ne p4, p3, :cond_2

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->playerEpisodes()V

    return v0

    :cond_2
    const/16 p3, 0x15

    if-eq p4, p3, :cond_4

    const/16 v1, 0x16

    if-ne p4, v1, :cond_3

    goto :goto_0

    :cond_3
    return p5

    :cond_4
    :goto_0
    const/4 p5, -0x1

    if-ne p4, p3, :cond_5

    :goto_1
    const/4 v1, -0x1

    goto :goto_2

    :cond_5
    const/4 v1, 0x1

    :goto_2
    add-int/2addr p1, v1

    if-ltz p1, :cond_6

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge p1, v1, :cond_6

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_6

    if-ne p4, p3, :cond_5

    goto :goto_1

    :cond_6
    if-ltz p1, :cond_7

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p3

    if-ge p1, p3, :cond_7

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->requestFocusFromTouch()Z

    :cond_7
    return v0
.end method

.method synthetic lambda$startPlayer$85$cn-hongguo-tv-MainActivity(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 253
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    const/4 p3, 0x0

    if-eqz p1, :cond_0

    return p3

    :cond_0
    const/16 p1, 0x17

    const/4 v0, 0x1

    if-eq p2, p1, :cond_4

    const/16 p1, 0x42

    if-ne p2, p1, :cond_1

    goto :goto_0

    :cond_1
    const/16 p1, 0x14

    if-ne p2, p1, :cond_2

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->pauseButton:Landroid/widget/Button;

    invoke-virtual {p1}, Landroid/widget/Button;->requestFocusFromTouch()Z

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->scheduleHide()V

    return v0

    :cond_2
    const/16 p1, 0x13

    if-ne p2, p1, :cond_3

    const/4 p3, 0x1

    :cond_3
    return p3

    :cond_4
    :goto_0
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->togglePause()V

    return v0
.end method

.method latestEpisode(Lorg/json/JSONObject;Lorg/json/JSONArray;)I
    .locals 2

    .line 149
    const-string v0, "history"

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->bucket(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result p2

    const/4 v0, 0x1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const-string v1, "episode"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p1

    :goto_0
    invoke-static {p2, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    return p1
.end method

.method learnRecommendations()Z
    .locals 3

    .line 190
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "personal_recommendations"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "record_history"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    return v2
.end method

.method loadCover(Ljava/lang/String;Landroid/widget/ImageView;)V
    .locals 8

    .line 139
    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    iget-object v4, p0, Lcn/hongguo/tv/MainActivity;->api:Lcn/hongguo/tv/Api;

    iget v2, p0, Lcn/hongguo/tv/MainActivity;->generation:I

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->covers:Landroid/util/LruCache;

    invoke-virtual {v0, p1}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void

    :cond_0
    iget-object v6, p0, Lcn/hongguo/tv/MainActivity;->coverIo:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v7, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda93;

    move-object v0, v7

    move-object v1, p0

    move-object v3, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda93;-><init>(Lcn/hongguo/tv/MainActivity;ILjava/lang/String;Lcn/hongguo/tv/Api;Landroid/widget/ImageView;)V

    invoke-virtual {v6, v7}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method manageSaved(Ljava/lang/String;)V
    .locals 1

    .line 187
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcn/hongguo/tv/MainActivity;->manageSaved(Ljava/lang/String;I)V

    return-void
.end method

.method manageSaved(Ljava/lang/String;I)V
    .locals 13

    .line 188
    const-string v0, "favorites"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "\u7ba1\u7406\u6536\u85cf"

    goto :goto_0

    :cond_0
    const-string v0, "\u7ba1\u7406\u89c2\u770b\u5386\u53f2"

    :goto_0
    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->shell(Ljava/lang/String;)Landroid/widget/LinearLayout;

    move-result-object v1

    new-instance v2, Landroid/widget/ScrollView;

    invoke-direct {v2, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ScrollView;->setFocusable(Z)V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->column()Landroid/widget/LinearLayout;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    invoke-virtual {p0, v1}, Lcn/hongguo/tv/MainActivity;->body(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v5

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v8, -0x1

    invoke-direct {v6, v8, v3, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v5, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->bucket(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v6

    :cond_1
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    if-eqz v7, :cond_1

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    new-instance v2, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda67;

    invoke-direct {v2}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda67;-><init>()V

    invoke-static {v5, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-static {p2, v6}, Ljava/lang/Math;->min(II)I

    move-result v6

    add-int/lit8 v7, p2, 0x14

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v9

    invoke-static {v7, v9}, Ljava/lang/Math;->min(II)I

    move-result v7

    invoke-virtual {v5, v6, v7}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/json/JSONObject;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "title"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "    \u00b7    \u79fb\u9664"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    new-instance v10, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda68;

    invoke-direct {v10}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda68;-><init>()V

    invoke-virtual {p0, v9, v10, v3}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v9

    invoke-virtual {v9}, Landroid/widget/Button;->setSingleLine()V

    sget-object v10, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    const/16 v10, 0x13

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setGravity(I)V

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v11, 0x42500000    # 52.0f

    invoke-virtual {p0, v11}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v11

    invoke-direct {v10, v8, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v11, 0x40800000    # 4.0f

    invoke-virtual {p0, v11}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v12

    invoke-virtual {p0, v11}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v11

    invoke-virtual {v10, v3, v12, v3, v11}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v4, v9, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v10, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda69;

    invoke-direct {v10, p0, v7, p1}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda69;-><init>(Lcn/hongguo/tv/MainActivity;Lorg/json/JSONObject;Ljava/lang/String;)V

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_2

    :cond_3
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/16 v7, 0x14

    if-le v6, v7, :cond_4

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v6

    new-instance v7, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda70;

    invoke-direct {v7, p0, p1, p2}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda70;-><init>(Lcn/hongguo/tv/MainActivity;Ljava/lang/String;I)V

    const-string v8, "\u4e0a\u4e00\u9875"

    invoke-virtual {p0, v8, v7, v3}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v7

    invoke-virtual {p0, v6, v7}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    new-instance v8, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda71;

    invoke-direct {v8, p0, p1, p2, v5}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda71;-><init>(Lcn/hongguo/tv/MainActivity;Ljava/lang/String;ILjava/util/ArrayList;)V

    const-string p2, "\u4e0b\u4e00\u9875"

    invoke-virtual {p0, p2, v8, v3}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object p2

    invoke-virtual {p0, v6, p2}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    invoke-virtual {v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_3

    :cond_4
    const/4 v7, 0x0

    :goto_3
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_5

    const/16 p2, 0x12

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->muted()I

    move-result v5

    const-string v6, "\u6682\u65e0\u8bb0\u5f55"

    invoke-virtual {p0, v6, p2, v5}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p2

    invoke-virtual {v4, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_5
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u8fd4\u56de"

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v4, "\u7ba1\u7406"

    const-string v5, ""

    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    new-instance v4, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda72;

    invoke-direct {v4, p0, p1}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda72;-><init>(Lcn/hongguo/tv/MainActivity;Ljava/lang/String;)V

    invoke-virtual {p0, p2, v4, v3}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object p1

    invoke-virtual {p0, v1}, Lcn/hongguo/tv/MainActivity;->body(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p0, v1}, Lcn/hongguo/tv/MainActivity;->pageUi(Landroid/view/View;)Lcn/hongguo/tv/MainActivity$PageUi;

    move-result-object p2

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_6

    move-object v4, p1

    goto :goto_4

    :cond_6
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    :goto_4
    iput-object v4, p2, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    invoke-virtual {p0, v1}, Lcn/hongguo/tv/MainActivity;->pageUi(Landroid/view/View;)Lcn/hongguo/tv/MainActivity$PageUi;

    move-result-object p2

    iget-object p2, p2, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    invoke-virtual {p0, v1, v0, p2, v3}, Lcn/hongguo/tv/MainActivity;->show(Landroid/view/View;Ljava/lang/String;Landroid/view/View;Z)V

    invoke-virtual {p0, v1}, Lcn/hongguo/tv/MainActivity;->pageUi(Landroid/view/View;)Lcn/hongguo/tv/MainActivity$PageUi;

    move-result-object p2

    iget-object p2, p2, Lcn/hongguo/tv/MainActivity$PageUi;->top:Landroid/view/View;

    if-eqz v7, :cond_7

    goto :goto_5

    :cond_7
    move-object v7, p1

    :goto_5
    const/4 p1, 0x1

    invoke-virtual {p0, v2, p1, p2, v7}, Lcn/hongguo/tv/MainActivity;->wireGrid(Ljava/util/ArrayList;ILandroid/view/View;Landroid/view/View;)V

    return-void
.end method

.method maybePrefetch(II)V
    .locals 5

    .line 221
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcn/hongguo/tv/MainActivity;->prefetchDisabledUntil:J

    cmp-long v4, v0, v2

    if-ltz v4, :cond_2

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->activityVisible:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->buffering:Z

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->resuming:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->api:Lcn/hongguo/tv/Api;

    invoke-virtual {v0}, Lcn/hongguo/tv/Api;->independent()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "autoplay"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "repeat_one"

    const/4 v3, 0x0

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_2

    iget v0, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->episodes:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_2

    const/16 v0, 0x7d0

    if-lt p1, v0, :cond_2

    sub-int/2addr p2, p1

    const p1, 0xea60

    if-le p2, p1, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->current:Lorg/json/JSONObject;

    const-string v0, "id"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ":"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget v1, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    add-int/2addr v1, v2

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->qualityCeiling()I

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->prefetchKey:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    return-void

    :cond_1
    iput-object p1, p0, Lcn/hongguo/tv/MainActivity;->prefetchKey:Ljava/lang/String;

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->api:Lcn/hongguo/tv/Api;

    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->current:Lorg/json/JSONObject;

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iget v0, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    add-int/2addr v0, v2

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->qualityCeiling()I

    move-result v1

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity;->mediaIo:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v3, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda25;

    invoke-direct {v3, p1, p2, v0, v1}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda25;-><init>(Lcn/hongguo/tv/Api;Ljava/lang/String;II)V

    invoke-virtual {v2, v3}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object p1

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity;->prefetchJob:Ljava/util/concurrent/Future;

    :cond_2
    :goto_0
    return-void
.end method

.method muted()I
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->darkTheme()Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, -0x524d40

    goto :goto_0

    :cond_0
    sget v0, Lcn/hongguo/tv/MainActivity;->MUTED:I

    :goto_0
    return v0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 324
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    iget-object p3, p0, Lcn/hongguo/tv/MainActivity;->updates:Lcn/hongguo/tv/TvUpdater;

    if-eqz p3, :cond_0

    iget-object p3, p0, Lcn/hongguo/tv/MainActivity;->updates:Lcn/hongguo/tv/TvUpdater;

    invoke-virtual {p3, p1, p2}, Lcn/hongguo/tv/TvUpdater;->activityResult(II)V

    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    .line 72
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelConfirmHold()V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    const-string v1, "settings-overlay"

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->closeSettingsOverlay()V

    return-void

    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    const-string v1, "episode-overlay"

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->closeEpisodeOverlay()V

    return-void

    :cond_1
    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->controlsVisible:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->buffering:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->failure:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->hideChrome:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->hideChrome:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_2
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->stopPlayer()V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->restore()V

    return-void

    :cond_3
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->restore()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 52
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lcn/hongguo/tv/Catalog;

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->getCacheDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "catalog-v1.json"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcn/hongguo/tv/Catalog;-><init>(Ljava/io/File;)V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity;->catalog:Lcn/hongguo/tv/Catalog;

    const-string p1, "hongguo-tv"

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcn/hongguo/tv/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    new-instance p1, Lcn/hongguo/tv/Recommendations;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v2, "recommendations"

    const-string v3, "{}"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v1}, Lcn/hongguo/tv/Recommendations;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity;->recommendations:Lcn/hongguo/tv/Recommendations;

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/high16 v1, 0x3f800000    # 1.0f

    const/16 v2, 0x17

    if-lt p1, v2, :cond_0

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v3, "speed"

    invoke-interface {p1, v3, v1}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v1

    :cond_0
    iput v1, p0, Lcn/hongguo/tv/MainActivity;->speed:F

    .line 53
    const-string p1, "activity"

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/ActivityManager;

    new-instance v1, Lcn/hongguo/tv/MemoryProfile;

    invoke-virtual {p1}, Landroid/app/ActivityManager;->getMemoryClass()I

    move-result v3

    invoke-virtual {p1}, Landroid/app/ActivityManager;->isLowRamDevice()Z

    move-result p1

    const/4 v4, 0x1

    if-nez p1, :cond_1

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge p1, v2, :cond_2

    :cond_1
    const/4 v0, 0x1

    :cond_2
    invoke-direct {v1, v3, v0}, Lcn/hongguo/tv/MemoryProfile;-><init>(IZ)V

    iput-object v1, p0, Lcn/hongguo/tv/MainActivity;->memory:Lcn/hongguo/tv/MemoryProfile;

    .line 54
    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->memory:Lcn/hongguo/tv/MemoryProfile;

    iget p1, p1, Lcn/hongguo/tv/MemoryProfile;->coverWorkers:I

    invoke-static {p1}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/ThreadPoolExecutor;

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity;->coverIo:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->memory:Lcn/hongguo/tv/MemoryProfile;

    iget-boolean p1, p1, Lcn/hongguo/tv/MemoryProfile;->lowRam:Z

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    const/4 v4, 0x2

    :goto_0
    invoke-static {v4}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/ThreadPoolExecutor;

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity;->io:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 55
    new-instance p1, Lcn/hongguo/tv/MainActivity$2;

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->memory:Lcn/hongguo/tv/MemoryProfile;

    iget v0, v0, Lcn/hongguo/tv/MemoryProfile;->cacheBytes:I

    invoke-direct {p1, p0, v0}, Lcn/hongguo/tv/MainActivity$2;-><init>(Lcn/hongguo/tv/MainActivity;I)V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity;->covers:Landroid/util/LruCache;

    .line 56
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    const/16 v0, 0x1006

    invoke-virtual {p1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 57
    new-instance p1, Landroid/widget/FrameLayout;

    invoke-direct {p1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity;->host:Landroid/widget/FrameLayout;

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->host:Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->pageColor()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->host:Landroid/widget/FrameLayout;

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->setContentView(Landroid/view/View;)V

    .line 58
    :try_start_0
    invoke-static {p0}, Lcn/hongguo/tv/Api;->local(Landroid/content/Context;)Lcn/hongguo/tv/Api;

    move-result-object p1

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity;->api:Lcn/hongguo/tv/Api;

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->api:Lcn/hongguo/tv/Api;

    if-nez p1, :cond_4

    new-instance p1, Lcn/hongguo/tv/Api;

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "base"

    const-string v2, "http://127.0.0.1:8768"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v2, "token"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v0, v1}, Lcn/hongguo/tv/Api;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity;->api:Lcn/hongguo/tv/Api;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 59
    :cond_4
    :goto_1
    new-instance p1, Lcn/hongguo/tv/TvUpdater;

    invoke-direct {p1, p0}, Lcn/hongguo/tv/TvUpdater;-><init>(Lcn/hongguo/tv/MainActivity;)V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity;->updates:Lcn/hongguo/tv/TvUpdater;

    const-string p1, "\u9996\u9875"

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcn/hongguo/tv/MainActivity;->home(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ticker:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 60
    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->io:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda91;

    invoke-direct {v0, p0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda91;-><init>(Lcn/hongguo/tv/MainActivity;)V

    invoke-virtual {p1, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 61
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .line 325
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->released:Z

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->updates:Lcn/hongguo/tv/TvUpdater;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->updates:Lcn/hongguo/tv/TvUpdater;

    invoke-virtual {v0}, Lcn/hongguo/tv/TvUpdater;->destroy()V

    :cond_0
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->stopPlayer()V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->io:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdownNow()Ljava/util/List;

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->coverIo:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdownNow()Ljava/util/List;

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->mediaIo:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdownNow()Ljava/util/List;

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->covers:Landroid/util/LruCache;

    invoke-virtual {v0}, Landroid/util/LruCache;->evictAll()V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->back:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->clear()V

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method public onLowMemory()V
    .locals 4

    .line 323
    invoke-super {p0}, Landroid/app/Activity;->onLowMemory()V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelPrefetch()V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    const-wide/32 v2, 0xea60

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcn/hongguo/tv/MainActivity;->prefetchDisabledUntil:J

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->covers:Landroid/util/LruCache;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->covers:Landroid/util/LruCache;

    invoke-virtual {v0}, Landroid/util/LruCache;->evictAll()V

    :cond_0
    return-void
.end method

.method protected onPause()V
    .locals 4

    .line 321
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->updates:Lcn/hongguo/tv/TvUpdater;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->updates:Lcn/hongguo/tv/TvUpdater;

    invoke-virtual {v0}, Lcn/hongguo/tv/TvUpdater;->pause()V

    :cond_0
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelConfirmHold()V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->recommendations:Lcn/hongguo/tv/Recommendations;

    invoke-virtual {v0}, Lcn/hongguo/tv/Recommendations;->resetSample()V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->persistRecommendations()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->activityVisible:Z

    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelPrefetch()V

    const/4 v0, -0x1

    iput v0, p0, Lcn/hongguo/tv/MainActivity;->seekPreview:I

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->stallTimeout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->saveProgress()V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelMedia()V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->sourceFailure(Landroid/media/MediaPlayer;)V

    :cond_1
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-eqz v0, :cond_2

    :try_start_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->pauseButton:Landroid/widget/Button;

    const-string v1, "\u64ad\u653e"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity;->current:Lorg/json/JSONObject;

    const-string v3, "title"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u00b7 \u7b2c "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u96c6 \u00b7 \u5df2\u6682\u505c"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->hideChrome:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->showControls()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :cond_2
    :goto_0
    return-void
.end method

.method protected onResume()V
    .locals 1

    .line 320
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->activityVisible:Z

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->updates:Lcn/hongguo/tv/TvUpdater;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->updates:Lcn/hongguo/tv/TvUpdater;

    invoke-virtual {v0}, Lcn/hongguo/tv/TvUpdater;->resume()V

    :cond_0
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 7

    .line 322
    invoke-super {p0, p1}, Landroid/app/Activity;->onTrimMemory(I)V

    const/16 v0, 0xf

    const/16 v1, 0xa

    const/16 v2, 0x28

    if-ge p1, v2, :cond_0

    if-eq p1, v1, :cond_0

    if-ne p1, v0, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelPrefetch()V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    const-wide/32 v5, 0xea60

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcn/hongguo/tv/MainActivity;->prefetchDisabledUntil:J

    :cond_1
    iget-object v3, p0, Lcn/hongguo/tv/MainActivity;->covers:Landroid/util/LruCache;

    if-eqz v3, :cond_3

    if-ge p1, v2, :cond_2

    if-eq p1, v1, :cond_2

    if-ne p1, v0, :cond_3

    :cond_2
    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->covers:Landroid/util/LruCache;

    invoke-virtual {p1}, Landroid/util/LruCache;->evictAll()V

    :cond_3
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    .line 319
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelConfirmHold()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->updates:Lcn/hongguo/tv/TvUpdater;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->updates:Lcn/hongguo/tv/TvUpdater;

    invoke-virtual {p1}, Lcn/hongguo/tv/TvUpdater;->maybeRemind()V

    :cond_1
    :goto_0
    return-void
.end method

.method openPlayerControls()V
    .locals 1

    .line 288
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->showControls()V

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->seek:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->requestFocusFromTouch()Z

    :cond_0
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->scheduleHide()V

    return-void
.end method

.method pageColor()I
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->darkTheme()Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, -0xebe9e5

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :goto_0
    return v0
.end method

.method pageUi(Landroid/view/View;)Lcn/hongguo/tv/MainActivity$PageUi;
    .locals 1

    .line 79
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcn/hongguo/tv/MainActivity$PageUi;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcn/hongguo/tv/MainActivity$PageUi;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method persistRecommendations()V
    .locals 3

    .line 191
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->recommendations:Lcn/hongguo/tv/Recommendations;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->recommendations:Lcn/hongguo/tv/Recommendations;

    invoke-virtual {v1}, Lcn/hongguo/tv/Recommendations;->serialize()Ljava/lang/String;

    move-result-object v1

    const-string v2, "recommendations"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_0
    return-void
.end method

.method playEpisode(IJ)V
    .locals 4

    .line 257
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelConfirmHold()V

    const/4 v0, -0x1

    iput v0, p0, Lcn/hongguo/tv/MainActivity;->seekPreview:I

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->nextButton:Landroid/widget/Button;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->episodes:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ge p1, v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->nextButton:Landroid/widget/Button;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->nextButton:Landroid/widget/Button;

    invoke-virtual {v1}, Landroid/widget/Button;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_1

    :cond_1
    const v1, 0x3eb33333    # 0.35f

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setAlpha(F)V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->recommendations:Lcn/hongguo/tv/Recommendations;

    invoke-virtual {v0}, Lcn/hongguo/tv/Recommendations;->resetSample()V

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->cancelMediaForEpisode(I)V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->hideChrome:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->stallTimeout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iput-boolean v3, p0, Lcn/hongguo/tv/MainActivity;->buffering:Z

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->saveProgress()V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-eqz v0, :cond_2

    :try_start_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    :cond_2
    :goto_2
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcn/hongguo/tv/MainActivity;->transitionStartedAt:J

    iput p1, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    iput-wide p2, p0, Lcn/hongguo/tv/MainActivity;->pendingSeek:J

    iput-boolean v3, p0, Lcn/hongguo/tv/MainActivity;->resuming:Z

    iput-boolean v3, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    iput-boolean v3, p0, Lcn/hongguo/tv/MainActivity;->ended:Z

    iput-boolean v2, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    const-string p2, ""

    iput-object p2, p0, Lcn/hongguo/tv/MainActivity;->failure:Ljava/lang/String;

    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->clock:Landroid/widget/TextView;

    const-string p3, "00:00 / 00:00"

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->seek:Landroid/widget/SeekBar;

    invoke-virtual {p2, v3}, Landroid/widget/SeekBar;->setProgress(I)V

    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->seek:Landroid/widget/SeekBar;

    invoke-virtual {p2, v2}, Landroid/widget/SeekBar;->setMax(I)V

    iput-boolean v2, p0, Lcn/hongguo/tv/MainActivity;->controlsVisible:Z

    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->chrome:Landroid/widget/LinearLayout;

    invoke-virtual {p2, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->pauseButton:Landroid/widget/Button;

    const-string p3, "\u6682\u505c"

    invoke-virtual {p2, p3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->status:Landroid/widget/TextView;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->current:Lorg/json/JSONObject;

    const-string v1, "title"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, " \u00b7 \u7b2c "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    iget v0, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, " \u96c6 \u00b7 \u6b63\u5728\u51c6\u5907\u2026"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-nez p2, :cond_3

    new-instance p2, Landroid/media/MediaPlayer;

    invoke-direct {p2}, Landroid/media/MediaPlayer;-><init>()V

    iput-object p2, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    :cond_3
    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    .line 258
    :try_start_1
    invoke-static {p2}, Lcn/hongguo/tv/MainActivity$Modern21;->audio(Landroid/media/MediaPlayer;)V

    iget-object p3, p0, Lcn/hongguo/tv/MainActivity;->surface:Landroid/view/SurfaceView;

    invoke-virtual {p3}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/media/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    invoke-virtual {p2, v2}, Landroid/media/MediaPlayer;->setScreenOnWhilePlaying(Z)V

    new-instance p3, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda62;

    invoke-direct {p3, p0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda62;-><init>(Lcn/hongguo/tv/MainActivity;)V

    invoke-virtual {p2, p3}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    new-instance p3, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda63;

    invoke-direct {p3, p0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda63;-><init>(Lcn/hongguo/tv/MainActivity;)V

    invoke-virtual {p2, p3}, Landroid/media/MediaPlayer;->setOnVideoSizeChangedListener(Landroid/media/MediaPlayer$OnVideoSizeChangedListener;)V

    new-instance p3, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda64;

    invoke-direct {p3, p0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda64;-><init>(Lcn/hongguo/tv/MainActivity;)V

    invoke-virtual {p2, p3}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    new-instance p3, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda65;

    invoke-direct {p3, p0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda65;-><init>(Lcn/hongguo/tv/MainActivity;)V

    invoke-virtual {p2, p3}, Landroid/media/MediaPlayer;->setOnInfoListener(Landroid/media/MediaPlayer$OnInfoListener;)V

    new-instance p3, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda66;

    invoke-direct {p3, p0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda66;-><init>(Lcn/hongguo/tv/MainActivity;)V

    invoke-virtual {p2, p3}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    invoke-virtual {p0, p2, p1}, Lcn/hongguo/tv/MainActivity;->prepareSource(Landroid/media/MediaPlayer;I)V

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->stallTimeout:Ljava/lang/Runnable;

    const-wide/32 v0, 0x15f90

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_3

    :catch_1
    move-exception p1

    iput-boolean v3, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    const-string p1, "\u65e0\u6cd5\u51c6\u5907\u64ad\u653e\uff0c\u8bf7\u68c0\u67e5\u8fde\u63a5\u540e\u91cd\u8bd5"

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity;->failure:Ljava/lang/String;

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->status:Landroid/widget/TextView;

    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->failure:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->pauseButton:Landroid/widget/Button;

    const-string p2, "\u91cd\u8bd5"

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->showControls()V

    .line 259
    :goto_3
    return-void
.end method

.method playerEpisodes()V
    .locals 11

    .line 290
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelConfirmHold()V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->playerOverlay()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->commitSeekPreview()V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcn/hongguo/tv/MainActivity;->overlayReturnFocus:Landroid/view/View;

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->hideChrome:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->column()Landroid/widget/LinearLayout;

    move-result-object v0

    const-string v1, "episode-overlay"

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    const/high16 v1, 0x41900000    # 18.0f

    invoke-virtual {p0, v1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v2

    const/high16 v3, 0x41a00000    # 20.0f

    invoke-virtual {p0, v3}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v4

    invoke-virtual {p0, v1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v1

    invoke-virtual {p0, v3}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v3

    invoke-virtual {v0, v2, v4, v1, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const v1, -0xde7e6e4

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u9009\u96c6 \u00b7 \u7b2c "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u96c6\u64ad\u653e\u4e2d"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x16

    const/4 v3, -0x1

    invoke-virtual {p0, v1, v2, v3}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const/16 v1, 0xe

    const v2, -0x45413b

    const-string v4, "\u8fd4\u56de\u5173\u95ed"

    invoke-virtual {p0, v4, v1, v2}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->column()Landroid/widget/LinearLayout;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const/high16 v1, 0x44160000    # 600.0f

    invoke-virtual {p0, v1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v1

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v2, v2

    const v4, 0x3f28f5c3    # 0.66f

    mul-float v2, v2, v4

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v6, 0x5

    invoke-direct {v4, v1, v3, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v2, v0, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->chrome:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->controlsVisible:Z

    iget-object v6, p0, Lcn/hongguo/tv/MainActivity;->current:Lorg/json/JSONObject;

    iget-object v7, p0, Lcn/hongguo/tv/MainActivity;->episodes:Lorg/json/JSONArray;

    iget v0, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    add-int/lit8 v0, v0, -0x1

    div-int/lit8 v8, v0, 0x14

    iget v9, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    const/4 v10, 0x1

    move-object v4, p0

    invoke-virtual/range {v4 .. v10}, Lcn/hongguo/tv/MainActivity;->renderEpisodePage(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Lorg/json/JSONArray;IIZ)V

    return-void
.end method

.method playerOverlay()Landroid/view/View;
    .locals 2

    .line 283
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    const-string v1, "settings-overlay"

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    const-string v1, "episode-overlay"

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method playerSettings()V
    .locals 2

    .line 182
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelConfirmHold()V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    const-string v1, "settings-overlay"

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    const-string v1, "episode-overlay"

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->closeEpisodeOverlay()V

    :cond_1
    new-instance v0, Lcn/hongguo/tv/TvSettings;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lcn/hongguo/tv/TvSettings;-><init>(Lcn/hongguo/tv/MainActivity;Z)V

    invoke-virtual {v0}, Lcn/hongguo/tv/TvSettings;->drawer()V

    :cond_2
    :goto_0
    return-void
.end method

.method prepareSource(Landroid/media/MediaPlayer;I)V
    .locals 10

    .line 234
    iget v6, p0, Lcn/hongguo/tv/MainActivity;->mediaGeneration:I

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity;->api:Lcn/hongguo/tv/Api;

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->current:Lorg/json/JSONObject;

    const-string v1, "id"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->qualityCeiling()I

    move-result v5

    iget-object v8, p0, Lcn/hongguo/tv/MainActivity;->mediaIo:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v9, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda77;

    move-object v0, v9

    move-object v1, p0

    move v4, p2

    move-object v7, p1

    invoke-direct/range {v0 .. v7}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda77;-><init>(Lcn/hongguo/tv/MainActivity;Lcn/hongguo/tv/Api;Ljava/lang/String;IIILandroid/media/MediaPlayer;)V

    invoke-virtual {v8, v9}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object p1

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity;->mediaJob:Ljava/util/concurrent/Future;

    return-void
.end method

.method previewSeek(I)V
    .locals 3

    .line 286
    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->resuming:Z

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    iget v0, p0, Lcn/hongguo/tv/MainActivity;->seekPreview:I

    if-ltz v0, :cond_1

    iget v0, p0, Lcn/hongguo/tv/MainActivity;->seekPreview:I

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    :goto_0
    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v1

    add-int/lit16 v1, v1, -0x1f4

    const/4 v2, 0x0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    add-int/2addr v0, p1

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcn/hongguo/tv/MainActivity;->seekPreview:I

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->showControls()V

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->seek:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Landroid/widget/SeekBar;->requestFocusFromTouch()Z

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->seek:Landroid/widget/SeekBar;

    iget v0, p0, Lcn/hongguo/tv/MainActivity;->seekPreview:I

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->clock:Landroid/widget/TextView;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcn/hongguo/tv/MainActivity;->seekPreview:I

    int-to-long v1, v1

    invoke-static {v1, v2}, Lcn/hongguo/tv/MainActivity;->time(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " / "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v1

    int-to-long v1, v1

    invoke-static {v1, v2}, Lcn/hongguo/tv/MainActivity;->time(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u00b7 \u677e\u5f00\u5b9a\u4f4d"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->hideChrome:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_2
    :goto_1
    return-void
.end method

.method qualityCeiling()I
    .locals 3

    .line 220
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "quality"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->memory:Lcn/hongguo/tv/MemoryProfile;

    iget-boolean v1, v1, Lcn/hongguo/tv/MemoryProfile;->lowRam:Z

    invoke-static {v0, v1}, Lcn/hongguo/tv/PlaybackQuality;->ceiling(IZ)I

    move-result v0

    return v0
.end method

.method recommendNext(Lorg/json/JSONObject;)V
    .locals 16

    .line 194
    move-object/from16 v13, p0

    move-object/from16 v12, p1

    iget v0, v13, Lcn/hongguo/tv/MainActivity;->recommendationTicket:I

    iget v1, v13, Lcn/hongguo/tv/MainActivity;->generation:I

    if-ne v0, v1, :cond_0

    return-void

    .line 195
    :cond_0
    iget v3, v13, Lcn/hongguo/tv/MainActivity;->generation:I

    iput v3, v13, Lcn/hongguo/tv/MainActivity;->recommendationTicket:I

    iget-object v10, v13, Lcn/hongguo/tv/MainActivity;->api:Lcn/hongguo/tv/Api;

    .line 196
    if-nez v12, :cond_1

    iget-object v0, v13, Lcn/hongguo/tv/MainActivity;->catalogMode:Ljava/lang/String;

    goto :goto_0

    :cond_1
    const-string v0, "catalog_mode"

    iget-object v1, v13, Lcn/hongguo/tv/MainActivity;->catalogMode:Ljava/lang/String;

    invoke-virtual {v12, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    move-object v4, v0

    const-string v0, ""

    if-nez v12, :cond_2

    move-object v9, v0

    goto :goto_1

    :cond_2
    const-string v1, "id"

    invoke-virtual {v12, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move-object v9, v1

    .line 197
    :goto_1
    const/4 v1, 0x0

    if-eqz v12, :cond_3

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->learnRecommendations()Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, v13, Lcn/hongguo/tv/MainActivity;->recommendations:Lcn/hongguo/tv/Recommendations;

    invoke-virtual {v2, v12}, Lcn/hongguo/tv/Recommendations;->early(Lorg/json/JSONObject;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, v13, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz v2, :cond_3

    iget v2, v13, Lcn/hongguo/tv/MainActivity;->episode:I

    const/4 v5, 0x1

    if-ne v2, v5, :cond_3

    iget-boolean v2, v13, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-eqz v2, :cond_3

    iget-object v2, v13, Lcn/hongguo/tv/MainActivity;->failure:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_3

    const/4 v11, 0x1

    goto :goto_2

    :cond_3
    const/4 v11, 0x0

    .line 198
    :goto_2
    if-eqz v11, :cond_4

    invoke-static/range {p1 .. p1}, Lcn/hongguo/tv/Recommendations;->genre(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    :cond_4
    move-object v6, v0

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->learnRecommendations()Z

    move-result v0

    .line 199
    if-eqz v0, :cond_5

    iget-object v0, v13, Lcn/hongguo/tv/MainActivity;->recommendations:Lcn/hongguo/tv/Recommendations;

    goto :goto_3

    :cond_5
    iget-object v0, v13, Lcn/hongguo/tv/MainActivity;->recommendations:Lcn/hongguo/tv/Recommendations;

    invoke-virtual {v0}, Lcn/hongguo/tv/Recommendations;->neutral()Lcn/hongguo/tv/Recommendations;

    move-result-object v0

    :goto_3
    move-object v5, v0

    .line 200
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-virtual {v5, v4, v6, v7, v8}, Lcn/hongguo/tv/Recommendations;->query(Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v2

    .line 201
    const-string v0, "\u6b63\u5728\u627e\u4e0b\u4e00\u90e8\u2026"

    invoke-static {v13, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 202
    iget-object v14, v13, Lcn/hongguo/tv/MainActivity;->io:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v15, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;

    move-object v0, v15

    move-object/from16 v1, p0

    move-object/from16 v12, p1

    invoke-direct/range {v0 .. v12}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;-><init>(Lcn/hongguo/tv/MainActivity;Ljava/lang/String;ILjava/lang/String;Lcn/hongguo/tv/Recommendations;Ljava/lang/String;JLjava/lang/String;Lcn/hongguo/tv/Api;ZLorg/json/JSONObject;)V

    invoke-virtual {v14, v15}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 218
    return-void
.end method

.method refreshSeekLabels()V
    .locals 4

    .line 179
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->rewindButton:Landroid/widget/Button;

    const-string v1, " \u79d2"

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->rewindButton:Landroid/widget/Button;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u2212"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->seekSeconds()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->forwardButton:Landroid/widget/Button;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->forwardButton:Landroid/widget/Button;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "+"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->seekSeconds()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    return-void
.end method

.method reloadVisibleCovers(Landroid/view/View;)V
    .locals 2

    .line 141
    instance-of v0, p1, Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    check-cast p1, Landroid/widget/ImageView;

    invoke-virtual {p0, v0, p1}, Lcn/hongguo/tv/MainActivity;->loadCover(Ljava/lang/String;Landroid/widget/ImageView;)V

    goto :goto_1

    :cond_0
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    check-cast p1, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcn/hongguo/tv/MainActivity;->reloadVisibleCovers(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method rememberSearch(Ljava/lang/String;)V
    .locals 5

    .line 185
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x50

    if-le v0, v2, :cond_1

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    :cond_1
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->searchHistory()Lorg/json/JSONArray;

    move-result-object v0

    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v2, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v1, v3, :cond_3

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    const/4 v4, 0x6

    if-ge v3, v4, :cond_3

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "search_history"

    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method renderCards(Landroid/widget/LinearLayout;Lorg/json/JSONArray;Landroid/view/View;)V
    .locals 1

    .line 122
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcn/hongguo/tv/MainActivity;->renderCards(Landroid/widget/LinearLayout;Lorg/json/JSONArray;Landroid/view/View;I)V

    return-void
.end method

.method renderCards(Landroid/widget/LinearLayout;Lorg/json/JSONArray;Landroid/view/View;I)V
    .locals 22

    .line 124
    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p3

    invoke-virtual/range {p1 .. p1}, Landroid/widget/LinearLayout;->hasFocus()Z

    move-result v9

    const-string v0, "favorites"

    invoke-virtual {v6, v0}, Lcn/hongguo/tv/MainActivity;->bucket(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    iget-object v1, v6, Lcn/hongguo/tv/MainActivity;->coverIo:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v1}, Ljava/util/concurrent/ThreadPoolExecutor;->getQueue()Ljava/util/concurrent/BlockingQueue;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/BlockingQueue;->clear()V

    invoke-virtual/range {p1 .. p1}, Landroid/widget/LinearLayout;->removeAllViews()V

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v1, v1

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v1, v2

    const v2, 0x44898000    # 1100.0f

    cmpl-float v2, v1, v2

    if-ltz v2, :cond_0

    const/4 v2, 0x6

    const/4 v11, 0x6

    goto :goto_0

    :cond_0
    const/4 v2, 0x5

    const/4 v11, 0x5

    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v2, v2

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    add-int/lit16 v2, v2, -0x16d

    const/high16 v3, 0x42b00000    # 88.0f

    sub-float/2addr v1, v3

    const/high16 v3, 0x42380000    # 46.0f

    sub-float/2addr v1, v3

    int-to-float v3, v11

    div-float/2addr v1, v3

    const/high16 v3, 0x41600000    # 14.0f

    sub-float/2addr v1, v3

    const v3, 0x3fb0a3d7    # 1.38f

    mul-float v1, v1, v3

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    const/16 v2, 0x80

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->currentUi()Lcn/hongguo/tv/MainActivity$PageUi;

    move-result-object v12

    .line 125
    const/4 v2, 0x0

    move/from16 v3, p4

    :goto_1
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v4

    add-int/lit8 v13, p4, 0x14

    invoke-static {v4, v13}, Ljava/lang/Math;->min(II)I

    move-result v4

    if-ge v3, v4, :cond_7

    .line 126
    move-object/from16 v4, p2

    invoke-virtual {v4, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v13

    if-nez v13, :cond_1

    move/from16 v20, v3

    move/from16 v18, v9

    move/from16 v19, v11

    goto/16 :goto_4

    :cond_1
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v16

    rem-int v16, v16, v11

    if-nez v16, :cond_2

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v2

    const/16 v15, 0x30

    invoke-virtual {v2, v15}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-virtual {v7, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->column()Landroid/widget/LinearLayout;

    move-result-object v15

    const/high16 v14, 0x40800000    # 4.0f

    invoke-virtual {v6, v14}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v5

    invoke-virtual {v6, v14}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v4

    invoke-virtual {v6, v14}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v14

    move/from16 v18, v9

    const/high16 v9, 0x40a00000    # 5.0f

    invoke-virtual {v6, v9}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v8

    invoke-virtual {v15, v5, v4, v14, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/4 v4, 0x0

    invoke-virtual {v6, v15, v4}, Lcn/hongguo/tv/MainActivity;->focusStyle(Landroid/view/View;Z)V

    new-instance v4, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda30;

    invoke-direct {v4, v6, v13}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda30;-><init>(Lcn/hongguo/tv/MainActivity;Lorg/json/JSONObject;)V

    invoke-virtual {v15, v4}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "title"

    invoke-virtual {v13, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v8, "\uff0c\u786e\u8ba4\u67e5\u770b\u8be6\u60c5"

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v15, v4}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 127
    new-instance v4, Landroid/widget/FrameLayout;

    invoke-direct {v4, v6}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const v8, -0xf1714

    const/4 v14, 0x0

    invoke-virtual {v6, v8, v14}, Lcn/hongguo/tv/MainActivity;->bg(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v8

    invoke-virtual {v4, v8}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/16 v8, 0x12

    const v14, -0x49655b

    const-string v9, "\u7ea2\u679c\u77ed\u5267"

    invoke-virtual {v6, v9, v8, v14}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v8

    const/16 v9, 0x11

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v9, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v14, -0x1

    invoke-direct {v9, v14, v14}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v8, v9}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v8, Landroid/widget/ImageView;

    invoke-direct {v8, v6}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v9, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    new-instance v9, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v9, v14, v14}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v8, v9}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v9, "count"

    invoke-virtual {v13, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v17

    if-lez v17, :cond_3

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\u5168 "

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v13, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, " \u96c6"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_2

    :cond_3
    const-string v7, "\u77ed\u5267"

    :goto_2
    const/16 v9, 0xb

    const/4 v14, -0x1

    invoke-virtual {v6, v7, v9, v14}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v7

    const v9, -0x5ae7e6e4

    const/4 v14, 0x0

    invoke-virtual {v6, v9, v14}, Lcn/hongguo/tv/MainActivity;->bg(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v9

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v9, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v14, 0x35

    move/from16 v19, v11

    const/4 v11, -0x2

    invoke-direct {v9, v11, v11, v14}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    const/high16 v14, 0x40a00000    # 5.0f

    invoke-virtual {v6, v14}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v11

    move/from16 v20, v3

    invoke-virtual {v6, v14}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v3

    move-object/from16 v21, v8

    invoke-virtual {v6, v14}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v8

    const/4 v14, 0x0

    invoke-virtual {v9, v11, v3, v8, v14}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v4, v7, v9}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    int-to-float v7, v1

    invoke-virtual {v6, v7}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v7

    const/4 v8, -0x1

    invoke-direct {v3, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v15, v4, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 128
    invoke-virtual {v13, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x10

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->ink()I

    move-result v5

    invoke-virtual {v6, v3, v4, v5}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v3

    const/high16 v4, 0x40400000    # 3.0f

    invoke-virtual {v6, v4}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v5

    const/high16 v7, 0x40e00000    # 7.0f

    invoke-virtual {v6, v7}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v7

    invoke-virtual {v6, v4}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v8

    const/high16 v9, 0x40000000    # 2.0f

    invoke-virtual {v6, v9}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v9

    invoke-virtual {v3, v5, v7, v8, v9}, Landroid/widget/TextView;->setPadding(IIII)V

    const/4 v5, 0x2

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setMaxLines(I)V

    const/high16 v5, 0x42500000    # 52.0f

    invoke-virtual {v6, v5}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v5

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setHeight(I)V

    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-virtual {v15, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 129
    const-string v5, "episode"

    invoke-virtual {v13, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    const-string v8, "id"

    if-eqz v7, :cond_4

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\u770b\u5230\u7b2c "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v13, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " \u96c6 \u00b7 "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, "position"

    invoke-virtual {v13, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v16

    invoke-static/range {v16 .. v17}, Lcn/hongguo/tv/MainActivity;->time(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_3

    :cond_4
    invoke-virtual {v13, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    const-string v5, "\u5df2\u6536\u85cf"

    goto :goto_3

    :cond_5
    const-string v5, ""

    :goto_3
    const/16 v7, 0xc

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->muted()I

    move-result v9

    invoke-virtual {v6, v5, v7, v9}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/TextView;->setSingleLine()V

    invoke-virtual {v6, v4}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v9

    invoke-virtual {v6, v4}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v11

    invoke-virtual {v6, v4}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v14

    const/4 v4, 0x0

    invoke-virtual {v7, v9, v4, v11, v14}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_6

    invoke-virtual {v15, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 130
    :cond_6
    invoke-virtual {v15}, Landroid/widget/LinearLayout;->getOnFocusChangeListener()Landroid/view/View$OnFocusChangeListener;

    move-result-object v4

    new-instance v5, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda31;

    invoke-direct {v5, v6, v4, v12, v3}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda31;-><init>(Lcn/hongguo/tv/MainActivity;Landroid/view/View$OnFocusChangeListener;Lcn/hongguo/tv/MainActivity$PageUi;Landroid/widget/TextView;)V

    invoke-virtual {v15, v5}, Landroid/widget/LinearLayout;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 131
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v7, 0x0

    invoke-direct {v3, v7, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    const/high16 v4, 0x40400000    # 3.0f

    invoke-virtual {v6, v4}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v5

    const/high16 v7, 0x40a00000    # 5.0f

    invoke-virtual {v6, v7}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v7

    invoke-virtual {v6, v4}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v4

    const/high16 v9, 0x41000000    # 8.0f

    invoke-virtual {v6, v9}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v9

    invoke-virtual {v3, v5, v7, v4, v9}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v2, v15, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v10, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v13, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v4, v21

    invoke-virtual {v6, v3, v4}, Lcn/hongguo/tv/MainActivity;->loadCover(Ljava/lang/String;Landroid/widget/ImageView;)V

    .line 125
    :goto_4
    add-int/lit8 v3, v20, 0x1

    move-object/from16 v7, p1

    move-object/from16 v8, p3

    move/from16 v9, v18

    move/from16 v11, v19

    goto/16 :goto_1

    .line 133
    :cond_7
    move/from16 v18, v9

    move/from16 v19, v11

    const/4 v7, 0x1

    if-eqz v2, :cond_8

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v0

    rem-int v0, v0, v19

    :goto_5
    if-lez v0, :cond_8

    move/from16 v8, v19

    if-ge v0, v8, :cond_9

    new-instance v1, Landroid/view/View;

    invoke-direct {v1, v6}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v9, 0x0

    invoke-direct {v3, v9, v7, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v0, v0, 0x1

    move/from16 v19, v8

    goto :goto_5

    :cond_8
    move/from16 v8, v19

    :cond_9
    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v9, 0x0

    .line 134
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v0

    const/16 v1, 0x14

    if-le v0, v1, :cond_10

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v11

    new-instance v14, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda32;

    move-object v0, v14

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    const/high16 v9, 0x3f800000    # 1.0f

    const/4 v15, 0x0

    move/from16 v5, p4

    invoke-direct/range {v0 .. v5}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda32;-><init>(Lcn/hongguo/tv/MainActivity;Landroid/widget/LinearLayout;Lorg/json/JSONArray;Landroid/view/View;I)V

    const-string v0, "\u4e0a\u4e00\u9875"

    invoke-virtual {v6, v0, v14, v15}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v14

    new-instance v5, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda33;

    move-object v0, v5

    move-object v9, v5

    move/from16 v5, p4

    invoke-direct/range {v0 .. v5}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda33;-><init>(Lcn/hongguo/tv/MainActivity;Landroid/widget/LinearLayout;Lorg/json/JSONArray;Landroid/view/View;I)V

    const-string v0, "\u4e0b\u4e00\u9875"

    invoke-virtual {v6, v0, v9, v15}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v0

    if-lez p4, :cond_a

    const/4 v5, 0x1

    goto :goto_6

    :cond_a
    const/4 v5, 0x0

    :goto_6
    invoke-virtual {v14, v5}, Landroid/widget/Button;->setEnabled(Z)V

    const v5, 0x3eb33333    # 0.35f

    if-lez p4, :cond_b

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_7

    :cond_b
    const v1, 0x3eb33333    # 0.35f

    :goto_7
    invoke-virtual {v14, v1}, Landroid/widget/Button;->setAlpha(F)V

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v13, v1, :cond_c

    const/4 v1, 0x1

    goto :goto_8

    :cond_c
    const/4 v1, 0x0

    :goto_8
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-virtual {v0}, Landroid/widget/Button;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_d

    const/high16 v5, 0x3f800000    # 1.0f

    :cond_d
    invoke-virtual {v0, v5}, Landroid/widget/Button;->setAlpha(F)V

    invoke-virtual {v6, v11, v14}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v2, p4, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\u2014"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v2

    invoke-static {v2, v13}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " / "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->muted()I

    move-result v2

    const/16 v3, 0x11

    invoke-virtual {v6, v1, v3, v2}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v11, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v6, v11, v0}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    move-object/from16 v1, p1

    invoke-virtual {v1, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v14}, Landroid/widget/Button;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_e

    move-object v1, v14

    goto :goto_9

    :cond_e
    move-object v1, v0

    :goto_9
    invoke-virtual {v10}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_f

    move-object/from16 v2, p3

    goto :goto_a

    :cond_f
    invoke-virtual {v10, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    :goto_a
    const/4 v3, 0x2

    new-array v4, v3, [Landroid/widget/Button;

    aput-object v14, v4, v15

    aput-object v0, v4, v7

    const/4 v5, 0x0

    :goto_b
    if-ge v5, v3, :cond_11

    aget-object v0, v4, v5

    new-instance v7, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda34;

    invoke-direct {v7, v2}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda34;-><init>(Landroid/view/View;)V

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_b

    :cond_10
    const/4 v15, 0x0

    move-object/from16 v1, p3

    .line 135
    :cond_11
    move-object/from16 v4, p3

    invoke-virtual {v6, v4}, Lcn/hongguo/tv/MainActivity;->topTarget(Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v6, v10, v8, v0, v1}, Lcn/hongguo/tv/MainActivity;->wireGrid(Ljava/util/ArrayList;ILandroid/view/View;Landroid/view/View;)V

    invoke-virtual {v10}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_13

    if-eqz v12, :cond_12

    invoke-virtual {v10, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iput-object v0, v12, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    :cond_12
    iget-object v0, v6, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    iget-object v2, v0, Lcn/hongguo/tv/MainActivity$Screen;->view:Landroid/view/View;

    invoke-virtual {v10, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Landroid/view/View;

    new-instance v8, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda35;

    move-object v0, v8

    move-object/from16 v1, p0

    move/from16 v3, v18

    move-object/from16 v4, p3

    move-object v5, v10

    invoke-direct/range {v0 .. v5}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda35;-><init>(Lcn/hongguo/tv/MainActivity;Landroid/view/View;ZLandroid/view/View;Ljava/util/ArrayList;)V

    invoke-virtual {v7, v8}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    goto :goto_c

    :cond_13
    if-eqz v12, :cond_14

    iput-object v4, v12, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    .line 136
    :cond_14
    :goto_c
    return-void
.end method

.method renderEpisodePage(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Lorg/json/JSONArray;IIZ)V
    .locals 23

    .line 153
    move-object/from16 v8, p0

    move-object/from16 v9, p1

    move/from16 v10, p4

    move/from16 v11, p5

    move/from16 v12, p6

    invoke-virtual/range {p1 .. p1}, Landroid/widget/LinearLayout;->removeAllViews()V

    invoke-virtual/range {p3 .. p3}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0x12

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->muted()I

    move-result v1

    const-string v2, "\u6682\u65e0\u53ef\u64ad\u653e\u5267\u96c6"

    invoke-virtual {v8, v2, v0, v1}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v9, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void

    .line 154
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v13

    invoke-virtual/range {p3 .. p3}, Lorg/json/JSONArray;->length()I

    move-result v0

    const/4 v14, 0x1

    sub-int/2addr v0, v14

    div-int/lit8 v15, v0, 0x14

    .line 155
    new-instance v7, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda48;

    move-object v0, v7

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move-object v14, v7

    move/from16 v7, p6

    invoke-direct/range {v0 .. v7}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda48;-><init>(Lcn/hongguo/tv/MainActivity;Landroid/widget/LinearLayout;Lorg/json/JSONObject;Lorg/json/JSONArray;IIZ)V

    const-string v0, "\u4e0a\u4e00\u7ec4"

    invoke-virtual {v8, v0, v14, v12}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v14

    .line 156
    new-instance v7, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda49;

    move-object v0, v7

    move-object v11, v7

    move/from16 v7, p6

    invoke-direct/range {v0 .. v7}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda49;-><init>(Lcn/hongguo/tv/MainActivity;Landroid/widget/LinearLayout;Lorg/json/JSONObject;Lorg/json/JSONArray;IIZ)V

    const-string v0, "\u4e0b\u4e00\u7ec4"

    invoke-virtual {v8, v0, v11, v12}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v6

    .line 157
    const/4 v7, 0x2

    new-array v0, v7, [Landroid/widget/Button;

    const/4 v11, 0x0

    aput-object v14, v0, v11

    const/4 v1, 0x1

    aput-object v6, v0, v1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v7, :cond_1

    aget-object v2, v0, v1

    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setTextSize(F)V

    const/high16 v3, 0x41000000    # 8.0f

    invoke-virtual {v8, v3}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v4

    invoke-virtual {v8, v3}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v3

    invoke-virtual {v2, v4, v11, v3, v11}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-virtual {v2, v11}, Landroid/widget/Button;->setMinWidth(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 158
    :cond_1
    if-lez v10, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    :goto_1
    invoke-virtual {v14, v0}, Landroid/widget/Button;->setEnabled(Z)V

    if-ge v10, v15, :cond_3

    const/4 v0, 0x1

    goto :goto_2

    :cond_3
    const/4 v0, 0x0

    :goto_2
    invoke-virtual {v6, v0}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-virtual {v14}, Landroid/widget/Button;->isEnabled()Z

    move-result v0

    const v1, 0x3eb33333    # 0.35f

    const/high16 v15, 0x3f800000    # 1.0f

    if-eqz v0, :cond_4

    const/high16 v0, 0x3f800000    # 1.0f

    goto :goto_3

    :cond_4
    const v0, 0x3eb33333    # 0.35f

    :goto_3
    invoke-virtual {v14, v0}, Landroid/widget/Button;->setAlpha(F)V

    invoke-virtual {v6}, Landroid/widget/Button;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_5

    const/high16 v1, 0x3f800000    # 1.0f

    :cond_5
    invoke-virtual {v6, v1}, Landroid/widget/Button;->setAlpha(F)V

    .line 159
    invoke-virtual {v8, v13, v14}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    mul-int/lit8 v10, v10, 0x14

    add-int/lit8 v1, v10, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\u2014"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual/range {p3 .. p3}, Lorg/json/JSONArray;->length()I

    move-result v1

    add-int/lit8 v5, v10, 0x14

    invoke-static {v1, v5}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " / "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual/range {p3 .. p3}, Lorg/json/JSONArray;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v16, -0x1

    if-eqz v12, :cond_6

    const/4 v1, -0x1

    goto :goto_4

    :cond_6
    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->ink()I

    move-result v1

    :goto_4
    const/16 v2, 0xf

    invoke-virtual {v8, v0, v2, v1}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v0

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v11, v2, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v13, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v8, v13, v6}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    invoke-virtual {v9, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 160
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 161
    const/16 v17, 0x0

    move v0, v10

    move-object/from16 v1, v17

    :goto_5
    invoke-virtual/range {p3 .. p3}, Lorg/json/JSONArray;->length()I

    move-result v2

    invoke-static {v2, v5}, Ljava/lang/Math;->min(II)I

    move-result v2

    if-ge v0, v2, :cond_e

    .line 162
    rem-int/lit8 v2, v0, 0x5

    if-nez v2, :cond_7

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v9, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_7
    move-object v3, v1

    add-int/lit8 v2, v0, 0x1

    .line 163
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v18, ""

    move/from16 v1, p5

    if-ne v2, v1, :cond_8

    const-string v19, " \u25b8"

    move-object/from16 v4, v19

    goto :goto_6

    :cond_8
    move-object/from16 v4, v18

    :goto_6
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda50;

    move-object/from16 v19, v0

    move v7, v1

    move-object/from16 v1, p0

    move/from16 v20, v2

    move/from16 v2, p6

    move-object/from16 v21, v3

    move/from16 v3, v20

    move-object v15, v4

    move-object/from16 v4, p2

    move/from16 v22, v5

    move-object/from16 v5, p3

    invoke-direct/range {v0 .. v5}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda50;-><init>(Lcn/hongguo/tv/MainActivity;ZILorg/json/JSONObject;Lorg/json/JSONArray;)V

    invoke-virtual {v8, v15, v0, v12}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v0

    .line 164
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u7b2c "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move/from16 v2, v20

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " \u96c6"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-ne v2, v7, :cond_a

    if-eqz v12, :cond_9

    const-string v18, "\uff0c\u6b63\u5728\u64ad\u653e"

    goto :goto_7

    :cond_9
    const-string v18, "\uff0c\u4e0a\u6b21\u89c2\u770b"

    :cond_a
    :goto_7
    move-object/from16 v3, v18

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    if-ne v2, v7, :cond_b

    const/4 v1, 0x1

    goto :goto_8

    :cond_b
    const/4 v1, 0x0

    :goto_8
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setSelected(Z)V

    if-ne v2, v7, :cond_c

    sget v1, Lcn/hongguo/tv/MainActivity;->PINK:I

    goto :goto_9

    :cond_c
    if-eqz v12, :cond_d

    const/4 v1, -0x1

    goto :goto_9

    :cond_d
    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->ink()I

    move-result v1

    :goto_9
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    const/high16 v1, 0x41900000    # 18.0f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    const/high16 v1, 0x40800000    # 4.0f

    invoke-virtual {v8, v1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v3

    invoke-virtual {v8, v1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v4

    invoke-virtual {v0, v3, v11, v4, v11}, Landroid/widget/Button;->setPadding(IIII)V

    .line 165
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x42500000    # 52.0f

    invoke-virtual {v8, v4}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v4

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v3, v11, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    const/high16 v4, 0x40400000    # 3.0f

    invoke-virtual {v8, v4}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v5

    invoke-virtual {v8, v1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v15

    invoke-virtual {v8, v4}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v4

    invoke-virtual {v8, v1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v1

    invoke-virtual {v3, v5, v15, v4, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    move-object/from16 v1, v21

    invoke-virtual {v1, v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v13, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 161
    move v0, v2

    move/from16 v5, v22

    const/4 v7, 0x2

    const/high16 v15, 0x3f800000    # 1.0f

    goto/16 :goto_5

    .line 167
    :cond_e
    move/from16 v7, p5

    const/high16 v4, 0x40400000    # 3.0f

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x5

    rem-int/2addr v0, v2

    :goto_a
    if-lez v0, :cond_f

    if-ge v0, v2, :cond_f

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v9, 0x1

    invoke-direct {v3, v11, v9, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v8, v4}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v9

    invoke-virtual {v8, v4}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v15

    invoke-virtual {v3, v9, v11, v15, v11}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    new-instance v9, Landroid/view/View;

    invoke-direct {v9, v8}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v9, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 168
    :cond_f
    if-le v7, v10, :cond_10

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/2addr v0, v10

    if-gt v7, v0, :cond_10

    const/4 v0, 0x1

    add-int/lit8 v1, v7, -0x1

    sub-int/2addr v1, v10

    goto :goto_b

    :cond_10
    const/4 v1, 0x0

    :goto_b
    invoke-virtual {v13, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 169
    invoke-virtual {v14}, Landroid/widget/Button;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_11

    move-object v1, v14

    goto :goto_c

    :cond_11
    invoke-virtual {v6}, Landroid/widget/Button;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_12

    move-object v1, v6

    goto :goto_c

    :cond_12
    if-eqz v12, :cond_13

    move-object/from16 v1, v17

    goto :goto_c

    :cond_13
    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->currentUi()Lcn/hongguo/tv/MainActivity$PageUi;

    move-result-object v1

    iget-object v1, v1, Lcn/hongguo/tv/MainActivity$PageUi;->top:Landroid/view/View;

    .line 170
    :goto_c
    invoke-virtual {v8, v13, v2, v1}, Lcn/hongguo/tv/MainActivity;->wireGrid(Ljava/util/ArrayList;ILandroid/view/View;)V

    .line 171
    const/4 v1, 0x2

    new-array v2, v1, [Landroid/widget/Button;

    aput-object v14, v2, v11

    const/4 v3, 0x1

    aput-object v6, v2, v3

    :goto_d
    if-ge v11, v1, :cond_14

    aget-object v3, v2, v11

    new-instance v4, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda51;

    invoke-direct {v4, v0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda51;-><init>(Landroid/view/View;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    add-int/lit8 v11, v11, 0x1

    goto :goto_d

    .line 172
    :cond_14
    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->currentUi()Lcn/hongguo/tv/MainActivity$PageUi;

    move-result-object v1

    if-eqz v1, :cond_15

    iput-object v0, v1, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    :cond_15
    invoke-virtual {v0}, Landroid/view/View;->requestFocusFromTouch()Z

    .line 173
    return-void
.end method

.method request(Ljava/lang/String;Landroid/widget/TextView;Lcn/hongguo/tv/MainActivity$Done;)V
    .locals 9

    .line 74
    iget v2, p0, Lcn/hongguo/tv/MainActivity;->generation:I

    iget-object v3, p0, Lcn/hongguo/tv/MainActivity;->api:Lcn/hongguo/tv/Api;

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lcn/hongguo/tv/Api;->ready()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v7, p0, Lcn/hongguo/tv/MainActivity;->io:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v8, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda92;

    move-object v0, v8

    move-object v1, p0

    move-object v4, p1

    move-object v5, p3

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda92;-><init>(Lcn/hongguo/tv/MainActivity;ILcn/hongguo/tv/Api;Ljava/lang/String;Lcn/hongguo/tv/MainActivity$Done;Landroid/widget/TextView;)V

    invoke-virtual {v7, v8}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    return-void

    :cond_1
    :goto_0
    const-string p1, "\u8bf7\u5148\u5728\u8bbe\u7f6e\u4e2d\u8fde\u63a5\u64ad\u653e\u670d\u52a1"

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method restore()V
    .locals 5

    .line 71
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->hideKeyboard()V

    iget v0, p0, Lcn/hongguo/tv/MainActivity;->generation:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcn/hongguo/tv/MainActivity;->generation:I

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->coverIo:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->getQueue()Ljava/util/concurrent/BlockingQueue;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->clear()V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->io:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->getQueue()Ljava/util/concurrent/BlockingQueue;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->clear()V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->back:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->currentUi()Lcn/hongguo/tv/MainActivity$PageUi;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object v1

    iget-object v2, v0, Lcn/hongguo/tv/MainActivity$PageUi;->activeRail:Landroid/view/View;

    if-eq v1, v2, :cond_0

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity$PageUi;->activeRail:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestFocusFromTouch()Z

    return-void

    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity$Screen;->name:Ljava/lang/String;

    const-string v1, "\u9996\u9875"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0, v1}, Lcn/hongguo/tv/MainActivity;->chooseSection(Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->finish()V

    return-void

    :cond_2
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->back:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcn/hongguo/tv/MainActivity$Screen;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->host:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->removeAllViews()V

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->host:Landroid/widget/FrameLayout;

    iget-object v2, v0, Lcn/hongguo/tv/MainActivity$Screen;->view:Landroid/view/View;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iput-object v0, p0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->updates:Lcn/hongguo/tv/TvUpdater;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->updates:Lcn/hongguo/tv/TvUpdater;

    invoke-virtual {v1}, Lcn/hongguo/tv/TvUpdater;->resume()V

    :cond_3
    iget-object v1, v0, Lcn/hongguo/tv/MainActivity$Screen;->view:Landroid/view/View;

    invoke-virtual {p0, v1}, Lcn/hongguo/tv/MainActivity;->reloadVisibleCovers(Landroid/view/View;)V

    iget-object v1, v0, Lcn/hongguo/tv/MainActivity$Screen;->onRestore:Ljava/lang/Runnable;

    if-eqz v1, :cond_4

    iget-object v1, v0, Lcn/hongguo/tv/MainActivity$Screen;->onRestore:Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    :cond_4
    iget-object v1, v0, Lcn/hongguo/tv/MainActivity$Screen;->focus:Landroid/view/View;

    if-eqz v1, :cond_5

    new-instance v2, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, v0, v1}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda0;-><init>(Lcn/hongguo/tv/MainActivity;Lcn/hongguo/tv/MainActivity$Screen;Landroid/view/View;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_5
    return-void
.end method

.method resumePausedPlayer()V
    .locals 5

    .line 266
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_5

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-nez v0, :cond_0

    goto/16 :goto_0

    .line 267
    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->pauseButton:Landroid/widget/Button;

    const-string v1, "\u6682\u505c"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->stallTimeout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 268
    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->activityVisible:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->stallTimeout:Ljava/lang/Runnable;

    const-wide/16 v2, 0x61a8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 269
    :cond_1
    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->resuming:Z

    if-eqz v0, :cond_2

    return-void

    .line 272
    :cond_2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_4

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->buffering:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->stallTimeout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_3
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->scheduleHide()V

    return-void

    .line 273
    :cond_4
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v1

    int-to-long v1, v1

    iput-wide v1, p0, Lcn/hongguo/tv/MainActivity;->pendingSeek:J

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcn/hongguo/tv/MainActivity;->resuming:Z

    .line 274
    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->status:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcn/hongguo/tv/MainActivity;->current:Lorg/json/JSONObject;

    const-string v4, "title"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " \u00b7 \u7b2c "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " \u96c6 \u00b7 \u6b63\u5728\u6062\u590d\u2026"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 275
    new-instance v1, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda81;

    invoke-direct {v1, p0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda81;-><init>(Lcn/hongguo/tv/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnSeekCompleteListener(Landroid/media/MediaPlayer$OnSeekCompleteListener;)V

    .line 281
    iget-wide v0, p0, Lcn/hongguo/tv/MainActivity;->pendingSeek:J

    invoke-virtual {p0, v0, v1}, Lcn/hongguo/tv/MainActivity;->seekToPosition(J)V

    .line 282
    return-void

    .line 266
    :cond_5
    :goto_0
    return-void
.end method

.method resumeSeries(Lorg/json/JSONObject;Lorg/json/JSONArray;)V
    .locals 9

    .line 150
    const-string v0, "history"

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->bucket(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const-string v2, "episode"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v2

    :goto_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v3

    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v6

    const-wide/16 v1, 0x0

    if-nez v0, :cond_1

    move-wide v7, v1

    goto :goto_1

    :cond_1
    const-string v3, "position"

    invoke-virtual {v0, v3, v1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v0

    move-wide v7, v0

    :goto_1
    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    invoke-virtual/range {v3 .. v8}, Lcn/hongguo/tv/MainActivity;->startPlayer(Lorg/json/JSONObject;Lorg/json/JSONArray;IJ)V

    return-void
.end method

.method row()Landroid/widget/LinearLayout;
    .locals 2

    .line 65
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    return-object v0
.end method

.method sampleRecommendation(II)V
    .locals 16

    .line 192
    move-object/from16 v0, p0

    iget-object v1, v0, Lcn/hongguo/tv/MainActivity;->current:Lorg/json/JSONObject;

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    iget-object v2, v0, Lcn/hongguo/tv/MainActivity;->recommendations:Lcn/hongguo/tv/Recommendations;

    iget-object v3, v0, Lcn/hongguo/tv/MainActivity;->current:Lorg/json/JSONObject;

    iget v4, v0, Lcn/hongguo/tv/MainActivity;->episode:I

    iget-object v1, v0, Lcn/hongguo/tv/MainActivity;->episodes:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v5

    move/from16 v1, p1

    int-to-long v6, v1

    move/from16 v1, p2

    int-to-long v8, v1

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->learnRecommendations()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-boolean v1, v0, Lcn/hongguo/tv/MainActivity;->activityVisible:Z

    if-eqz v1, :cond_1

    iget-boolean v1, v0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-eqz v1, :cond_1

    iget-boolean v1, v0, Lcn/hongguo/tv/MainActivity;->resuming:Z

    if-nez v1, :cond_1

    iget-boolean v1, v0, Lcn/hongguo/tv/MainActivity;->buffering:Z

    if-nez v1, :cond_1

    iget-object v1, v0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    const/4 v12, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    const/4 v12, 0x0

    :goto_0
    iget-boolean v1, v0, Lcn/hongguo/tv/MainActivity;->temporarySpeed:Z

    if-eqz v1, :cond_2

    const/high16 v1, 0x40000000    # 2.0f

    const/high16 v13, 0x40000000    # 2.0f

    goto :goto_1

    :cond_2
    iget v1, v0, Lcn/hongguo/tv/MainActivity;->speed:F

    move v13, v1

    :goto_1
    move-wide/from16 p1, v14

    invoke-virtual/range {v2 .. v15}, Lcn/hongguo/tv/Recommendations;->sample(Lorg/json/JSONObject;IIJJJZFJ)V

    iget-wide v1, v0, Lcn/hongguo/tv/MainActivity;->recommendationSaveAt:J

    move-wide/from16 v3, p1

    sub-long v14, v3, v1

    const-wide/16 v1, 0x3a98

    cmp-long v5, v14, v1

    if-ltz v5, :cond_3

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->persistRecommendations()V

    iput-wide v3, v0, Lcn/hongguo/tv/MainActivity;->recommendationSaveAt:J

    :cond_3
    return-void
.end method

.method saveProgress()V
    .locals 1

    .line 316
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->saveProgress(Z)V

    return-void
.end method

.method saveProgress(Z)V
    .locals 11

    .line 317
    const-string v0, "history"

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v2, "record_history"

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->current:Lorg/json/JSONObject;

    if-eqz v1, :cond_5

    iget-boolean v1, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_5

    iget-boolean v1, p0, Lcn/hongguo/tv/MainActivity;->resuming:Z

    if-eqz v1, :cond_0

    goto/16 :goto_3

    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    if-nez p1, :cond_1

    iget-wide v4, p0, Lcn/hongguo/tv/MainActivity;->lastProgressWrite:J

    sub-long v4, v1, v4

    const-wide/16 v6, 0x1388

    cmp-long v8, v4, v6

    if-gez v8, :cond_1

    return-void

    :cond_1
    :try_start_0
    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->bucket(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    new-instance v5, Lorg/json/JSONObject;

    iget-object v6, p0, Lcn/hongguo/tv/MainActivity;->current:Lorg/json/JSONObject;

    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iget-boolean v6, p0, Lcn/hongguo/tv/MainActivity;->ended:Z

    const/4 v7, 0x0

    if-eqz v6, :cond_2

    const/4 v6, 0x0

    goto :goto_0

    :cond_2
    iget-object v6, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v6}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v6

    :goto_0
    const-string v8, "episode"

    iget-boolean v9, p0, Lcn/hongguo/tv/MainActivity;->ended:Z

    if-eqz v9, :cond_3

    iget-object v9, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v10, "repeat_one"

    invoke-interface {v9, v10, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    if-nez v7, :cond_3

    iget v7, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    iget-object v9, p0, Lcn/hongguo/tv/MainActivity;->episodes:Lorg/json/JSONArray;

    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v7, v9, :cond_3

    iget v7, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    add-int/2addr v7, v3

    goto :goto_1

    :cond_3
    iget v7, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    :goto_1
    invoke-virtual {v5, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v3, "position"

    invoke-virtual {v5, v3, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v3, "updated"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v5, v3, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v3, "id"

    invoke-virtual {v5, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v3, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v0, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    if-eqz p1, :cond_4

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_2

    :cond_4
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :goto_2
    iput-wide v1, p0, Lcn/hongguo/tv/MainActivity;->lastProgressWrite:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception p1

    :cond_5
    :goto_3
    return-void
.end method

.method scaleMode()I
    .locals 3

    .line 177
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "scale_mode"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x2

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method scheduleHide()V
    .locals 6

    .line 289
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->hideChrome:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->buffering:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->playerOverlay()Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    iget v0, p0, Lcn/hongguo/tv/MainActivity;->seekPreview:I

    if-gez v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->hideChrome:Ljava/lang/Runnable;

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v3, "controls_seconds"

    const/4 v4, 0x5

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    int-to-long v2, v2

    const-wide/16 v4, 0x3e8

    mul-long v2, v2, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method

.method search()V
    .locals 16

    .line 142
    move-object/from16 v0, p0

    iget-object v1, v0, Lcn/hongguo/tv/MainActivity;->catalogMode:Ljava/lang/String;

    const-string v2, "ai"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "\u641c\u7d22AI\u5267"

    goto :goto_0

    :cond_0
    const-string v1, "\u641c\u7d22\u77ed\u5267\u6216\u6f14\u5458"

    :goto_0
    invoke-virtual {v0, v1}, Lcn/hongguo/tv/MainActivity;->shell(Ljava/lang/String;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->column()Landroid/widget/LinearLayout;

    move-result-object v3

    new-instance v4, Landroid/widget/ScrollView;

    invoke-direct {v4, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/ScrollView;->setFocusable(Z)V

    invoke-virtual {v4, v3}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v1}, Lcn/hongguo/tv/MainActivity;->body(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v6

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x1

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v7, v8, v5, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v6, v4, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Landroid/widget/EditText;

    invoke-direct {v4, v0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4}, Landroid/widget/EditText;->setSingleLine()V

    iget-object v6, v0, Lcn/hongguo/tv/MainActivity;->catalogMode:Ljava/lang/String;

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    const-string v6, "\u641c\u7d22\u5f53\u524d\u70ed\u95e8 AI \u7247\u5355\u4e2d\u7684\u7247\u540d\u6216\u9898\u6750"

    goto :goto_1

    :cond_1
    const-string v6, "\u8f93\u5165\u7247\u540d\u6216\u6f14\u5458"

    :goto_1
    invoke-virtual {v4, v6}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    const/high16 v6, 0x41a80000    # 21.0f

    invoke-virtual {v4, v6}, Landroid/widget/EditText;->setTextSize(F)V

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->ink()I

    move-result v6

    invoke-virtual {v4, v6}, Landroid/widget/EditText;->setTextColor(I)V

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->muted()I

    move-result v6

    invoke-virtual {v4, v6}, Landroid/widget/EditText;->setHintTextColor(I)V

    const/high16 v6, 0x41800000    # 16.0f

    invoke-virtual {v0, v6}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v7

    const/high16 v10, 0x41200000    # 10.0f

    invoke-virtual {v0, v10}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v11

    invoke-virtual {v0, v6}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v6

    invoke-virtual {v0, v10}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v10

    invoke-virtual {v4, v7, v11, v6, v10}, Landroid/widget/EditText;->setPadding(IIII)V

    const v6, -0x90808

    sget v7, Lcn/hongguo/tv/MainActivity;->PINK:I

    invoke-virtual {v0, v6, v7}, Lcn/hongguo/tv/MainActivity;->bg(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x42680000    # 58.0f

    invoke-virtual {v0, v7}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v7

    invoke-direct {v6, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v7, 0x41000000    # 8.0f

    invoke-virtual {v0, v7}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v8

    const/high16 v10, 0x41a00000    # 20.0f

    invoke-virtual {v0, v10}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v10

    invoke-virtual {v0, v7}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v7

    const/high16 v11, 0x41b00000    # 22.0f

    invoke-virtual {v0, v11}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v11

    invoke-virtual {v6, v8, v10, v7, v11}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v3, v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v6

    new-instance v7, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda3;

    invoke-direct {v7, v0, v4}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda3;-><init>(Lcn/hongguo/tv/MainActivity;Landroid/widget/EditText;)V

    const-string v8, "\u641c\u7d22"

    invoke-virtual {v0, v8, v7, v5}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v7

    invoke-virtual {v0, v6, v7}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const/16 v6, 0x13

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->ink()I

    move-result v10

    const-string v11, "\u8bd5\u8bd5\u8fd9\u4e9b\u9898\u6750"

    invoke-virtual {v0, v11, v6, v10}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v6

    iget-object v10, v0, Lcn/hongguo/tv/MainActivity;->catalogMode:Ljava/lang/String;

    invoke-virtual {v10, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v10, 0x4

    const/4 v11, 0x2

    const/4 v12, 0x3

    const/4 v13, 0x1

    if-eqz v2, :cond_2

    new-array v2, v10, [Ljava/lang/String;

    const-string v10, "\u8111\u6d1e"

    aput-object v10, v2, v5

    const-string v10, "\u7384\u5e7b"

    aput-object v10, v2, v13

    const-string v10, "\u5267\u60c5"

    aput-object v10, v2, v11

    const-string v10, "\u79d1\u5e7b"

    aput-object v10, v2, v12

    goto :goto_2

    :cond_2
    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/String;

    const-string v14, "\u91cd\u751f"

    aput-object v14, v2, v5

    const-string v14, "\u4e07\u5996"

    aput-object v14, v2, v13

    const-string v14, "\u751c\u5ba0"

    aput-object v14, v2, v11

    const-string v11, "\u53e4\u88c5"

    aput-object v11, v2, v12

    const-string v11, "\u9006\u88ad"

    aput-object v11, v2, v10

    :goto_2
    array-length v10, v2

    const/4 v11, 0x0

    :goto_3
    if-ge v11, v10, :cond_3

    aget-object v12, v2, v11

    new-instance v14, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda4;

    invoke-direct {v14, v0, v12}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda4;-><init>(Lcn/hongguo/tv/MainActivity;Ljava/lang/String;)V

    invoke-virtual {v0, v12, v14, v5}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v12

    invoke-virtual {v0, v6, v12}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    add-int/lit8 v11, v11, 0x1

    goto :goto_3

    :cond_3
    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->searchHistory()Lorg/json/JSONArray;

    move-result-object v2

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lez v6, :cond_6

    const/16 v6, 0x11

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->ink()I

    move-result v10

    const-string v11, "\u6700\u8fd1\u641c\u7d22"

    invoke-virtual {v0, v11, v6, v10}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->column()Landroid/widget/LinearLayout;

    move-result-object v6

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_4
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-ge v11, v12, :cond_5

    rem-int/lit8 v12, v11, 0x3

    if-nez v12, :cond_4

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v10

    invoke-virtual {v6, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_4
    invoke-virtual {v2, v11}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v12

    new-instance v14, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda5;

    invoke-direct {v14, v0, v12}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda5;-><init>(Lcn/hongguo/tv/MainActivity;Ljava/lang/String;)V

    invoke-virtual {v0, v12, v14, v5}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v12

    const/high16 v14, 0x41600000    # 14.0f

    invoke-virtual {v12, v14}, Landroid/widget/Button;->setTextSize(F)V

    invoke-virtual {v12}, Landroid/widget/Button;->setSingleLine()V

    sget-object v14, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v12, v14}, Landroid/widget/Button;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    new-instance v14, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v15, 0x42280000    # 42.0f

    invoke-virtual {v0, v15}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v15

    invoke-direct {v14, v5, v15, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    const/high16 v15, 0x40800000    # 4.0f

    invoke-virtual {v0, v15}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v5

    const/high16 v9, 0x40400000    # 3.0f

    invoke-virtual {v0, v9}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v13

    invoke-virtual {v0, v15}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v15

    invoke-virtual {v0, v9}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v9

    invoke-virtual {v14, v5, v13, v15, v9}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v10, v12, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v11, v11, 0x1

    const/4 v5, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    const/4 v13, 0x1

    goto :goto_4

    :cond_5
    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_6
    invoke-virtual {v0, v1}, Lcn/hongguo/tv/MainActivity;->pageUi(Landroid/view/View;)Lcn/hongguo/tv/MainActivity$PageUi;

    move-result-object v2

    iput-object v4, v2, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v8, v4, v2}, Lcn/hongguo/tv/MainActivity;->show(Landroid/view/View;Ljava/lang/String;Landroid/view/View;Z)V

    new-instance v1, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda6;

    invoke-direct {v1, v7}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda6;-><init>(Landroid/widget/Button;)V

    invoke-virtual {v4, v1}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    return-void
.end method

.method searchFor(Ljava/lang/String;)V
    .locals 1

    .line 186
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->rememberSearch(Ljava/lang/String;)V

    const-string v0, "\u641c\u7d22\u7ed3\u679c"

    invoke-virtual {p0, v0, p1}, Lcn/hongguo/tv/MainActivity;->home(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method searchHistory()Lorg/json/JSONArray;
    .locals 4

    .line 184
    :try_start_0
    new-instance v0, Lorg/json/JSONArray;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v2, "search_history"

    const-string v3, "[]"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    return-object v0
.end method

.method seekBy(I)V
    .locals 2

    .line 262
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v0

    add-int/lit16 v0, v0, -0x1f4

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v1

    add-int/2addr v1, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Lcn/hongguo/tv/MainActivity;->seekToPosition(J)V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->showControls()V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->scheduleHide()V

    :cond_0
    return-void
.end method

.method seekSeconds()I
    .locals 3

    .line 178
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "seek_seconds"

    const/16 v2, 0xa

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    const/16 v1, 0x1e

    if-ne v0, v1, :cond_1

    :cond_0
    move v2, v0

    :cond_1
    return v2
.end method

.method seekToPosition(J)V
    .locals 2

    .line 148
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->recommendations:Lcn/hongguo/tv/Recommendations;

    invoke-virtual {v0}, Lcn/hongguo/tv/Recommendations;->resetSample()V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-static {v0, p1, p2}, Lcn/hongguo/tv/MainActivity$Modern26;->seek(Landroid/media/MediaPlayer;J)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    long-to-int p2, p1

    invoke-virtual {v0, p2}, Landroid/media/MediaPlayer;->seekTo(I)V

    :goto_0
    return-void
.end method

.method selectedStyle(Landroid/widget/Button;Z)V
    .locals 1

    .line 84
    invoke-virtual {p1, p2}, Landroid/widget/Button;->setSelected(Z)V

    if-eqz p2, :cond_0

    sget v0, Lcn/hongguo/tv/MainActivity;->PINK:I

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->ink()I

    move-result v0

    :goto_0
    invoke-virtual {p1, v0}, Landroid/widget/Button;->setTextColor(I)V

    new-instance v0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda47;

    invoke-direct {v0, p0, p2}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda47;-><init>(Lcn/hongguo/tv/MainActivity;Z)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    invoke-virtual {p1}, Landroid/widget/Button;->getOnFocusChangeListener()Landroid/view/View$OnFocusChangeListener;

    move-result-object p2

    invoke-virtual {p1}, Landroid/widget/Button;->hasFocus()Z

    move-result v0

    invoke-interface {p2, p1, v0}, Landroid/view/View$OnFocusChangeListener;->onFocusChange(Landroid/view/View;Z)V

    return-void
.end method

.method setDarkTheme(Z)V
    .locals 2

    .line 17
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "dark_theme"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->host:Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->pageColor()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->back:Ljava/util/ArrayDeque;

    invoke-virtual {p1}, Ljava/util/ArrayDeque;->clear()V

    new-instance p1, Lcn/hongguo/tv/TvSettings;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcn/hongguo/tv/TvSettings;-><init>(Lcn/hongguo/tv/MainActivity;Z)V

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcn/hongguo/tv/TvSettings;->page(I)V

    return-void
.end method

.method setSleepMinutes(I)V
    .locals 6

    .line 180
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->sleepStop:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const-wide/32 v0, 0xea60

    if-gtz p1, :cond_0

    const-wide/16 v2, 0x0

    goto :goto_0

    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    int-to-long v4, p1

    mul-long v4, v4, v0

    add-long/2addr v2, v4

    :goto_0
    iput-wide v2, p0, Lcn/hongguo/tv/MainActivity;->sleepDeadline:J

    if-lez p1, :cond_1

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v3, p0, Lcn/hongguo/tv/MainActivity;->sleepStop:Ljava/lang/Runnable;

    int-to-long v4, p1

    mul-long v4, v4, v0

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1
    return-void
.end method

.method settings()V
    .locals 7

    .line 175
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->api:Lcn/hongguo/tv/Api;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->api:Lcn/hongguo/tv/Api;

    invoke-virtual {v0}, Lcn/hongguo/tv/Api;->independent()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->standaloneSettings()V

    return-void

    :cond_0
    const-string v0, "\u64ad\u653e\u670d\u52a1"

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->shell(Ljava/lang/String;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->body(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v1

    const/16 v2, 0x12

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->muted()I

    move-result v3

    const-string v4, "\u76ee\u5f55\u53ef\u76f4\u63a5\u6d4f\u89c8\uff1b\u64ad\u653e\u4ecd\u9700\u7535\u8111\u4f34\u968f\u670d\u52a1\u3002USB \u6d4b\u8bd5\u53ef\u4f7f\u7528 ADB \u7aef\u53e3\u8f6c\u53d1\u3002"

    invoke-virtual {p0, v4, v2, v3}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/widget/EditText;

    invoke-direct {v1, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->ink()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setTextColor(I)V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->muted()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHintTextColor(I)V

    invoke-virtual {v1}, Landroid/widget/EditText;->setSingleLine()V

    const/16 v2, 0x11

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setInputType(I)V

    iget-object v3, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v4, "base"

    const-string v5, "http://127.0.0.1:8768"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->body(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v3, Landroid/widget/EditText;

    invoke-direct {v3, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->ink()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setTextColor(I)V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->muted()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setHintTextColor(I)V

    invoke-virtual {v3}, Landroid/widget/EditText;->setSingleLine()V

    const-string v4, "\u8f93\u5165\u4f34\u968f\u670d\u52a1\u663e\u793a\u7684\u914d\u5bf9\u7801"

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    const/16 v4, 0x81

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setInputType(I)V

    iget-object v4, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v5, "token"

    const-string v6, ""

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->body(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->muted()I

    move-result v4

    invoke-virtual {p0, v6, v2, v4}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->body(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v4, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda82;

    invoke-direct {v4, p0, v1, v3, v2}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda82;-><init>(Lcn/hongguo/tv/MainActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/TextView;)V

    const-string v1, "\u4fdd\u5b58\u5e76\u68c0\u67e5\u8fde\u63a5"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v4, v2}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->body(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u81ea\u52a8\u8fde\u64ad\uff1a"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v5, "autoplay"

    const/4 v6, 0x1

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_1

    const-string v4, "\u5f00"

    goto :goto_0

    :cond_1
    const-string v4, "\u5173"

    :goto_0
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda83;

    invoke-direct {v4}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda83;-><init>()V

    invoke-virtual {p0, v3, v4, v2}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v2

    new-instance v3, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda84;

    invoke-direct {v3, p0, v2}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda84;-><init>(Lcn/hongguo/tv/MainActivity;Landroid/widget/Button;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->body(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/MainActivity;->body(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v2

    const/16 v3, 0xf

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->muted()I

    move-result v4

    const-string v5, "\u7248\u672c 0.1.0 \u00b7 \u975e\u5b98\u65b9\u4e2a\u4eba\u6d4b\u8bd5\u7248\u672c"

    invoke-virtual {p0, v5, v3, v4}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v2, "\u8bbe\u7f6e"

    invoke-virtual {p0, v0, v2, v1, v6}, Lcn/hongguo/tv/MainActivity;->show(Landroid/view/View;Ljava/lang/String;Landroid/view/View;Z)V

    return-void
.end method

.method shell(Ljava/lang/String;)Landroid/widget/LinearLayout;
    .locals 16

    .line 86
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v2

    const/16 v3, 0x30

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    new-instance v3, Lcn/hongguo/tv/MainActivity$PageUi;

    invoke-direct {v3}, Lcn/hongguo/tv/MainActivity$PageUi;-><init>()V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 87
    const-string v4, "\u6536\u85cf"

    invoke-virtual {v1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    const-string v6, "\u9996\u9875"

    const-string v7, "\u5206\u7c7b"

    const-string v8, "\u5386\u53f2"

    const-string v9, "\u8bbe\u7f6e"

    if-eqz v5, :cond_0

    move-object v5, v4

    goto :goto_2

    :cond_0
    invoke-virtual {v1, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    move-object v5, v8

    goto :goto_2

    :cond_1
    const-string v5, "\u9898\u6750"

    invoke-virtual {v1, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_5

    invoke-virtual {v1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {v1, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_4

    const-string v5, "\u5e94\u7528\u66f4\u65b0"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    const-string v5, "\u72ec\u7acb\u64ad\u653e"

    invoke-virtual {v1, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_4

    const-string v5, "\u64ad\u653e\u670d\u52a1"

    invoke-virtual {v1, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_3

    goto :goto_0

    :cond_3
    move-object v5, v6

    goto :goto_2

    :cond_4
    :goto_0
    move-object v5, v9

    goto :goto_2

    :cond_5
    :goto_1
    move-object v5, v7

    :goto_2
    iput-object v5, v3, Lcn/hongguo/tv/MainActivity$PageUi;->section:Ljava/lang/String;

    .line 88
    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->column()Landroid/widget/LinearLayout;

    move-result-object v5

    iput-object v5, v3, Lcn/hongguo/tv/MainActivity$PageUi;->rail:Landroid/widget/LinearLayout;

    iget-object v5, v3, Lcn/hongguo/tv/MainActivity$PageUi;->rail:Landroid/widget/LinearLayout;

    const/high16 v10, 0x41200000    # 10.0f

    invoke-virtual {v0, v10}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v11

    const/high16 v12, 0x41900000    # 18.0f

    invoke-virtual {v0, v12}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v13

    invoke-virtual {v0, v10}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v14

    const/high16 v15, 0x41600000    # 14.0f

    invoke-virtual {v0, v15}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v10

    invoke-virtual {v5, v11, v13, v14, v10}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v5, v3, Lcn/hongguo/tv/MainActivity$PageUi;->rail:Landroid/widget/LinearLayout;

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->darkTheme()Z

    move-result v10

    if-eqz v10, :cond_6

    const v10, -0xe4e2dc

    goto :goto_3

    :cond_6
    const v10, -0x80706

    :goto_3
    invoke-virtual {v5, v10}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    iget-object v5, v3, Lcn/hongguo/tv/MainActivity$PageUi;->rail:Landroid/widget/LinearLayout;

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v11, 0x42b00000    # 88.0f

    invoke-virtual {v0, v11}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v11

    const/4 v13, -0x1

    invoke-direct {v10, v11, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v5, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 89
    const-string v5, "\u25b6"

    const/16 v10, 0x1b

    invoke-virtual {v0, v5, v10, v13}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v5

    const/16 v10, 0x11

    invoke-virtual {v5, v10}, Landroid/widget/TextView;->setGravity(I)V

    sget v11, Lcn/hongguo/tv/MainActivity;->PINK:I

    const/4 v14, 0x0

    invoke-virtual {v0, v11, v14}, Lcn/hongguo/tv/MainActivity;->bg(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v11

    invoke-virtual {v5, v11}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v15, 0x42380000    # 46.0f

    invoke-virtual {v0, v15}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v10

    invoke-virtual {v0, v15}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v15

    invoke-direct {v11, v10, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v10, 0x1

    iput v10, v11, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    invoke-virtual {v0, v12}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v12

    iput v12, v11, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iget-object v12, v3, Lcn/hongguo/tv/MainActivity$PageUi;->rail:Landroid/widget/LinearLayout;

    invoke-virtual {v12, v5, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 90
    filled-new-array {v6, v7, v4, v8, v9}, [Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 91
    const/4 v6, 0x0

    :goto_4
    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v8, 0x5

    if-ge v6, v8, :cond_9

    aget-object v8, v4, v6

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_7

    iget-object v11, v3, Lcn/hongguo/tv/MainActivity$PageUi;->rail:Landroid/widget/LinearLayout;

    new-instance v12, Landroid/view/View;

    invoke-direct {v12, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v15, v10, v14, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v11, v12, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_7
    new-instance v7, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda40;

    invoke-direct {v7, v0, v8}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda40;-><init>(Lcn/hongguo/tv/MainActivity;Ljava/lang/String;)V

    invoke-virtual {v0, v8, v7, v14}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v7

    const/high16 v11, 0x41800000    # 16.0f

    invoke-virtual {v7, v11}, Landroid/widget/Button;->setTextSize(F)V

    invoke-virtual {v7, v14, v14, v14, v14}, Landroid/widget/Button;->setPadding(IIII)V

    iget-object v11, v3, Lcn/hongguo/tv/MainActivity$PageUi;->section:Ljava/lang/String;

    invoke-virtual {v8, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    invoke-virtual {v0, v7, v11}, Lcn/hongguo/tv/MainActivity;->selectedStyle(Landroid/widget/Button;Z)V

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v12, 0x42400000    # 48.0f

    invoke-virtual {v0, v12}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v12

    invoke-direct {v11, v13, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v12, 0x41200000    # 10.0f

    invoke-virtual {v0, v12}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v15

    iput v15, v11, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iget-object v12, v3, Lcn/hongguo/tv/MainActivity$PageUi;->rail:Landroid/widget/LinearLayout;

    invoke-virtual {v12, v7, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v11, v3, Lcn/hongguo/tv/MainActivity$PageUi;->section:Ljava/lang/String;

    invoke-virtual {v8, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_8

    iput-object v7, v3, Lcn/hongguo/tv/MainActivity$PageUi;->activeRail:Landroid/view/View;

    :cond_8
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 92
    :cond_9
    const/16 v4, 0xa

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->muted()I

    move-result v6

    const-string v8, "\u6e20\u9053\u6709\u6570"

    invoke-virtual {v0, v8, v4, v6}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v4

    const/16 v6, 0x11

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {v4}, Landroid/widget/TextView;->setSingleLine()V

    iget-object v6, v3, Lcn/hongguo/tv/MainActivity$PageUi;->rail:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 93
    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->column()Landroid/widget/LinearLayout;

    move-result-object v4

    iput-object v4, v3, Lcn/hongguo/tv/MainActivity$PageUi;->body:Landroid/widget/LinearLayout;

    iget-object v4, v3, Lcn/hongguo/tv/MainActivity$PageUi;->body:Landroid/widget/LinearLayout;

    const/high16 v6, 0x41b00000    # 22.0f

    invoke-virtual {v0, v6}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v6

    const/high16 v8, 0x41600000    # 14.0f

    invoke-virtual {v0, v8}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v8

    const/high16 v9, 0x41c00000    # 24.0f

    invoke-virtual {v0, v9}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v9

    const/high16 v11, 0x41200000    # 10.0f

    invoke-virtual {v0, v11}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v11

    invoke-virtual {v4, v6, v8, v9, v11}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v4, v3, Lcn/hongguo/tv/MainActivity$PageUi;->body:Landroid/widget/LinearLayout;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v14, v13, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 94
    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v4

    const/16 v6, 0x16

    sget v8, Lcn/hongguo/tv/MainActivity;->PINK:I

    const-string v9, "\u7ea2\u679c\u514d\u8d39\u77ed\u5267"

    invoke-virtual {v0, v9, v6, v8}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v6

    const/4 v8, 0x0

    invoke-virtual {v6, v8, v10}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    invoke-virtual {v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 95
    new-instance v6, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda41;

    invoke-direct {v6, v0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda41;-><init>(Lcn/hongguo/tv/MainActivity;)V

    const-string v9, "\u771f\u4eba\u5267"

    invoke-virtual {v0, v9, v6, v14}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v6

    new-instance v9, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda42;

    invoke-direct {v9, v0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda42;-><init>(Lcn/hongguo/tv/MainActivity;)V

    const-string v11, "\u6f2b\u5267"

    invoke-virtual {v0, v11, v9, v14}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v9

    iget-object v11, v0, Lcn/hongguo/tv/MainActivity;->catalogMode:Ljava/lang/String;

    const-string v12, "short"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    invoke-virtual {v0, v6, v11}, Lcn/hongguo/tv/MainActivity;->selectedStyle(Landroid/widget/Button;Z)V

    iget-object v11, v0, Lcn/hongguo/tv/MainActivity;->catalogMode:Ljava/lang/String;

    const-string v12, "manju"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    invoke-virtual {v0, v9, v11}, Lcn/hongguo/tv/MainActivity;->selectedStyle(Landroid/widget/Button;Z)V

    invoke-virtual {v0, v4, v6}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    invoke-virtual {v0, v4, v9}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    new-instance v11, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda43;

    invoke-direct {v11, v0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda43;-><init>(Lcn/hongguo/tv/MainActivity;)V

    const-string v15, "AI\u5267"

    invoke-virtual {v0, v15, v11, v14}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v11

    iget-object v15, v0, Lcn/hongguo/tv/MainActivity;->catalogMode:Ljava/lang/String;

    const-string v8, "ai"

    invoke-virtual {v15, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    invoke-virtual {v0, v11, v15}, Lcn/hongguo/tv/MainActivity;->selectedStyle(Landroid/widget/Button;Z)V

    invoke-virtual {v0, v4, v11}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    iget-object v15, v0, Lcn/hongguo/tv/MainActivity;->catalogMode:Ljava/lang/String;

    invoke-virtual {v15, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_a

    move-object v9, v11

    goto :goto_5

    :cond_a
    iget-object v11, v0, Lcn/hongguo/tv/MainActivity;->catalogMode:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_b

    goto :goto_5

    :cond_b
    move-object v9, v6

    :goto_5
    iput-object v9, v3, Lcn/hongguo/tv/MainActivity$PageUi;->top:Landroid/view/View;

    .line 96
    new-instance v9, Landroid/view/View;

    invoke-direct {v9, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v11, v14, v10, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v9, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v9, v0, Lcn/hongguo/tv/MainActivity;->catalogMode:Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_c

    const-string v8, "\u641c\u7d22AI\u5267"

    goto :goto_6

    :cond_c
    const-string v8, "\u641c\u7d22\u77ed\u5267\u6216\u6f14\u5458"

    :goto_6
    new-instance v9, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda44;

    invoke-direct {v9, v0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda44;-><init>(Lcn/hongguo/tv/MainActivity;)V

    invoke-virtual {v0, v8, v9, v14}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v8

    const/high16 v9, 0x41700000    # 15.0f

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setTextSize(F)V

    invoke-virtual {v0, v4, v8}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    iget-object v8, v3, Lcn/hongguo/tv/MainActivity$PageUi;->body:Landroid/widget/LinearLayout;

    invoke-virtual {v8, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 97
    new-instance v4, Landroid/view/View;

    invoke-direct {v4, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->darkTheme()Z

    move-result v8

    if-eqz v8, :cond_d

    const v8, -0xcfcbc2

    goto :goto_7

    :cond_d
    const v8, -0xf0e0d

    :goto_7
    invoke-virtual {v4, v8}, Landroid/view/View;->setBackgroundColor(I)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v0, v7}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v7

    invoke-direct {v8, v13, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v7, 0x41000000    # 8.0f

    invoke-virtual {v0, v7}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v7

    const/high16 v9, 0x41400000    # 12.0f

    invoke-virtual {v0, v9}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v9

    invoke-virtual {v8, v14, v7, v14, v9}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    iget-object v7, v3, Lcn/hongguo/tv/MainActivity$PageUi;->body:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v4, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 98
    const/16 v4, 0x18

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->ink()I

    move-result v7

    invoke-virtual {v0, v1, v4, v7}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    iput-object v1, v3, Lcn/hongguo/tv/MainActivity$PageUi;->heading:Landroid/widget/TextView;

    iget-object v1, v3, Lcn/hongguo/tv/MainActivity$PageUi;->heading:Landroid/widget/TextView;

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v10}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    iget-object v1, v3, Lcn/hongguo/tv/MainActivity$PageUi;->heading:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->setSingleLine()V

    iget-object v1, v3, Lcn/hongguo/tv/MainActivity$PageUi;->heading:Landroid/widget/TextView;

    sget-object v4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object v1, v3, Lcn/hongguo/tv/MainActivity$PageUi;->body:Landroid/widget/LinearLayout;

    iget-object v4, v3, Lcn/hongguo/tv/MainActivity$PageUi;->heading:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 99
    nop

    :goto_8
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v14, v1, :cond_e

    invoke-virtual {v5, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    new-instance v4, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda45;

    invoke-direct {v4, v5, v14, v3}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda45;-><init>(Ljava/util/ArrayList;ILcn/hongguo/tv/MainActivity$PageUi;)V

    invoke-virtual {v1, v4}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    add-int/lit8 v14, v14, 0x1

    goto :goto_8

    .line 100
    :cond_e
    new-instance v1, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda46;

    invoke-direct {v1, v3}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda46;-><init>(Lcn/hongguo/tv/MainActivity$PageUi;)V

    invoke-virtual {v6, v1}, Landroid/widget/Button;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 101
    return-object v2
.end method

.method show(Landroid/view/View;Ljava/lang/String;Landroid/view/View;Z)V
    .locals 2

    .line 69
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->hideKeyboard()V

    iget v0, p0, Lcn/hongguo/tv/MainActivity;->generation:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcn/hongguo/tv/MainActivity;->generation:I

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->coverIo:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->getQueue()Ljava/util/concurrent/BlockingQueue;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->clear()V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->io:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->getQueue()Ljava/util/concurrent/BlockingQueue;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->clear()V

    if-eqz p4, :cond_0

    iget-object p4, p0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    if-eqz p4, :cond_0

    iget-object p4, p0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object v0

    iput-object v0, p4, Lcn/hongguo/tv/MainActivity$Screen;->focus:Landroid/view/View;

    iget-object p4, p0, Lcn/hongguo/tv/MainActivity;->back:Ljava/util/ArrayDeque;

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    invoke-virtual {p4, v0}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    :goto_0
    iget-object p4, p0, Lcn/hongguo/tv/MainActivity;->back:Ljava/util/ArrayDeque;

    invoke-virtual {p4}, Ljava/util/ArrayDeque;->size()I

    move-result p4

    const/4 v0, 0x4

    if-le p4, v0, :cond_0

    iget-object p4, p0, Lcn/hongguo/tv/MainActivity;->back:Ljava/util/ArrayDeque;

    invoke-virtual {p4}, Ljava/util/ArrayDeque;->removeLast()Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iget-object p4, p0, Lcn/hongguo/tv/MainActivity;->host:Landroid/widget/FrameLayout;

    invoke-virtual {p4}, Landroid/widget/FrameLayout;->removeAllViews()V

    iget-object p4, p0, Lcn/hongguo/tv/MainActivity;->host:Landroid/widget/FrameLayout;

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p4, p1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p4, Lcn/hongguo/tv/MainActivity$Screen;

    invoke-direct {p4, p1, p2}, Lcn/hongguo/tv/MainActivity$Screen;-><init>(Landroid/view/View;Ljava/lang/String;)V

    iput-object p4, p0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->updates:Lcn/hongguo/tv/TvUpdater;

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->updates:Lcn/hongguo/tv/TvUpdater;

    invoke-virtual {p2}, Lcn/hongguo/tv/TvUpdater;->resume()V

    :cond_1
    if-eqz p3, :cond_2

    new-instance p2, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda74;

    invoke-direct {p2, p0, p1, p3}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda74;-><init>(Lcn/hongguo/tv/MainActivity;Landroid/view/View;Landroid/view/View;)V

    invoke-virtual {p3, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_2
    return-void
.end method

.method showControls()V
    .locals 2

    .line 285
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->chrome:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->playerOverlay()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->chrome:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->controlsVisible:Z

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->hasWindowFocus()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->chrome:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v0, v1}, Lcn/hongguo/tv/MainActivity;->inside(Landroid/view/View;Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->pauseButton:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->requestFocusFromTouch()Z

    :cond_1
    :goto_0
    return-void
.end method

.method sleepLabel()Ljava/lang/String;
    .locals 6

    .line 181
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u5b9a\u65f6\u505c\u6b62\uff1a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcn/hongguo/tv/MainActivity;->sleepDeadline:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    const-string v1, "\u5173\u95ed"

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v2, p0, Lcn/hongguo/tv/MainActivity;->sleepDeadline:J

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    sub-long/2addr v2, v4

    const-wide/32 v4, 0xea5f

    add-long/2addr v2, v4

    const-wide/32 v4, 0xea60

    div-long/2addr v2, v4

    const-wide/16 v4, 0x1

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u5206\u949f\u540e"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method sourceFailure(Landroid/media/MediaPlayer;)V
    .locals 1

    .line 231
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcn/hongguo/tv/MainActivity;->sourceFailure(Landroid/media/MediaPlayer;Ljava/lang/Exception;)V

    return-void
.end method

.method sourceFailure(Landroid/media/MediaPlayer;Ljava/lang/Exception;)V
    .locals 1

    .line 232
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-ne p1, v0, :cond_1

    iget-boolean p1, p0, Lcn/hongguo/tv/MainActivity;->released:Z

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelConfirmHold()V

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->stallTimeout:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    iput-boolean p1, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    invoke-static {p2}, Lcn/hongguo/tv/PlaybackUnavailable;->message(Ljava/lang/Exception;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity;->failure:Ljava/lang/String;

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->status:Landroid/widget/TextView;

    iget-object p2, p0, Lcn/hongguo/tv/MainActivity;->failure:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity;->pauseButton:Landroid/widget/Button;

    const-string p2, "\u91cd\u8bd5"

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->showControls()V

    :cond_1
    :goto_0
    return-void
.end method

.method standaloneSettings()V
    .locals 2

    .line 176
    new-instance v0, Lcn/hongguo/tv/TvSettings;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcn/hongguo/tv/TvSettings;-><init>(Lcn/hongguo/tv/MainActivity;Z)V

    invoke-virtual {v0}, Lcn/hongguo/tv/TvSettings;->page()V

    return-void
.end method

.method startPlayer(Lorg/json/JSONObject;Lorg/json/JSONArray;IJ)V
    .locals 16

    .line 236
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lcn/hongguo/tv/MainActivity;->updates:Lcn/hongguo/tv/TvUpdater;

    if-eqz v2, :cond_0

    iget-object v2, v0, Lcn/hongguo/tv/MainActivity;->updates:Lcn/hongguo/tv/TvUpdater;

    invoke-virtual {v2}, Lcn/hongguo/tv/TvUpdater;->pause()V

    .line 237
    :cond_0
    iget-object v2, v0, Lcn/hongguo/tv/MainActivity;->recommendations:Lcn/hongguo/tv/Recommendations;

    invoke-virtual {v2}, Lcn/hongguo/tv/Recommendations;->resetSample()V

    iget-object v2, v0, Lcn/hongguo/tv/MainActivity;->recommendations:Lcn/hongguo/tv/Recommendations;

    invoke-virtual {v2, v1}, Lcn/hongguo/tv/Recommendations;->shown(Lorg/json/JSONObject;)V

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->persistRecommendations()V

    iput-object v1, v0, Lcn/hongguo/tv/MainActivity;->current:Lorg/json/JSONObject;

    move-object/from16 v1, p2

    iput-object v1, v0, Lcn/hongguo/tv/MainActivity;->episodes:Lorg/json/JSONArray;

    const/4 v1, -0x1

    iput v1, v0, Lcn/hongguo/tv/MainActivity;->seekPreview:I

    .line 238
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, v0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    iget-object v2, v0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    const/high16 v3, -0x1000000

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    iget-object v2, v0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setKeepScreenOn(Z)V

    .line 239
    iget-object v2, v0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    new-instance v4, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda52;

    invoke-direct {v4, v0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda52;-><init>(Lcn/hongguo/tv/MainActivity;)V

    invoke-virtual {v2, v4}, Landroid/widget/FrameLayout;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 240
    new-instance v2, Landroid/view/SurfaceView;

    invoke-direct {v2, v0}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    iput-object v2, v0, Lcn/hongguo/tv/MainActivity;->surface:Landroid/view/SurfaceView;

    iget-object v2, v0, Lcn/hongguo/tv/MainActivity;->surface:Landroid/view/SurfaceView;

    invoke-virtual {v2, v3}, Landroid/view/SurfaceView;->setFocusable(Z)V

    iget-object v2, v0, Lcn/hongguo/tv/MainActivity;->surface:Landroid/view/SurfaceView;

    invoke-virtual {v2, v3}, Landroid/view/SurfaceView;->setFocusableInTouchMode(Z)V

    iget-object v2, v0, Lcn/hongguo/tv/MainActivity;->surface:Landroid/view/SurfaceView;

    new-instance v4, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda53;

    invoke-direct {v4, v0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda53;-><init>(Lcn/hongguo/tv/MainActivity;)V

    invoke-virtual {v2, v4}, Landroid/view/SurfaceView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v2, v0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    iget-object v4, v0, Lcn/hongguo/tv/MainActivity;->surface:Landroid/view/SurfaceView;

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v6, 0x11

    invoke-direct {v5, v1, v1, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v2, v4, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 241
    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->column()Landroid/widget/LinearLayout;

    move-result-object v2

    iput-object v2, v0, Lcn/hongguo/tv/MainActivity;->chrome:Landroid/widget/LinearLayout;

    iget-object v2, v0, Lcn/hongguo/tv/MainActivity;->chrome:Landroid/widget/LinearLayout;

    const/high16 v4, 0x41e00000    # 28.0f

    invoke-virtual {v0, v4}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v5

    const/high16 v7, 0x41400000    # 12.0f

    invoke-virtual {v0, v7}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v7

    invoke-virtual {v0, v4}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v8

    const/high16 v9, 0x41600000    # 14.0f

    invoke-virtual {v0, v9}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v9

    invoke-virtual {v2, v5, v7, v8, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v2, v0, Lcn/hongguo/tv/MainActivity;->chrome:Landroid/widget/LinearLayout;

    const v5, -0x22e7e6e4

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 242
    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v2

    const-string v7, "\u51c6\u5907\u64ad\u653e\u2026"

    const/16 v8, 0x13

    invoke-virtual {v0, v7, v8, v1}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v7

    iput-object v7, v0, Lcn/hongguo/tv/MainActivity;->status:Landroid/widget/TextView;

    iget-object v7, v0, Lcn/hongguo/tv/MainActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->setSingleLine()V

    iget-object v7, v0, Lcn/hongguo/tv/MainActivity;->status:Landroid/widget/TextView;

    sget-object v8, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object v7, v0, Lcn/hongguo/tv/MainActivity;->status:Landroid/widget/TextView;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, 0x0

    const/4 v10, -0x2

    const/high16 v11, 0x3f800000    # 1.0f

    invoke-direct {v8, v9, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v7, "00:00 / 00:00"

    const/16 v8, 0xf

    invoke-virtual {v0, v7, v8, v1}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v7

    iput-object v7, v0, Lcn/hongguo/tv/MainActivity;->clock:Landroid/widget/TextView;

    iget-object v7, v0, Lcn/hongguo/tv/MainActivity;->clock:Landroid/widget/TextView;

    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v7, v0, Lcn/hongguo/tv/MainActivity;->chrome:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 243
    new-instance v2, Landroid/widget/SeekBar;

    invoke-direct {v2, v0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    iput-object v2, v0, Lcn/hongguo/tv/MainActivity;->seek:Landroid/widget/SeekBar;

    iget-object v2, v0, Lcn/hongguo/tv/MainActivity;->seek:Landroid/widget/SeekBar;

    const-string v7, "\u64ad\u653e\u8fdb\u5ea6\uff0c\u5de6\u53f3\u5b9a\u4f4d\uff0c\u786e\u8ba4\u6682\u505c\u6216\u7ee7\u7eed"

    invoke-virtual {v2, v7}, Landroid/widget/SeekBar;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v2, v0, Lcn/hongguo/tv/MainActivity;->seek:Landroid/widget/SeekBar;

    sget v7, Lcn/hongguo/tv/MainActivity;->PINK:I

    invoke-static {v2, v7}, Lcn/hongguo/tv/MainActivity$Modern21;->tint(Landroid/widget/SeekBar;I)V

    iget-object v2, v0, Lcn/hongguo/tv/MainActivity;->chrome:Landroid/widget/LinearLayout;

    iget-object v7, v0, Lcn/hongguo/tv/MainActivity;->seek:Landroid/widget/SeekBar;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v12, 0x42300000    # 44.0f

    invoke-virtual {v0, v12}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v12

    invoke-direct {v8, v1, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 244
    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v2

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 245
    new-instance v8, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda54;

    invoke-direct {v8, v0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda54;-><init>(Lcn/hongguo/tv/MainActivity;)V

    const-string v12, "\u6682\u505c"

    invoke-virtual {v0, v12, v8, v3}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v8

    iput-object v8, v0, Lcn/hongguo/tv/MainActivity;->pauseButton:Landroid/widget/Button;

    new-instance v8, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda55;

    invoke-direct {v8, v0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda55;-><init>(Lcn/hongguo/tv/MainActivity;)V

    const-string v12, "\u4e0b\u4e00\u96c6"

    invoke-virtual {v0, v12, v8, v3}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v8

    iput-object v8, v0, Lcn/hongguo/tv/MainActivity;->nextButton:Landroid/widget/Button;

    .line 246
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget v12, v0, Lcn/hongguo/tv/MainActivity;->speed:F

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v12, " \u500d"

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    new-instance v12, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda56;

    invoke-direct {v12, v0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda56;-><init>(Lcn/hongguo/tv/MainActivity;)V

    invoke-virtual {v0, v8, v12, v3}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v8

    iput-object v8, v0, Lcn/hongguo/tv/MainActivity;->rateButton:Landroid/widget/Button;

    .line 247
    iget-object v8, v0, Lcn/hongguo/tv/MainActivity;->pauseButton:Landroid/widget/Button;

    iget-object v12, v0, Lcn/hongguo/tv/MainActivity;->nextButton:Landroid/widget/Button;

    new-instance v13, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda57;

    invoke-direct {v13, v0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda57;-><init>(Lcn/hongguo/tv/MainActivity;)V

    const-string v14, "\u6362\u4e00\u90e8"

    invoke-virtual {v0, v14, v13, v3}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v13

    new-instance v14, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda58;

    invoke-direct {v14, v0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda58;-><init>(Lcn/hongguo/tv/MainActivity;)V

    const-string v15, "\u9009\u96c6"

    invoke-virtual {v0, v15, v14, v3}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v14

    iget-object v15, v0, Lcn/hongguo/tv/MainActivity;->rateButton:Landroid/widget/Button;

    new-instance v4, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda59;

    invoke-direct {v4, v0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda59;-><init>(Lcn/hongguo/tv/MainActivity;)V

    const-string v5, "\u8bbe\u7f6e"

    invoke-virtual {v0, v5, v4, v3}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v4

    const/4 v5, 0x6

    new-array v6, v5, [Landroid/widget/Button;

    aput-object v8, v6, v9

    aput-object v12, v6, v3

    const/4 v8, 0x2

    aput-object v13, v6, v8

    const/4 v8, 0x3

    aput-object v14, v6, v8

    const/4 v8, 0x4

    aput-object v15, v6, v8

    const/4 v8, 0x5

    aput-object v4, v6, v8

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v8, v6, v4

    .line 248
    const/high16 v12, 0x41800000    # 16.0f

    invoke-virtual {v8, v12}, Landroid/widget/Button;->setTextSize(F)V

    const/high16 v12, 0x40800000    # 4.0f

    invoke-virtual {v0, v12}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v13

    invoke-virtual {v0, v12}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v14

    invoke-virtual {v8, v13, v9, v14, v9}, Landroid/widget/Button;->setPadding(IIII)V

    new-instance v13, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v14, 0x42400000    # 48.0f

    invoke-virtual {v0, v14}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v14

    invoke-direct {v13, v9, v14, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v12}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v14

    invoke-virtual {v0, v12}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v15

    invoke-virtual {v0, v12}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v5

    invoke-virtual {v0, v12}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v12

    invoke-virtual {v13, v14, v15, v5, v12}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v2, v8, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 247
    add-int/lit8 v4, v4, 0x1

    const/4 v5, 0x6

    goto :goto_0

    .line 250
    :cond_1
    const/4 v4, 0x0

    :goto_1
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v4, v5, :cond_2

    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    new-instance v6, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda60;

    invoke-direct {v6, v0, v4, v7}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda60;-><init>(Lcn/hongguo/tv/MainActivity;ILjava/util/ArrayList;)V

    invoke-virtual {v5, v6}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 251
    :cond_2
    iget-object v4, v0, Lcn/hongguo/tv/MainActivity;->chrome:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v2, v0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    iget-object v4, v0, Lcn/hongguo/tv/MainActivity;->chrome:Landroid/widget/LinearLayout;

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v6, 0x50

    invoke-direct {v5, v1, v10, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v2, v4, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v2, ""

    const/16 v4, 0x11

    invoke-virtual {v0, v2, v4, v1}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    iput-object v1, v0, Lcn/hongguo/tv/MainActivity;->holdHint:Landroid/widget/TextView;

    iget-object v1, v0, Lcn/hongguo/tv/MainActivity;->holdHint:Landroid/widget/TextView;

    const/high16 v2, 0x41900000    # 18.0f

    invoke-virtual {v0, v2}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v4

    const/high16 v5, 0x41200000    # 10.0f

    invoke-virtual {v0, v5}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v6

    invoke-virtual {v0, v2}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v2

    invoke-virtual {v0, v5}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v5

    invoke-virtual {v1, v4, v6, v2, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v1, v0, Lcn/hongguo/tv/MainActivity;->holdHint:Landroid/widget/TextView;

    const v2, -0x22e7e6e4

    invoke-virtual {v0, v2, v9}, Lcn/hongguo/tv/MainActivity;->bg(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, v0, Lcn/hongguo/tv/MainActivity;->holdHint:Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v2, 0x31

    invoke-direct {v1, v10, v10, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    const/high16 v2, 0x41e00000    # 28.0f

    invoke-virtual {v0, v2}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v2

    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    iget-object v2, v0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    iget-object v4, v0, Lcn/hongguo/tv/MainActivity;->holdHint:Landroid/widget/TextView;

    invoke-virtual {v2, v4, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, v0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    const-string v2, "\u64ad\u653e"

    iget-object v4, v0, Lcn/hongguo/tv/MainActivity;->pauseButton:Landroid/widget/Button;

    invoke-virtual {v0, v1, v2, v4, v3}, Lcn/hongguo/tv/MainActivity;->show(Landroid/view/View;Ljava/lang/String;Landroid/view/View;Z)V

    .line 252
    iget-object v1, v0, Lcn/hongguo/tv/MainActivity;->seek:Landroid/widget/SeekBar;

    new-instance v2, Lcn/hongguo/tv/MainActivity$3;

    invoke-direct {v2, v0}, Lcn/hongguo/tv/MainActivity$3;-><init>(Lcn/hongguo/tv/MainActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 253
    iget-object v1, v0, Lcn/hongguo/tv/MainActivity;->seek:Landroid/widget/SeekBar;

    new-instance v2, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda61;

    invoke-direct {v2, v0}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda61;-><init>(Lcn/hongguo/tv/MainActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/SeekBar;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 255
    iget-object v1, v0, Lcn/hongguo/tv/MainActivity;->surface:Landroid/view/SurfaceView;

    invoke-virtual {v1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    new-instance v2, Lcn/hongguo/tv/MainActivity$4;

    move/from16 v3, p3

    move-wide/from16 v4, p4

    invoke-direct {v2, v0, v3, v4, v5}, Lcn/hongguo/tv/MainActivity$4;-><init>(Lcn/hongguo/tv/MainActivity;IJ)V

    invoke-interface {v1, v2}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 256
    return-void
.end method

.method stopPlayer()V
    .locals 4

    .line 318
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelConfirmHold()V

    const/4 v0, 0x0

    iput v0, p0, Lcn/hongguo/tv/MainActivity;->heldConfirmKey:I

    const/4 v1, 0x0

    iput-object v1, p0, Lcn/hongguo/tv/MainActivity;->holdHint:Landroid/widget/TextView;

    const/4 v2, -0x1

    iput v2, p0, Lcn/hongguo/tv/MainActivity;->seekPreview:I

    iput-object v1, p0, Lcn/hongguo/tv/MainActivity;->nextButton:Landroid/widget/Button;

    iput-object v1, p0, Lcn/hongguo/tv/MainActivity;->rateButton:Landroid/widget/Button;

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity;->recommendations:Lcn/hongguo/tv/Recommendations;

    invoke-virtual {v2}, Lcn/hongguo/tv/Recommendations;->resetSample()V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->persistRecommendations()V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelMedia()V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->saveProgress()V

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v3, p0, Lcn/hongguo/tv/MainActivity;->hideChrome:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v3, p0, Lcn/hongguo/tv/MainActivity;->stallTimeout:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->release()V

    iput-object v1, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    :cond_0
    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    iput-object v1, p0, Lcn/hongguo/tv/MainActivity;->current:Lorg/json/JSONObject;

    iput-object v1, p0, Lcn/hongguo/tv/MainActivity;->surface:Landroid/view/SurfaceView;

    iput-object v1, p0, Lcn/hongguo/tv/MainActivity;->chrome:Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    iput-object v1, p0, Lcn/hongguo/tv/MainActivity;->overlayReturnFocus:Landroid/view/View;

    iput-object v1, p0, Lcn/hongguo/tv/MainActivity;->rewindButton:Landroid/widget/Button;

    iput-object v1, p0, Lcn/hongguo/tv/MainActivity;->forwardButton:Landroid/widget/Button;

    iput v0, p0, Lcn/hongguo/tv/MainActivity;->videoWidth:I

    iput v0, p0, Lcn/hongguo/tv/MainActivity;->videoHeight:I

    return-void
.end method

.method text(Ljava/lang/String;II)Landroid/widget/TextView;
    .locals 2

    .line 63
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    int-to-float p1, p2

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 p1, 0x41000000    # 8.0f

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result p2

    const/high16 p3, 0x40c00000    # 6.0f

    invoke-virtual {p0, p3}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v1

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result p1

    invoke-virtual {p0, p3}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result p3

    invoke-virtual {v0, p2, v1, p1, p3}, Landroid/widget/TextView;->setPadding(IIII)V

    return-object v0
.end method

.method themedFill(I)I
    .locals 1

    .line 15
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->darkTheme()Z

    move-result v0

    if-nez v0, :cond_0

    return p1

    :cond_0
    sparse-switch p1, :sswitch_data_0

    return p1

    :sswitch_0
    const p1, -0xcadad0

    return p1

    :sswitch_1
    const p1, -0xb7cfc2

    return p1

    :sswitch_2
    const p1, -0xdad7cf

    return p1

    :sswitch_3
    const p1, -0xd6d9d2

    return p1

    nop

    :sswitch_data_0
    .sparse-switch
        -0xf1714 -> :sswitch_3
        -0x90808 -> :sswitch_2
        -0x21510 -> :sswitch_1
        -0x20f0b -> :sswitch_0
    .end sparse-switch
.end method

.method togglePause()V
    .locals 4

    .line 263
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelConfirmHold()V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->failure:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    iget-wide v1, p0, Lcn/hongguo/tv/MainActivity;->pendingSeek:J

    :goto_0
    invoke-virtual {p0, v0, v1, v2}, Lcn/hongguo/tv/MainActivity;->playEpisode(IJ)V

    return-void

    :cond_0
    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    const-string v1, "\u64ad\u653e"

    const/4 v2, 0x1

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    xor-int/2addr v0, v2

    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->pauseButton:Landroid/widget/Button;

    iget-boolean v2, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    if-eqz v2, :cond_1

    const-string v1, "\u6682\u505c"

    :cond_1
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->stallTimeout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->activityVisible:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->stallTimeout:Ljava/lang/Runnable;

    const-wide/32 v2, 0xea60

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_2
    return-void

    :cond_3
    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->ended:Z

    if-eqz v0, :cond_4

    iget v0, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    const-wide/16 v1, 0x0

    goto :goto_0

    :cond_4
    iget-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    if-eqz v0, :cond_5

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->cancelPrefetch()V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity;->stallTimeout:Ljava/lang/Runnable;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->pauseButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity;->current:Lorg/json/JSONObject;

    const-string v3, "title"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u00b7 \u7b2c "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcn/hongguo/tv/MainActivity;->episode:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u96c6 \u00b7 \u5df2\u6682\u505c"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity;->hideChrome:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->showControls()V

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->saveProgress()V

    goto :goto_1

    :cond_5
    iput-boolean v2, p0, Lcn/hongguo/tv/MainActivity;->wantPlaying:Z

    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->resumePausedPlayer()V

    :goto_1
    return-void
.end method

.method topTarget(Landroid/view/View;)Landroid/view/View;
    .locals 1

    .line 82
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->currentUi()Lcn/hongguo/tv/MainActivity$PageUi;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, v0, Lcn/hongguo/tv/MainActivity$PageUi;->top:Landroid/view/View;

    :goto_0
    return-object p1
.end method

.method wireGrid(Ljava/util/ArrayList;ILandroid/view/View;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;I",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 137
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcn/hongguo/tv/MainActivity;->wireGrid(Ljava/util/ArrayList;ILandroid/view/View;Landroid/view/View;)V

    return-void
.end method

.method wireGrid(Ljava/util/ArrayList;ILandroid/view/View;Landroid/view/View;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;I",
            "Landroid/view/View;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 138
    invoke-virtual {p0}, Lcn/hongguo/tv/MainActivity;->currentUi()Lcn/hongguo/tv/MainActivity$PageUi;

    move-result-object v7

    const/4 v0, 0x0

    const/4 v8, 0x0

    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v8, v0, :cond_0

    invoke-virtual {p1, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Landroid/view/View;

    new-instance v10, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda78;

    move-object v0, v10

    move v1, v8

    move-object v2, p1

    move v3, p2

    move-object v4, v7

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda78;-><init>(ILjava/util/ArrayList;ILcn/hongguo/tv/MainActivity$PageUi;Landroid/view/View;Landroid/view/View;)V

    invoke-virtual {v9, v10}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
