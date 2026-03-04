import { NativeModule, requireNativeModule } from "expo-modules-core";

import type { CookieBidirectionalSyncResult, CookieSyncResult, CookieClearResult } from "./iOSCommonCookies.types";

declare class iOSCommonCookiesModule extends NativeModule {
  /** Copy cookies from HTTPCookieStorage -> WKWebsiteDataStore.default().httpCookieStore */
  syncCookiesToWebView(): Promise<CookieSyncResult>;

  /** Copy cookies from WKWebsiteDataStore.default().httpCookieStore -> HTTPCookieStorage */
  syncCookiesFromWebView(): Promise<CookieSyncResult>;

  /** Clear all cookies from HTTPCookieStorage and WKWebView cookie store */
  clearAllCookies(): Promise<CookieClearResult>;

  /** Best-effort two-way sync (HTTP -> WebView, then WebView -> HTTP) */
  syncCookiesBidirectional(): Promise<CookieBidirectionalSyncResult>;
}

export default requireNativeModule<iOSCommonCookiesModule>("iOSCommonCookies");
