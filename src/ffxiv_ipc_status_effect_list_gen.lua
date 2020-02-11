-- This file is generated by tools/json2lua.js

local db = require('ffxiv_db')
local ffxiv_ipc_status_effect_list = Proto("ffxiv_ipc_status_effect_list", "FFXIV-IPC Status Effect List")

local status_effect_list_fields = {
  class_id                = ProtoField.uint8("ffxiv_ipc_status_effect_list.class_id", "classId", base.DEC, db.ClassJob),
  level1                  = ProtoField.uint8("ffxiv_ipc_status_effect_list.level1", "level1", base.DEC),
  level                   = ProtoField.uint16("ffxiv_ipc_status_effect_list.level", "level", base.DEC),
  current_hp              = ProtoField.uint32("ffxiv_ipc_status_effect_list.current_hp", "current_hp", base.DEC),
  max_hp                  = ProtoField.uint32("ffxiv_ipc_status_effect_list.max_hp", "max_hp", base.DEC),
  current_mp              = ProtoField.uint16("ffxiv_ipc_status_effect_list.current_mp", "current_mp", base.DEC),
  max_mp                  = ProtoField.uint16("ffxiv_ipc_status_effect_list.max_mp", "max_mp", base.DEC),
  current_tp              = ProtoField.uint16("ffxiv_ipc_status_effect_list.current_tp", "currentTp", base.DEC),
  unknown1                = ProtoField.uint16("ffxiv_ipc_status_effect_list.unknown1", "unknown1", base.DEC),
  padding                 = ProtoField.uint32("ffxiv_ipc_status_effect_list.padding", "padding", base.DEC),
}

ffxiv_ipc_status_effect_list.fields = status_effect_list_fields

function ffxiv_ipc_status_effect_list.dissector(tvbuf, pktinfo, root)
  local tree = root:add(ffxiv_ipc_status_effect_list, tvbuf)
  pktinfo.cols.info:set("Status Effect List")

  local len = tvbuf:len()

  -- dissect the class_id field
  local class_id_tvbr = tvbuf:range(0, 1)
  local class_id_val  = class_id_tvbr:le_uint()
  tree:add_le(status_effect_list_fields.class_id, class_id_tvbr, class_id_val)

  -- dissect the level1 field
  local level1_tvbr = tvbuf:range(1, 1)
  local level1_val  = level1_tvbr:le_uint()
  tree:add_le(status_effect_list_fields.level1, level1_tvbr, level1_val)

  -- dissect the level field
  local level_tvbr = tvbuf:range(2, 2)
  local level_val  = level_tvbr:le_uint()
  tree:add_le(status_effect_list_fields.level, level_tvbr, level_val)

  -- dissect the current_hp field
  local current_hp_tvbr = tvbuf:range(4, 4)
  local current_hp_val  = current_hp_tvbr:le_uint()
  tree:add_le(status_effect_list_fields.current_hp, current_hp_tvbr, current_hp_val)

  -- dissect the max_hp field
  local max_hp_tvbr = tvbuf:range(8, 4)
  local max_hp_val  = max_hp_tvbr:le_uint()
  tree:add_le(status_effect_list_fields.max_hp, max_hp_tvbr, max_hp_val)

  -- dissect the current_mp field
  local current_mp_tvbr = tvbuf:range(12, 2)
  local current_mp_val  = current_mp_tvbr:le_uint()
  tree:add_le(status_effect_list_fields.current_mp, current_mp_tvbr, current_mp_val)

  -- dissect the max_mp field
  local max_mp_tvbr = tvbuf:range(14, 2)
  local max_mp_val  = max_mp_tvbr:le_uint()
  tree:add_le(status_effect_list_fields.max_mp, max_mp_tvbr, max_mp_val)

  -- dissect the current_tp field
  local current_tp_tvbr = tvbuf:range(16, 2)
  local current_tp_val  = current_tp_tvbr:le_uint()
  tree:add_le(status_effect_list_fields.current_tp, current_tp_tvbr, current_tp_val)

  -- dissect the unknown1 field
  local unknown1_tvbr = tvbuf:range(18, 2)
  local unknown1_val  = unknown1_tvbr:le_uint()
  tree:add_le(status_effect_list_fields.unknown1, unknown1_tvbr, unknown1_val)

  -- dissect status_effect_list_item
  local status_effect_list_item_dissector = Dissector.get('ffxiv_ipc_status_effect_list_item')
  local status_effect_list_item_pos = 20
  local status_effect_list_item_len = 12
  local status_effect_list_item_count = 30

  while status_effect_list_item_pos + status_effect_list_item_len <= len do
    local status_effect_list_item_tvbr = tvbuf:range(status_effect_list_item_pos, 12)
    status_effect_list_item_dissector:call(status_effect_list_item_tvbr:tvb(), pktinfo, root)
    status_effect_list_item_pos = status_effect_list_item_pos + status_effect_list_item_len
    status_effect_list_item_count = status_effect_list_item_count - 1
    if status_effect_list_item_count <= 0 then
      break
    end
  end

  -- dissect the padding field
  local padding_tvbr = tvbuf:range(380, 4)
  local padding_val  = padding_tvbr:le_uint()
  tree:add_le(status_effect_list_fields.padding, padding_tvbr, padding_val)

  return len
end