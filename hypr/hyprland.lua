require("monitor")
require("autostart")
require("env")
require("looks")
require("keys")
require("windows")

hl.config({
  misc = {
    force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
  },
  general = {
    gaps_in = 1,
    gaps_out = 0,
  },

  decoration = {
    rounding = 0,
    rounding_power = 0,

    shadow = {
      enabled = false,
    },

    blur = {
      enabled = false
    },
  }
})
-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-- For Noctalia Color templates
require("noctalia").apply_theme()
