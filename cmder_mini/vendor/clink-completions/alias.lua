local matchers = require('matchers')
local parser = clink.arg.new_parser

function lines_from(file)
  lines = {}
  for line in io.lines(file) do 
    lines[#lines + 1] = line
  end
  return lines
end

function cmds_from(directory)
    local i, t, popen = 0, {}, io.popen
    for filename in io.popen('dir "'..directory..'" /b'):lines() do
        i = i + 1
        if string.match(filename, '.cmd') then
            filename = filename:gsub(".cmd", "")
            t[i] = filename
        end
    end
    return t
end

local path_to_here = debug.getinfo(1).source:match("@?(.*/)")
local dir = string.format("%s../../../aliases", path_to_here)
local files = cmds_from(dir)
local targets = {}
for i, line in ipairs(files) do
    table.insert(targets, line)
end

local alias_parser = parser({
    "--edit" .. parser(targets),
    "--rm" .. parser(targets),
    {targets},
    }, "-h", "--help")

clink.arg.register_parser("alias", alias_parser)
clink.arg.register_parser("alias.cmd", alias_parser)