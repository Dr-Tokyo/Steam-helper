-- Simple ACF/Manifest parser for Steam files
local parser = {}

function parser.parse_acf(path)
  local file = io.open(path, "r")
  if not file then return nil end

  local data = {}
  for line in file:lines() do
    local key, value = line:match('^%s*"(.+)"%s+"(.*)"%s*$')
    if key and value then
      data[key] = value
    end
  end
  file:close()
  return data
end

return parser
