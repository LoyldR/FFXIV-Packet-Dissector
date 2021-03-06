-- This file is generated by tools/json2lua.js

local db = require('ffxiv_db')
local ffxiv_ipc_update_class_info = Proto("ffxiv_ipc_update_class_info", "FFXIV-IPC Update ClassInfo")

local update_class_info_fields = {
  class_id         = ProtoField.uint8("ffxiv_ipc_update_class_info.class_id", "classId", base.DEC, db.ClassJob),
  level1           = ProtoField.uint8("ffxiv_ipc_update_class_info.level1", "level1", base.DEC),
  level            = ProtoField.uint16("ffxiv_ipc_update_class_info.level", "level", base.DEC),
  next_level_index = ProtoField.uint32("ffxiv_ipc_update_class_info.next_level_index", "nextLevelIndex", base.DEC),
  current_exp      = ProtoField.uint32("ffxiv_ipc_update_class_info.current_exp", "currentExp", base.DEC),
  rested_exp       = ProtoField.uint32("ffxiv_ipc_update_class_info.rested_exp", "restedExp", base.DEC),
}

ffxiv_ipc_update_class_info.fields = update_class_info_fields

function ffxiv_ipc_update_class_info.dissector(tvbuf, pktinfo, root)
  local tree = root:add(ffxiv_ipc_update_class_info, tvbuf)
  pktinfo.cols.info:set("Update ClassInfo")

  local len = tvbuf:len()

  -- dissect the class_id field
  local class_id_tvbr = tvbuf:range(0, 1)
  local class_id_val  = class_id_tvbr:le_uint()
  tree:add_le(update_class_info_fields.class_id, class_id_tvbr, class_id_val)

  local class_id_display = ", classId: " .. (db.ClassJob[class_id_val] or "(unknown)")
  pktinfo.cols.info:append(class_id_display)
  tree:append_text(class_id_display)

  -- dissect the level1 field
  local level1_tvbr = tvbuf:range(1, 1)
  local level1_val  = level1_tvbr:le_uint()
  tree:add_le(update_class_info_fields.level1, level1_tvbr, level1_val)

  -- dissect the level field
  local level_tvbr = tvbuf:range(2, 2)
  local level_val  = level_tvbr:le_uint()
  tree:add_le(update_class_info_fields.level, level_tvbr, level_val)

  -- dissect the next_level_index field
  local next_level_index_tvbr = tvbuf:range(4, 4)
  local next_level_index_val  = next_level_index_tvbr:le_uint()
  tree:add_le(update_class_info_fields.next_level_index, next_level_index_tvbr, next_level_index_val)

  -- dissect the current_exp field
  local current_exp_tvbr = tvbuf:range(8, 4)
  local current_exp_val  = current_exp_tvbr:le_uint()
  tree:add_le(update_class_info_fields.current_exp, current_exp_tvbr, current_exp_val)

  -- dissect the rested_exp field
  local rested_exp_tvbr = tvbuf:range(12, 4)
  local rested_exp_val  = rested_exp_tvbr:le_uint()
  tree:add_le(update_class_info_fields.rested_exp, rested_exp_tvbr, rested_exp_val)

  return len
end