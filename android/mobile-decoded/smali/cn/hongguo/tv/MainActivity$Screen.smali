.class Lcn/hongguo/tv/MainActivity$Screen;
.super Ljava/lang/Object;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/hongguo/tv/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Screen"
.end annotation


# instance fields
.field focus:Landroid/view/View;

.field name:Ljava/lang/String;

.field onRestore:Ljava/lang/Runnable;

.field view:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;Ljava/lang/String;)V
    .locals 0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity$Screen;->view:Landroid/view/View;

    iput-object p2, p0, Lcn/hongguo/tv/MainActivity$Screen;->name:Ljava/lang/String;

    return-void
.end method
