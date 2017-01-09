.class Lcom/android/server/am/ActivityManagerService$22;
.super Ljava/lang/Object;
.source "ActivityManagerService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/am/ActivityManagerService;->recordPssSampleLocked(Lcom/android/server/am/ProcessRecord;IJJJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/am/ActivityManagerService;

.field final synthetic val$heapdumpFile:Ljava/io/File;

.field final synthetic val$myProc:Lcom/android/server/am/ProcessRecord;


# direct methods
.method constructor <init>(Lcom/android/server/am/ActivityManagerService;Ljava/io/File;Lcom/android/server/am/ProcessRecord;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/server/am/ActivityManagerService;
    .param p2, "val$heapdumpFile"    # Ljava/io/File;
    .param p3, "val$myProc"    # Lcom/android/server/am/ProcessRecord;

    .prologue
    .line 18364
    iput-object p1, p0, Lcom/android/server/am/ActivityManagerService$22;->this$0:Lcom/android/server/am/ActivityManagerService;

    iput-object p2, p0, Lcom/android/server/am/ActivityManagerService$22;->val$heapdumpFile:Ljava/io/File;

    iput-object p3, p0, Lcom/android/server/am/ActivityManagerService$22;->val$myProc:Lcom/android/server/am/ProcessRecord;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    .line 18367
    iget-object v5, p0, Lcom/android/server/am/ActivityManagerService$22;->this$0:Lcom/android/server/am/ActivityManagerService;

    invoke-static {}, Landroid/app/ActivityThread;->currentActivityThread()Landroid/app/ActivityThread;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/ActivityThread;->getApplicationThread()Landroid/app/ActivityThread$ApplicationThread;

    move-result-object v6

    .line 18369
    sget-object v7, Lcom/android/internal/app/DumpHeapActivity;->JAVA_URI:Landroid/net/Uri;

    .line 18372
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v8

    .line 18370
    const/4 v9, 0x3

    .line 18367
    invoke-virtual {v5, v6, v7, v9, v8}, Lcom/android/server/am/ActivityManagerService;->revokeUriPermission(Landroid/app/IApplicationThread;Landroid/net/Uri;II)V

    .line 18373
    const/4 v3, 0x0

    .line 18375
    .local v3, "fd":Landroid/os/ParcelFileDescriptor;
    :try_start_0
    iget-object v5, p0, Lcom/android/server/am/ActivityManagerService$22;->val$heapdumpFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 18376
    iget-object v5, p0, Lcom/android/server/am/ActivityManagerService$22;->val$heapdumpFile:Ljava/io/File;

    .line 18377
    const/high16 v6, 0x2e000000

    .line 18376
    invoke-static {v5, v6}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v3

    .line 18381
    .local v3, "fd":Landroid/os/ParcelFileDescriptor;
    iget-object v5, p0, Lcom/android/server/am/ActivityManagerService$22;->val$myProc:Lcom/android/server/am/ProcessRecord;

    iget-object v4, v5, Lcom/android/server/am/ProcessRecord;->thread:Landroid/app/IApplicationThread;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18382
    .local v4, "thread":Landroid/app/IApplicationThread;
    if-eqz v4, :cond_0

    .line 18387
    :try_start_1
    iget-object v5, p0, Lcom/android/server/am/ActivityManagerService$22;->val$heapdumpFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    invoke-interface {v4, v6, v5, v3}, Landroid/app/IApplicationThread;->dumpHeap(ZLjava/lang/String;Landroid/os/ParcelFileDescriptor;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18394
    :cond_0
    :goto_0
    if-eqz v3, :cond_1

    .line 18396
    :try_start_2
    invoke-virtual {v3}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 18366
    .end local v3    # "fd":Landroid/os/ParcelFileDescriptor;
    .end local v4    # "thread":Landroid/app/IApplicationThread;
    :cond_1
    :goto_1
    return-void

    .line 18397
    .restart local v3    # "fd":Landroid/os/ParcelFileDescriptor;
    .restart local v4    # "thread":Landroid/app/IApplicationThread;
    :catch_0
    move-exception v2

    .local v2, "e":Ljava/io/IOException;
    goto :goto_1

    .line 18391
    .end local v2    # "e":Ljava/io/IOException;
    .end local v3    # "fd":Landroid/os/ParcelFileDescriptor;
    .end local v4    # "thread":Landroid/app/IApplicationThread;
    :catch_1
    move-exception v1

    .line 18392
    .local v1, "e":Ljava/io/FileNotFoundException;
    :try_start_3
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 18394
    if-eqz v3, :cond_1

    .line 18396
    :try_start_4
    invoke-virtual {v3}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_1

    .line 18397
    :catch_2
    move-exception v2

    .restart local v2    # "e":Ljava/io/IOException;
    goto :goto_1

    .line 18393
    .end local v1    # "e":Ljava/io/FileNotFoundException;
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v5

    .line 18394
    if-eqz v3, :cond_2

    .line 18396
    :try_start_5
    invoke-virtual {v3}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 18393
    :cond_2
    :goto_2
    throw v5

    .line 18397
    :catch_3
    move-exception v2

    .restart local v2    # "e":Ljava/io/IOException;
    goto :goto_2

    .line 18388
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v3    # "fd":Landroid/os/ParcelFileDescriptor;
    .restart local v4    # "thread":Landroid/app/IApplicationThread;
    :catch_4
    move-exception v0

    .local v0, "e":Landroid/os/RemoteException;
    goto :goto_0
.end method
