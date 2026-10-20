package cn.hongguo.tv;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import java.io.FileNotFoundException;

/** Read-only provider serving the verified update APK to the system installer,
 *  same shape as the original UpdateProvider. Authority is per-channel:
 *  site.zhangyue.hongguo.{mobile|tv}.family-update */
public final class FamilyOtaProvider extends ContentProvider {
 public boolean onCreate() { return true; }
 static Uri uri(Context c) { return Uri.parse("content://" + c.getPackageName() + ".family-update/apk"); }
 void require(Uri u) {
  if(!uri(getContext()).toString().equals(u.toString())) throw new SecurityException("Unknown update resource");
 }
 public String getType(Uri u) { require(u); return "application/vnd.android.package-archive"; }
 public ParcelFileDescriptor openFile(Uri u, String mode) throws FileNotFoundException {
  require(u);
  if(!"r".equals(mode)) throw new SecurityException("Read only");
  return ParcelFileDescriptor.open(FamilyOtaClient.apk(getContext()), ParcelFileDescriptor.MODE_READ_ONLY);
 }
 public Cursor query(Uri u, String[] cols, String sel, String[] args, String order) {
  require(u);
  if(cols == null) cols = new String[]{"_display_name","_size"};
  MatrixCursor c = new MatrixCursor(cols);
  Object[] row = new Object[cols.length];
  for(int i = 0; i < cols.length; i++)
   row[i] = "_display_name".equals(cols[i]) ? "Hongguo-family-update.apk"
    : "_size".equals(cols[i]) ? Long.valueOf(FamilyOtaClient.apk(getContext()).length()) : null;
  c.addRow(row);
  return c;
 }
 public Uri insert(Uri u, ContentValues v) { throw new SecurityException("Read only"); }
 public int delete(Uri u, String s, String[] a) { throw new SecurityException("Read only"); }
 public int update(Uri u, ContentValues v, String s, String[] a) { throw new SecurityException("Read only"); }
}
