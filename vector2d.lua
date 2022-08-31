Vector = {}
function Vector.new(x, y)
    return setmetatable({ x = x or 0, y = y or 0 }, Vector)
end