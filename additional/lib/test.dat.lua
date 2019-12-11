
local _NAME = "test"
local _M = {}
local _G = _G

print("loading test")

_M.put = function(msg)
    print(msg)
end

_G.package.loaded[_NAME] = _M
return _M
