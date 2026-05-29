-- hyprland.lua
-- Hyprland 0.55+ Lua config — verified against official wiki + dispatchers page
-- ml4w stripped, noctalia-shell as desktop shell

--------------------
---- MONITOR ----
--------------------

hl.monitor({
  output   = "",
  mode     = "preferred",
  position = "auto",
  scale    = "auto",
})

--------------------
---- AUTOSTART ----
--------------------

hl.on("hyprland.start", function()
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
  hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("wl-paste --watch cliphist store")
  hl.exec_cmd("nm-applet --indicator")
  -- NixOS flake: "noctalia-shell" | Manual/PikaOS: "qs -c noctalia-shell"
  hl.exec_cmd("noctalia-shell")
end)

--------------------
---- COLORS ----
--------------------

local colors = {
  on_surface = "rgba(e1e2e8ff)", -- active border  ($color11 / $on_surface)
  primary    = "rgba(a2c9feff)", -- inactive border ($color8  / $primary)
}

--------------------
---- GENERAL ----
--------------------

hl.config({
  general = {
    gaps_in          = 10,
    gaps_out         = 20,
    border_size      = 3,
    col              = {
      active_border   = colors.on_surface,
      inactive_border = colors.primary,
    },
    layout           = "dwindle",
    resize_on_border = true,
    allow_tearing    = false,
  },
})

--------------------
---- DECORATION ----
--------------------

hl.config({
  decoration = {
    rounding           = 10,
    active_opacity     = 1.0,
    inactive_opacity   = 0.9,
    fullscreen_opacity = 1.0,
    blur               = {
      enabled           = true,
      size              = 12,
      passes            = 4,
      new_optimizations = true,
      ignore_opacity    = true,
      -- xray removed: caused terminal to appear fully transparent
    },
    shadow             = {
      enabled      = true,
      range        = 10,
      render_power = 2,
      color        = 0x33000000,
    },
  },
})

-- Noctalia panel blur (ignore_alpha is correct per wiki)
hl.layer_rule({
  name         = "noctalia-blur",
  match        = { namespace = "noctalia-background-.*" },
  blur         = true,
  ignore_alpha = 0.5,
})

--------------------
---- ANIMATIONS ----
--------------------

hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("md3_standard", { type = "bezier", points = { { 0.2, 0 }, { 0, 1 } } })
hl.curve("md3_decel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("md3_accel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })
hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.1 } } })
hl.curve("crazyshot", { type = "bezier", points = { { 0.1, 1.5 }, { 0.76, 0.92 } } })
hl.curve("hyprnostretch", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.0 } } })
hl.curve("menu_decel", { type = "bezier", points = { { 0.1, 1 }, { 0, 1 } } })
hl.curve("menu_accel", { type = "bezier", points = { { 0.38, 0.04 }, { 1, 0.07 } } })
hl.curve("easeInOutCirc", { type = "bezier", points = { { 0.85, 0 }, { 0.15, 1 } } })
hl.curve("easeOutCirc", { type = "bezier", points = { { 0, 0.55 }, { 0.45, 1 } } })
hl.curve("easeOutExpo", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.curve("softAcDecel", { type = "bezier", points = { { 0.26, 0.26 }, { 0.15, 1 } } })
hl.curve("md2", { type = "bezier", points = { { 0.4, 0 }, { 0.2, 1 } } })

hl.config({ animations = { enabled = true } })

hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "md3_decel", style = "popin 60%" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "md3_decel", style = "popin 60%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "md3_accel", style = "popin 60%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "md3_decel" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3, bezier = "menu_decel", style = "slide" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.6, bezier = "menu_accel" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 2, bezier = "menu_decel" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 4.5, bezier = "menu_accel" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 7, bezier = "menu_decel", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "md3_decel", style = "slidevert" })

--------------------
---- LAYOUTS ----
--------------------

-- dwindle.pseudotile removed in 0.55 — use SUPER+P bind (hl.dsp.window.pseudo()) per-window
hl.config({
  dwindle = {
    preserve_split = true,
  },
  binds = {
    workspace_back_and_forth = true,
    allow_workspace_cycles   = true,
    pass_mouse_when_bound    = false,
  },
})

--------------------
---- INPUT ----
--------------------

hl.config({
  input = {
    kb_layout          = "us",
    kb_variant         = "",
    kb_model           = "",
    kb_options         = "",
    numlock_by_default = true,
    follow_mouse       = 1,
    mouse_refocus      = false,
    sensitivity        = 0,
    touchpad           = {
      natural_scroll = false,
      scroll_factor  = 1.0,
    },
  },
})

--------------------
---- MISC ----
--------------------

hl.config({
  misc = {
    disable_hyprland_logo      = true,
    disable_splash_rendering   = true,
    initial_workspace_tracking = 1,
    force_default_wallpaper    = 0,
  },
})

--------------------
---- WINDOW RULES ----
--------------------

hl.window_rule({ name = "tile-edge", match = { title = "^Microsoft-edge$" }, tile = true })
hl.window_rule({ name = "tile-brave", match = { title = "^Brave-browser$" }, tile = true })
hl.window_rule({ name = "tile-chromium", match = { title = "^Chromium$" }, tile = true })

hl.window_rule({ name = "float-pavucontrol", match = { title = "^pavucontrol$" }, float = true })
hl.window_rule({ name = "float-blueman", match = { title = "^blueman-manager$" }, float = true })
hl.window_rule({ name = "float-nm", match = { title = "^nm-connection-editor$" }, float = true })
hl.window_rule({ name = "float-qalc", match = { title = "^qalculate-gtk$" }, float = true })

hl.window_rule({
  name  = "pip",
  match = { title = "^Picture-in-Picture$" },
  float = true,
  pin   = true,
  move  = "69.5% 4%",
})

-- XWayland: no blur for Resolve
hl.window_rule({
  name    = "noblur-resolve",
  match   = { class = "^resolve$", xwayland = true },
  no_blur = true,
})

-- Fix XWayland drag issues
hl.window_rule({
  name     = "fix-xwayland-drags",
  match    = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
  no_focus = true,
})

--------------------
---- KEYBINDINGS ----
--------------------

local mainMod     = "SUPER"
local terminal    = "kitty"
local fileManager = "nautilus"
local HYPRSCRIPTS = os.getenv("HOME") .. "/.config/hypr/scripts"
-- NixOS flake: "noctalia-shell ipc call" | Manual/PikaOS: "qs -c noctalia-shell ipc call"
local ipc         = "noctalia-shell ipc call"

-- Applications
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("flatpak run app.zen_browser.zen"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))

-- Noctalia panels
hl.bind(mainMod .. " + CTRL + RETURN", hl.dsp.exec_cmd(ipc .. " launcher toggle"))
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd(ipc .. " controlCenter toggle"))
hl.bind(mainMod .. " + CTRL + comma", hl.dsp.exec_cmd(ipc .. " settings toggle"))
hl.bind(mainMod .. " + CTRL + H", hl.dsp.exec_cmd(ipc .. " session toggle"))
hl.bind("CTRL + SUPER + B", hl.dsp.exec_cmd(ipc .. " bar toggle"))
-- Logout menu
hl.bind("CTRL + SUPER + H", hl.dsp.exec_cmd(ipc .. " sessionMenu toggle"))

-- Wallpaper selector
hl.bind("CTRL + SUPER + W", hl.dsp.exec_cmd(ipc .. " wallpaper toggle"))


-- Window management
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = 0 }))
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("hyprctl dispatch workspaceopt allfloat"))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + K", hl.dsp.layout("swapsplit"))
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())


-- Focus — arrows
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Focus — HJKL
hl.bind(mainMod .. " + ALT + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + ALT + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + ALT + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + ALT + J", hl.dsp.focus({ direction = "down" }))

-- Swap windows (swapwindow has no lua dispatcher, use hyprctl)
hl.bind(mainMod .. " + ALT + left", hl.dsp.exec_cmd("hyprctl dispatch swapwindow l"))
hl.bind(mainMod .. " + ALT + right", hl.dsp.exec_cmd("hyprctl dispatch swapwindow r"))
hl.bind(mainMod .. " + ALT + up", hl.dsp.exec_cmd("hyprctl dispatch swapwindow u"))
hl.bind(mainMod .. " + ALT + down", hl.dsp.exec_cmd("hyprctl dispatch swapwindow d"))

-- Resize — keyboard
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 100, y = 0 }))
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -100, y = 0 }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 100 }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -100 }))

-- Mouse drag/resize — hl.dsp.window.drag() is correct for movewindow (per official example)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Alt+Tab cycle (two separate hl.dispatch calls inside lambda — per wiki)
hl.bind("ALT + Tab", function()
  hl.dispatch(hl.dsp.window.cycle_next())
  hl.dispatch(hl.dsp.window.bring_to_top())
end)

-- Workspaces 1-10
for i = 1, 10 do
  local key = i % 10 -- 10 → key 0
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
  hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.exec_cmd(HYPRSCRIPTS .. "/moveTo.sh " .. i))
end

-- Workspace navigation
hl.bind(mainMod .. " + H", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + D", hl.dsp.focus({ workspace = "next" }))
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + CTRL + down", hl.dsp.focus({ workspace = "empty" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/toggle_desktop.sh"))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Display zoom reset
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor 1"))

-- Actions
hl.bind(mainMod .. " + CTRL + U", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/toggle-animations.sh"))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/screenshot.sh"))
hl.bind(mainMod .. " + ALT + F", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/screenshot.sh --instant"))
hl.bind(mainMod .. " + ALT + S", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/screenshot.sh --instant-area"))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/power.sh lock"))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/hyprshade.sh"))
hl.bind(mainMod .. " + ALT + G", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/gamemode.sh"))
hl.bind("CTRL + ALT + N", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/night_mode.sh"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

-- Fn keys — volume/brightness via noctalia OSD
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. " brightness increase"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. " brightness decrease"), { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. " volume increase"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. " volume decrease"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. " volume muteOutput"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
-- XF86Lock keysym doesn't exist — use XF86ScreenSaver (xkbcommon name after XKB_KEY_ prefix)
hl.bind("XF86ScreenSaver", hl.dsp.exec_cmd("hyprlock"))
hl.bind("XF86Calculator", hl.dsp.exec_cmd("qalculate-gtk"))

-- Keyboard backlight (Apple/Mac hardware)
hl.bind("code:238", hl.dsp.exec_cmd("brightnessctl -d smc::kbd_backlight s +10"))
hl.bind("code:237", hl.dsp.exec_cmd("brightnessctl -d smc::kbd_backlight s 10-"))
