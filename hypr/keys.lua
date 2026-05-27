---------------------
---- KEYBINDINGS ----
---------------------
local p = require("programs")

local function mainMod(key)
  return "SUPER + " .. key
end

local function mainModS(key)
  return "SUPER + SHIFT + " .. key
end

local binds = {
  { mainMod("W"),         hl.dsp.window.close() },
  { mainModS("W"),        hl.dsp.window.kill() },
  { mainMod("Return"),    hl.dsp.exec_cmd(p.terminal) },
  { mainMod("E"),         hl.dsp.exec_cmd(p.fileManager) },
  { mainMod("Space"),     hl.dsp.exec_cmd(p.menu) },
  { mainModS("F"),        hl.dsp.window.float() },
  { mainModS("P"),        hl.dsp.window.pseudo() },
  { mainModS("J"),        hl.dsp.layout("togglesplit") },
  -- focus
  { mainMod("left"),      hl.dsp.focus({ direction = "left" }) },
  { mainMod("up"),        hl.dsp.focus({ direction = "up" }) },
  { mainMod("right"),     hl.dsp.focus({ direction = "right" }) },
  { mainMod("down"),      hl.dsp.focus({ direction = "down" }) },
  { mainMod("h"),         hl.dsp.focus({ direction = "left" }) },
  { mainMod("k"),         hl.dsp.focus({ direction = "up" }) },
  { mainMod("l"),         hl.dsp.focus({ direction = "right" }) },
  { mainMod("j"),         hl.dsp.focus({ direction = "down" }) },
  -- move windows
  { mainModS("left"),     hl.dsp.window.move({ direction = "left" }) },
  { mainModS("up"),       hl.dsp.window.move({ direction = "up" }) },
  { mainModS("right"),    hl.dsp.window.move({ direction = "right" }) },
  { mainModS("down"),     hl.dsp.window.move({ direction = "down" }) },
  { mainModS("h"),        hl.dsp.window.move({ direction = "left" }) },
  { mainModS("k"),        hl.dsp.window.move({ direction = "up" }) },
  { mainModS("l"),        hl.dsp.window.move({ direction = "right" }) },
  { mainModS("j"),        hl.dsp.window.move({ direction = "down" }) },
  --
  { mainMod("m"),         hl.dsp.workspace.toggle_special("magic") },
  { mainModS("m"),        hl.dsp.window.move({ workspace = "special:magic" }) },
  { mainMod("mouse:272"), hl.dsp.window.drag(),                               { mouse = true } },
  { mainMod("mouse:273"), hl.dsp.window.resize(),                             { mouse = true } },
}

for _, value in pairs(binds) do
  hl.bind(value[1], value[2], value[3])
end

for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  local mm = "SUPER"
  hl.bind(mm .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mm .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
-- hl.bind(mainMod .. " + M",
--   hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
