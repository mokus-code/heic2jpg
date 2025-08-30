# Convert HEIC / HEIF / WebP → JPG (Windows Context Menu)

Lightweight Windows context menu helper to convert `.heic`, `.heif`, `.heics`, or `.webp` images into `.jpg` via ImageMagick. Works on Windows 10/11 (shows under classic menu on Win11 if not pinned to primary surface).

---

## 📦 Installation

1. Install [ImageMagick with HEIC + WebP support](https://imagemagick.org/script/download.php).
   - For HEIC/HEIF decoding install Microsoft Store: **HEIF Image Extensions** + **HEVC Video Extensions** (or an alternative HEVC codec).
2. Download / clone this repo and place it at `C:\heic2jpg` (path is hard‑coded in the `.reg`).
3. Import `add_context_menu_systemfileassoc.reg` (double‑click → Yes). Keys are written to `HKCR\SystemFileAssociations` for: `.heic`, `.heif`, `.heics`, `.webp`.
4. (Optional Win11) Restart Explorer: open PowerShell and run `Stop-Process -Name explorer -Force`.
5. Right‑click a supported file → "Convert to JPG" (in classic menu on Win11: Shift+F10 or "Show more options").

---

## 📜 Files

- `convert_to_jpg.ps1` – Conversion logic (ImageMagick, timestamp preservation).
- `convert_to_jpg.cmd` – Simple wrapper invoking the PowerShell script (bypasses execution policy).
- `add_context_menu_systemfileassoc.reg` – Adds context menu entries (extension‑scoped, robust against ProgID changes).
- `remove_context_menu.reg` – Removes all related context menu entries (both legacy & current paths).
- `README.md` – This documentation.

---

## 🔄 Uninstall

1. Run `remove_context_menu.reg`.
2. (Optional) Restart Explorer.
3. Delete `C:\heic2jpg`.

---

## ✅ Example

Right-click on:

```
IMG_1234.HEIC
IMG_5678.WEBP
```

It creates:

```
IMG_1234.JPG
IMG_5678.JPG
```

in the same folder with preserved timestamps.

---

## 🛠️ Notes
- Silent mode: import `add_context_menu_systemfileassoc_hidden.reg` to add an additional menu entry "Convert to JPG (Silent)" that launches via a small VBS wrapper (`convert_to_jpg_hidden.vbs`) with a hidden window. Output is suppressed unless an internal error occurs (no user dialog appears). Use the regular entry if you want to see progress/errors.
 - Error log: `C:\heic2jpg\error.log` is recreated fresh each run; only errors/warnings for the latest run are kept. If no issues occurred the file is removed.
- Multi-select triggers conversion sequentially (Explorer invokes command per file).
- To pin the command to Win11 primary (compact) menu would require a COM shell extension or `IExplorerCommand` registration (out of scope for this simple script).
- Adjust display name (e.g. Russian) by editing the default value under each `ConvertToJPG` key in the `.reg` file.

## 📄 License
Public domain / Unlicense style: do whatever you want. (Add a formal LICENSE file if required for your distribution.)