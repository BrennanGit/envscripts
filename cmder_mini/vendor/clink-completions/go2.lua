local matchers = require('matchers')
local parser = clink.arg.new_parser

function lines_from(file)
  lines = {}
  for line in io.lines(file) do 
    lines[#lines + 1] = line
  end
  return lines
end

local path_to_here = debug.getinfo(1).source:match("@?(.*/)")
local script = string.format("%s../../../go2targets/base.cmd", path_to_here)
local lines = lines_from(script)
local targets = {}
for i, line in ipairs(lines) do
  if line:find("^:") and not line:find("^:END") then
    table.insert(targets, string.sub(line, 2))
  end
end

local go2_parser = parser(targets)


clink.arg.register_parser("go2", go2_parser)
clink.arg.register_parser("go2.cmd", go2_parser)