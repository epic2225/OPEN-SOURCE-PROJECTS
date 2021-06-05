--[[

A special function that allows you to dump libraries into a selected function environment.

Written by cfgtsp

]]

return function(tbl, env)
	local env = getfenv(env) or getfenv(1)
	
	for k, v in pairs(tbl) do
		env[k] = v
	end
end
