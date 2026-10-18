.class public final synthetic Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda71;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/MainActivity;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:I

.field public final synthetic f$3:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/MainActivity;Ljava/lang/String;ILjava/util/ArrayList;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda71;->f$0:Lcn/hongguo/tv/MainActivity;

    iput-object p2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda71;->f$1:Ljava/lang/String;

    iput p3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda71;->f$2:I

    iput-object p4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda71;->f$3:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda71;->f$0:Lcn/hongguo/tv/MainActivity;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda71;->f$1:Ljava/lang/String;

    iget v2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda71;->f$2:I

    iget-object v3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda71;->f$3:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2, v3}, Lcn/hongguo/tv/MainActivity;->lambda$manageSaved$67$cn-hongguo-tv-MainActivity(Ljava/lang/String;ILjava/util/ArrayList;)V

    return-void
.end method
