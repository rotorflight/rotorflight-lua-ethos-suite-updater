# Rotorflight Radio Updater

Windows updater for the Rotorflight Lua Ethos Suite.

![Rotorflight Radio Updater](https://raw.githubusercontent.com/rotorflight/rotorflight-lua-ethos-suite-updater/master/src/README.png)

## Download

Updater binaries are published on GitHub Releases, **but only when**:
- a release is created, or
- the updater source is updated and a release is produced

This means the exact binary link can change or be missing on older releases. Use the Releases page to pick the matching version:

```
https://github.com/rotorflight/rotorflight-lua-ethos-suite-updater/releases
```

Asset names (when present):
- Windows: `rfsuite-updater-<version>-windows.zip`
- macOS: `rfsuite-updater-<version>-macos.zip`
- Linux: `updater-ubuntu-latest` (workflow artifacts; not yet attached to releases)

If a release does not include updater assets, the binaries were not rebuilt for that tag. In that case, use the most recent release **that includes** the updater artifacts or build locally (see below).

If you would like a newer build, download the tool from GitHub Actions artifacts.

Note: The updater is published for Windows, macOS, and Linux.

## Developer Notes

The updater checks for updates by loading:

`src/release.json`

You should update this file if releasing a new version.

Compilation requirements:

1. Windows build host (PyInstaller target).
2. Python 3.x on PATH.
3. PyInstaller installed: `pip install pyinstaller`
4. From `src`, run: `make.cmd`
5. Output EXE: `src/update_radio_gui.exe`

Optional build inputs:

- `src/icon.ico` (embedded icon used by `make.cmd`)

## macOS / Linux Notes

- The updater uses `tkinter` for the GUI. Ensure your Python install includes Tk support.
  - macOS: the python.org installer typically includes Tk.
  - Linux: install your distro's `python3-tk` package.
- HID support is optional. If `hid`/`hidapi` is missing, the updater can still work
  when the radio is already mounted in storage mode.
- For development runs on macOS/Linux, use:
  - `src/run_updater.sh`
- macOS icon: generate `icon.icns` from the Windows `.ico` with:
  - `python3 src/build_icon_icns.py`
