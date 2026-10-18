.class final Lcn/hongguo/tv/HomeFeed;
.super Ljava/lang/Object;
.source "HomeFeed.java"


# instance fields
.field final a:Lcn/hongguo/tv/MainActivity;

.field final cached:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Lcn/hongguo/tv/Catalog$Result;",
            ">;"
        }
    .end annotation
.end field

.field catalogNote:Ljava/lang/String;

.field content:Landroid/widget/LinearLayout;

.field homeQuery:Ljava/lang/String;

.field job:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation
.end field

.field lastFocusId:Ljava/lang/String;

.field loading:Z

.field message:Landroid/widget/TextView;

.field final mode:Ljava/lang/String;

.field names:[Ljava/lang/String;

.field next:Landroid/widget/Button;

.field offset:I

.field opening:Z

.field page:Landroid/widget/LinearLayout;

.field pending:Ljava/lang/Runnable;

.field pool:Lorg/json/JSONArray;

.field previous:Landroid/widget/Button;

.field refresh:Landroid/widget/Button;

.field requestId:I

.field final rows:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;>;"
        }
    .end annotation
.end field

.field scroll:Landroid/widget/ScrollView;

.field section:I

.field final tabs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/widget/Button;",
            ">;"
        }
    .end annotation
.end field

.field typeTab:Landroid/view/View;

.field ui:Lcn/hongguo/tv/MainActivity$PageUi;


# direct methods
.method constructor <init>(Lcn/hongguo/tv/MainActivity;)V
    .locals 4

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcn/hongguo/tv/HomeFeed;->tabs:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcn/hongguo/tv/HomeFeed;->rows:Ljava/util/ArrayList;

    .line 8
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lcn/hongguo/tv/HomeFeed;->pool:Lorg/json/JSONArray;

    const-string v0, ""

    iput-object v0, p0, Lcn/hongguo/tv/HomeFeed;->catalogNote:Ljava/lang/String;

    iput-object v0, p0, Lcn/hongguo/tv/HomeFeed;->lastFocusId:Ljava/lang/String;

    .line 9
    new-instance v0, Ljava/util/LinkedHashMap;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/4 v3, 0x3

    invoke-direct {v0, v3, v1, v2}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, p0, Lcn/hongguo/tv/HomeFeed;->cached:Ljava/util/LinkedHashMap;

    .line 11
    iput-object p1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity;->catalogMode:Ljava/lang/String;

    iput-object p1, p0, Lcn/hongguo/tv/HomeFeed;->mode:Ljava/lang/String;

    return-void
.end method

.method static synthetic lambda$history$13(Lorg/json/JSONObject;Lorg/json/JSONObject;)I
    .locals 3

    .line 43
    const-string v0, "updated"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v1

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide p0

    invoke-static {v1, v2, p0, p1}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic lambda$historyRow$18()V
    .locals 0

    .line 70
    return-void
.end method


# virtual methods
.method bind(Landroid/view/View;Lorg/json/JSONObject;)V
    .locals 2

    .line 67
    const-string v0, "id"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "title"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\uff0c\u786e\u8ba4\u64ad\u653e"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcn/hongguo/tv/MainActivity;->focusStyle(Landroid/view/View;Z)V

    new-instance v0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda20;

    invoke-direct {v0, p0, p2}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda20;-><init>(Lcn/hongguo/tv/HomeFeed;Lorg/json/JSONObject;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p1}, Landroid/view/View;->getOnFocusChangeListener()Landroid/view/View$OnFocusChangeListener;

    move-result-object v0

    new-instance v1, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda21;

    invoke-direct {v1, p0, v0, p2}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda21;-><init>(Lcn/hongguo/tv/HomeFeed;Landroid/view/View$OnFocusChangeListener;Lorg/json/JSONObject;)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    return-void
.end method

.method cancel()V
    .locals 3

    .line 33
    iget v0, p0, Lcn/hongguo/tv/HomeFeed;->requestId:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lcn/hongguo/tv/HomeFeed;->requestId:I

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->pending:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed;->pending:Ljava/lang/Runnable;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcn/hongguo/tv/HomeFeed;->pending:Ljava/lang/Runnable;

    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed;->job:Ljava/util/concurrent/Future;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed;->job:Ljava/util/concurrent/Future;

    invoke-interface {v2, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, v1, Lcn/hongguo/tv/MainActivity;->io:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v1}, Ljava/util/concurrent/ThreadPoolExecutor;->purge()V

    iput-object v0, p0, Lcn/hongguo/tv/HomeFeed;->job:Ljava/util/concurrent/Future;

    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/hongguo/tv/HomeFeed;->loading:Z

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->refresh:Landroid/widget/Button;

    const-string v1, "\u6362\u4e00\u6279"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method heading(Ljava/lang/String;)V
    .locals 3

    .line 66
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v1}, Lcn/hongguo/tv/MainActivity;->ink()I

    move-result v1

    const/16 v2, 0x12

    invoke-virtual {v0, p1, v2, v1}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method history()Ljava/util/ArrayList;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .line 42
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    const-string v1, "history"

    invoke-virtual {v0, v1}, Lcn/hongguo/tv/MainActivity;->bucket(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :cond_0

    const-string v4, "catalog_mode"

    const-string v5, "short"

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcn/hongguo/tv/HomeFeed;->mode:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 43
    :cond_1
    new-instance v0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda22;

    invoke-direct {v0}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda22;-><init>()V

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    return-object v1
.end method

.method historyRow(Ljava/util/ArrayList;I)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lorg/json/JSONObject;",
            ">;I)V"
        }
    .end annotation

    .line 69
    nop

    .line 70
    const/4 v0, 0x0

    const/4 v1, 0x0

    move-object v2, v0

    const/4 v3, 0x0

    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-static {p2, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    if-ge v3, v4, :cond_1

    rem-int/lit8 v4, v3, 0x3

    if-nez v4, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v0}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v0

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-object v4, p0, Lcn/hongguo/tv/HomeFeed;->rows:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v4, p0, Lcn/hongguo/tv/HomeFeed;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_0
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/json/JSONObject;

    iget-object v5, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "title"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n\u7b2c "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "episode"

    const/4 v8, 0x1

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " \u96c6 \u00b7 "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "position"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v7

    invoke-static {v7, v8}, Lcn/hongguo/tv/MainActivity;->time(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda15;

    invoke-direct {v7}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda15;-><init>()V

    invoke-virtual {v5, v6, v7, v1}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v5

    const/high16 v6, 0x41600000    # 14.0f

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setTextSize(F)V

    const/4 v6, 0x2

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setMaxLines(I)V

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object v6, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    const/high16 v7, 0x41200000    # 10.0f

    invoke-virtual {v6, v7}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v6

    iget-object v8, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v8, v7}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v7

    invoke-virtual {v5, v6, v1, v7, v1}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-virtual {p0, v5, v4}, Lcn/hongguo/tv/HomeFeed;->bind(Landroid/view/View;Lorg/json/JSONObject;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v6, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    const/high16 v7, 0x42800000    # 64.0f

    invoke-virtual {v6, v7}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v6

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v4, v1, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    iget-object v6, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    const/high16 v7, 0x40400000    # 3.0f

    invoke-virtual {v6, v7}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v6

    iget-object v8, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    const/high16 v9, 0x40800000    # 4.0f

    invoke-virtual {v8, v9}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v8

    iget-object v10, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v10, v7}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v7

    iget-object v10, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v10, v9}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v9

    invoke-virtual {v4, v6, v8, v7, v9}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v0, v5, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 71
    :cond_1
    return-void
.end method

.method synthetic lambda$bind$16$cn-hongguo-tv-HomeFeed(Lorg/json/JSONObject;Landroid/view/View;)V
    .locals 0

    .line 67
    invoke-virtual {p0, p1}, Lcn/hongguo/tv/HomeFeed;->open(Lorg/json/JSONObject;)V

    return-void
.end method

.method synthetic lambda$bind$17$cn-hongguo-tv-HomeFeed(Landroid/view/View$OnFocusChangeListener;Lorg/json/JSONObject;Landroid/view/View;Z)V
    .locals 0

    .line 67
    invoke-interface {p1, p3, p4}, Landroid/view/View$OnFocusChangeListener;->onFocusChange(Landroid/view/View;Z)V

    if-eqz p4, :cond_0

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->ui:Lcn/hongguo/tv/MainActivity$PageUi;

    iput-object p3, p1, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    const-string p1, "id"

    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcn/hongguo/tv/HomeFeed;->lastFocusId:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method synthetic lambda$load$10$cn-hongguo-tv-HomeFeed(IILcn/hongguo/tv/Catalog$Result;Ljava/lang/String;)V
    .locals 3

    .line 39
    iget v0, p0, Lcn/hongguo/tv/HomeFeed;->requestId:I

    if-ne p1, v0, :cond_5

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget p1, p1, Lcn/hongguo/tv/MainActivity;->generation:I

    if-ne p2, p1, :cond_5

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-boolean p1, p1, Lcn/hongguo/tv/MainActivity;->released:Z

    if-eqz p1, :cond_0

    goto/16 :goto_2

    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcn/hongguo/tv/HomeFeed;->loading:Z

    iget-object p2, p0, Lcn/hongguo/tv/HomeFeed;->refresh:Landroid/widget/Button;

    const-string v0, "\u6362\u4e00\u6279"

    invoke-virtual {p2, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance p2, Lorg/json/JSONArray;

    invoke-direct {p2}, Lorg/json/JSONArray;-><init>()V

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p3, Lcn/hongguo/tv/Catalog$Result;->items:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    const/16 v2, 0x14

    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p3, Lcn/hongguo/tv/Catalog$Result;->items:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p2, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    new-instance v0, Lcn/hongguo/tv/Catalog$Result;

    iget-boolean v1, p3, Lcn/hongguo/tv/Catalog$Result;->stale:Z

    iget-boolean p3, p3, Lcn/hongguo/tv/Catalog$Result;->fromCache:Z

    invoke-direct {v0, p2, v1, p3}, Lcn/hongguo/tv/Catalog$Result;-><init>(Lorg/json/JSONArray;ZZ)V

    iget-object p3, p0, Lcn/hongguo/tv/HomeFeed;->cached:Ljava/util/LinkedHashMap;

    invoke-virtual {p3, p4, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1
    iget-object p3, p0, Lcn/hongguo/tv/HomeFeed;->cached:Ljava/util/LinkedHashMap;

    invoke-virtual {p3}, Ljava/util/LinkedHashMap;->size()I

    move-result p3

    const/4 p4, 0x3

    if-le p3, p4, :cond_2

    iget-object p3, p0, Lcn/hongguo/tv/HomeFeed;->cached:Ljava/util/LinkedHashMap;

    iget-object p4, p0, Lcn/hongguo/tv/HomeFeed;->cached:Ljava/util/LinkedHashMap;

    invoke-virtual {p4}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object p4

    invoke-interface {p4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p4

    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_2
    iput-object p2, p0, Lcn/hongguo/tv/HomeFeed;->pool:Lorg/json/JSONArray;

    iget-object p2, p0, Lcn/hongguo/tv/HomeFeed;->mode:Ljava/lang/String;

    invoke-virtual {v0, p2}, Lcn/hongguo/tv/Catalog$Result;->note(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcn/hongguo/tv/HomeFeed;->catalogNote:Ljava/lang/String;

    iget-object p2, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {p2}, Lcn/hongguo/tv/MainActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object p2

    iget-object p3, p0, Lcn/hongguo/tv/HomeFeed;->refresh:Landroid/widget/Button;

    if-eq p2, p3, :cond_3

    iget-object p2, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {p2}, Lcn/hongguo/tv/MainActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object p2

    if-nez p2, :cond_4

    :cond_3
    const/4 p1, 0x1

    :cond_4
    invoke-virtual {p0, p1}, Lcn/hongguo/tv/HomeFeed;->render(Z)V

    :cond_5
    :goto_2
    return-void
.end method

.method synthetic lambda$load$11$cn-hongguo-tv-HomeFeed(II)V
    .locals 1

    .line 39
    iget v0, p0, Lcn/hongguo/tv/HomeFeed;->requestId:I

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget p1, p1, Lcn/hongguo/tv/MainActivity;->generation:I

    if-ne p2, p1, :cond_1

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-boolean p1, p1, Lcn/hongguo/tv/MainActivity;->released:Z

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcn/hongguo/tv/HomeFeed;->loading:Z

    iget-object p2, p0, Lcn/hongguo/tv/HomeFeed;->refresh:Landroid/widget/Button;

    const-string v0, "\u6362\u4e00\u6279"

    invoke-virtual {p2, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const-string p2, "\u76ee\u5f55\u6682\u4e0d\u53ef\u7528\uff0c\u8bf7\u7a0d\u540e\u6362\u4e00\u6279"

    iput-object p2, p0, Lcn/hongguo/tv/HomeFeed;->catalogNote:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/HomeFeed;->render(Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method synthetic lambda$load$12$cn-hongguo-tv-HomeFeed(Ljava/lang/String;ZII)V
    .locals 8

    .line 39
    :try_start_0
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->catalog:Lcn/hongguo/tv/Catalog;

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->mode:Ljava/lang/String;

    invoke-virtual {v0, p1, v1, p2}, Lcn/hongguo/tv/Catalog;->browsePage(Ljava/lang/String;Ljava/lang/String;Z)Lcn/hongguo/tv/Catalog$Result;

    move-result-object v6

    iget-object p2, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p2, p2, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    new-instance v0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda12;

    move-object v2, v0

    move-object v3, p0

    move v4, p3

    move v5, p4

    move-object v7, p1

    invoke-direct/range {v2 .. v7}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda12;-><init>(Lcn/hongguo/tv/HomeFeed;IILcn/hongguo/tv/Catalog$Result;Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    new-instance p2, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda13;

    invoke-direct {p2, p0, p3, p4}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda13;-><init>(Lcn/hongguo/tv/HomeFeed;II)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_0
    return-void
.end method

.method synthetic lambda$open$21$cn-hongguo-tv-HomeFeed(ILorg/json/JSONObject;Lorg/json/JSONArray;)V
    .locals 1

    .line 82
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget v0, v0, Lcn/hongguo/tv/MainActivity;->generation:I

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-boolean p1, p1, Lcn/hongguo/tv/MainActivity;->released:Z

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcn/hongguo/tv/HomeFeed;->opening:Z

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->message:Landroid/widget/TextView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {p1, p2, p3}, Lcn/hongguo/tv/MainActivity;->resumeSeries(Lorg/json/JSONObject;Lorg/json/JSONArray;)V

    :cond_1
    :goto_0
    return-void
.end method

.method synthetic lambda$open$22$cn-hongguo-tv-HomeFeed(I)V
    .locals 2

    .line 82
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget v0, v0, Lcn/hongguo/tv/MainActivity;->generation:I

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-boolean p1, p1, Lcn/hongguo/tv/MainActivity;->released:Z

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcn/hongguo/tv/HomeFeed;->opening:Z

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->message:Landroid/widget/TextView;

    const-string v1, "\u6682\u65f6\u65e0\u6cd5\u64ad\u653e\uff0c\u8bf7\u91cd\u8bd5\u6216\u6362\u4e00\u90e8"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->message:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method synthetic lambda$open$23$cn-hongguo-tv-HomeFeed(Lcn/hongguo/tv/Api;Lorg/json/JSONObject;I)V
    .locals 2

    .line 82
    if-eqz p1, :cond_1

    :try_start_0
    invoke-virtual {p1}, Lcn/hongguo/tv/Api;->ready()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/episodes?id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcn/hongguo/tv/Api;->q(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcn/hongguo/tv/Api;->json(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "series"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-static {p2, v0}, Lcn/hongguo/tv/Recommendations;->copyMetadata(Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    const-string p2, "episodes"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p2, p2, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    new-instance v1, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda18;

    invoke-direct {v1, p0, p3, v0, p1}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda18;-><init>(Lcn/hongguo/tv/HomeFeed;ILorg/json/JSONObject;Lorg/json/JSONArray;)V

    invoke-virtual {p2, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_1

    :cond_0
    new-instance p1, Ljava/lang/Exception;

    invoke-direct {p1}, Ljava/lang/Exception;-><init>()V

    :goto_0
    throw p1

    :cond_1
    new-instance p1, Ljava/lang/Exception;

    invoke-direct {p1}, Ljava/lang/Exception;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    new-instance p2, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda19;

    invoke-direct {p2, p0, p3}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda19;-><init>(Lcn/hongguo/tv/HomeFeed;I)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_1
    return-void
.end method

.method synthetic lambda$ranked$14$cn-hongguo-tv-HomeFeed(ZJLorg/json/JSONObject;Lorg/json/JSONObject;)I
    .locals 5

    .line 49
    iget v0, p0, Lcn/hongguo/tv/HomeFeed;->section:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    const-wide/16 v0, 0x0

    if-eqz p1, :cond_1

    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v2, v2, Lcn/hongguo/tv/MainActivity;->recommendations:Lcn/hongguo/tv/Recommendations;

    iget-object v3, p0, Lcn/hongguo/tv/HomeFeed;->mode:Ljava/lang/String;

    invoke-static {p4}, Lcn/hongguo/tv/Recommendations;->genre(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4, p2, p3}, Lcn/hongguo/tv/Recommendations;->score(Ljava/lang/String;Ljava/lang/String;J)D

    move-result-wide v2

    goto :goto_0

    :cond_1
    move-wide v2, v0

    :goto_0
    if-eqz p1, :cond_2

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity;->recommendations:Lcn/hongguo/tv/Recommendations;

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->mode:Ljava/lang/String;

    invoke-static {p5}, Lcn/hongguo/tv/Recommendations;->genre(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1, p2, p3}, Lcn/hongguo/tv/Recommendations;->score(Ljava/lang/String;Ljava/lang/String;J)D

    move-result-wide v0

    :cond_2
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Double;->compare(DD)I

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_1

    :cond_3
    invoke-static {p5, p2, p3}, Lcn/hongguo/tv/Recommendations;->online(Lorg/json/JSONObject;J)J

    move-result-wide v0

    invoke-static {p4, p2, p3}, Lcn/hongguo/tv/Recommendations;->online(Lorg/json/JSONObject;J)J

    move-result-wide p1

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Long;->compare(JJ)I

    move-result p1

    :goto_1
    return p1
.end method

.method synthetic lambda$render$15$cn-hongguo-tv-HomeFeed(Landroid/view/View;)V
    .locals 2

    .line 64
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity$Screen;->view:Landroid/view/View;

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->page:Landroid/widget/LinearLayout;

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->requestFocusFromTouch()Z

    :cond_0
    return-void
.end method

.method synthetic lambda$select$8$cn-hongguo-tv-HomeFeed(I)V
    .locals 1

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lcn/hongguo/tv/HomeFeed;->pending:Ljava/lang/Runnable;

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget v0, v0, Lcn/hongguo/tv/MainActivity;->generation:I

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-boolean p1, p1, Lcn/hongguo/tv/MainActivity;->released:Z

    if-nez p1, :cond_0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/HomeFeed;->load(Z)V

    :cond_0
    return-void
.end method

.method synthetic lambda$show$0$cn-hongguo-tv-HomeFeed(I)V
    .locals 0

    .line 16
    invoke-virtual {p0, p1}, Lcn/hongguo/tv/HomeFeed;->select(I)V

    return-void
.end method

.method synthetic lambda$show$1$cn-hongguo-tv-HomeFeed(ILandroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 16
    invoke-virtual {p4}, Landroid/view/KeyEvent;->getAction()I

    move-result p2

    const/4 p4, 0x0

    if-eqz p2, :cond_0

    return p4

    :cond_0
    const/16 p2, 0x13

    const/4 v0, 0x1

    if-ne p3, p2, :cond_1

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->typeTab:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->requestFocusFromTouch()Z

    return v0

    :cond_1
    const/16 p2, 0x14

    if-ne p3, p2, :cond_2

    iget-object p2, p0, Lcn/hongguo/tv/HomeFeed;->ui:Lcn/hongguo/tv/MainActivity$PageUi;

    iget-object p2, p2, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    if-eqz p2, :cond_2

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->ui:Lcn/hongguo/tv/MainActivity$PageUi;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->requestFocusFromTouch()Z

    return v0

    :cond_2
    const/16 p2, 0x15

    if-ne p3, p2, :cond_4

    if-nez p1, :cond_3

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->ui:Lcn/hongguo/tv/MainActivity$PageUi;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity$PageUi;->activeRail:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->requestFocusFromTouch()Z

    goto :goto_0

    :cond_3
    iget-object p2, p0, Lcn/hongguo/tv/HomeFeed;->tabs:Ljava/util/ArrayList;

    sub-int/2addr p1, v0

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    invoke-virtual {p1}, Landroid/widget/Button;->requestFocusFromTouch()Z

    :goto_0
    return v0

    :cond_4
    const/16 p2, 0x16

    if-ne p3, p2, :cond_5

    iget-object p2, p0, Lcn/hongguo/tv/HomeFeed;->tabs:Ljava/util/ArrayList;

    iget-object p3, p0, Lcn/hongguo/tv/HomeFeed;->tabs:Ljava/util/ArrayList;

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p3

    sub-int/2addr p3, v0

    add-int/2addr p1, v0

    invoke-static {p3, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    invoke-virtual {p1}, Landroid/widget/Button;->requestFocusFromTouch()Z

    return v0

    :cond_5
    return p4
.end method

.method synthetic lambda$show$2$cn-hongguo-tv-HomeFeed()V
    .locals 2

    .line 20
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcn/hongguo/tv/MainActivity;->recommendNext(Lorg/json/JSONObject;)V

    return-void
.end method

.method synthetic lambda$show$3$cn-hongguo-tv-HomeFeed()V
    .locals 2

    .line 20
    iget v0, p0, Lcn/hongguo/tv/HomeFeed;->offset:I

    invoke-virtual {p0}, Lcn/hongguo/tv/HomeFeed;->pageSize()I

    move-result v1

    sub-int/2addr v0, v1

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcn/hongguo/tv/HomeFeed;->offset:I

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/HomeFeed;->render(Z)V

    return-void
.end method

.method synthetic lambda$show$4$cn-hongguo-tv-HomeFeed()V
    .locals 2

    .line 20
    iget v0, p0, Lcn/hongguo/tv/HomeFeed;->offset:I

    invoke-virtual {p0}, Lcn/hongguo/tv/HomeFeed;->pageSize()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcn/hongguo/tv/HomeFeed;->offset:I

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/HomeFeed;->render(Z)V

    return-void
.end method

.method synthetic lambda$show$5$cn-hongguo-tv-HomeFeed()V
    .locals 1

    .line 20
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/HomeFeed;->load(Z)V

    return-void
.end method

.method synthetic lambda$show$6$cn-hongguo-tv-HomeFeed()V
    .locals 3

    .line 21
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/hongguo/tv/HomeFeed;->opening:Z

    iget-boolean v1, p0, Lcn/hongguo/tv/HomeFeed;->loading:Z

    invoke-virtual {p0}, Lcn/hongguo/tv/HomeFeed;->cancel()V

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcn/hongguo/tv/HomeFeed;->render(Z)V

    if-eqz v1, :cond_0

    invoke-virtual {p0, v0}, Lcn/hongguo/tv/HomeFeed;->load(Z)V

    :cond_0
    return-void
.end method

.method synthetic lambda$tabStyle$9$cn-hongguo-tv-HomeFeed(Landroid/view/View$OnFocusChangeListener;ILandroid/view/View;Z)V
    .locals 0

    .line 35
    invoke-interface {p1, p3, p4}, Landroid/view/View$OnFocusChangeListener;->onFocusChange(Landroid/view/View;Z)V

    if-eqz p4, :cond_0

    invoke-virtual {p0, p2}, Lcn/hongguo/tv/HomeFeed;->select(I)V

    :cond_0
    return-void
.end method

.method synthetic lambda$wire$19$cn-hongguo-tv-HomeFeed(IILandroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 2

    .line 77
    invoke-virtual {p5}, Landroid/view/KeyEvent;->getAction()I

    move-result p3

    const/4 p5, 0x0

    if-eqz p3, :cond_0

    return p5

    :cond_0
    const/16 p3, 0x15

    const/4 v0, 0x1

    if-ne p4, p3, :cond_2

    if-nez p1, :cond_1

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->ui:Lcn/hongguo/tv/MainActivity$PageUi;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity$PageUi;->activeRail:Landroid/view/View;

    goto :goto_0

    :cond_1
    iget-object p3, p0, Lcn/hongguo/tv/HomeFeed;->rows:Ljava/util/ArrayList;

    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/ArrayList;

    sub-int/2addr p1, v0

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->requestFocusFromTouch()Z

    return v0

    :cond_2
    const/16 p3, 0x16

    if-ne p4, p3, :cond_3

    iget-object p3, p0, Lcn/hongguo/tv/HomeFeed;->rows:Ljava/util/ArrayList;

    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/util/ArrayList;

    add-int/2addr p1, v0

    iget-object p4, p0, Lcn/hongguo/tv/HomeFeed;->rows:Ljava/util/ArrayList;

    invoke-virtual {p4, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    sub-int/2addr p2, v0

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->requestFocusFromTouch()Z

    return v0

    :cond_3
    const/16 p3, 0x13

    if-eq p4, p3, :cond_5

    const/16 v1, 0x14

    if-ne p4, v1, :cond_4

    goto :goto_1

    :cond_4
    return p5

    :cond_5
    :goto_1
    if-ne p4, p3, :cond_6

    const/4 p3, -0x1

    goto :goto_2

    :cond_6
    const/4 p3, 0x1

    :goto_2
    add-int/2addr p2, p3

    if-gez p2, :cond_7

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->tabs:Ljava/util/ArrayList;

    iget p2, p0, Lcn/hongguo/tv/HomeFeed;->section:I

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    :goto_3
    invoke-virtual {p1}, Landroid/widget/Button;->requestFocusFromTouch()Z

    goto :goto_4

    :cond_7
    iget-object p3, p0, Lcn/hongguo/tv/HomeFeed;->rows:Ljava/util/ArrayList;

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p3

    if-lt p2, p3, :cond_8

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->refresh:Landroid/widget/Button;

    goto :goto_3

    :cond_8
    iget-object p3, p0, Lcn/hongguo/tv/HomeFeed;->rows:Ljava/util/ArrayList;

    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/util/ArrayList;

    iget-object p4, p0, Lcn/hongguo/tv/HomeFeed;->rows:Ljava/util/ArrayList;

    invoke-virtual {p4, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    sub-int/2addr p2, v0

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->requestFocusFromTouch()Z

    :goto_4
    return v0
.end method

.method synthetic lambda$wire$20$cn-hongguo-tv-HomeFeed(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 78
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    const/4 p3, 0x0

    if-nez p1, :cond_0

    const/16 p1, 0x13

    if-ne p2, p1, :cond_0

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->rows:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->rows:Ljava/util/ArrayList;

    iget-object p2, p0, Lcn/hongguo/tv/HomeFeed;->rows:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    const/4 v0, 0x1

    sub-int/2addr p2, v0

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->requestFocusFromTouch()Z

    return v0

    :cond_0
    return p3
.end method

.method synthetic lambda$wireHeader$7$cn-hongguo-tv-HomeFeed(ILjava/util/ArrayList;Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 26
    invoke-virtual {p5}, Landroid/view/KeyEvent;->getAction()I

    move-result p3

    const/4 p5, 0x0

    if-eqz p3, :cond_0

    return p5

    .line 27
    :cond_0
    const/16 p3, 0x13

    const/4 v0, 0x1

    if-ne p4, p3, :cond_1

    return v0

    :cond_1
    const/16 p3, 0x14

    if-ne p4, p3, :cond_2

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->tabs:Ljava/util/ArrayList;

    iget p2, p0, Lcn/hongguo/tv/HomeFeed;->section:I

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    invoke-virtual {p1}, Landroid/widget/Button;->requestFocusFromTouch()Z

    return v0

    .line 28
    :cond_2
    const/16 p3, 0x15

    if-ne p4, p3, :cond_4

    if-nez p1, :cond_3

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->ui:Lcn/hongguo/tv/MainActivity$PageUi;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity$PageUi;->activeRail:Landroid/view/View;

    goto :goto_0

    :cond_3
    sub-int/2addr p1, v0

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->requestFocusFromTouch()Z

    return v0

    .line 29
    :cond_4
    const/16 p3, 0x16

    if-ne p4, p3, :cond_5

    add-int/2addr p1, v0

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p3

    sub-int/2addr p3, v0

    invoke-static {p1, p3}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->requestFocusFromTouch()Z

    return v0

    :cond_5
    return p5
.end method

.method load(Z)V
    .locals 8

    .line 37
    invoke-virtual {p0}, Lcn/hongguo/tv/HomeFeed;->cancel()V

    iget v0, p0, Lcn/hongguo/tv/HomeFeed;->section:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    invoke-virtual {p0, v1}, Lcn/hongguo/tv/HomeFeed;->render(Z)V

    return-void

    :cond_0
    iput-boolean v2, p0, Lcn/hongguo/tv/HomeFeed;->loading:Z

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->refresh:Landroid/widget/Button;

    const-string v2, "\u52a0\u8f7d\u4e2d\u2026"

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->message:Landroid/widget/TextView;

    const-string v2, "\u6b63\u5728\u52a0\u8f7d\u2026"

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->message:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 38
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget v6, v0, Lcn/hongguo/tv/MainActivity;->generation:I

    iget v5, p0, Lcn/hongguo/tv/HomeFeed;->requestId:I

    invoke-virtual {p0}, Lcn/hongguo/tv/HomeFeed;->query()Ljava/lang/String;

    move-result-object v3

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->api:Lcn/hongguo/tv/Api;

    .line 39
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->io:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v7, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda23;

    move-object v1, v7

    move-object v2, p0

    move v4, p1

    invoke-direct/range {v1 .. v6}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda23;-><init>(Lcn/hongguo/tv/HomeFeed;Ljava/lang/String;ZII)V

    invoke-virtual {v0, v7}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object p1

    iput-object p1, p0, Lcn/hongguo/tv/HomeFeed;->job:Ljava/util/concurrent/Future;

    .line 40
    return-void
.end method

.method open(Lorg/json/JSONObject;)V
    .locals 4

    .line 81
    iget-boolean v0, p0, Lcn/hongguo/tv/HomeFeed;->opening:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/hongguo/tv/HomeFeed;->opening:Z

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->message:Landroid/widget/TextView;

    const-string v1, "\u6b63\u5728\u51c6\u5907\u64ad\u653e\u2026"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->message:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget v0, v0, Lcn/hongguo/tv/MainActivity;->generation:I

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, v1, Lcn/hongguo/tv/MainActivity;->api:Lcn/hongguo/tv/Api;

    .line 82
    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v2, v2, Lcn/hongguo/tv/MainActivity;->io:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v3, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda1;

    invoke-direct {v3, p0, v1, p1, v0}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda1;-><init>(Lcn/hongguo/tv/HomeFeed;Lcn/hongguo/tv/Api;Lorg/json/JSONObject;I)V

    invoke-virtual {v2, v3}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 83
    return-void
.end method

.method pageSize()I
    .locals 1

    .line 31
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->memory:Lcn/hongguo/tv/MemoryProfile;

    iget-boolean v0, v0, Lcn/hongguo/tv/MemoryProfile;->lowRam:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x6

    :goto_0
    return v0
.end method

.method query()Ljava/lang/String;
    .locals 2

    .line 32
    iget v0, p0, Lcn/hongguo/tv/HomeFeed;->section:I

    const/4 v1, 0x3

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->names:[Ljava/lang/String;

    iget v1, p0, Lcn/hongguo/tv/HomeFeed;->section:I

    aget-object v0, v0, v1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->homeQuery:Ljava/lang/String;

    :goto_0
    return-object v0
.end method

.method ranked()Ljava/util/ArrayList;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .line 46
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 47
    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    iget-object v6, p0, Lcn/hongguo/tv/HomeFeed;->pool:Lorg/json/JSONArray;

    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v6

    const/16 v7, 0x3c

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    if-ge v5, v6, :cond_1

    iget-object v6, p0, Lcn/hongguo/tv/HomeFeed;->pool:Lorg/json/JSONArray;

    invoke-virtual {v6, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    if-eqz v6, :cond_0

    const-string v7, "id"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_0

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 48
    :cond_1
    iget-object v3, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v3, v3, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v5, "personal_recommendations"

    const/4 v6, 0x1

    invoke-interface {v3, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v3, v3, Lcn/hongguo/tv/MainActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v5, "record_history"

    invoke-interface {v3, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v4, 0x1

    .line 49
    :cond_2
    new-instance v3, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, v4, v0, v1}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda0;-><init>(Lcn/hongguo/tv/HomeFeed;ZJ)V

    invoke-static {v2, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    return-object v2
.end method

.method render(Z)V
    .locals 10

    .line 52
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->lastFocusId:Ljava/lang/String;

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->hasFocus()Z

    move-result v1

    .line 53
    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v2, v2, Lcn/hongguo/tv/MainActivity;->coverIo:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v2}, Ljava/util/concurrent/ThreadPoolExecutor;->getQueue()Ljava/util/concurrent/BlockingQueue;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/BlockingQueue;->clear()V

    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->removeAllViews()V

    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed;->rows:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed;->scroll:Landroid/widget/ScrollView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v3}, Landroid/widget/ScrollView;->scrollTo(II)V

    const/4 v2, 0x0

    :goto_0
    iget-object v4, p0, Lcn/hongguo/tv/HomeFeed;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v2, v4, :cond_0

    iget-object v4, p0, Lcn/hongguo/tv/HomeFeed;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    invoke-virtual {p0, v4, v2}, Lcn/hongguo/tv/HomeFeed;->tabStyle(Landroid/widget/Button;I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed;->ui:Lcn/hongguo/tv/MainActivity$PageUi;

    iget-object v4, p0, Lcn/hongguo/tv/HomeFeed;->tabs:Ljava/util/ArrayList;

    iget v5, p0, Lcn/hongguo/tv/HomeFeed;->section:I

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    iput-object v4, v2, Lcn/hongguo/tv/MainActivity$PageUi;->top:Landroid/view/View;

    .line 54
    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed;->message:Landroid/widget/TextView;

    iget-boolean v4, p0, Lcn/hongguo/tv/HomeFeed;->loading:Z

    if-eqz v4, :cond_1

    const-string v4, "\u6b63\u5728\u52a0\u8f7d\u2026"

    goto :goto_1

    :cond_1
    iget-object v4, p0, Lcn/hongguo/tv/HomeFeed;->catalogNote:Ljava/lang/String;

    :goto_1
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed;->message:Landroid/widget/TextView;

    iget-boolean v4, p0, Lcn/hongguo/tv/HomeFeed;->loading:Z

    if-nez v4, :cond_2

    iget-object v4, p0, Lcn/hongguo/tv/HomeFeed;->catalogNote:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_2

    const/16 v4, 0x8

    goto :goto_2

    :cond_2
    const/4 v4, 0x0

    :goto_2
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 55
    invoke-virtual {p0}, Lcn/hongguo/tv/HomeFeed;->history()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {p0}, Lcn/hongguo/tv/HomeFeed;->ranked()Ljava/util/ArrayList;

    move-result-object v4

    .line 56
    iget v5, p0, Lcn/hongguo/tv/HomeFeed;->section:I

    const/16 v6, 0x12

    const/4 v7, 0x1

    if-ne v5, v7, :cond_5

    const-string v5, "\u7ee7\u7eed\u89c2\u770b"

    invoke-virtual {p0, v5}, Lcn/hongguo/tv/HomeFeed;->heading(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_3

    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed;->content:Landroid/widget/LinearLayout;

    iget-object v5, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v8, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v8}, Lcn/hongguo/tv/MainActivity;->muted()I

    move-result v8

    const-string v9, "\u8fd8\u6ca1\u6709\u89c2\u770b\u8bb0\u5f55\uff0c\u53bb\u63a8\u8350\u9875\u6311\u4e00\u90e8\u5427"

    invoke-virtual {v5, v9, v6, v8}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_5

    :cond_3
    iget-object v5, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v5, v5, Lcn/hongguo/tv/MainActivity;->memory:Lcn/hongguo/tv/MemoryProfile;

    iget-boolean v5, v5, Lcn/hongguo/tv/MemoryProfile;->lowRam:Z

    if-eqz v5, :cond_4

    const/4 v5, 0x4

    goto :goto_3

    :cond_4
    const/4 v5, 0x6

    :goto_3
    invoke-virtual {p0, v2, v5}, Lcn/hongguo/tv/HomeFeed;->historyRow(Ljava/util/ArrayList;I)V

    goto :goto_5

    .line 58
    :cond_5
    iget v2, p0, Lcn/hongguo/tv/HomeFeed;->offset:I

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lt v2, v5, :cond_6

    iput v3, p0, Lcn/hongguo/tv/HomeFeed;->offset:I

    .line 59
    :cond_6
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_7

    iget v2, p0, Lcn/hongguo/tv/HomeFeed;->offset:I

    invoke-virtual {p0}, Lcn/hongguo/tv/HomeFeed;->pageSize()I

    move-result v5

    invoke-virtual {p0, v4, v2, v5}, Lcn/hongguo/tv/HomeFeed;->shelf(Ljava/util/ArrayList;II)V

    .line 60
    :cond_7
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_9

    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed;->content:Landroid/widget/LinearLayout;

    iget-object v5, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-boolean v8, p0, Lcn/hongguo/tv/HomeFeed;->loading:Z

    if-eqz v8, :cond_8

    const-string v8, "\u6b63\u5728\u627e\u597d\u5267\u2026"

    goto :goto_4

    :cond_8
    const-string v8, "\u6682\u65f6\u6ca1\u6709\u63a8\u8350\uff0c\u8bd5\u8bd5\u6362\u4e00\u6279"

    :goto_4
    iget-object v9, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v9}, Lcn/hongguo/tv/MainActivity;->muted()I

    move-result v9

    invoke-virtual {v5, v8, v6, v9}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 62
    :cond_9
    :goto_5
    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed;->previous:Landroid/widget/Button;

    iget v5, p0, Lcn/hongguo/tv/HomeFeed;->section:I

    if-eq v5, v7, :cond_a

    iget v5, p0, Lcn/hongguo/tv/HomeFeed;->offset:I

    if-lez v5, :cond_a

    const/4 v5, 0x1

    goto :goto_6

    :cond_a
    const/4 v5, 0x0

    :goto_6
    invoke-virtual {v2, v5}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed;->next:Landroid/widget/Button;

    iget v5, p0, Lcn/hongguo/tv/HomeFeed;->section:I

    if-eq v5, v7, :cond_b

    iget v5, p0, Lcn/hongguo/tv/HomeFeed;->offset:I

    invoke-virtual {p0}, Lcn/hongguo/tv/HomeFeed;->pageSize()I

    move-result v6

    add-int/2addr v5, v6

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v5, v4, :cond_b

    goto :goto_7

    :cond_b
    const/4 v7, 0x0

    :goto_7
    invoke-virtual {v2, v7}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-virtual {p0}, Lcn/hongguo/tv/HomeFeed;->wire()V

    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed;->ui:Lcn/hongguo/tv/MainActivity$PageUi;

    iget-object v4, p0, Lcn/hongguo/tv/HomeFeed;->rows:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_c

    iget-object v3, p0, Lcn/hongguo/tv/HomeFeed;->refresh:Landroid/widget/Button;

    goto :goto_8

    :cond_c
    iget-object v4, p0, Lcn/hongguo/tv/HomeFeed;->rows:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    :goto_8
    iput-object v3, v2, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed;->ui:Lcn/hongguo/tv/MainActivity$PageUi;

    iget-object v2, v2, Lcn/hongguo/tv/MainActivity$PageUi;->content:Landroid/view/View;

    .line 63
    if-eqz v0, :cond_f

    iget-object v3, p0, Lcn/hongguo/tv/HomeFeed;->rows:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_f

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_e
    :goto_9
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_d

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_e

    move-object v2, v5

    goto :goto_9

    .line 64
    :cond_f
    if-nez v1, :cond_10

    if-eqz p1, :cond_11

    :cond_10
    new-instance p1, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda3;

    invoke-direct {p1, p0, v2}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda3;-><init>(Lcn/hongguo/tv/HomeFeed;Landroid/view/View;)V

    invoke-virtual {v2, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 65
    :cond_11
    return-void
.end method

.method select(I)V
    .locals 3

    .line 34
    iget v0, p0, Lcn/hongguo/tv/HomeFeed;->section:I

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcn/hongguo/tv/HomeFeed;->cancel()V

    iput p1, p0, Lcn/hongguo/tv/HomeFeed;->section:I

    const/4 p1, 0x0

    iput p1, p0, Lcn/hongguo/tv/HomeFeed;->offset:I

    const-string v0, ""

    iput-object v0, p0, Lcn/hongguo/tv/HomeFeed;->lastFocusId:Ljava/lang/String;

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    iput-object v1, p0, Lcn/hongguo/tv/HomeFeed;->pool:Lorg/json/JSONArray;

    iput-object v0, p0, Lcn/hongguo/tv/HomeFeed;->catalogNote:Ljava/lang/String;

    iget v0, p0, Lcn/hongguo/tv/HomeFeed;->section:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/HomeFeed;->render(Z)V

    return-void

    :cond_1
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->cached:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Lcn/hongguo/tv/HomeFeed;->query()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcn/hongguo/tv/Catalog$Result;

    if-eqz v0, :cond_2

    iget-object v1, v0, Lcn/hongguo/tv/Catalog$Result;->items:Lorg/json/JSONArray;

    iput-object v1, p0, Lcn/hongguo/tv/HomeFeed;->pool:Lorg/json/JSONArray;

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->mode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcn/hongguo/tv/Catalog$Result;->note(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcn/hongguo/tv/HomeFeed;->catalogNote:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/HomeFeed;->render(Z)V

    return-void

    :cond_2
    iput-boolean v1, p0, Lcn/hongguo/tv/HomeFeed;->loading:Z

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/HomeFeed;->render(Z)V

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget p1, p1, Lcn/hongguo/tv/MainActivity;->generation:I

    new-instance v0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda14;

    invoke-direct {v0, p0, p1}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda14;-><init>(Lcn/hongguo/tv/HomeFeed;I)V

    iput-object v0, p0, Lcn/hongguo/tv/HomeFeed;->pending:Ljava/lang/Runnable;

    iget-object p1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->pending:Ljava/lang/Runnable;

    const-wide/16 v1, 0xa0

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method shelf(Ljava/util/ArrayList;II)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lorg/json/JSONObject;",
            ">;II)V"
        }
    .end annotation

    .line 73
    move-object/from16 v0, p0

    move/from16 v1, p3

    iget-object v2, v0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v2}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v2

    const/16 v3, 0x30

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 74
    move/from16 v4, p2

    :goto_0
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int v6, p2, v1

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v5

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v7, 0x0

    if-ge v4, v5, :cond_0

    move-object/from16 v5, p1

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/json/JSONObject;

    iget-object v9, v0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v9}, Lcn/hongguo/tv/MainActivity;->column()Landroid/widget/LinearLayout;

    move-result-object v9

    iget-object v10, v0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    const/high16 v11, 0x40800000    # 4.0f

    invoke-virtual {v10, v11}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v10

    iget-object v12, v0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v12, v11}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v12

    iget-object v13, v0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v13, v11}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v13

    iget-object v14, v0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v14, v11}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v14

    invoke-virtual {v9, v10, v12, v13, v14}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-virtual {v0, v9, v8}, Lcn/hongguo/tv/HomeFeed;->bind(Landroid/view/View;Lorg/json/JSONObject;)V

    new-instance v10, Landroid/widget/ImageView;

    iget-object v12, v0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-direct {v10, v12}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iget-object v12, v0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    const v13, -0xf1714

    invoke-virtual {v12, v13}, Lcn/hongguo/tv/MainActivity;->themedFill(I)I

    move-result v12

    invoke-virtual {v10, v12}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    sget-object v12, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v10, v12}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v13, v0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    const/high16 v14, 0x434a0000    # 202.0f

    invoke-virtual {v13, v14}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v13

    const/4 v14, -0x1

    invoke-direct {v12, v14, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v9, v10, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v12, v0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    const-string v13, "title"

    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    iget-object v14, v0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v14}, Lcn/hongguo/tv/MainActivity;->ink()I

    move-result v14

    const/16 v15, 0xe

    invoke-virtual {v12, v13, v15, v14}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v12

    const/4 v13, 0x2

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setLines(I)V

    sget-object v13, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-virtual {v9, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v13, -0x2

    invoke-direct {v12, v7, v13, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    iget-object v6, v0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    const/high16 v7, 0x40400000    # 3.0f

    invoke-virtual {v6, v7}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v6

    iget-object v13, v0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v13, v11}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v13

    iget-object v14, v0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v14, v7}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v7

    iget-object v14, v0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v14, v11}, Lcn/hongguo/tv/MainActivity;->dp(F)I

    move-result v11

    invoke-virtual {v12, v6, v13, v7, v11}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v2, v9, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v6, v0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    const-string v7, "id"

    invoke-virtual {v8, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v10}, Lcn/hongguo/tv/MainActivity;->loadCover(Ljava/lang/String;Landroid/widget/ImageView;)V

    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 75
    :cond_0
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    :goto_1
    if-ge v4, v1, :cond_1

    new-instance v5, Landroid/view/View;

    iget-object v8, v0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-direct {v5, v8}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, 0x1

    invoke-direct {v8, v7, v9, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v5, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_1
    iget-object v1, v0, Lcn/hongguo/tv/HomeFeed;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v1, v0, Lcn/hongguo/tv/HomeFeed;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 76
    return-void
.end method

.method show(Z)V
    .locals 12

    .line 13
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->mode:Ljava/lang/String;

    const-string v2, "ai"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v3, "\u6f2b\u5267"

    const-string v4, "\u63a8\u8350"

    const-string v5, "AI\u5267"

    const-string v6, "manju"

    if-eqz v1, :cond_0

    move-object v1, v5

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->mode:Ljava/lang/String;

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    move-object v1, v3

    goto :goto_0

    :cond_1
    move-object v1, v4

    :goto_0
    invoke-virtual {v0, v1}, Lcn/hongguo/tv/MainActivity;->shell(Ljava/lang/String;)Landroid/widget/LinearLayout;

    move-result-object v0

    iput-object v0, p0, Lcn/hongguo/tv/HomeFeed;->page:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->page:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Lcn/hongguo/tv/MainActivity;->pageUi(Landroid/view/View;)Lcn/hongguo/tv/MainActivity$PageUi;

    move-result-object v0

    iput-object v0, p0, Lcn/hongguo/tv/HomeFeed;->ui:Lcn/hongguo/tv/MainActivity$PageUi;

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->ui:Lcn/hongguo/tv/MainActivity$PageUi;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity$PageUi;->top:Landroid/view/View;

    iput-object v0, p0, Lcn/hongguo/tv/HomeFeed;->typeTab:Landroid/view/View;

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->ui:Lcn/hongguo/tv/MainActivity$PageUi;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity$PageUi;->heading:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 14
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v0}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->mode:Ljava/lang/String;

    invoke-static {v1}, Lcn/hongguo/tv/PublicCategories;->genres(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v7, v1

    const/4 v8, 0x3

    add-int/2addr v7, v8

    new-array v7, v7, [Ljava/lang/String;

    iput-object v7, p0, Lcn/hongguo/tv/HomeFeed;->names:[Ljava/lang/String;

    iget-object v7, p0, Lcn/hongguo/tv/HomeFeed;->names:[Ljava/lang/String;

    const/4 v9, 0x0

    aput-object v4, v7, v9

    iget-object v4, p0, Lcn/hongguo/tv/HomeFeed;->names:[Ljava/lang/String;

    const-string v7, "\u7ee7\u7eed\u770b"

    const/4 v10, 0x1

    aput-object v7, v4, v10

    iget-object v4, p0, Lcn/hongguo/tv/HomeFeed;->names:[Ljava/lang/String;

    const/4 v7, 0x2

    const-string v11, "\u5168\u90e8"

    aput-object v11, v4, v7

    iget-object v4, p0, Lcn/hongguo/tv/HomeFeed;->names:[Ljava/lang/String;

    array-length v7, v1

    invoke-static {v1, v9, v4, v8, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 15
    iput-object v11, p0, Lcn/hongguo/tv/HomeFeed;->homeQuery:Ljava/lang/String;

    .line 16
    const/4 v1, 0x0

    :goto_1
    iget-object v4, p0, Lcn/hongguo/tv/HomeFeed;->names:[Ljava/lang/String;

    array-length v4, v4

    if-ge v1, v4, :cond_2

    iget-object v4, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v7, p0, Lcn/hongguo/tv/HomeFeed;->names:[Ljava/lang/String;

    aget-object v7, v7, v1

    new-instance v8, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda5;

    invoke-direct {v8, p0, v1}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda5;-><init>(Lcn/hongguo/tv/HomeFeed;I)V

    invoke-virtual {v4, v7, v8, v9}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v4

    const/high16 v7, 0x41800000    # 16.0f

    invoke-virtual {v4, v7}, Landroid/widget/Button;->setTextSize(F)V

    iget-object v7, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v7, v0, v4}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    iget-object v7, p0, Lcn/hongguo/tv/HomeFeed;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v4, v1}, Lcn/hongguo/tv/HomeFeed;->tabStyle(Landroid/widget/Button;I)V

    new-instance v7, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda6;

    invoke-direct {v7, p0, v1}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda6;-><init>(Lcn/hongguo/tv/HomeFeed;I)V

    invoke-virtual {v4, v7}, Landroid/widget/Button;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 17
    :cond_2
    new-instance v1, Landroid/widget/HorizontalScrollView;

    iget-object v4, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-direct {v1, v4}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v9}, Landroid/widget/HorizontalScrollView;->setFocusable(Z)V

    invoke-virtual {v1, v9}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    invoke-virtual {v1, v0}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v4, p0, Lcn/hongguo/tv/HomeFeed;->page:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v4}, Lcn/hongguo/tv/MainActivity;->body(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 18
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v1}, Lcn/hongguo/tv/MainActivity;->muted()I

    move-result v1

    const-string v4, "\u6b63\u5728\u52a0\u8f7d\u2026"

    const/16 v7, 0xd

    invoke-virtual {v0, v4, v7, v1}, Lcn/hongguo/tv/MainActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, p0, Lcn/hongguo/tv/HomeFeed;->message:Landroid/widget/TextView;

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->page:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Lcn/hongguo/tv/MainActivity;->body(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->message:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 19
    new-instance v0, Landroid/widget/ScrollView;

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-direct {v0, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcn/hongguo/tv/HomeFeed;->scroll:Landroid/widget/ScrollView;

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0, v9}, Landroid/widget/ScrollView;->setFocusable(Z)V

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0, v9}, Landroid/widget/ScrollView;->setClipToPadding(Z)V

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v0}, Lcn/hongguo/tv/MainActivity;->column()Landroid/widget/LinearLayout;

    move-result-object v0

    iput-object v0, p0, Lcn/hongguo/tv/HomeFeed;->content:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->scroll:Landroid/widget/ScrollView;

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->page:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Lcn/hongguo/tv/MainActivity;->body(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->scroll:Landroid/widget/ScrollView;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x1

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v4, v7, v9, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v0}, Lcn/hongguo/tv/MainActivity;->row()Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    new-instance v4, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda7;

    invoke-direct {v4, p0}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda7;-><init>(Lcn/hongguo/tv/HomeFeed;)V

    const-string v7, "\u968f\u4fbf\u770b\u770b"

    invoke-virtual {v1, v7, v4, v9}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v1

    const/high16 v4, 0x41600000    # 14.0f

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setTextSize(F)V

    iget-object v7, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v7, v0, v1}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    new-instance v1, Landroid/view/View;

    iget-object v7, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    invoke-direct {v1, v7}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v9, v10, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    new-instance v7, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda8;

    invoke-direct {v7, p0}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda8;-><init>(Lcn/hongguo/tv/HomeFeed;)V

    const-string v8, "\u4e0a\u4e00\u9875"

    invoke-virtual {v1, v8, v7, v9}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v1

    iput-object v1, p0, Lcn/hongguo/tv/HomeFeed;->previous:Landroid/widget/Button;

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    new-instance v7, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda9;

    invoke-direct {v7, p0}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda9;-><init>(Lcn/hongguo/tv/HomeFeed;)V

    const-string v8, "\u4e0b\u4e00\u9875"

    invoke-virtual {v1, v8, v7, v9}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v1

    iput-object v1, p0, Lcn/hongguo/tv/HomeFeed;->next:Landroid/widget/Button;

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->previous:Landroid/widget/Button;

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setTextSize(F)V

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->next:Landroid/widget/Button;

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setTextSize(F)V

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v7, p0, Lcn/hongguo/tv/HomeFeed;->previous:Landroid/widget/Button;

    invoke-virtual {v1, v0, v7}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v7, p0, Lcn/hongguo/tv/HomeFeed;->next:Landroid/widget/Button;

    invoke-virtual {v1, v0, v7}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    new-instance v7, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda10;

    invoke-direct {v7, p0}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda10;-><init>(Lcn/hongguo/tv/HomeFeed;)V

    const-string v8, "\u6362\u4e00\u6279"

    invoke-virtual {v1, v8, v7, v9}, Lcn/hongguo/tv/MainActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;Z)Landroid/widget/Button;

    move-result-object v1

    iput-object v1, p0, Lcn/hongguo/tv/HomeFeed;->refresh:Landroid/widget/Button;

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->refresh:Landroid/widget/Button;

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setTextSize(F)V

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v4, p0, Lcn/hongguo/tv/HomeFeed;->refresh:Landroid/widget/Button;

    invoke-virtual {v1, v0, v4}, Lcn/hongguo/tv/MainActivity;->addButton(Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v4, p0, Lcn/hongguo/tv/HomeFeed;->page:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v4}, Lcn/hongguo/tv/MainActivity;->body(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 21
    invoke-virtual {p0}, Lcn/hongguo/tv/HomeFeed;->wireHeader()V

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->page:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lcn/hongguo/tv/HomeFeed;->mode:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    move-object v3, v5

    goto :goto_2

    :cond_3
    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed;->mode:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    goto :goto_2

    :cond_4
    const-string v3, "\u9996\u9875"

    :goto_2
    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-virtual {v0, v1, v3, v2, v9}, Lcn/hongguo/tv/MainActivity;->show(Landroid/view/View;Ljava/lang/String;Landroid/view/View;Z)V

    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->screen:Lcn/hongguo/tv/MainActivity$Screen;

    new-instance v1, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda11;

    invoke-direct {v1, p0}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda11;-><init>(Lcn/hongguo/tv/HomeFeed;)V

    iput-object v1, v0, Lcn/hongguo/tv/MainActivity$Screen;->onRestore:Ljava/lang/Runnable;

    invoke-virtual {p0, v9}, Lcn/hongguo/tv/HomeFeed;->render(Z)V

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/HomeFeed;->load(Z)V

    .line 22
    return-void
.end method

.method tabStyle(Landroid/widget/Button;I)V
    .locals 2

    .line 35
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;

    iget v1, p0, Lcn/hongguo/tv/HomeFeed;->section:I

    if-ne p2, v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, p1, v1}, Lcn/hongguo/tv/MainActivity;->selectedStyle(Landroid/widget/Button;Z)V

    invoke-virtual {p1}, Landroid/widget/Button;->getOnFocusChangeListener()Landroid/view/View$OnFocusChangeListener;

    move-result-object v0

    new-instance v1, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, v0, p2}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda2;-><init>(Lcn/hongguo/tv/HomeFeed;Landroid/view/View$OnFocusChangeListener;I)V

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    return-void
.end method

.method wire()V
    .locals 6

    .line 77
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed;->rows:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed;->rows:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    const/4 v3, 0x0

    :goto_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    new-instance v5, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda16;

    invoke-direct {v5, p0, v3, v1}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda16;-><init>(Lcn/hongguo/tv/HomeFeed;II)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 78
    :cond_1
    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed;->previous:Landroid/widget/Button;

    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed;->next:Landroid/widget/Button;

    iget-object v3, p0, Lcn/hongguo/tv/HomeFeed;->refresh:Landroid/widget/Button;

    const/4 v4, 0x3

    new-array v5, v4, [Landroid/widget/Button;

    aput-object v1, v5, v0

    const/4 v1, 0x1

    aput-object v2, v5, v1

    const/4 v1, 0x2

    aput-object v3, v5, v1

    :goto_2
    if-ge v0, v4, :cond_2

    aget-object v1, v5, v0

    new-instance v2, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda17;

    invoke-direct {v2, p0}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda17;-><init>(Lcn/hongguo/tv/HomeFeed;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 79
    :cond_2
    return-void
.end method

.method wireHeader()V
    .locals 5

    .line 24
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->typeTab:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 25
    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-ge v3, v4, :cond_1

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    instance-of v4, v4, Landroid/widget/Button;

    if-eqz v4, :cond_0

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 26
    :cond_1
    nop

    :goto_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v2, v0, :cond_2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    new-instance v3, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda4;

    invoke-direct {v3, p0, v2, v1}, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda4;-><init>(Lcn/hongguo/tv/HomeFeed;ILjava/util/ArrayList;)V

    invoke-virtual {v0, v3}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 30
    :cond_2
    return-void
.end method
