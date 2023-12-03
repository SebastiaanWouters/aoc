package.path = package.path .. ";../helpers.lua"

local helpers = require "helpers"
local file = "input.txt"
local lines = helpers.lines_from(file)

red = 12
green = 13
blue = 14

function getId(s)
  local id = ''
  for i = 6,8 do
    if s:sub(i,i) ~= ':' then
      id = id .. s:sub(i,i)
    else
      break
    end 
  end
  return tonumber(id)
end

  
function parseLine(l)
  p = {}
  p.id = getId(l)
  p.g = 0
  p.b = 0
  p.r = 0
  for i = 7, #l do
    local substring = l:sub(i, i + 2)
    if substring == "red" then
      if tonumber(l:sub(i-3,i - 2)) > p.r then
        p.r = tonumber(l:sub(i - 3, i - 2))
      end
    end
    if substring == "blu" then
      if tonumber(l:sub(i-3,i - 2)) > p.b then
        p.b = tonumber(l:sub(i - 3, i - 2))
      end
    end
    if substring == "gre" then
      if tonumber(l:sub(i-3,i - 2)) > p.g then
        p.g = tonumber(l:sub(i - 3, i - 2))
      end
    end

  end
  return p
end

sum = 0
power = 0
for k,v in pairs(lines) do
  res = parseLine(v)
  if res.g <= green and res.b <= blue and res.r <= red then
    sum = sum + res.id
  end
  temp = res.g * res.b * res.r
  power = power + temp
end
print(sum, power)
