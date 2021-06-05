--[[

A special function that allows you to dump libraries into a selected function environment.

Written by cfgtsp

]]

return function(tbl, env)
	local env = (type(env) == "number" and env) or (type(env) == "string" and tostring(env)) or 1
	local Env = getfenv(env)
	
	for k, v in pairs(tbl) do
		Env[k] = v
	end
end
