## 1.0.11

- Development channel can now install directly from any repository branch, not just master
- Development channel now lists open pull requests (including forks) as installable options
- Version list no longer fails to load entirely if a single GitHub API call (releases, branches, or pull requests) times out


## 1.0.10

- Updater executable and macOS app names are now unique to the Ethos Suite updater


## 1.0.9

- Version selection split into Releases, Snapshots, and Development channels
- Development channel now supports master plus recent master commits
- Archive layout detection now handles historical rfsuite, scripts/rfsuite, src/rfsuite, and package-root ZIP layouts
- i18n compile sentinel is preserved for localized source installs
- Bundled logo is used as an immediate fallback before the remote logo refresh


## 1.0.8

- Release and snapshot now download from source tag ZIP, following the same process as master
- i18n translations and version suffix in main.lua now correctly applied for all source ZIP installs


## 1.0.7

- Additional checks added to try help identify target volume for install when scripts folder has not been created. (brand new radio)


## 1.0.6
- Release version for windows, mac, linux


