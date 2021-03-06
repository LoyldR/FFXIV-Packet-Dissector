-- This file is generated by tools/json2lua.js

local ffxiv_ipc_triple_traid_info = Proto("ffxiv_ipc_triple_traid_info", "FFXIV-IPC Triple Traid Info")

local triple_traid_info_fields = {
  traid_id = ProtoField.uint32("ffxiv_ipc_triple_traid_info.traid_id", "TraidId", base.DEC),
  unknown2 = ProtoField.uint32("ffxiv_ipc_triple_traid_info.unknown2", "unknown2", base.DEC),
  unknown3 = ProtoField.uint32("ffxiv_ipc_triple_traid_info.unknown3", "unknown3", base.DEC),
  rule1    = ProtoField.uint8("ffxiv_ipc_triple_traid_info.rule1", "Rule1", base.DEC),
  rule2    = ProtoField.uint8("ffxiv_ipc_triple_traid_info.rule2", "Rule2", base.DEC),
  unknown4 = ProtoField.uint16("ffxiv_ipc_triple_traid_info.unknown4", "unknown4", base.DEC),
  unknown4 = ProtoField.uint32("ffxiv_ipc_triple_traid_info.unknown4", "unknown4", base.DEC),
  unknown5 = ProtoField.uint32("ffxiv_ipc_triple_traid_info.unknown5", "unknown5", base.DEC),
  unknown6 = ProtoField.uint16("ffxiv_ipc_triple_traid_info.unknown6", "unknown6", base.DEC),
  reward   = ProtoField.uint16("ffxiv_ipc_triple_traid_info.reward", "Reward", base.DEC),
  unknown7 = ProtoField.uint32("ffxiv_ipc_triple_traid_info.unknown7", "unknown7", base.DEC),
  unknown8 = ProtoField.uint32("ffxiv_ipc_triple_traid_info.unknown8", "unknown8", base.DEC),
  unknown9 = ProtoField.uint32("ffxiv_ipc_triple_traid_info.unknown9", "unknown9", base.DEC),
}

ffxiv_ipc_triple_traid_info.fields = triple_traid_info_fields

function ffxiv_ipc_triple_traid_info.dissector(tvbuf, pktinfo, root)
  local tree = root:add(ffxiv_ipc_triple_traid_info, tvbuf)
  pktinfo.cols.info:set("Triple Traid Info")

  local len = tvbuf:len()

  -- dissect the traid_id field
  local traid_id_tvbr = tvbuf:range(0, 4)
  local traid_id_val  = traid_id_tvbr:le_uint()
  tree:add_le(triple_traid_info_fields.traid_id, traid_id_tvbr, traid_id_val)

  -- dissect the unknown2 field
  local unknown2_tvbr = tvbuf:range(4, 4)
  local unknown2_val  = unknown2_tvbr:le_uint()
  tree:add_le(triple_traid_info_fields.unknown2, unknown2_tvbr, unknown2_val)

  -- dissect the unknown3 field
  local unknown3_tvbr = tvbuf:range(8, 4)
  local unknown3_val  = unknown3_tvbr:le_uint()
  tree:add_le(triple_traid_info_fields.unknown3, unknown3_tvbr, unknown3_val)

  -- dissect the rule1 field
  local rule1_tvbr = tvbuf:range(12, 1)
  local rule1_val  = rule1_tvbr:le_uint()
  tree:add_le(triple_traid_info_fields.rule1, rule1_tvbr, rule1_val)

  -- dissect the rule2 field
  local rule2_tvbr = tvbuf:range(13, 1)
  local rule2_val  = rule2_tvbr:le_uint()
  tree:add_le(triple_traid_info_fields.rule2, rule2_tvbr, rule2_val)

  -- dissect the unknown4 field
  local unknown4_tvbr = tvbuf:range(14, 2)
  local unknown4_val  = unknown4_tvbr:le_uint()
  tree:add_le(triple_traid_info_fields.unknown4, unknown4_tvbr, unknown4_val)

  -- dissect the unknown4 field
  local unknown4_tvbr = tvbuf:range(16, 4)
  local unknown4_val  = unknown4_tvbr:le_uint()
  tree:add_le(triple_traid_info_fields.unknown4, unknown4_tvbr, unknown4_val)

  -- dissect the unknown5 field
  local unknown5_tvbr = tvbuf:range(20, 4)
  local unknown5_val  = unknown5_tvbr:le_uint()
  tree:add_le(triple_traid_info_fields.unknown5, unknown5_tvbr, unknown5_val)

  -- dissect the unknown6 field
  local unknown6_tvbr = tvbuf:range(24, 2)
  local unknown6_val  = unknown6_tvbr:le_uint()
  tree:add_le(triple_traid_info_fields.unknown6, unknown6_tvbr, unknown6_val)

  -- dissect the reward field
  local reward_tvbr = tvbuf:range(26, 2)
  local reward_val  = reward_tvbr:le_uint()
  tree:add_le(triple_traid_info_fields.reward, reward_tvbr, reward_val)

  -- dissect the unknown7 field
  local unknown7_tvbr = tvbuf:range(28, 4)
  local unknown7_val  = unknown7_tvbr:le_uint()
  tree:add_le(triple_traid_info_fields.unknown7, unknown7_tvbr, unknown7_val)

  -- dissect the unknown8 field
  local unknown8_tvbr = tvbuf:range(32, 4)
  local unknown8_val  = unknown8_tvbr:le_uint()
  tree:add_le(triple_traid_info_fields.unknown8, unknown8_tvbr, unknown8_val)

  -- dissect the unknown9 field
  local unknown9_tvbr = tvbuf:range(36, 4)
  local unknown9_val  = unknown9_tvbr:le_uint()
  tree:add_le(triple_traid_info_fields.unknown9, unknown9_tvbr, unknown9_val)

  return len
end