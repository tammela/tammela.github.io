-- fixes missing info on pages

local iter = io.lines(arg[1])
local tmpname = os.tmpname()
local tmp = io.open(tmpname, "w")

local missing = { -- in place
   ["<title>[%g%s]*</title>"] = {info = "pedro's memory dump"} -- regex = missing info
}

for l in iter do
   for regex, v in pairs(missing) do
      if string.match(l, regex) then
         local s = string.gsub(l, "(<.*>)[%g%s]*(</.*>)", string.format("%%1%s%%2", v.info))
         tmp:write(s .. "\n")
         goto continue
      end
   end
   tmp:write(l .. "\n")
::continue::
end

tmp:close()

os.remove(arg[1])
os.rename(tmpname, arg[1])
