-- [nfnl] fnl/core.fnl
local _local_1_ = require("nfnl.core")
local concat = _local_1_.concat
local function snoc(xs, x)
  return concat(xs, {x})
end
return {snoc = snoc}
