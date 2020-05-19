-- This file is generated by tools/json2lua.js

local M = {}
M.types = {
  [0x008C] = {
    [0] = {
      name = "ffxiv_ipc_actor_cast",
      length = 32,
    },
  },
  [0x03CC] = {
    [0] = {
      name = "ffxiv_ipc_actor_control",
      length = 24,
    },
  },
  [0x0398] = {
    [0] = {
      name = "ffxiv_ipc_actor_control_self",
      length = 32,
    },
  },
  [0x03DB] = {
    [0] = {
      name = "ffxiv_ipc_actor_gauge",
      length = 16,
    },
  },
  [0x02D8] = {
    [0] = {
      name = "ffxiv_ipc_actor_move",
      length = 16,
    },
  },
  [0x0067] = {
    [0] = {
      name = "ffxiv_ipc_actor_set_pos",
      length = 24,
    },
  },
  [0x0251] = {
    [0] = {
      name = "ffxiv_ipc_add_status_effect",
      length = 30,
    },
  },
  [0x0245] = {
    [0] = {
      name = "ffxiv_ipc_effect16",
      length = 1212,
    },
  },
  [0x01E5] = {
    [0] = {
      name = "ffxiv_ipc_effect24",
      length = 1788,
    },
  },
  [0x01B2] = {
    [0] = {
      name = "ffxiv_ipc_effect32",
      length = 2364,
    },
  },
  [0x0219] = {
    [0] = {
      name = "ffxiv_ipc_effect8",
      length = 636,
    },
  },
  [0x023b] = {
    [0] = {
      name = "ffxiv_ipc_boss_status_effect_list",
      length = 744,
    },
  },
  [0x0233] = {
    [0] = {
      name = "ffxiv_ipc_client_trigger",
      length = 32,
    },
  },
  [0x026F] = {
    [0] = {
      name = "ffxiv_ipc_container_info",
      length = 16,
    },
  },
  [0x0217] = {
    [0] = {
      name = "ffxiv_ipc_currency_crystal_info",
      length = 32,
    },
  },
  [0x00D5] = {
    [0] = {
      name = "ffxiv_ipc_effect",
      length = 124,
    },
  },
  [0x038D] = {
    [0] = {
      name = "ffxiv_ipc_examine",
      length = 656,
    },
  },
  [0x0264] = {
    [0] = {
      name = "ffxiv_ipc_init_zone",
      length = 96,
    },
  },
  [0x0177] = {
    [0] = {
      name = "ffxiv_ipc_inventory_action_ack",
      length = 16,
    },
  },
  [0x028B] = {
    [0] = {
      name = "ffxiv_ipc_inventory_transaction",
      length = 36,
    },
  },
  [0x008f] = {
    [0] = {
      name = "ffxiv_ipc_inventory_transaction_finish",
      length = 16,
    },
  },
  [0x0280] = {
    [0] = {
      name = "ffxiv_ipc_npc_spawn",
      length = 640,
    },
  },
  [0x02e0] = {
    [0] = {
      name = "ffxiv_ipc_boss_npc_spawn",
      length = 640,
    },
  },
  [0x0116] = {
    [0] = {
      name = "ffxiv_ipc_player_spawn",
      length = 632,
    },
  },
  [0x0346] = {
    [0] = {
      name = "ffxiv_ipc_player_stats",
      length = 224,
    },
  },
  [0x02AE] = {
    [0] = {
      name = "ffxiv_ipc_public_message",
      length = 48,
    },
  },
  [0x00B5] = {
    [0] = {
      name = "ffxiv_ipc_retainer_information",
      length = 73,
    },
  },
  [0x021F] = {
    [0] = {
      name = "ffxiv_ipc_status_effect_list",
      length = 384,
    },
  },
  [0x0096] = {
    [0] = {
      name = "ffxiv_ipc_update_class_info",
      length = 16,
    },
  },
  [0x01F6] = {
    [0] = {
      name = "ffxiv_ipc_update_hp_mp_tp",
      length = 14,
    },
  },
  [0x01A7] = {
    [0] = {
      name = "ffxiv_ipc_update_inventory_slot",
      length = 64,
    },
  },
  [0x0387] = {
    [0] = {
      name = "ffxiv_ipc_item_info",
      length = 64,
    },
  },
}

function M.getDissector(typeNum, length)
  local types = M.types[typeNum]
  if type(types) ~= "table" then
    return nil
  end

  for k, v in pairs(types) do
    if v.length == length then
      return Dissector.get(v.name)
    end
  end

  for k, v in pairs(types) do
    if v.length < length then
      return Dissector.get(v.name)
    end
  end

  return nil
end

return M
