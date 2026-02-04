import ExpoModulesCore
import WebKit

public class iOSCommonCookiesModule: Module {
  public func definition() -> ModuleDefinition {
    Name("iOSCommonCookies")

    // Copy cookies from HTTPCookieStorage -> WKWebView cookie store.
    AsyncFunction("syncCookiesToWebView") { (promise: Promise) in
      DispatchQueue.main.async {
        let cookieStore = WKWebsiteDataStore.default().httpCookieStore
        let cookies = HTTPCookieStorage.shared.cookies ?? []
        var cookieNames: [String] = []

        for cookie in cookies {
          cookieNames.append(cookie.name)
          cookieStore.setCookie(cookie)
        }

        promise.resolve([
          "synced": cookies.count,
          "cookieNames": cookieNames
        ])
      }
    }

    // Copy cookies from WKWebView cookie store -> HTTPCookieStorage.
    AsyncFunction("syncCookiesFromWebView") { (promise: Promise) in
      DispatchQueue.main.async {
        let cookieStore = WKWebsiteDataStore.default().httpCookieStore

        cookieStore.getAllCookies { cookies in
          var cookieNames: [String] = []

          for cookie in cookies {
            cookieNames.append(cookie.name)
            HTTPCookieStorage.shared.setCookie(cookie)
          }

          promise.resolve([
            "synced": cookies.count,
            "cookieNames": cookieNames
          ])
        }
      }
    }

    // Best-effort two-way sync: HTTP -> WebView, then WebView -> HTTP.
    AsyncFunction("syncCookiesBidirectional") { (promise: Promise) in
      DispatchQueue.main.async {
        let cookieStore = WKWebsiteDataStore.default().httpCookieStore
        let httpCookies = HTTPCookieStorage.shared.cookies ?? []

        // 1) HTTP -> WebView
        for cookie in httpCookies {
          cookieStore.setCookie(cookie)
        }

        // 2) WebView -> HTTP
        cookieStore.getAllCookies { webViewCookies in
          for cookie in webViewCookies {
            HTTPCookieStorage.shared.setCookie(cookie)
          }

          let httpCookieNames = Set(httpCookies.map { $0.name })
          let webViewCookieNames = Set(webViewCookies.map { $0.name })
          let allCookieNames = httpCookieNames.union(webViewCookieNames)

          promise.resolve([
            "synced": allCookieNames.count,
            "cookieNames": Array(allCookieNames),
            "fromHTTP": httpCookies.count,
            "fromWebView": webViewCookies.count
          ])
        }
      }
    }
  }
}
