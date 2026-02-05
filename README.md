# platform-react-native-modules

Monorepo containing reusable React Native / Expo native modules for Telefónica.

The goal of this repository is to centralize native modules that can be reused across multiple React Native projects, avoiding duplication and improving maintainability.

## Repository structure

This repository is organized as a monorepo using Yarn workspaces.

```
platform-react-native-modules/
├─ package.json
├─ yarn.lock
├─ .yarnrc.yml
├─ packages/
│  └─ public/
│     ├─ ios-common-cookies/
│     └─ ...
└─ .github/
```

### Public packages

All reusable packages intended to be published are placed under:

```
packages/public/*
```

These packages are published under the `@telefonica` scope.

## Packages

### @telefonica/ios-common-cookies

Expo iOS native module for synchronizing cookies between `HTTPCookieStorage` and `WKWebView`.

Location:
```
packages/public/ios-common-cookies
```

Install:
```bash
yarn add @telefonica/ios-common-cookies
```

## Development

Install dependencies:

```bash
yarn install
```

Typecheck all workspaces:

```bash
yarn ts:check
```

Build all workspaces:

```bash
yarn build
```

## Publishing

Publishing is done via GitHub Actions using `semantic-release`.

Each package is versioned and released independently.

## License

MIT
