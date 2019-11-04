-- This file is generated by tools/json2lua.js

local db = require('ffxiv_db')
local ffxiv_ipc_public_message = Proto("ffxiv_ipc_public_message", "FFXIV-IPC Public Message")

local function makeValString(enumTable)
  local t = {}
  for name,num in pairs(enumTable) do
      t[num] = name
  end
  return t
end

local public_message_type = {
  Shout = 11,
  Yell = 30,
  Say = 10,
}

local public_message_type_valstr = makeValString(public_message_type)

local public_message_fields = {
  uid0         = ProtoField.uint32("ffxiv_ipc_public_message.uid0", "UID0", base.HEX),
  uid1         = ProtoField.uint32("ffxiv_ipc_public_message.uid1", "UID1", base.HEX),
  character_id = ProtoField.uint32("ffxiv_ipc_public_message.character_id", "CharacterID", base.HEX),
  user_server  = ProtoField.uint16("ffxiv_ipc_public_message.user_server", "UserServer", base.DEC, db.World),
  type         = ProtoField.uint8("ffxiv_ipc_public_message.type", "Type", base.DEC, public_message_type_valstr),
  reserved0    = ProtoField.uint8("ffxiv_ipc_public_message.reserved0", "Reserved0", base.DEC),
  nickname     = ProtoField.string("ffxiv_ipc_public_message.nickname", "Nickname", base.UNICODE),
  content      = ProtoField.string("ffxiv_ipc_public_message.content", "Content", base.UNICODE),
}

ffxiv_ipc_public_message.fields = public_message_fields

function ffxiv_ipc_public_message.dissector(tvbuf, pktinfo, root)
  local tree = root:add(ffxiv_ipc_public_message, tvbuf)

  -- dissect the uid0 field
  local uid0_tvbr = tvbuf:range(0, 4)
  local uid0_val  = uid0_tvbr:le_uint()
  tree:add_le(public_message_fields.uid0, uid0_tvbr)

  -- dissect the uid1 field
  local uid1_tvbr = tvbuf:range(4, 4)
  local uid1_val  = uid1_tvbr:le_uint()
  tree:add_le(public_message_fields.uid1, uid1_tvbr)

  -- dissect the character_id field
  local character_id_tvbr = tvbuf:range(8, 4)
  local character_id_val  = character_id_tvbr:le_uint()
  tree:add_le(public_message_fields.character_id, character_id_tvbr)

  -- dissect the user_server field
  local user_server_tvbr = tvbuf:range(12, 2)
  local user_server_val  = user_server_tvbr:le_uint()
  tree:add_le(public_message_fields.user_server, user_server_tvbr)

  -- dissect the type field
  local type_tvbr = tvbuf:range(14, 1)
  local type_val  = type_tvbr:le_uint()
  tree:add_le(public_message_fields.type, type_tvbr)

  -- dissect the reserved0 field
  local reserved0_tvbr = tvbuf:range(15, 1)
  local reserved0_val  = reserved0_tvbr:le_uint()
  tree:add_le(public_message_fields.reserved0, reserved0_tvbr)

  -- dissect the nickname field
  local nickname_tvbr = tvbuf:range(16, 32)
  local nickname_val  = nickname_tvbr:string(ENC_UTF_8)
  tree:add(public_message_fields.nickname, nickname_val)

  -- dissect the content field
  local content_tvbr = tvbuf:range(48)
  local content_val  = content_tvbr:string(ENC_UTF_8)
  tree:add(public_message_fields.content, content_val)


  pktinfo.cols.info:set("Public Message")
  return tvbuf:len()
end