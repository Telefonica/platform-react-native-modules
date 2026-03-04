export type CookieSyncResult = {
  synced: number;
  cookieNames: string[];
};

export type CookieBidirectionalSyncResult = CookieSyncResult & {
  fromHTTP: number;
  fromWebView: number;
};

export type CookieClearResult = {
  clearedHTTP: number;
  clearedWebView: number;
};
