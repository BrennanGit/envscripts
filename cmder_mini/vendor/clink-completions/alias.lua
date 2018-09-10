local matchers = require('matchers')
local parser = clink.arg.new_parser

function lines_from(file)
  lines = {}
  for line in io.lines(file) do 
    lines[#lines + 1] = line
  end
  return lines
end

function bats_from(directory)
    local i, t, popen = 0, {}, io.popen
    for filename in io.popen('dir "'..directory..'" /b'):lines() do
        i = i + 1
        if string.match(filename, '.bat') then
            filename = filename:gsub(".bat", "")
            t[i] = filename
        end
    end
    return t
end

local path_to_here = debug.getinfo(1).source:match("@?(.*/)")
local dir = string.format("%s../../..", path_to_here)
local files = bats_from(dir)
local targets = {}
for i, line in ipairs(files) do
    table.insert(targets, line)
end

local alias_parser = parser(targets)

clink.arg.register_parser("alias", alias_parser)
clink.arg.register_parser("alias.bat", alias_parser)