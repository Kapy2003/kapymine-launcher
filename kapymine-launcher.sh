#!/bin/bash

# ─── Paths ────────────────────────────────────────────────
PRISM_APPIMAGE="/usr/share/kapymine-launcher/kapymine-launcher.AppImage"
INSTANCES_DIR="$HOME/.local/share/PrismLauncher/instances"
ACCOUNTS_FILE="$HOME/.local/share/PrismLauncher/accounts.json"

# ─── Dependencies Check ───────────────────────────────────
for cmd in yad jq uuidgen; do
  command -v "$cmd" >/dev/null || { echo "Missing: $cmd"; exit 1; }
done

# ─── Main Menu ────────────────────────────────────
while true; do
  mapfile -t versions < <(find "$INSTANCES_DIR" -mindepth 1 -maxdepth 1 -type d -not -name '.*' -printf "%f\n" 2>/dev/null)

  # ─── THE STYLE FIX ──────────────────────────────────────
  # 1. We match the Dark Theme (Adwaita:dark).
  # 2. We target the button container (.dialog-action-area) to force colors.
  
  STYLE_CSS="
    /* Reset all buttons to look clean */
    button {
        border-radius: 6px;
        border: 1px solid rgba(255,255,255,0.1);
        font-weight: bold;
    }
    
    /* Play Button (1st in row) - Emerald Green */
    .dialog-action-area button:nth-child(1) {
        background-image: none !important;
        background-color: #27ae60 !important;
        color: white !important;
    }
    
    /* Install Button (2nd in row) - Belize Blue */
    .dialog-action-area button:nth-child(2) {
        background-image: none !important;
        background-color: #2980b9 !important;
        color: white !important;
    }
    
    /* Hover Effects */
    .dialog-action-area button:nth-child(1):hover { background-color: #2ecc71 !important; }
    .dialog-action-area button:nth-child(2):hover { background-color: #3498db !important; }
  "

  # ─── RUN YAD ────────────────────────────────────────────
  # We use 'Adwaita:dark' to match your system vibe but allow our CSS edits.
  
  GTK_THEME=Adwaita:dark yad --question \
    --title="Minecraft Launcher" \
    --text="<span size='large' weight='bold'>Ready to play?</span>\nChoose an action below:" \
    --button="🟢 Play / Select:0" \
    --button="📥 Install New:2" \
    --button="❌ Cancel:1" \
    --center --width=400 --borders=20 \
    --gtk-css="$STYLE_CSS"

  response=$?

  if [[ $response -eq 2 ]]; then
    "$PRISM_APPIMAGE" &
    break
  elif [[ $response -eq 0 ]]; then
    selected_version=$(GTK_THEME=Adwaita:dark yad --list \
      --title="Choose Minecraft Version" \
      --column="Available Versions" "${versions[@]}" \
      --height=450 --width=350 --center \
      --button="🟢 Launch:0" \
      --button="❌ Cancel:1" \
      --gtk-css="treeview:selected { background-color: #27ae60 !important; color: white !important; }")

    if [ -n "$selected_version" ]; then
        clean_version=$(echo "$selected_version" | cut -d'|' -f1)
        exec "$PRISM_APPIMAGE" -l "$clean_version"
    fi
  else
    break
  fi
done
