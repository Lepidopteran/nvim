local M = {}
local mappings = require("core.mapping")


function findSubtable(table, key)
  for k, v in pairs(table) do
    if type(v) == "table" and k == key then
      return v
    end
  end
  return nil
end

