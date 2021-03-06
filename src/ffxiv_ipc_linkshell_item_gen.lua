-- This file is generated by tools/json2lua.js

local db = require('ffxiv_db')
local ffxiv_ipc_linkshell_item = Proto("ffxiv_ipc_linkshell_item", "FFXIV-IPC LinkshellItem")

local linkshell_item_fields = {
  id       = ProtoField.uint32("ffxiv_ipc_linkshell_item.id", "ID", base.DEC),
  unknown0 = ProtoField.uint16("ffxiv_ipc_linkshell_item.unknown0", "unknown0", base.DEC),
  server1  = ProtoField.uint16("ffxiv_ipc_linkshell_item.server1", "Server1", base.DEC, db.World),
  id2      = ProtoField.uint32("ffxiv_ipc_linkshell_item.id2", "ID2", base.DEC),
  unknown1 = ProtoField.uint16("ffxiv_ipc_linkshell_item.unknown1", "unknown1", base.DEC),
  server2  = ProtoField.uint16("ffxiv_ipc_linkshell_item.server2", "Server2", base.DEC, db.World),
  rank     = ProtoField.uint8("ffxiv_ipc_linkshell_item.rank", "rank", base.DEC),
  padding  = ProtoField.uint16("ffxiv_ipc_linkshell_item.padding", "padding", base.DEC),
  name     = ProtoField.string("ffxiv_ipc_linkshell_item.name", "Name", base.UNICODE),
}

ffxiv_ipc_linkshell_item.fields = linkshell_item_fields

function ffxiv_ipc_linkshell_item.dissector(tvbuf, pktinfo, root)
  local tree = root:add(ffxiv_ipc_linkshell_item, tvbuf)
  pktinfo.cols.info:set("LinkshellItem")

  local len = tvbuf:len()

  -- dissect the id field
  local id_tvbr = tvbuf:range(0, 4)
  local id_val  = id_tvbr:le_uint()
  tree:add_le(linkshell_item_fields.id, id_tvbr, id_val)

  -- dissect the unknown0 field
  local unknown0_tvbr = tvbuf:range(4, 2)
  local unknown0_val  = unknown0_tvbr:le_uint()
  tree:add_le(linkshell_item_fields.unknown0, unknown0_tvbr, unknown0_val)

  -- dissect the server1 field
  local server1_tvbr = tvbuf:range(6, 2)
  local server1_val  = server1_tvbr:le_uint()
  tree:add_le(linkshell_item_fields.server1, server1_tvbr, server1_val)

  -- dissect the id2 field
  local id2_tvbr = tvbuf:range(8, 4)
  local id2_val  = id2_tvbr:le_uint()
  tree:add_le(linkshell_item_fields.id2, id2_tvbr, id2_val)

  -- dissect the unknown1 field
  local unknown1_tvbr = tvbuf:range(12, 2)
  local unknown1_val  = unknown1_tvbr:le_uint()
  tree:add_le(linkshell_item_fields.unknown1, unknown1_tvbr, unknown1_val)

  -- dissect the server2 field
  local server2_tvbr = tvbuf:range(14, 2)
  local server2_val  = server2_tvbr:le_uint()
  tree:add_le(linkshell_item_fields.server2, server2_tvbr, server2_val)

  -- dissect the rank field
  local rank_tvbr = tvbuf:range(17, 1)
  local rank_val  = rank_tvbr:le_uint()
  tree:add_le(linkshell_item_fields.rank, rank_tvbr, rank_val)

  -- dissect the padding field
  local padding_tvbr = tvbuf:range(18, 2)
  local padding_val  = padding_tvbr:le_uint()
  tree:add_le(linkshell_item_fields.padding, padding_tvbr, padding_val)

  -- dissect the name field
  local name_tvbr = tvbuf:range(20, 36)
  local name_val  = name_tvbr:string(ENC_UTF_8)
  tree:add(linkshell_item_fields.name, name_tvbr, name_val)

  local name_display = ", Name: " .. name_val
  pktinfo.cols.info:append(name_display)
  tree:append_text(name_display)

  if id_val == 0 then
    tree:set_hidden(true)
  end

  return len
end