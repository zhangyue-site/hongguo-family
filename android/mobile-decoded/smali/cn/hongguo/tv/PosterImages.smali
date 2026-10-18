.class final Lcn/hongguo/tv/PosterImages;
.super Ljava/lang/Object;
.source "PosterImages.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static decode([BLcn/hongguo/tv/MemoryProfile;)Landroid/graphics/Bitmap;
    .locals 7

    .line 20
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 21
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 22
    array-length v2, p0

    const/4 v3, 0x0

    invoke-static {p0, v3, v2, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 23
    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    const/4 v4, 0x0

    if-lez v2, :cond_4

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-lez v2, :cond_4

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    const/16 v5, 0x2ee0

    if-gt v2, v5, :cond_4

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-le v2, v5, :cond_0

    goto :goto_2

    .line 24
    :cond_0
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 25
    iput v1, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 26
    :goto_0
    iget v5, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v6, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    add-int/2addr v5, v6

    sub-int/2addr v5, v1

    iget v6, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    div-int/2addr v5, v6

    iget v6, p1, Lcn/hongguo/tv/MemoryProfile;->width:I

    if-gt v5, v6, :cond_3

    iget v5, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iget v6, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    add-int/2addr v5, v6

    sub-int/2addr v5, v1

    iget v6, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    div-int/2addr v5, v6

    iget v6, p1, Lcn/hongguo/tv/MemoryProfile;->height:I

    if-le v5, v6, :cond_1

    goto :goto_1

    .line 27
    :cond_1
    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    iput-object v0, v2, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 28
    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    .line 29
    array-length v0, p0

    invoke-static {p0, v3, v0, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 31
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getAllocationByteCount()I

    move-result v0

    iget v1, p1, Lcn/hongguo/tv/MemoryProfile;->width:I

    iget p1, p1, Lcn/hongguo/tv/MemoryProfile;->height:I

    mul-int v1, v1, p1

    mul-int/lit8 v1, v1, 0x4

    if-le v0, v1, :cond_2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    return-object v4

    .line 32
    :cond_2
    return-object p0

    .line 26
    :cond_3
    :goto_1
    iget v5, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    mul-int/lit8 v5, v5, 0x2

    iput v5, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    goto :goto_0

    .line 23
    :cond_4
    :goto_2
    return-object v4
.end method

.method static read(Ljava/io/InputStream;Lcn/hongguo/tv/MemoryProfile;)Landroid/graphics/Bitmap;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 10
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 11
    const/16 v1, 0x2000

    new-array v1, v1, [B

    .line 13
    :goto_0
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    .line 14
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v3

    add-int/2addr v3, v2

    iget v4, p1, Lcn/hongguo/tv/MemoryProfile;->encodedBytes:I

    if-le v3, v4, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 15
    :cond_0
    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 17
    :cond_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    invoke-static {p0, p1}, Lcn/hongguo/tv/PosterImages;->decode([BLcn/hongguo/tv/MemoryProfile;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method
