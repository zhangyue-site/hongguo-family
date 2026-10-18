.class final Lcn/hongguo/tv/TvSettings;
.super Ljava/lang/Object;
.source "TvSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/hongguo/tv/TvSettings$Selection;
    }
.end annotation


# instance fields
.field final a:Lcn/hongguo/tv/MainActivity;

.field final dark:Z

.field first:Landroid/view/View;

.field list:Landroid/widget/LinearLayout;


# direct methods
.method constructor <init>(Lcn/hongguo/tv/MainActivity;Z)V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iput-boolean p2, p0, Lcn/hongguo/tv/TvSettings;->dark:Z

    return-void
.end method

.method static synthetic lambda$choose$0(Lcn/hongguo/tv/TvSettings$Selection;ILandroid/app/AlertDialog;)V
    .locals 0

    .line 14
    invoke-interface {p0, p1}, Lcn/hongguo/tv/TvSettings$Selection;->accept(I)V

    invoke-virtual {p2}, Landroid/app/AlertDialog;->dismiss()V

    return-void
.end method

.method static synthetic lambda$choose$2(Ljava/util/ArrayList;I)V
    .locals 1

    .line 15
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/widget/Button;

    invoke-virtual {p0}, Landroid/widget/Button;->requestFocusFromTouch()Z

    return-void
.end method

.method static synthetic lambda$clearRow$47()V
    .locals 0

    .line 52
    return-void
.end method

.method static synthetic lambda$confirm$3(Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 18
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$confirm$4(Landroid/app/AlertDialog;Landroid/content/DialogInterface;)V
    .locals 0

    .line 18
    const/4 p1, -0x2

    invoke-virtual {p0, p1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Button;->requestFocusFromTouch()Z

    return-void
.end method

.method static synthetic lambda$confirm$5(Landroid/widget/Button;Landroid/content/DialogInterface;)V
    .locals 0

    .line 18
    invoke-virtual {p0}, Landroid/widget/Button;->isAttachedToWindow()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Landroid/widget/Button;->requestFocusFromTouch()Z

    :cond_0
    return-void
.end method

.method static synthetic lambda$drawer$59(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 68
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result p0

    if-nez p0, :cond_1

    const/16 p0, 0x15

    if-eq p1, p0, :cond_0

    const/16 p0, 0x16

    if-ne p1, p0, :cond_1

    :cond_0
    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static synthetic lambda$general$26()V
    .locals 0

    .line 37
    return-void
.end method

.method static synthetic lambda$general$29()V
    .locals 0

    .line 39
    return-void
.end method

.method static synthetic lambda$general$31()V
    .locals 0

    .line 40
    return-void
.end method

.method static synthetic lambda$general$33()V
    .locals 0

    .line 41
    return-void
.end method

.method static synthetic lambda$general$36()V
    .locals 0

    .line 42
    return-void
.end method

.method static synthetic lambda$page$55()V
    .locals 0

    .line 66
    return-void
.end method

.method static synthetic lambda$playback$11()V
    .locals 0

    .line 22
    return-void
.end method

.method static synthetic lambda$playback$14()V
    .locals 0

    .line 23
    return-void
.end method

.method static synthetic lambda$playback$17()V
    .locals 0

    .line 24
    return-void
.end method

.method static synthetic lambda$playback$20()V
    .locals 0

    .line 25
    return-void
.end method

.method static synthetic lambda$playback$6()V
    .locals 0

    .line 20
    return-void
.end method

.method static synthetic lambda$playback$9()V
    .locals 0

    .line 21
    return-void
.end method

.method static synthetic lambda$storage$40()V
    .locals 0

    .line 47
    return-void
.end method

.method static synthetic lambda$wireRows$58(Landroid/view/View;Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 67
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    if-nez p1, :cond_2

    const/16 p1, 0x15

    if-eq p2, p1, :cond_0

    const/16 p3, 0x16

    if-ne p2, p3, :cond_2

    :cond_0
    if-ne p2, p1, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->requestFocusFromTouch()Z

    :cond_1
    const/4 p0, 0x1

    return p0

    :cond_2
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method about()V
    .locals 3

    .line 54
    :try_start_0
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v0}, Lcn/hongguo/tv/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v1}, Lcn/hongguo/tv/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v0, ""

    .line 55
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u7ea2\u679c\u7535\u89c6\u7aef "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n\u7531\u6e20\u9053\u6709\u6570\u72ec\u7acb\u7ef4\u62a4 \u00b7 Android TV \u6d4b\u8bd5\u7248\nAndroid "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u00b7 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, v1, Lcn/hongguo/tv/MainActivity;->memory:Lcn/hongguo/tv/MemoryProfile;

    iget-boolean v1, v1, Lcn/hongguo/tv/MemoryProfile;->lowRam:Z

    if-eqz v1, :cond_0

    const-string v1, "\u4f4e\u5185\u5b58\u6a21\u5f0f"

    goto :goto_1

    :cond_0
    const-string v1, "\u6807\u51c6\u5185\u5b58\u6a21\u5f0f"

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/TvSettings;->note(Ljava/lang/String;)V

    .line 56
    new-instance v0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda15;

    invoke-direct {v0, p0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda15;-><init>(Lcn/hongguo/tv/TvSettings;)V

    const-string v1, "\u68c0\u67e5\u66f4\u65b0"

    invoke-virtual {p0, v1, v0}, Lcn/hongguo/tv/TvSettings;->row(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    .line 57
    new-instance v0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda16;

    invoke-direct {v0, p0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda16;-><init>(Lcn/hongguo/tv/TvSettings;)V

    const-string v1, "\u539f\u7248\u4e0b\u8f7d\u4e0e\u6765\u6e90\u6838\u9a8c"

    invoke-virtual {p0, v1, v0}, Lcn/hongguo/tv/TvSettings;->row(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    .line 58
    new-instance v0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda17;

    invoke-direct {v0, p0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda17;-><init>(Lcn/hongguo/tv/TvSettings;)V

    const-string v1, "\u53cd\u9988\u95ee\u9898"

    invoke-virtual {p0, v1, v0}, Lcn/hongguo/tv/TvSettings;->row(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    .line 59
    const-string v0, "\u6536\u85cf\u3001\u89c2\u770b\u4e0e\u641c\u7d22\u5386\u53f2\u4ec5\u4fdd\u5b58\u5728\u672c\u8bbe\u5907\u3002\u5185\u5bb9\u52a0\u8f7d\u548c\u64ad\u653e\u9700\u8981\u8054\u7f51\u3002"

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/TvSettings;->note(Ljava/lang/String;)V

    .line 60
    new-instance v0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda18;

    invoke-direct {v0, p0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda18;-><init>(Lcn/hongguo/tv/TvSettings;)V

    const-string v1, "\u67e5\u770b\u8bbe\u5907\u517c\u5bb9\u4fe1\u606f"

    invoke-virtual {p0, v1, v0}, Lcn/hongguo/tv/TvSettings;->row(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    .line 61
    const-string v0, "Copyright \u00a9 2026 \u6e20\u9053\u6709\u6570\u53ca\u8d21\u732e\u8005\u3002\u72ec\u7acb\u7b2c\u4e09\u65b9\u5ba2\u6237\u7aef\uff0c\u4e0e\u7ea2\u679c\u5b98\u65b9\u65e0\u96b6\u5c5e\u5173\u7cfb\u3002\u54c1\u724c\u3001\u5267\u96c6\u4e0e\u7b2c\u4e09\u65b9\u7ec4\u4ef6\u5f52\u5404\u81ea\u6743\u5229\u65b9\u6240\u6709\u3002JNA 5.10.0 \u6309 Apache 2.0 \u4f7f\u7528\uff0c\u8bb8\u53ef\u968f\u5b89\u88c5\u5305\u63d0\u4f9b\u3002"

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/TvSettings;->note(Ljava/lang/String;)V

    .line 62
    return-void
.end method

.method choose(Landroid/widget/Button;Ljava/lang/String;[Ljava/lang/String;ILcn/hongguo/tv/TvSettings$Selection;)V
    .locals 16

    .line 13
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move/from16 v2, p4

    iget-object v3, v0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v3}, Lcn/hongguo/tv/MainActivity;->column()Landroid/widget/LinearLayout;

    move-result-object v3

    new-instance v4, Landroid/widget/ScrollView;

    iget-object v5, v0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-direct {v4, v5}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/ScrollView;->setFocusable(Z)V

    invoke-virtual {v4, v3}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    iget-object v6, v0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-boolean v7, v0, Lcn/hongguo/tv/TvSettings;->dark:Z

    invoke-virtual {v6, v7}, Lcn/hongguo/tv/MainActivity;->dialog(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    move-object/from16 v7, p2

    invoke-virtual {v6, v7}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    invoke-virtual {v6, v4}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    const-string v7, "\u53d6\u6d88"

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v6

    .line 14
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    const/4 v8, 0x0

    :goto_0
    array-length v9, v1

    if-ge v8, v9, :cond_1

    iget-object v9, v0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v11, v1, v8

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    if-ne v8, v2, :cond_0

    const-string v11, "  \u2713"

    goto :goto_1

    :cond_0
    const-string v11, ""

    :goto_1
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    new-instance v11, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda1;

    move-object/from16 v12, p5

    invoke-direct {v11, v12, v8, v6}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda1;-><init>(Lcn/hongguo/tv/TvSettings$Selection;ILandroid/app/AlertDialog;)V

    iget-boolean v13, v0, Lcn/hongguo/tv/TvSettings;->dark:Z

    invoke-virtual {v9, v10, v11, v13}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v9

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v11, v0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    const/high16 v13, 0x42400000    # 48.0f

    invoke-virtual {v11, v13}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v11

    const/4 v13, -0x1

    invoke-direct {v10, v13, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v11, v0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    const/high16 v13, 0x41000000    # 8.0f

    invoke-virtual {v11, v13}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v11

    iget-object v14, v0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    const/high16 v15, 0x40400000    # 3.0f

    invoke-virtual {v14, v15}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v14

    iget-object v5, v0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v5, v13}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v5

    iget-object v13, v0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v13, v15}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v13

    invoke-virtual {v10, v11, v14, v5, v13}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v3, v9, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v8, v8, 0x1

    const/4 v5, 0x0

    goto :goto_0

    .line 15
    :cond_1
    new-instance v3, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda2;

    move-object/from16 v5, p1

    invoke-direct {v3, v0, v5}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda2;-><init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/Button;)V

    invoke-virtual {v6, v3}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    invoke-virtual {v6}, Landroid/app/AlertDialog;->show()V

    invoke-virtual {v4}, Landroid/widget/ScrollView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    iget-object v5, v0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    array-length v1, v1

    const/4 v6, 0x5

    invoke-static {v1, v6}, Ljava/lang/Math;->min(II)I

    move-result v1

    mul-int/lit8 v1, v1, 0x36

    int-to-float v1, v1

    invoke-virtual {v5, v1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v1

    iput v1, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v4}, Landroid/widget/ScrollView;->requestLayout()V

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    const/4 v3, 0x0

    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    new-instance v3, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda3;

    invoke-direct {v3, v7, v2}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda3;-><init>(Ljava/util/ArrayList;I)V

    invoke-virtual {v1, v3}, Landroid/widget/Button;->post(Ljava/lang/Runnable;)Z

    .line 16
    return-void
.end method

.method clearRow(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 52
    new-instance v0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda5;

    invoke-direct {v0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda5;-><init>()V

    invoke-virtual {p0, p1, v0}, Lcn/hongguo/tv/TvSettings;->row(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    new-instance v7, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda6;

    move-object v1, v7

    move-object v2, p0

    move-object v3, v0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    invoke-direct/range {v1 .. v6}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda6;-><init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method confirm(Landroid/widget/Button;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 2

    .line 18
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-boolean v1, p0, Lcn/hongguo/tv/TvSettings;->dark:Z

    invoke-virtual {v0, v1}, Lcn/hongguo/tv/MainActivity;->dialog(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    const-string v0, "\u6b64\u64cd\u4f5c\u4e0d\u53ef\u64a4\u9500\uff0c\u8bf7\u786e\u8ba4\u3002\u6536\u85cf\u548c\u5176\u4ed6\u8bbe\u7f6e\u4e0d\u4f1a\u540c\u65f6\u5220\u9664\u3002"

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    const-string v0, "\u53d6\u6d88"

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda8;

    invoke-direct {v0, p3}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda8;-><init>(Ljava/lang/Runnable;)V

    const-string p3, "\u786e\u8ba4\u6e05\u9664"

    invoke-virtual {p2, p3, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    invoke-virtual {p2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p2

    new-instance p3, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda9;

    invoke-direct {p3, p2}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda9;-><init>(Landroid/app/AlertDialog;)V

    invoke-virtual {p2, p3}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    new-instance p3, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda10;

    invoke-direct {p3, p1}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda10;-><init>(Landroid/widget/Button;)V

    invoke-virtual {p2, p3}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    invoke-virtual {p2}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method drawer()V
    .locals 8

    .line 68
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v1}, Lcn/hongguo/tv/MainActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object v1

    iput-object v1, v0, Lcn/hongguo/tv/MainActivity;->overlayReturnFocus:Landroid/view/View;

    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, v1, Lcn/hongguo/tv/MainActivity;->hideChrome:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v0}, Lcn/hongguo/tv/MainActivity;->column()Landroid/widget/LinearLayout;

    move-result-object v0

    const-string v1, "settings-overlay"

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    const/high16 v2, 0x41800000    # 16.0f

    invoke-virtual {v1, v2}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v1

    iget-object v3, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    const/high16 v4, 0x41600000    # 14.0f

    invoke-virtual {v3, v4}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v3

    iget-object v4, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v4, v2}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v2

    iget-object v4, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    const/high16 v5, 0x41400000    # 12.0f

    invoke-virtual {v4, v5}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v4

    invoke-virtual {v0, v1, v3, v2, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const v1, -0xde7e6e4

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    const-string v2, "\u64ad\u653e\u8bbe\u7f6e \u00b7 \u8fd4\u56de\u5173\u95ed"

    const/16 v3, 0x17

    const/4 v4, -0x1

    invoke-virtual {v1, v2, v3, v4}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/widget/ScrollView;

    iget-object v2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-direct {v1, v2}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ScrollView;->setFocusable(Z)V

    iget-object v3, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v3}, Lcn/hongguo/tv/MainActivity;->column()Landroid/widget/LinearLayout;

    move-result-object v3

    iput-object v3, p0, Lcn/hongguo/tv/TvSettings;->list:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcn/hongguo/tv/TvSettings;->list:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v3}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v3, v4, v2, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v2}, Lcn/hongguo/tv/TvSettings;->populate(I)V

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, v1, Lcn/hongguo/tv/MainActivity;->playback:Landroid/widget/FrameLayout;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    iget-object v5, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    const/high16 v6, 0x43d20000    # 420.0f

    invoke-virtual {v5, v6}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v5

    iget-object v6, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v6}, Lcn/hongguo/tv/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    iget v6, v6, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v6, v6

    const v7, 0x3f0ccccd    # 0.55f

    mul-float v6, v6, v7

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v5

    const/4 v6, 0x5

    invoke-direct {v3, v5, v4, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v1, v0, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->chrome:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iput-boolean v2, v0, Lcn/hongguo/tv/MainActivity;->controlsVisible:Z

    :goto_0
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->list:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-ge v2, v0, :cond_1

    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->list:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    instance-of v1, v0, Landroid/widget/Button;

    if-eqz v1, :cond_0

    new-instance v1, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda57;

    invoke-direct {v1}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda57;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->first:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestFocusFromTouch()Z

    return-void
.end method

.method general()V
    .locals 6

    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u5916\u89c2\u4e3b\u9898\uff1a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v1}, Lcn/hongguo/tv/MainActivity;->darkTheme()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "\u6697\u8272"

    goto :goto_0

    :cond_0
    const-string v1, "\u6d45\u8272"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda46;

    invoke-direct {v1}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda46;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcn/hongguo/tv/TvSettings;->row(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    new-instance v1, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda48;

    invoke-direct {v1, p0, v0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda48;-><init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/Button;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u8bb0\u5f55\u89c2\u770b\u5386\u53f2\uff1a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, v1, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v2, "record_history"

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    const-string v2, "\u5f00"

    const-string v4, "\u5173"

    if-eqz v1, :cond_1

    move-object v1, v2

    goto :goto_1

    :cond_1
    move-object v1, v4

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda49;

    invoke-direct {v1}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda49;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcn/hongguo/tv/TvSettings;->row(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    new-instance v1, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda50;

    invoke-direct {v1, p0, v0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda50;-><init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/Button;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u6309\u89c2\u770b\u504f\u597d\u63a8\u8350\uff1a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, v1, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v5, "personal_recommendations"

    invoke-interface {v1, v5, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_2

    :cond_2
    move-object v2, v4

    :goto_2
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda51;

    invoke-direct {v1}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda51;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcn/hongguo/tv/TvSettings;->row(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    new-instance v1, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda52;

    invoke-direct {v1, p0, v0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda52;-><init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/Button;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 41
    new-instance v0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda53;

    invoke-direct {v0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda53;-><init>()V

    const-string v1, "\u91cd\u7f6e\u63a8\u8350\u504f\u597d"

    invoke-virtual {p0, v1, v0}, Lcn/hongguo/tv/TvSettings;->row(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    new-instance v1, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda54;

    invoke-direct {v1, p0, v0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda54;-><init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/Button;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u63a7\u5236\u680f\u81ea\u52a8\u9690\u85cf\uff1a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, v1, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v2, "controls_seconds"

    const/4 v3, 0x5

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u79d2"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda55;

    invoke-direct {v1}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda55;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcn/hongguo/tv/TvSettings;->row(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    new-instance v1, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda56;

    invoke-direct {v1, p0, v0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda56;-><init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/Button;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 43
    new-instance v0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda47;

    invoke-direct {v0, p0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda47;-><init>(Lcn/hongguo/tv/TvSettings;)V

    const-string v1, "\u9065\u63a7\u5668\u64cd\u4f5c\u8bf4\u660e"

    invoke-virtual {p0, v1, v0}, Lcn/hongguo/tv/TvSettings;->row(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    .line 44
    const-string v0, "\u5173\u95ed\u5386\u53f2\u8bb0\u5f55\u4e0d\u5220\u9664\u5df2\u6709\u8bb0\u5f55\uff1b\u4e4b\u540e\u64ad\u653e\u4e0d\u4f1a\u65b0\u589e\u6216\u8986\u76d6\u89c2\u770b\u8fdb\u5ea6\uff0c\u4e5f\u4e0d\u5b66\u4e60\u89c2\u770b\u504f\u597d\u3002"

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/TvSettings;->note(Ljava/lang/String;)V

    .line 45
    return-void
.end method

.method synthetic lambda$about$50$cn-hongguo-tv-TvSettings()V
    .locals 1

    .line 56
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->updates:Lcn/hongguo/tv/TvUpdater;

    invoke-virtual {v0}, Lcn/hongguo/tv/TvUpdater;->page()V

    return-void
.end method

.method synthetic lambda$about$51$cn-hongguo-tv-TvSettings(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 57
    const-string p1, "https://github.com/waligoraamodio288-rgb/hongguo-desktop-releases"

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/TvSettings;->openLink(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$about$52$cn-hongguo-tv-TvSettings()V
    .locals 3

    .line 57
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-boolean v1, p0, Lcn/hongguo/tv/TvSettings;->dark:Z

    invoke-virtual {v0, v1}, Lcn/hongguo/tv/MainActivity;->dialog(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u539f\u7248\u4e0e\u7f72\u540d"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-static {v2}, Lcn/hongguo/tv/AppOrigin;->verify(Landroid/content/Context;)I

    move-result v2

    invoke-static {v2}, Lcn/hongguo/tv/AppOrigin;->status(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n\n\u7ef4\u62a4\u8005\uff1a\u6e20\u9053\u6709\u6570\n\u539f\u53d1\u884c\u4ed3\u5e93\uff1a\nwaligoraamodio288-rgb/hongguo-desktop-releases\n\n\u6b22\u8fce\u8f6c\u8f7d\u4ecb\u7ecd\uff0c\u8bf7\u4fdd\u7559\u7f72\u540d\u4e0e\u539f\u7248\u94fe\u63a5\u3002\u7b2c\u4e09\u65b9\u955c\u50cf\u8bf7\u6807\u660e\u8eab\u4efd\u3002\u7b7e\u540d\u6838\u9a8c\u7528\u4e8e\u8bc6\u522b\u53d1\u884c\u6765\u6e90\uff0c\u4e0d\u4fdd\u8bc1\u65e0\u6cd5\u88ab\u590d\u5236\u6216\u4fee\u6539\u3002"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda59;

    invoke-direct {v1, p0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda59;-><init>(Lcn/hongguo/tv/TvSettings;)V

    const-string v2, "\u6253\u5f00\u539f\u7248\u5165\u53e3"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u5173\u95ed"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method synthetic lambda$about$53$cn-hongguo-tv-TvSettings()V
    .locals 1

    .line 58
    const-string v0, "https://github.com/waligoraamodio288-rgb/hongguo-desktop-releases/issues"

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/TvSettings;->openLink(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$about$54$cn-hongguo-tv-TvSettings()V
    .locals 4

    .line 60
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-boolean v1, p0, Lcn/hongguo/tv/TvSettings;->dark:Z

    invoke-virtual {v0, v1}, Lcn/hongguo/tv/MainActivity;->dialog(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u8bbe\u5907\u4e0e\u64ad\u653e"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\nAndroid API "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n\u6d77\u62a5\u7f13\u5b58\u9884\u7b97 "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v2, v2, Lcn/hongguo/tv/MainActivity;->memory:Lcn/hongguo/tv/MemoryProfile;

    iget v2, v2, Lcn/hongguo/tv/MemoryProfile;->cacheBytes:I

    div-int/lit16 v2, v2, 0x400

    div-int/lit16 v2, v2, 0x400

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " MiB\n\u500d\u901f\uff1a"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x17

    if-lt v2, v3, :cond_0

    const-string v2, "\u7531\u7cfb\u7edf\u64ad\u653e\u5668\u652f\u6301"

    goto :goto_0

    :cond_0
    const-string v2, "\u6b63\u5e38\u901f\u5ea6"

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n\u64ad\u653e\u5931\u8d25\u65f6\u53ef\u91cd\u8bd5\u6216\u6e05\u7406\u64ad\u653e\u7f13\u5b58\u3002\u76ee\u5f55\u670d\u52a1\u5076\u53d1\u4e0d\u53ef\u7528\uff0c\u53ef\u7a0d\u540e\u91cd\u65b0\u52a0\u8f7d\u3002"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u5173\u95ed"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method synthetic lambda$choose$1$cn-hongguo-tv-TvSettings(Landroid/widget/Button;Landroid/content/DialogInterface;)V
    .locals 0

    .line 15
    invoke-virtual {p1}, Landroid/widget/Button;->isAttachedToWindow()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Landroid/widget/Button;->requestFocusFromTouch()Z

    :cond_0
    iget-object p1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {p1}, Lcn/hongguo/tv/MainActivity;->scheduleHide()V

    return-void
.end method

.method synthetic lambda$clearRow$48$cn-hongguo-tv-TvSettings(Ljava/lang/String;Ljava/lang/String;Landroid/widget/Button;Ljava/lang/String;)V
    .locals 1

    .line 52
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object p1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity;->back:Ljava/util/ArrayDeque;

    invoke-virtual {p1}, Ljava/util/ArrayDeque;->clear()V

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "\uff1a\u5df2\u6e05\u9664"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$clearRow$49$cn-hongguo-tv-TvSettings(Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .locals 7

    .line 52
    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p5

    const-string v0, "\uff1f"

    invoke-virtual {p5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    new-instance v6, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda42;

    move-object v0, v6

    move-object v1, p0

    move-object v2, p3

    move-object v3, p4

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda42;-><init>(Lcn/hongguo/tv/TvSettings;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Button;Ljava/lang/String;)V

    invoke-virtual {p0, p1, p5, v6}, Lcn/hongguo/tv/TvSettings;->confirm(Landroid/widget/Button;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$general$27$cn-hongguo-tv-TvSettings(I)V
    .locals 1

    .line 37
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {v0, p1}, Lcn/hongguo/tv/MainActivity;->setDarkTheme(Z)V

    return-void
.end method

.method synthetic lambda$general$28$cn-hongguo-tv-TvSettings(Landroid/widget/Button;Landroid/view/View;)V
    .locals 7

    .line 37
    const-string p2, "\u6697\u8272"

    const-string v0, "\u6d45\u8272"

    filled-new-array {p2, v0}, [Ljava/lang/String;

    move-result-object v4

    iget-object p2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {p2}, Lcn/hongguo/tv/MainActivity;->darkTheme()Z

    move-result p2

    xor-int/lit8 v5, p2, 0x1

    new-instance v6, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda0;

    invoke-direct {v6, p0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda0;-><init>(Lcn/hongguo/tv/TvSettings;)V

    const-string v3, "\u5916\u89c2\u4e3b\u9898"

    move-object v1, p0

    move-object v2, p1

    invoke-virtual/range {v1 .. v6}, Lcn/hongguo/tv/TvSettings;->choose(Landroid/widget/Button;Ljava/lang/String;[Ljava/lang/String;ILcn/hongguo/tv/TvSettings$Selection;)V

    return-void
.end method

.method synthetic lambda$general$30$cn-hongguo-tv-TvSettings(Landroid/widget/Button;Landroid/view/View;)V
    .locals 2

    .line 39
    iget-object p2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p2, p2, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v0, "record_history"

    const/4 v1, 0x1

    invoke-interface {p2, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    xor-int/2addr p2, v1

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, v1, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u8bb0\u5f55\u89c2\u770b\u5386\u53f2\uff1a"

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

.method synthetic lambda$general$32$cn-hongguo-tv-TvSettings(Landroid/widget/Button;Landroid/view/View;)V
    .locals 2

    .line 40
    iget-object p2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p2, p2, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v0, "personal_recommendations"

    const/4 v1, 0x1

    invoke-interface {p2, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    xor-int/2addr p2, v1

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, v1, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->recommendations:Lcn/hongguo/tv/Recommendations;

    invoke-virtual {v0}, Lcn/hongguo/tv/Recommendations;->resetSample()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u6309\u89c2\u770b\u504f\u597d\u63a8\u8350\uff1a"

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

.method synthetic lambda$general$34$cn-hongguo-tv-TvSettings(Landroid/widget/Button;)V
    .locals 3

    .line 41
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    new-instance v1, Lcn/hongguo/tv/Recommendations;

    const-string v2, "{}"

    invoke-direct {v1, v2}, Lcn/hongguo/tv/Recommendations;-><init>(Ljava/lang/String;)V

    iput-object v1, v0, Lcn/hongguo/tv/MainActivity;->recommendations:Lcn/hongguo/tv/Recommendations;

    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v0}, Lcn/hongguo/tv/MainActivity;->persistRecommendations()V

    const-string v0, "\u63a8\u8350\u504f\u597d\u5df2\u91cd\u7f6e"

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$general$35$cn-hongguo-tv-TvSettings(Landroid/widget/Button;Landroid/view/View;)V
    .locals 1

    .line 41
    new-instance p2, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda13;

    invoke-direct {p2, p0, p1}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda13;-><init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/Button;)V

    const-string v0, "\u91cd\u7f6e\u63a8\u8350\u504f\u597d\uff1f"

    invoke-virtual {p0, p1, v0, p2}, Lcn/hongguo/tv/TvSettings;->confirm(Landroid/widget/Button;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$general$37$cn-hongguo-tv-TvSettings(Landroid/widget/Button;I)V
    .locals 3

    .line 42
    const/4 v0, 0x5

    const/16 v1, 0x8

    const/4 v2, 0x3

    filled-new-array {v2, v0, v1}, [I

    move-result-object v0

    aget p2, v0, p2

    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "controls_seconds"

    invoke-interface {v0, v1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u63a7\u5236\u680f\u81ea\u52a8\u9690\u85cf\uff1a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " \u79d2"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$general$38$cn-hongguo-tv-TvSettings(Landroid/widget/Button;Landroid/view/View;)V
    .locals 8

    .line 42
    const-string p2, "5 \u79d2"

    const-string v0, "8 \u79d2"

    const-string v1, "3 \u79d2"

    filled-new-array {v1, p2, v0}, [Ljava/lang/String;

    move-result-object v5

    iget-object p2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p2, p2, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v0, "controls_seconds"

    const/4 v1, 0x5

    invoke-interface {p2, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p2

    const/4 v2, 0x3

    if-ne p2, v2, :cond_0

    const/4 p2, 0x0

    const/4 v6, 0x0

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p2, p2, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {p2, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p2

    const/16 v0, 0x8

    if-ne p2, v0, :cond_1

    const/4 p2, 0x2

    const/4 v6, 0x2

    goto :goto_0

    :cond_1
    const/4 p2, 0x1

    const/4 v6, 0x1

    :goto_0
    new-instance v7, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda43;

    invoke-direct {v7, p0, p1}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda43;-><init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/Button;)V

    const-string v4, "\u63a7\u5236\u680f\u81ea\u52a8\u9690\u85cf"

    move-object v2, p0

    move-object v3, p1

    invoke-virtual/range {v2 .. v7}, Lcn/hongguo/tv/TvSettings;->choose(Landroid/widget/Button;Ljava/lang/String;[Ljava/lang/String;ILcn/hongguo/tv/TvSettings$Selection;)V

    return-void
.end method

.method synthetic lambda$general$39$cn-hongguo-tv-TvSettings()V
    .locals 3

    .line 43
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-boolean v1, p0, Lcn/hongguo/tv/TvSettings;->dark:Z

    invoke-virtual {v0, v1}, Lcn/hongguo/tv/MainActivity;->dialog(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u9065\u63a7\u5668\u64cd\u4f5c"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u65b9\u5411\u952e\u9009\u62e9\uff0c\u786e\u8ba4\u8fdb\u5165\uff0c\u8fd4\u56de\u9010\u5c42\u9000\u51fa\u3002\n\u64ad\u653e\u65f6\u786e\u8ba4\u5524\u51fa\u8fdb\u5ea6\u6761\uff0c\u5de6\u53f3\u5b9a\u4f4d\uff0c\u677e\u5f00\u8df3\u8f6c\uff0c\u518d\u786e\u8ba4\u6682\u505c\u6216\u7ee7\u7eed\u3002\n\u64ad\u653e\u4e2d\u957f\u6309\u786e\u8ba4\u7ea6\u534a\u79d2\u4e34\u65f6 2 \u500d\uff0c\u677e\u5f00\u6062\u590d\uff1bAndroid 6 \u4ee5\u4e0a\u4e14\u8bbe\u5907\u652f\u6301\u65f6\u53ef\u7528\u3002\n\u83dc\u5355\u952e\u6253\u5f00\u64ad\u653e\u8bbe\u7f6e\uff1b\u4e0b\u952e\u8fdb\u5165\u64cd\u4f5c\u6309\u94ae\uff0c\u518d\u6309\u4e0b\u952e\u6253\u5f00\u9009\u96c6\u3002\u6362\u4e00\u90e8\u968f\u673a\u627e\u5267\uff0c\u5a92\u4f53\u4e0b\u4e00\u9996\u952e\u4e5f\u53ef\u6362\u5267\u3002\n\u5206\u7c7b\u6216\u5217\u8868\u5de6\u8fb9\u754c\u53ef\u56de\u5230\u4fa7\u680f\u3002"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u77e5\u9053\u4e86"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method synthetic lambda$page$56$cn-hongguo-tv-TvSettings(Ljava/util/ArrayList;Landroid/widget/Button;ILandroid/widget/ScrollView;Landroid/widget/LinearLayout;Landroid/view/View;)V
    .locals 2

    .line 66
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p6

    const/4 v0, 0x0

    if-eqz p6, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p6

    check-cast p6, Landroid/widget/Button;

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    if-ne p6, p2, :cond_0

    const/4 v0, 0x1

    :cond_0
    invoke-virtual {v1, p6, v0}, Lcn/hongguo/tv/MainActivity;->selectedStyle(Landroid/widget/Button;Z)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p3}, Lcn/hongguo/tv/TvSettings;->populate(I)V

    invoke-virtual {p4, v0, v0}, Landroid/widget/ScrollView;->scrollTo(II)V

    iget-object p1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {p1, p5}, Lcn/hongguo/tv/MainActivity;->pageUi(Landroid/view/View;)Lcn/hongguo/tv/MainActivity$PageUi;

    move-result-object p1

    iput-object p2, p1, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    invoke-virtual {p0, p2}, Lcn/hongguo/tv/TvSettings;->wireRows(Landroid/view/View;)V

    return-void
.end method

.method synthetic lambda$page$57$cn-hongguo-tv-TvSettings(Landroid/widget/LinearLayout;Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 66
    invoke-virtual {p4}, Landroid/view/KeyEvent;->getAction()I

    move-result p2

    const/4 p4, 0x0

    if-eqz p2, :cond_0

    return p4

    :cond_0
    const/16 p2, 0x15

    const/4 v0, 0x1

    if-ne p3, p2, :cond_1

    iget-object p2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {p2, p1}, Lcn/hongguo/tv/MainActivity;->pageUi(Landroid/view/View;)Lcn/hongguo/tv/MainActivity$PageUi;

    move-result-object p1

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity$PageUi;->activeRail:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->requestFocusFromTouch()Z

    return v0

    :cond_1
    const/16 p1, 0x16

    if-ne p3, p1, :cond_3

    iget-object p1, p0, Lcn/hongguo/tv/TvSettings;->first:Landroid/view/View;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcn/hongguo/tv/TvSettings;->first:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->requestFocusFromTouch()Z

    :cond_2
    return v0

    :cond_3
    return p4
.end method

.method synthetic lambda$playback$10$cn-hongguo-tv-TvSettings(Landroid/widget/Button;Landroid/view/View;)V
    .locals 0

    .line 21
    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lcn/hongguo/tv/TvSettings;->rate(Landroid/widget/Button;Z)V

    return-void
.end method

.method synthetic lambda$playback$12$cn-hongguo-tv-TvSettings(Landroid/widget/Button;[Ljava/lang/String;I)V
    .locals 3

    .line 22
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "scale_mode"

    invoke-interface {v0, v1, p3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget v1, v1, Lcn/hongguo/tv/MainActivity;->videoWidth:I

    iget-object v2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget v2, v2, Lcn/hongguo/tv/MainActivity;->videoHeight:I

    invoke-virtual {v0, v1, v2}, Lcn/hongguo/tv/MainActivity;->fitVideo(II)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u753b\u9762\u6bd4\u4f8b\uff1a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    aget-object p2, p2, p3

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$playback$13$cn-hongguo-tv-TvSettings(Landroid/widget/Button;[Ljava/lang/String;Landroid/view/View;)V
    .locals 6

    .line 22
    iget-object p3, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {p3}, Lcn/hongguo/tv/MainActivity;->scaleMode()I

    move-result v4

    new-instance v5, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda11;

    invoke-direct {v5, p0, p1, p2}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda11;-><init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/Button;[Ljava/lang/String;)V

    const-string v2, "\u753b\u9762\u6bd4\u4f8b"

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    invoke-virtual/range {v0 .. v5}, Lcn/hongguo/tv/TvSettings;->choose(Landroid/widget/Button;Ljava/lang/String;[Ljava/lang/String;ILcn/hongguo/tv/TvSettings$Selection;)V

    return-void
.end method

.method synthetic lambda$playback$15$cn-hongguo-tv-TvSettings(Landroid/widget/Button;I)V
    .locals 3

    .line 23
    const/16 v0, 0xa

    const/16 v1, 0x1e

    const/4 v2, 0x5

    filled-new-array {v2, v0, v1}, [I

    move-result-object v0

    aget p2, v0, p2

    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "seek_seconds"

    invoke-interface {v0, v1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v0}, Lcn/hongguo/tv/MainActivity;->refreshSeekLabels()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u5feb\u8fdb\u9000\u6b65\u957f\uff1a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " \u79d2"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$playback$16$cn-hongguo-tv-TvSettings(Landroid/widget/Button;Landroid/view/View;)V
    .locals 8

    .line 23
    const-string p2, "10 \u79d2"

    const-string v0, "30 \u79d2"

    const-string v1, "5 \u79d2"

    filled-new-array {v1, p2, v0}, [Ljava/lang/String;

    move-result-object v5

    iget-object p2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {p2}, Lcn/hongguo/tv/MainActivity;->seekSeconds()I

    move-result p2

    const/4 v0, 0x5

    if-ne p2, v0, :cond_0

    const/4 p2, 0x0

    const/4 v6, 0x0

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {p2}, Lcn/hongguo/tv/MainActivity;->seekSeconds()I

    move-result p2

    const/16 v0, 0x1e

    if-ne p2, v0, :cond_1

    const/4 p2, 0x2

    const/4 v6, 0x2

    goto :goto_0

    :cond_1
    const/4 p2, 0x1

    const/4 v6, 0x1

    :goto_0
    new-instance v7, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda45;

    invoke-direct {v7, p0, p1}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda45;-><init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/Button;)V

    const-string v4, "\u5feb\u8fdb\u9000\u6b65\u957f"

    move-object v2, p0

    move-object v3, p1

    invoke-virtual/range {v2 .. v7}, Lcn/hongguo/tv/TvSettings;->choose(Landroid/widget/Button;Ljava/lang/String;[Ljava/lang/String;ILcn/hongguo/tv/TvSettings$Selection;)V

    return-void
.end method

.method synthetic lambda$playback$18$cn-hongguo-tv-TvSettings(Landroid/widget/Button;I)V
    .locals 5

    .line 24
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    const/16 v1, 0x3c

    const/16 v2, 0x5a

    const/4 v3, 0x0

    const/16 v4, 0x1e

    filled-new-array {v3, v4, v1, v2}, [I

    move-result-object v1

    aget p2, v1, p2

    invoke-virtual {v0, p2}, Lcn/hongguo/tv/MainActivity;->setSleepMinutes(I)V

    iget-object p2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {p2}, Lcn/hongguo/tv/MainActivity;->sleepLabel()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$playback$19$cn-hongguo-tv-TvSettings(Landroid/widget/Button;Landroid/view/View;)V
    .locals 9

    .line 24
    const-string p2, "60 \u5206\u949f"

    const-string v0, "90 \u5206\u949f"

    const-string v1, "\u5173\u95ed"

    const-string v2, "30 \u5206\u949f"

    filled-new-array {v1, v2, p2, v0}, [Ljava/lang/String;

    move-result-object v6

    new-instance v8, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda58;

    invoke-direct {v8, p0, p1}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda58;-><init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/Button;)V

    const-string v5, "\u5b9a\u65f6\u505c\u6b62\uff08\u4ec5\u672c\u6b21\u4f7f\u7528\uff09"

    const/4 v7, 0x0

    move-object v3, p0

    move-object v4, p1

    invoke-virtual/range {v3 .. v8}, Lcn/hongguo/tv/TvSettings;->choose(Landroid/widget/Button;Ljava/lang/String;[Ljava/lang/String;ILcn/hongguo/tv/TvSettings$Selection;)V

    return-void
.end method

.method synthetic lambda$playback$21$cn-hongguo-tv-TvSettings(Landroid/widget/Button;I)V
    .locals 2

    .line 26
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v0, p2}, Lcn/hongguo/tv/MainActivity;->changeQuality(I)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u6e05\u6670\u5ea6\uff1a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcn/hongguo/tv/PlaybackQuality;->LABELS:[Ljava/lang/String;

    aget-object p2, v1, p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$playback$22$cn-hongguo-tv-TvSettings(Landroid/widget/Button;Landroid/view/View;)V
    .locals 6

    .line 26
    sget-object v3, Lcn/hongguo/tv/PlaybackQuality;->LABELS:[Ljava/lang/String;

    iget-object p2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p2, p2, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v0, "quality"

    const/4 v1, 0x0

    invoke-interface {p2, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p2

    invoke-static {p2}, Lcn/hongguo/tv/PlaybackQuality;->index(I)I

    move-result v4

    new-instance v5, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda22;

    invoke-direct {v5, p0, p1}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda22;-><init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/Button;)V

    const-string v2, "\u6e05\u6670\u5ea6\u4e0a\u9650"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcn/hongguo/tv/TvSettings;->choose(Landroid/widget/Button;Ljava/lang/String;[Ljava/lang/String;ILcn/hongguo/tv/TvSettings$Selection;)V

    return-void
.end method

.method synthetic lambda$playback$23$cn-hongguo-tv-TvSettings()V
    .locals 5

    .line 28
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget v0, v0, Lcn/hongguo/tv/MainActivity;->episode:I

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v0}, Lcn/hongguo/tv/MainActivity;->closeSettingsOverlay()V

    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget v2, v2, Lcn/hongguo/tv/MainActivity;->episode:I

    sub-int/2addr v2, v1

    const-wide/16 v3, 0x0

    invoke-virtual {v0, v2, v3, v4}, Lcn/hongguo/tv/MainActivity;->playEpisode(IJ)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    const-string v1, "\u5df2\u7ecf\u662f\u7b2c\u4e00\u96c6"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :goto_0
    return-void
.end method

.method synthetic lambda$playback$24$cn-hongguo-tv-TvSettings()V
    .locals 4

    .line 28
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v0}, Lcn/hongguo/tv/MainActivity;->closeSettingsOverlay()V

    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget v1, v1, Lcn/hongguo/tv/MainActivity;->episode:I

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcn/hongguo/tv/MainActivity;->playEpisode(IJ)V

    return-void
.end method

.method synthetic lambda$playback$7$cn-hongguo-tv-TvSettings(Landroid/widget/Button;I)V
    .locals 5

    .line 20
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez p2, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    const-string v4, "autoplay"

    invoke-interface {v0, v4, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const/4 v3, 0x2

    if-ne p2, v3, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    const-string p2, "repeat_one"

    invoke-interface {v0, p2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object p2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {p2}, Lcn/hongguo/tv/MainActivity;->cancelPrefetch()V

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/TvSettings;->updateMode(Landroid/widget/Button;)V

    return-void
.end method

.method synthetic lambda$playback$8$cn-hongguo-tv-TvSettings(Landroid/widget/Button;Landroid/view/View;)V
    .locals 8

    .line 20
    const-string p2, "\u5355\u96c6\u64ad\u653e"

    const-string v0, "\u5355\u96c6\u5faa\u73af"

    const-string v1, "\u81ea\u52a8\u8fde\u64ad"

    filled-new-array {v1, p2, v0}, [Ljava/lang/String;

    move-result-object v5

    iget-object p2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p2, p2, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v0, "repeat_one"

    const/4 v1, 0x0

    invoke-interface {p2, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p2, 0x2

    const/4 v6, 0x2

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p2, p2, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v0, "autoplay"

    const/4 v2, 0x1

    invoke-interface {p2, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    if-eqz p2, :cond_1

    const/4 v6, 0x0

    goto :goto_0

    :cond_1
    const/4 v6, 0x1

    :goto_0
    new-instance v7, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda4;

    invoke-direct {v7, p0, p1}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda4;-><init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/Button;)V

    const-string v4, "\u64ad\u653e\u65b9\u5f0f"

    move-object v2, p0

    move-object v3, p1

    invoke-virtual/range {v2 .. v7}, Lcn/hongguo/tv/TvSettings;->choose(Landroid/widget/Button;Ljava/lang/String;[Ljava/lang/String;ILcn/hongguo/tv/TvSettings$Selection;)V

    return-void
.end method

.method synthetic lambda$rate$25$cn-hongguo-tv-TvSettings([FLandroid/widget/Button;ZI)V
    .locals 1

    .line 33
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    aget p1, p1, p4

    iput p1, v0, Lcn/hongguo/tv/MainActivity;->speed:F

    iget-object p1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iget-object p4, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget p4, p4, Lcn/hongguo/tv/MainActivity;->speed:F

    const-string v0, "speed"

    invoke-interface {p1, v0, p4}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object p1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {p1}, Lcn/hongguo/tv/MainActivity;->applySpeed()V

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p3, :cond_0

    const-string p3, ""

    goto :goto_0

    :cond_0
    const-string p3, "\u64ad\u653e\u901f\u5ea6\uff1a"

    :goto_0
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p3, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget p3, p3, Lcn/hongguo/tv/MainActivity;->speed:F

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, " \u500d"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity;->rateButton:Landroid/widget/Button;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity;->rateButton:Landroid/widget/Button;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p4, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget p4, p4, Lcn/hongguo/tv/MainActivity;->speed:F

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    return-void
.end method

.method synthetic lambda$storage$41$cn-hongguo-tv-TvSettings(ILandroid/widget/Button;Z)V
    .locals 1

    .line 47
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-boolean v0, v0, Lcn/hongguo/tv/MainActivity;->released:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget v0, v0, Lcn/hongguo/tv/MainActivity;->generation:I

    if-eq p1, v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object p1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity;->covers:Landroid/util/LruCache;

    invoke-virtual {p1}, Landroid/util/LruCache;->evictAll()V

    const/4 p1, 0x1

    invoke-virtual {p2, p1}, Landroid/widget/Button;->setEnabled(Z)V

    if-eqz p3, :cond_1

    const-string p1, "\u64ad\u653e\u7f13\u5b58\u5df2\u6e05\u7406"

    goto :goto_0

    :cond_1
    const-string p1, "\u6e05\u7406\u5931\u8d25\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    :goto_0
    invoke-virtual {p2, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :cond_2
    :goto_1
    return-void
.end method

.method synthetic lambda$storage$42$cn-hongguo-tv-TvSettings(ILandroid/widget/Button;)V
    .locals 3

    .line 47
    :try_start_0
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->api:Lcn/hongguo/tv/Api;

    invoke-virtual {v0}, Lcn/hongguo/tv/Api;->clearMediaCache()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    goto :goto_0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, v1, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    new-instance v2, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda23;

    invoke-direct {v2, p0, p1, p2, v0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda23;-><init>(Lcn/hongguo/tv/TvSettings;ILandroid/widget/Button;Z)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method synthetic lambda$storage$43$cn-hongguo-tv-TvSettings(Landroid/widget/Button;)V
    .locals 3

    .line 47
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    const-string v0, "\u6b63\u5728\u6e05\u7406\u2026"

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget v0, v0, Lcn/hongguo/tv/MainActivity;->generation:I

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, v1, Lcn/hongguo/tv/MainActivity;->mediaIo:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v2, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda7;

    invoke-direct {v2, p0, v0, p1}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda7;-><init>(Lcn/hongguo/tv/TvSettings;ILandroid/widget/Button;)V

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$storage$44$cn-hongguo-tv-TvSettings(Landroid/widget/Button;Landroid/view/View;)V
    .locals 1

    .line 47
    new-instance p2, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda12;

    invoke-direct {p2, p0, p1}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda12;-><init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/Button;)V

    const-string v0, "\u6e05\u7406\u64ad\u653e\u7f13\u5b58\uff1f"

    invoke-virtual {p0, p1, v0, p2}, Lcn/hongguo/tv/TvSettings;->confirm(Landroid/widget/Button;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$storage$45$cn-hongguo-tv-TvSettings()V
    .locals 2

    .line 49
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    const-string v1, "favorites"

    invoke-virtual {v0, v1}, Lcn/hongguo/tv/MainActivity;->manageSaved(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$storage$46$cn-hongguo-tv-TvSettings()V
    .locals 2

    .line 49
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    const-string v1, "history"

    invoke-virtual {v0, v1}, Lcn/hongguo/tv/MainActivity;->manageSaved(Ljava/lang/String;)V

    return-void
.end method

.method note(Ljava/lang/String;)V
    .locals 4

    .line 11
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->list:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-boolean v2, p0, Lcn/hongguo/tv/TvSettings;->dark:Z

    if-eqz v2, :cond_0

    const v2, -0x45413b

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v2}, Lcn/hongguo/tv/MainActivity;->muted()I

    move-result v2

    :goto_0
    const/16 v3, 0xe

    invoke-virtual {v1, p1, v3, v2}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method openLink(Ljava/lang/String;)V
    .locals 4

    .line 63
    :try_start_0
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v0, v1}, Lcn/hongguo/tv/MainActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-boolean v1, p0, Lcn/hongguo/tv/TvSettings;->dark:Z

    invoke-virtual {v0, v1}, Lcn/hongguo/tv/MainActivity;->dialog(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u8bf7\u5728\u624b\u673a\u6216\u7535\u8111\u8bbf\u95ee"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "\u5173\u95ed"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    :goto_0
    return-void
.end method

.method page()V
    .locals 1

    .line 65
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/TvSettings;->page(I)V

    return-void
.end method

.method page(I)V
    .locals 18

    .line 66
    move-object/from16 v7, p0

    move/from16 v8, p1

    iget-object v0, v7, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    const-string v9, "\u8bbe\u7f6e"

    invoke-virtual {v0, v9}, Lcn/hongguo/tv/MainActivity;->shell(Ljava/lang/String;)Landroid/widget/LinearLayout;

    move-result-object v10

    iget-object v0, v7, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v0}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v0

    const/16 v1, 0x30

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v1, v7, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v1}, Lcn/hongguo/tv/MainActivity;->column()Landroid/widget/LinearLayout;

    move-result-object v11

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v2, v7, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    const/high16 v3, 0x43160000    # 150.0f

    invoke-virtual {v2, v3}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v2

    const/4 v12, -0x1

    invoke-direct {v1, v2, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v11, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v13, Landroid/widget/ScrollView;

    iget-object v1, v7, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-direct {v13, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Landroid/widget/ScrollView;->setFocusable(Z)V

    iget-object v1, v7, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v1}, Lcn/hongguo/tv/MainActivity;->column()Landroid/widget/LinearLayout;

    move-result-object v1

    iput-object v1, v7, Lcn/hongguo/tv/TvSettings;->list:Landroid/widget/LinearLayout;

    iget-object v1, v7, Lcn/hongguo/tv/TvSettings;->list:Landroid/widget/LinearLayout;

    iget-object v2, v7, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual {v2, v3}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v2

    invoke-virtual {v1, v2, v14, v14, v14}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v1, v7, Lcn/hongguo/tv/TvSettings;->list:Landroid/widget/LinearLayout;

    invoke-virtual {v13, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v1, v14, v12, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v13, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, v7, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v1, v10}, Lcn/hongguo/tv/MainActivity;->body(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v1

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v12, v14, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    const-string v0, "\u5b58\u50a8\u4e0e\u8bb0\u5f55"

    const-string v1, "\u5173\u4e8e\u4e0e\u5e2e\u52a9"

    const-string v2, "\u64ad\u653e\u8bbe\u7f6e"

    const-string v3, "\u901a\u7528\u8bbe\u7f6e"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v16

    const/4 v6, 0x0

    :goto_0
    const/4 v0, 0x4

    if-ge v6, v0, :cond_0

    iget-object v0, v7, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    aget-object v1, v16, v6

    new-instance v2, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda19;

    invoke-direct {v2}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda19;-><init>()V

    invoke-virtual {v0, v1, v2, v14}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v5

    const/high16 v0, 0x41700000    # 15.0f

    invoke-virtual {v5, v0}, Landroid/widget/Button;->setTextSize(F)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v1, v7, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    const/high16 v2, 0x42480000    # 50.0f

    invoke-virtual {v1, v2}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v1

    invoke-direct {v0, v12, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v1, v7, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    const/high16 v2, 0x40a00000    # 5.0f

    invoke-virtual {v1, v2}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v1

    iget-object v3, v7, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v3, v2}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v2

    invoke-virtual {v0, v14, v1, v14, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v11, v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v15, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v4, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda20;

    move-object v0, v4

    move-object/from16 v1, p0

    move-object v2, v15

    move-object v3, v5

    move-object v12, v4

    move v4, v6

    move-object v14, v5

    move-object v5, v13

    move/from16 v17, v6

    move-object v6, v10

    invoke-direct/range {v0 .. v6}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda20;-><init>(Lcn/hongguo/tv/TvSettings;Ljava/util/ArrayList;Landroid/widget/Button;ILandroid/widget/ScrollView;Landroid/widget/LinearLayout;)V

    invoke-virtual {v14, v12}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda21;

    invoke-direct {v0, v7, v10}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda21;-><init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/LinearLayout;)V

    invoke-virtual {v14, v0}, Landroid/widget/Button;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    add-int/lit8 v6, v17, 0x1

    const/4 v12, -0x1

    const/4 v14, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual/range {p0 .. p1}, Lcn/hongguo/tv/TvSettings;->populate(I)V

    invoke-virtual {v15, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v7, v0}, Lcn/hongguo/tv/TvSettings;->wireRows(Landroid/view/View;)V

    iget-object v0, v7, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v15, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcn/hongguo/tv/MainActivity;->selectedStyle(Landroid/widget/Button;Z)V

    iget-object v0, v7, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v0, v10}, Lcn/hongguo/tv/MainActivity;->pageUi(Landroid/view/View;)Lcn/hongguo/tv/MainActivity$PageUi;

    move-result-object v0

    invoke-virtual {v15, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    iput-object v1, v0, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    iget-object v0, v7, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    if-ne v8, v2, :cond_1

    iget-object v1, v7, Lcn/hongguo/tv/TvSettings;->first:Landroid/view/View;

    goto :goto_1

    :cond_1
    invoke-virtual {v15, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    :goto_1
    const/4 v2, 0x0

    invoke-virtual {v0, v10, v9, v1, v2}, Lcn/hongguo/tv/MainActivity;->show(Landroid/view/View;Ljava/lang/String;Landroid/view/View;Z)V

    return-void
.end method

.method playback()V
    .locals 6

    .line 20
    new-instance v0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda24;

    invoke-direct {v0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda24;-><init>()V

    const-string v1, ""

    invoke-virtual {p0, v1, v0}, Lcn/hongguo/tv/TvSettings;->row(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/TvSettings;->updateMode(Landroid/widget/Button;)V

    new-instance v2, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda29;

    invoke-direct {v2, p0, v0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda29;-><init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/Button;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u64ad\u653e\u901f\u5ea6\uff1a"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget v2, v2, Lcn/hongguo/tv/MainActivity;->speed:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " \u500d"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda30;

    invoke-direct {v2}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda30;-><init>()V

    invoke-virtual {p0, v0, v2}, Lcn/hongguo/tv/TvSettings;->row(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    new-instance v2, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda31;

    invoke-direct {v2, p0, v0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda31;-><init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/Button;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 22
    const-string v0, "\u94fa\u6ee1\u5c4f\u5e55\uff08\u88c1\u5207\uff09"

    const-string v2, "\u62c9\u4f38\u94fa\u6ee1"

    const-string v3, "\u539f\u59cb\u6bd4\u4f8b"

    filled-new-array {v3, v0, v2}, [Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u753b\u9762\u6bd4\u4f8b\uff1a"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v3}, Lcn/hongguo/tv/MainActivity;->scaleMode()I

    move-result v3

    aget-object v3, v0, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda32;

    invoke-direct {v3}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda32;-><init>()V

    invoke-virtual {p0, v2, v3}, Lcn/hongguo/tv/TvSettings;->row(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v2

    new-instance v3, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda33;

    invoke-direct {v3, p0, v2, v0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda33;-><init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/Button;[Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u5feb\u8fdb\u9000\u6b65\u957f\uff1a"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v2}, Lcn/hongguo/tv/MainActivity;->seekSeconds()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " \u79d2"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda34;

    invoke-direct {v2}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda34;-><init>()V

    invoke-virtual {p0, v0, v2}, Lcn/hongguo/tv/TvSettings;->row(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    new-instance v2, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda35;

    invoke-direct {v2, p0, v0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda35;-><init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/Button;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 24
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v0}, Lcn/hongguo/tv/MainActivity;->sleepLabel()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda36;

    invoke-direct {v2}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda36;-><init>()V

    invoke-virtual {p0, v0, v2}, Lcn/hongguo/tv/TvSettings;->row(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    new-instance v2, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda37;

    invoke-direct {v2, p0, v0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda37;-><init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/Button;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u6e05\u6670\u5ea6\uff1a"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Lcn/hongguo/tv/PlaybackQuality;->LABELS:[Ljava/lang/String;

    iget-object v3, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v3, v3, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v4, "quality"

    const/4 v5, 0x0

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v3}, Lcn/hongguo/tv/PlaybackQuality;->index(I)I

    move-result v3

    aget-object v2, v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda25;

    invoke-direct {v2}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda25;-><init>()V

    invoke-virtual {p0, v0, v2}, Lcn/hongguo/tv/TvSettings;->row(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    .line 26
    new-instance v2, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda26;

    invoke-direct {v2, p0, v0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda26;-><init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/Button;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u6309\u53ef\u7528\u7247\u6e90\u548c\u8bbe\u5907\u80fd\u529b\u9009\u62e9\uff1b\u6ca1\u6709\u76ee\u6807\u6e05\u6670\u5ea6\u65f6\u4f7f\u7528\u8f83\u4f4e\u6863\u3002\u81ea\u52a8\u6a21\u5f0f\u5728\u4f4e\u5185\u5b58\u8bbe\u5907\u4e0a\u6700\u9ad8480p\u3002"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v2, v2, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-boolean v2, v2, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-eqz v2, :cond_1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " \u5f53\u524d "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget v3, v3, Lcn/hongguo/tv/MainActivity;->videoWidth:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\u00d7"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget v3, v3, Lcn/hongguo/tv/MainActivity;->videoHeight:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v3, v3, Lcn/hongguo/tv/MainActivity;->qualityNote:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " \u00b7 "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v3, v3, Lcn/hongguo/tv/MainActivity;->qualityNote:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/TvSettings;->note(Ljava/lang/String;)V

    .line 28
    iget-boolean v0, p0, Lcn/hongguo/tv/TvSettings;->dark:Z

    if-eqz v0, :cond_2

    new-instance v0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda27;

    invoke-direct {v0, p0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda27;-><init>(Lcn/hongguo/tv/TvSettings;)V

    const-string v1, "\u4e0a\u4e00\u96c6"

    invoke-virtual {p0, v1, v0}, Lcn/hongguo/tv/TvSettings;->row(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    new-instance v0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda28;

    invoke-direct {v0, p0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda28;-><init>(Lcn/hongguo/tv/TvSettings;)V

    const-string v1, "\u4ece\u5934\u64ad\u653e\u672c\u96c6"

    invoke-virtual {p0, v1, v0}, Lcn/hongguo/tv/TvSettings;->row(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    .line 29
    :cond_2
    return-void
.end method

.method populate(I)V
    .locals 1

    .line 64
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->list:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcn/hongguo/tv/TvSettings;->first:Landroid/view/View;

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcn/hongguo/tv/TvSettings;->playback()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    invoke-virtual {p0}, Lcn/hongguo/tv/TvSettings;->general()V

    goto :goto_0

    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    invoke-virtual {p0}, Lcn/hongguo/tv/TvSettings;->storage()V

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcn/hongguo/tv/TvSettings;->about()V

    :goto_0
    return-void
.end method

.method rate(Landroid/widget/Button;Z)V
    .locals 9

    .line 31
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    iget-object p1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    const-string p2, "\u5f53\u524d\u7cfb\u7edf\u652f\u6301\u6b63\u5e38\u901f\u5ea6\u64ad\u653e"

    invoke-static {p1, p2, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 32
    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, v1, Lcn/hongguo/tv/MainActivity;->hideChrome:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v0, 0x5

    new-array v1, v0, [F

    fill-array-data v1, :array_0

    const/4 v3, 0x1

    const/4 v7, 0x1

    :goto_0
    if-ge v2, v0, :cond_2

    aget v3, v1, v2

    iget-object v4, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget v4, v4, Lcn/hongguo/tv/MainActivity;->speed:F

    cmpl-float v3, v3, v4

    if-nez v3, :cond_1

    move v7, v2

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 33
    :cond_2
    const-string v0, "1.5 \u500d"

    const-string v2, "2.0 \u500d"

    const-string v3, "0.75 \u500d"

    const-string v4, "1.0 \u500d"

    const-string v5, "1.25 \u500d"

    filled-new-array {v3, v4, v5, v0, v2}, [Ljava/lang/String;

    move-result-object v6

    new-instance v8, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda44;

    invoke-direct {v8, p0, v1, p1, p2}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda44;-><init>(Lcn/hongguo/tv/TvSettings;[FLandroid/widget/Button;Z)V

    const-string v5, "\u64ad\u653e\u901f\u5ea6"

    move-object v3, p0

    move-object v4, p1

    invoke-virtual/range {v3 .. v8}, Lcn/hongguo/tv/TvSettings;->choose(Landroid/widget/Button;Ljava/lang/String;[Ljava/lang/String;ILcn/hongguo/tv/TvSettings$Selection;)V

    .line 34
    return-void

    nop

    :array_0
    .array-data 4
        0x3f400000    # 0.75f
        0x3f800000    # 1.0f
        0x3fa00000    # 1.25f
        0x3fc00000    # 1.5f
        0x40000000    # 2.0f
    .end array-data
.end method

.method row(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .locals 5

    .line 10
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-boolean v1, p0, Lcn/hongguo/tv/TvSettings;->dark:Z

    invoke-virtual {v0, p1, p2, v1}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object p1

    const/16 p2, 0x13

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setGravity(I)V

    const/high16 p2, 0x41800000    # 16.0f

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setTextSize(F)V

    invoke-virtual {p1}, Landroid/widget/Button;->setSingleLine()V

    sget-object p2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    const/high16 v1, 0x42480000    # 50.0f

    invoke-virtual {v0, v1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v0

    const/4 v1, -0x1

    invoke-direct {p2, v1, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    const/high16 v1, 0x40a00000    # 5.0f

    invoke-virtual {v0, v1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v0

    iget-object v2, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    const/high16 v3, 0x40800000    # 4.0f

    invoke-virtual {v2, v3}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v2

    iget-object v4, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v4, v1}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v1

    iget-object v4, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v4, v3}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v3

    invoke-virtual {p2, v0, v2, v1, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    iget-object v0, p0, Lcn/hongguo/tv/TvSettings;->list:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p2, p0, Lcn/hongguo/tv/TvSettings;->first:Landroid/view/View;

    if-nez p2, :cond_0

    iput-object p1, p0, Lcn/hongguo/tv/TvSettings;->first:Landroid/view/View;

    :cond_0
    return-object p1
.end method

.method storage()V
    .locals 3

    .line 47
    new-instance v0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda38;

    invoke-direct {v0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda38;-><init>()V

    const-string v1, "\u6e05\u7406\u64ad\u653e\u7f13\u5b58"

    invoke-virtual {p0, v1, v0}, Lcn/hongguo/tv/TvSettings;->row(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    new-instance v1, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda39;

    invoke-direct {v1, p0, v0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda39;-><init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/Button;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    const-string v0, "search_history"

    const-string v1, "[]"

    const-string v2, "\u6e05\u9664\u641c\u7d22\u5386\u53f2"

    invoke-virtual {p0, v2, v0, v1}, Lcn/hongguo/tv/TvSettings;->clearRow(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "history"

    const-string v1, "{}"

    const-string v2, "\u6e05\u9664\u89c2\u770b\u5386\u53f2"

    invoke-virtual {p0, v2, v0, v1}, Lcn/hongguo/tv/TvSettings;->clearRow(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    new-instance v0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda40;

    invoke-direct {v0, p0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda40;-><init>(Lcn/hongguo/tv/TvSettings;)V

    const-string v1, "\u7ba1\u7406\u6536\u85cf"

    invoke-virtual {p0, v1, v0}, Lcn/hongguo/tv/TvSettings;->row(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    new-instance v0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda41;

    invoke-direct {v0, p0}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda41;-><init>(Lcn/hongguo/tv/TvSettings;)V

    const-string v1, "\u7ba1\u7406\u89c2\u770b\u5386\u53f2"

    invoke-virtual {p0, v1, v0}, Lcn/hongguo/tv/TvSettings;->row(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    .line 50
    const-string v0, "\u6e05\u7406\u7f13\u5b58\u4fdd\u7559\u6536\u85cf\u3001\u89c2\u770b\u5386\u53f2\u548c\u8bbe\u7f6e\u3002\u64ad\u653e\u7f13\u5b58\u6700\u591a\u4fdd\u7559\u5f53\u524d\u4e0e\u4e0b\u4e00\u96c6\uff1b\u4f4e\u5185\u5b58\u8bbe\u5907\u6d77\u62a5\u7f13\u5b58\u4e0a\u9650 2 MiB\u3002"

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/TvSettings;->note(Ljava/lang/String;)V

    .line 51
    return-void
.end method

.method updateMode(Landroid/widget/Button;)V
    .locals 4

    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u64ad\u653e\u65b9\u5f0f\uff1a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, v1, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v2, "repeat_one"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "\u5355\u96c6\u5faa\u73af"

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, v1, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v2, "autoplay"

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "\u81ea\u52a8\u8fde\u64ad"

    goto :goto_0

    :cond_1
    const-string v1, "\u5355\u96c6\u64ad\u653e"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method wireRows(Landroid/view/View;)V
    .locals 3

    .line 67
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->list:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings;->list:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v2, v1, Landroid/widget/Button;

    if-eqz v2, :cond_0

    new-instance v2, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda14;

    invoke-direct {v2, p1}, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda14;-><init>(Landroid/view/View;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method
