.class Landroid/app/Instrumentation$1ContextMenuRunnable;
.super Ljava/lang/Object;
.source "Instrumentation.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/app/Instrumentation;->invokeContextMenuAction(Landroid/app/Activity;II)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ContextMenuRunnable"
.end annotation


# instance fields
.field private final activity:Landroid/app/Activity;

.field private final flags:I

.field private final identifier:I

.field returnValue:Z

.field final synthetic this$0:Landroid/app/Instrumentation;


# direct methods
.method public constructor <init>(Landroid/app/Instrumentation;Landroid/app/Activity;II)V
    .locals 0
    .param p1, "this$0"    # Landroid/app/Instrumentation;
    .param p2, "_activity"    # Landroid/app/Activity;
    .param p3, "_identifier"    # I
    .param p4, "_flags"    # I

    .prologue
    .line 820
    iput-object p1, p0, Landroid/app/Instrumentation$1ContextMenuRunnable;->this$0:Landroid/app/Instrumentation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 822
    iput-object p2, p0, Landroid/app/Instrumentation$1ContextMenuRunnable;->activity:Landroid/app/Activity;

    .line 823
    iput p3, p0, Landroid/app/Instrumentation$1ContextMenuRunnable;->identifier:I

    .line 824
    iput p4, p0, Landroid/app/Instrumentation$1ContextMenuRunnable;->flags:I

    .line 821
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 828
    iget-object v1, p0, Landroid/app/Instrumentation$1ContextMenuRunnable;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 830
    .local v0, "win":Landroid/view/Window;
    iget v1, p0, Landroid/app/Instrumentation$1ContextMenuRunnable;->identifier:I

    .line 831
    iget v2, p0, Landroid/app/Instrumentation$1ContextMenuRunnable;->flags:I

    .line 829
    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->performContextMenuIdentifierAction(II)Z

    move-result v1

    iput-boolean v1, p0, Landroid/app/Instrumentation$1ContextMenuRunnable;->returnValue:Z

    .line 827
    return-void
.end method
