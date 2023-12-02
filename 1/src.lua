package.path = package.path .. ";../helpers.lua"
local helpers = require "helpers"
local file = "input.txt"
local lines = helpers.lines_from(file)
sum = 0;

function isDigit(s)
  return string.find(s, "%d") and true or false
end

for k,v in pairs(lines) do
  local left = ''
  local right = ''
  local index = 0
  reversed = string.reverse(v)
  for i = 1, #v do
    local c = v:sub(i,i)
    if isDigit(c) then
      left = c
      index = i
      break
    end
  end 
  
  for i = 1, #reversed do
    local c = reversed:sub(i,i)
    if isDigit(c) then
        right = c
        break
    end
  end
  
  
  sum = sum + tonumber(left .. right)
end

print(sum)

