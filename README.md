## Convert HEIC / HEIF / WEBP to JPG (Right‑Click Menu)

For those tired of greedy devs milking that one lucky HEIC converter — here’s a no-nonsense tool to turn your HEIC/HEIF/WebP images into good old JPG.

Works on Windows 10 and 11.

---

### What You Need (one‑time)
Install ImageMagick: https://imagemagick.org/script/download.php
Look for ImageMagick-7.1.2-3-Q16-HDRI-x64-static.exe or similar

---

### Install (simple)
1. Download the ZIP with these files (green button Code -> Download  ZIP) and place the folder at: `C:\heic2jpg`
2. Double‑click `add_context_menu_systemfileassoc.reg` → Yes → Yes.
3. (Windows 11 only, if menu not visible) Right‑click the taskbar, choose Task Manager, restart Windows Explorer OR press Win+R and run: `explorer` after ending it.
4. Done. Right‑click a `.HEIC` (or `.WEBP`) file → Convert to JPG.

Multi‑select: select several files, right‑click any one → Convert to JPG. Each file becomes a JPG in the same folder.

---

### Silent (no window)
If you prefer no window at all:
1. Double‑click `add_context_menu_systemfileassoc_hidden.reg`.
2. Use the new menu item: Convert to JPG (Silent).

---

### Where Are My Files?
They appear next to the originals with the same name, just `.JPG`.
Original timestamps (date taken / modified) are kept.

---

### Remove
1. Double‑click `remove_context_menu.reg` → Yes.
2. Delete the folder `C:\heic2jpg` if you no longer need it.

---

### Problems? Quick Fixes
- No menu item: re‑run the .reg file; if Windows 11, click "Show more options" in the right‑click menu.
- File did not convert: install ImageMagick again and ensure you chose the default install options.
- Want to clear errors: if something failed a file `C:\heic2jpg\error.log` may appear — delete it; it will recreate only if there is a new error.
- Nothing happens in Silent mode: temporarily use the normal (non‑silent) menu to see messages.

---

### Safety
The scripts only run on files you select and create `.JPG` copies. They do not upload anything.

---

### License
Free to use, share, modify.
