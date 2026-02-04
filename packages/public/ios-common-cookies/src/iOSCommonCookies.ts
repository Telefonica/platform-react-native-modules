import { NativeModule, requireNativeModule } from "expo-modules-core";

import type { CookieBidirectionalSyncResult, CookieSyncResult } from "./iOSCommonCookies.types";

declare class iOSCommonCookiesModule extends NativeModule {
  /** Copy cookies from HTTPCookieStorage -> WKWebsiteDataStore.default().httpCookieStore */
  syncCookiesToWebView(): Promise<CookieSyncResult>;

  /** Copy cookies from WKWebsiteDataStore.default().httpCookieStore -> HTTPCookieStorage */
  syncCookiesFromWebView(): Promise<CookieSyncResult>;

  /** Best-effort two-way sync (HTTP -> WebView, then WebView -> HTTP) */
  syncCookiesBidirectional(): Promise<CookieBidirectionalSyncResult>;
}

export default requireNativeModule<iOSCommonCookiesModule>("iOSCommonCookies");
