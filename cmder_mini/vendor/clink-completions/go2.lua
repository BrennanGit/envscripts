local matchers = require('matchers')
local parser = clink.arg.new_parser

local scratch_dir = "C:\\Users\\brennan\\OneDrive - Xmos\\Documents\\Scratch"
local sb_dir = "C:\\Users\\brennan\\sb"
local home_dir = "C:\\Users\\brennan"


function lines_from(file)
  lines = {}
  for line in io.lines(file) do 
    lines[#lines + 1] = line
  end
  return lines
end

function scandir(directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen([[dir "]]..directory..[[" /b /ad]])
    for filename in pfile:lines() do
        i = i + 1
        t[i] = filename
    end
    pfile:close()
    return t
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

local scratch_dirs = scandir(scratch_dir)
local sandboxes = scandir(sb_dir)
local home_dirs = scandir(home_dir)

local go2_parser = parser({targets, scratch_dirs, sandboxes, home_dirs})


clink.arg.register_parser("go2", go2_parser)
clink.arg.register_parser("go2.cmd", go2_parser)