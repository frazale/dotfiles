local envvar = {
  ["GDK_BACKEND"] = "wayland,x11,*",
  ["SDL_VIDEODRIVER"] = "wayland",
  ["CLUTTER_BACKEND"] = "wayland",
  ["XDG_CURRENT_DESKTOP"] = "Hyprland",
  ["XDG_SESSION_TYPE"] = "wayland",
  ["XDG_SESSION_DESKTOP"] = "Hyprland",
  ["QT_AUTO_SCREEN_SCALE_FACTOR"] = "1",
  ["QT_QPA_PLATFORM"] = "wayland;xcb",
  ["QT_WAYLAND_DISABLE_WINDOWDECORATION"] = "1",
  ["GBM_BACKEND"] = "nvidia-drm",
  ["__GLX_VENDOR_LIBRARY_NAME"] = "nvidia",
  ["LIBVA_DRIVER_NAME"] = "nvidia",
  ["NVD_BACKEND"] = "direct",
  ["ELECTRON_OZONE_PLATFORM_HINT"] = "auto",
  ["GTK_THEME"] = "Nord",
  ["XCURSOR_SIZE"] = "24",
  ["HYPRCURSOR_SIZE"] = "24",
}

for key, value in pairs(envvar) do
  hl.env(key, value)
end
