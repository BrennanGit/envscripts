local matchers = require('matchers')
local parser = clink.arg.new_parser

local home_dir = "C:\\Users\\brennan"
local scratch_dir = "C:\\Users\\brennan\\OneDrive - Xmos\\Documents\\Scratch"
local sb_dir = "C:\\Users\\brennan\\sb"

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
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

function alias_list()
    local t = {}
    local path_to_here = debug.getinfo(1).source:match("@?(.*/)")
    local dir = string.format("%s../../../aliases", path_to_here)
    local files = cmds_from(dir)
    local targets = {}
    for i, line in ipairs(files) do
        t[i] = line
    end
    return t
end

local sandboxes = scandir(sb_dir)
local scratch_dirs = scandir(scratch_dir)
local home_dirs = scandir(home_dir)
local pwd_dirs = matchers.dirs
local aliases = alias_list()

local edit_parser = parser({
    "sb" .. parser({sandboxes}),
    "alias" .. parser({aliases}),
    scratch_dirs,
    pwd_dirs,
    home_dirs,
    }, "-h", "--help")


clink.arg.register_parser("edit", edit_parser)
clink.arg.register_parser("edit.cmd", edit_parser)
clink.arg.register_parser("editvs", edit_parser)
clink.arg.register_parser("editvs.cmd", edit_parser)
clink.arg.register_parser("editsubl", edit_parser)
clink.arg.register_parser("editsubl.cmd", edit_parser)
