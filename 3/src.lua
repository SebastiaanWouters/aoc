package.path = package.path .. ";../helpers.lua"

local helpers = require "helpers"
local file = "input.txt"
local lines = helpers.lines_from(file)

n = string.len(lines[1]) + 1
p = {-1,1,-n,-n-1,-n+1,n-1,n,n+1}

function flatten(lines)
  f = ''
  for k,v in pairs(lines) do
    f = f .. v
    f = f .. '.'
  end
  return f
end

function getValue(s,i)
  valid = false
  local value = ""
  length = 0
  j = i
  while tonumber(s:sub(j,j)) do
    value = value .. s:sub(j,j)
    length = length + 1
    if isAdjacent(s,j) then
      valid = true
    end
    j=j+1
  end
  if valid then
    return {["length"]=length,["value"]=value}
  else
    return nil
  end
end

function isAdjacent(s,i)
  local value = false
  for k,v in pairs(p) do
    if (s:sub(i+v,i+v) ~= '') and ((not tonumber(s:sub(i+v,i+v))) and (not (s:sub(i+v,i+v) == '.'))) then
      value = true  
    end
  end
  return value
end

flat = flatten(lines)
sum = 0
i = 1
while i <= #flat do
  v = getValue(flat,i)
  if v then
    sum = sum +  tonumber(v.value)
    i = i + v.length
  else
    i = i + 1
  end  
end

print(sum)
