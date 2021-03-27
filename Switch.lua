--[[

TODO: Make use of switch statements in lua
SETUP: Run "require(FILE_NAME_HERE)" in your code, you wont have to set it as a value as it will be loaded into your environment

]]

local copy = function(i, o)
	for k, v in pairs(i) do
		o[k] = v
	end
	return o
end

local env = getfenv(1)

setfenv(1, copy({switch = function(val, c)
	local cases = {}
    for k, v in pairs(c) do
        if type(v) == "function" then
            cases[k] = v
        end
    end
    return cases[val]()
end}, env))

return switch
