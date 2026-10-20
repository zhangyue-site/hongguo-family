package cn.hongguo.douyin;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.content.Context;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.animation.DecelerateInterpolator;
import android.widget.FrameLayout;
import java.util.ArrayList;

/** Full-screen vertical snap pager (Douyin-style), zero external dependencies.
 *  Textbook intercept pattern: vertical drags are intercepted (pages never see them),
 *  plain taps pass through to the page (click listeners keep working). */
public final class FeedView extends FrameLayout {
    public interface Listener { void onSettled(int index); }

    private final FrameLayout track = new FrameLayout(getContext());
    private final ArrayList<View> pages = new ArrayList<>();
    private final int touchSlop;
    private final float minFling;
    private Listener listener;
    private int pageHeight;
    private int current = 0;
    private boolean dragging;
    private boolean settled = true;
    private float downX, downY;
    private float dragBase;
    private VelocityTracker velocity;

    public FeedView(Context context) {
        super(context);
        touchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        minFling = ViewConfiguration.get(context).getScaledMinimumFlingVelocity() * 2.5f;
        setClipChildren(true);
        track.setClipChildren(false);
        addView(track);
    }

    public void setListener(Listener l) { listener = l; }

    public int currentPage() { return current; }
    public int pageCount() { return pages.size(); }
    public View pageAt(int i) { return i >= 0 && i < pages.size() ? pages.get(i) : null; }

    /** Append pages at any time; they snap to viewport height once known. */
    public void appendPage(View page) {
        pages.add(page);
        int h = pageHeight > 0 ? pageHeight : LayoutParams.MATCH_PARENT;
        track.addView(page, new LayoutParams(LayoutParams.MATCH_PARENT, h));
        if (pageHeight > 0) page.setTranslationY((pages.size() - 1) * (float) pageHeight);
    }

    public void clearPages() {
        track.removeAllViews();
        pages.clear();
        current = 0;
        if (pageHeight > 0) track.setTranslationY(0);
    }

    @Override protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        if (h <= 0 || h == pageHeight) return;
        pageHeight = h;
        for (int i = 0; i < pages.size(); i++) {
            View p = pages.get(i);
            LayoutParams lp = (LayoutParams) p.getLayoutParams();
            lp.height = h;
            p.setLayoutParams(lp);
            p.setTranslationY(i * (float) h);
        }
        jumpTo(current);
    }

    public void jumpTo(int index) {
        current = Math.max(0, Math.min(index, Math.max(0, pages.size() - 1)));
        if (pageHeight > 0) track.setTranslationY(-current * (float) pageHeight);
    }

    public void settleTo(final int index, boolean animate) {
        final int target = Math.max(0, Math.min(index, Math.max(0, pages.size() - 1)));
        current = target;
        if (pageHeight <= 0) { notifySettled(); return; }
        final float to = -target * (float) pageHeight;
        if (!animate) { track.setTranslationY(to); notifySettled(); return; }
        if (track.getTranslationY() == to) { notifySettled(); return; }
        settled = false;
        track.animate().translationY(to).setDuration(240)
            .setInterpolator(new DecelerateInterpolator(1.6f))
            .setListener(new AnimatorListenerAdapter() {
                @Override public void onAnimationEnd(Animator a) {
                    track.setTranslationY(to);
                    settled = true;
                    notifySettled();
                }
            }).start();
    }

    private void notifySettled() { if (listener != null) listener.onSettled(current); }

    @Override public boolean onInterceptTouchEvent(MotionEvent ev) {
        switch (ev.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                downX = ev.getX(); downY = ev.getY();
                dragging = false;
                if (velocity != null) { velocity.recycle(); velocity = null; }
                velocity = VelocityTracker.obtain();
                velocity.addMovement(ev);
                track.animate().cancel();
                break;
            case MotionEvent.ACTION_MOVE:
                if (velocity != null) velocity.addMovement(ev);
                float dy = ev.getY() - downY;
                float dx = ev.getX() - downX;
                if (!dragging && Math.abs(dy) > touchSlop && Math.abs(dy) > Math.abs(dx) && settled) {
                    dragging = true;
                    dragBase = track.getTranslationY();
                    return true;
                }
                break;
            default: break;
        }
        return false;
    }

    @Override public boolean onTouchEvent(MotionEvent ev) {
        if (velocity == null) velocity = VelocityTracker.obtain();
        velocity.addMovement(ev);
        switch (ev.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                downX = ev.getX(); downY = ev.getY();
                dragBase = track.getTranslationY();
                track.animate().cancel();
                return true;
            case MotionEvent.ACTION_MOVE: {
                float ny = dragBase + (ev.getY() - downY);
                float min = -(pages.size() - 1) * (float) pageHeight;
                if (ny > 0) ny *= 0.35f;                      // rubber band top
                if (ny < min) ny = min + (ny - min) * 0.35f;  // rubber band bottom
                track.setTranslationY(ny);
                return true;
            }
            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL: {
                velocity.computeCurrentVelocity(1000);
                float vy = velocity.getYVelocity();
                boolean fling = Math.abs(vy) > minFling;
                int target = current;
                if (dragging && pageHeight > 0) {
                    float traveled = track.getTranslationY() + current * (float) pageHeight;
                    if (fling) target += vy < 0 ? 1 : -1;
                    else if (traveled < -pageHeight * 0.28f) target += 1;
                    else if (traveled > pageHeight * 0.28f) target -= 1;
                }
                dragging = false;
                velocity.recycle(); velocity = null;
                settleTo(target, true);
                return true;
            }
            default: return super.onTouchEvent(ev);
        }
    }
}
