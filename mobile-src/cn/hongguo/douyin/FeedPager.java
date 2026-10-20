package cn.hongguo.douyin;

import android.content.Context;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.PagerSnapHelper;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

/** 0.6.0：按参考项目（DouyinDemo）的架构重做——
 *  RecyclerView(竖直) + PagerSnapHelper 逐页吸附，替代 ViewPager2。
 *  参考项目的 MyLayoutManager 等价物就是这套官方组件组合，行为确定、无内部状态坑。 */
public final class FeedPager extends FrameLayout {
    public interface Listener { void onSettled(int index); }
    public interface TouchObserver { void onTouch(MotionEvent ev); }

    private final ArrayList<View> pages = new ArrayList<>();
    private final RecyclerView rv;
    private final LinearLayoutManager lm;
    private final PagerSnapHelper snap = new PagerSnapHelper();
    private Listener listener;
    private TouchObserver observer;
    private int current = 0;
    private boolean idlePending = false;

    public FeedPager(Context context) {
        super(context);
        rv = new RecyclerView(context);
        lm = new LinearLayoutManager(context, LinearLayoutManager.VERTICAL, false);
        rv.setLayoutManager(lm);
        rv.setHasFixedSize(true);
        rv.setAdapter(new Adapter());
        snap.attachToRecyclerView(rv);
        rv.addOnScrollListener(new RecyclerView.OnScrollListener() {
            @Override public void onScrollStateChanged(@NonNull RecyclerView r, int newState) {
                if (newState == RecyclerView.SCROLL_STATE_IDLE) settle();
            }
        });
        addView(rv, new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));
    }

    private void settle() {
        if (pages.isEmpty()) return;
        View snapped = snap.findSnapView(lm);
        int pos = snapped != null ? rv.getChildAdapterPosition(snapped) : current;
        if (pos == RecyclerView.NO_POSITION) return;
        if (pos != current || idlePending) {
            current = pos;
            idlePending = false;
            if (listener != null) listener.onSettled(pos);
        }
    }

    public void setListener(Listener l) { listener = l; }
    public void setTouchObserver(TouchObserver o) { observer = o; }

    @Override public boolean dispatchTouchEvent(MotionEvent ev) {
        if (observer != null) {
            try { observer.onTouch(ev); } catch (Throwable ignored) {}
        }
        return super.dispatchTouchEvent(ev);
    }

    public int currentPage() { return current; }
    public int pageCount() { return pages.size(); }
    public View pageAt(int i) { return i >= 0 && i < pages.size() ? pages.get(i) : null; }

    public void appendPage(View page) { pages.add(page); notifyChanged(); }

    public void appendPages(java.util.List<View> batch) {
        if (batch == null || batch.isEmpty()) return;
        pages.addAll(batch);
        notifyChanged();
    }

    public void clearPages() { pages.clear(); current = 0; notifyChanged(); }

    private void notifyChanged() {
        RecyclerView.Adapter<?> a = rv.getAdapter();
        if (a != null) a.notifyDataSetChanged();
    }

    public void jumpTo(int index) {
        int n = pages.size();
        if (n == 0) return;
        int target = Math.max(0, Math.min(index, n - 1));
        if (target == current) return;
        current = target;
        rv.scrollToPosition(target);
        idlePending = true;   // 由下一次 IDLE 补发回调
    }

    public void settleTo(int index, boolean smooth) {
        int n = pages.size();
        if (n == 0) return;
        int target = Math.max(0, Math.min(index, n - 1));
        if (target == current) return;
        current = target;
        rv.smoothScrollToPosition(target);
        idlePending = true;
    }

    private final class Adapter extends RecyclerView.Adapter<Vh> {
        @NonNull @Override public Vh onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            FrameLayout cell = new FrameLayout(parent.getContext());
            cell.setLayoutParams(new RecyclerView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            return new Vh(cell);
        }

        @Override public void onBindViewHolder(@NonNull Vh h, int position) {
            if (position < 0 || position >= pages.size()) return;
            View p = pages.get(position);
            if (p.getParent() instanceof ViewGroup) ((ViewGroup) p.getParent()).removeView(p);
            FrameLayout cell = (FrameLayout) h.itemView;
            cell.removeAllViews();
            cell.addView(p, new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT));
        }

        @Override public int getItemCount() { return pages.size(); }
    }

    static final class Vh extends RecyclerView.ViewHolder {
        Vh(View v) { super(v); }
    }
}
