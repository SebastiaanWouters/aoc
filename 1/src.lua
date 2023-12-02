package.path = package.path .. ";../helpers.lua"
digits = {
    ["1"] = "1",
    ["2"] = "2",
    ["3"] = "3",
    ["4"] = "4",
    ["5"] = "5",
    ["6"] = "6",
    ["7"] = "7",
    ["8"] = "8",
    ["9"] = "9",
    ["one"] = "1",
    ["two"] = "2",
    ["three"] = "3",
    ["four"] = "4",
    ["five"] = "5",
    ["six"] = "6",
    ["seven"] = "7",
    ["eight"] = "8",
    ["nine"] = "9"
}

digits_r = {
    ["1"] = "1",
    ["2"] = "2",
    ["3"] = "3",
    ["4"] = "4",
    ["5"] = "5",
    ["6"] = "6",
    ["7"] = "7",
    ["8"] = "8",
    ["9"] = "9",
    ["eno"] = "1",
    ["owt"] = "2",
    ["eerht"] = "3",
    ["ruof"] = "4",
    ["evif"] = "5",
    ["xis"] = "6",
    ["neves"] = "7",
    ["thgie"] = "8",
    ["enin"] = "9"
}


local helpers = require "helpers"
local file = "input.txt"
local lines = helpers.lines_from(file)
sum = 0;

function getFirstDigit(s) 
  local i = 1000
  local digit = 0
  for k,v in pairs(digits) do 
    b,e = string.find(s, k)
    if (b ~= nil and b < i) then
      i = b
      digit = v
    end
  end
  print(digit)
  return digit
end

function getLastDigit(s)   
  local i = 1000
  local digit = 0
  for k,v in pairs(digits_r) do 
    b,e = string.find(s, k)
    if (b ~= nil and b < i) then
      i = b
      digit = v
    end
  end
  print(digit)
  return digit
end  

function isDigit(s)
  return string.find(s, "%d") and true or false
end

for k,v in pairs(lines) do
   local left = getFirstDigit(v)
   local right = getLastDigit(string.reverse(v))
   sum = sum + tonumber(left .. right)
 end

 print(sum)
