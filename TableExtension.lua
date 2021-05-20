local tbl = {}

--@TODO: 
--@PARAM: 
function tbl.shallowCopy(t)
	return {unpack(t)};
end

--@TODO: 
--@PARAM: 
function deepCopy(t)
	local copy = {};
	
	if type(t) ~= "table" then return end;
	
	for k, v in pairs(t) do
		if type(v) == "table" then
			local extra = deepCopy(v);
			copy[k] = v
		else
			copy[k] = v
		end
	end
	
	return copy
end

--@TODO: 
--@PARAM: 
function tbl.overrideIndex(t, ind, new)
	if type(t) ~= "table" then return end;
	if not t[ind] ~= nil then return end;
	
	local value = t[ind];
	t[ind] = nil;
	t[new] = value;
end

--@TODO: 
--@PARAM: 
function tbl.getTableIndexes(t)
	local indexes = {}
	for k, v in pairs(t) do
		indexes[#indexes + 1] = k
	end
	return indexes
end

--@TODO: 
--@PARAM: 
function tbl.getTableValues(t)
	local values = {}
	for k, v in pairs(t) do
		values[#values + 1] = v
	end
	return values
end

--@TODO: Get a table index from a value
--@PARAM: 1: "table Subject", 2: "var ObjectValue"
function tbl.reverseIndex(t, val)
	for k, v in pairs(t) do
		if t[k] == val then
			return k
		end
	end
end

function tbl.map(t, f)
	for k, v in pairs(t) do
		f(k, v, t);
	end
end

return tbl
