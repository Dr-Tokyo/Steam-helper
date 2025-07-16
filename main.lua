local parser = require("parser")
local steamapps_path = os.getenv("HOME") .. "/.steam/steam/steamapps/"

for file in io.popen('ls "' .. steamapps_path .. '"'):lines() do
  if file:match("%.acf$") then
    local info = parser.parse_acf(steamapps_path .. file)
    if info then
      print("Game: " .. (info.name or "Unknown"))
      print("AppID: " .. (info.appid or "Unknown"))
      print("Install Dir: " .. (info["installdir"] or "Unknown"))
      print("-----------")
    end
  end
end
