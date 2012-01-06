--[[--
CalGUI (Pronounced Cal-gew-ey), a GUI library for LuaFX
By flyingfisch 
Last Updated 1/05/2012
This project is free and open source.
--]]--

-- locals
local line = graydraw.line
local wait = misc.wait
local setcolor = graydraw.setcolor
local text = graydraw.text
local exitprog = misc.exit
local print = nbdraw.print
local find = string.find
local setCursor = nbdraw.setcursor
local strsub = string.sub
local strlen = string.len

--Sprites
--Cursor sprite (8x8):
cursor_img = "\000\000üü\000ÀÀ\000  \000\000\000\000\000\000\000\000\000\000\000"

--[[--
Class definition system
Borrowed from LuaNspire
Thanks to adriweb for code
--]]--
class = function(prototype)
    local derived = {}
    local derivedMT = {
        __index = prototype,
        __call  = function(proto, ...)
            local instance = {}
            local instanceMT = {
                __index = derived,
                __call = function()
                    return nil, "ERROR: Attempt to invoke an instance of a class"
                end,
            }
            setmetatable(instance, instanceMT)
            if instance.init then
                instance:init(...)
            end
            return instance
        end,
    }
    setmetatable(derived, derivedMT)
    return derived
end

--[[--
Input text system
--]]--
function input()
setcolor(false) --set 5-color mode "false"
i = 1
parse = ""
print(parse .. "_")
--keystrokes
while not key(5) do
repeat
--non-alpha:
if alpha == 0 then
if key(1) then parse = parse .. "0" end
if key(2) then parse = parse .. "." end
if key(4) then parse = parse .. "-" end
if key(6) then parse = parse .. "1" end
if key(7) then parse = parse .. "2" end
if key(8) then parse = parse .. "3" end
if key(9) then parse = parse .. "+" end
if key(10) then parse = parse .. "-" end
if key(11) then parse = parse .. "4" end
if key(12) then parse = parse .. "5" end
if key(13) then parse = parse .. "6" end
if key(14) then parse = parse .. "*" end
if key(15) then parse = parse .. "/" end
if key(16) then parse = parse .. "7" end
if key(17) then parse = parse .. "8" end
if key(18) then parse = parse .. "9" end
if key(19) then parse = strsub(parse,1,#parse-1) end
if key(33) then alpha = 1 end
--alpha:
else
if key(1) then parse = parse .. "z" end
if key(2) then parse = parse .. " " end
if key(3) then parse = parse .. [["]] end
if key(6) then parse = parse .. "u" end
if key(7) then parse = parse .. "v" end
if key(8) then parse = parse .. "w" end
if key(9) then parse = parse .. "x" end
if key(10) then parse = parse .. "y" end
if key(11) then parse = parse .. "p" end
if key(12) then parse = parse .. "q" end
if key(13) then parse = parse .. "r" end
if key(14) then parse = parse .. "s" end
if key(15) then parse = parse .. "t" end
if key(16) then parse = parse .. "m" end
if key(17) then parse = parse .. "n" end
if key(18) then parse = parse .. "o" end
if key(19) then parse = strsub(parse,1,#parse-1) end
if key(21) then parse = parse .. "g" end
if key(22) then parse = parse .. "h" end
if key(23) then parse = parse .. "i" end
if key(24) then parse = parse .. "j" end
if key(25) then parse = parse .. "k" end
if key(26) then parse = parse .. "l" end
if key(27) then parse = parse .. "a" end
if key(28) then parse = parse .. "b" end
if key(29) then parse = parse .. "c" end
if key(30) then parse = parse .. "d" end
if key(31) then parse = parse .. "e" end
if key(32) then parse = parse .. "f" end
if key(34) then parse = parse .. "r" end
if key(33) then alpha = 0 end
end
wait(2) --interrupt
until key(0)

clear nil
setCursor(1,1)
print(parse .. "_")

refresh

if key(5) then break end --check for EXE
wait(3)
end
end
