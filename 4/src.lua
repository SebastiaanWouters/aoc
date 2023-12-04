package.path = package.path .. ";../helpers.lua"

local helpers = require "helpers"
local file = "input.txt"
local lines = helpers.lines_from(file)

sum = 0

for k,v in pairs(lines) do
    winning = {}
    i = 9
    while i <= #v do
        if v:sub(i,i) == '|' then
            i = i + 1
            break
        end
        j = i
        while tonumber(v:sub(j,j)) do
            j = j + 1
        end
        if j > i then
            table.insert(winning, v:sub(i,j-1))
        end
        i = j + 1
    end
    matches = 0
    while i <= #v do
        j = i
        while tonumber(v:sub(j,j)) do
            j = j + 1
        end
        if j > i then
            --check for matching and count
            for b,e in pairs(winning) do
                if e == v:sub(i,j-1) then
                    matches = matches + 1 
                end
            end
        end
        i = j + 1
    end
    temp = 0
    if (matches > 0) then
        temp = 1
    end
    for i=1,matches-1 do
        temp = temp * 2
    end
    sum = sum + temp
    print(temp, matches)
end
print(sum)