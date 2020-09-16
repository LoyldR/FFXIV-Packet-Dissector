-- This file is generated by tools/json2lua.js

local M = {}
M.types = {
  [0x0166] = {
    [0] = {
      name = "ffxiv_ipc_actor_cast",
      length = 32,
    },
  },
  [0x038F] = {
    [0] = {
      name = "ffxiv_ipc_actor_control",
      length = 24,
    },
  },
  [0x028B] = {
    [0] = {
      name = "ffxiv_ipc_actor_control_self",
      length = 32,
    },
  },
  [0x0302] = {
    [0] = {
      name = "ffxiv_ipc_actor_gauge",
      length = 16,
    },
  },
  [0x01E5] = {
    [0] = {
      name = "ffxiv_ipc_actor_move",
      length = 16,
    },
    [1] = {
      name = "ffxiv_ipc_update_class_info",
      length = 16,
    },
  },
  [0x0323] = {
    [0] = {
      name = "ffxiv_ipc_actor_set_pos",
      length = 24,
    },
  },
  [0x0379] = {
    [0] = {
      name = "ffxiv_ipc_add_status_effect",
      length = 26,
    },
  },
  [0x00b1] = {
    [0] = {
      name = "ffxiv_ipc_effect16",
      length = 1212,
    },
  },
  [0x0382] = {
    [0] = {
      name = "ffxiv_ipc_effect24",
      length = 1788,
    },
  },
  [0x00d5] = {
    [0] = {
      name = "ffxiv_ipc_effect32",
      length = 2364,
    },
  },
  [0x02d1] = {
    [0] = {
      name = "ffxiv_ipc_effect8",
      length = 636,
    },
  },
  [0x0133] = {
    [0] = {
      name = "ffxiv_ipc_boss_status_effect_list",
      length = 744,
    },
  },
  [0x01FA] = {
    [0] = {
      name = "ffxiv_ipc_client_trigger",
      length = 32,
    },
  },
  [0x01ae] = {
    [0] = {
      name = "ffxiv_ipc_company_airship_status",
      length = 0,
    },
  },
  [0x00da] = {
    [0] = {
      name = "ffxiv_ipc_company_submersible_status",
      length = 0,
    },
  },
  [0x02A6] = {
    [0] = {
      name = "ffxiv_ipc_content_finder_notify_pop",
      length = 32,
    },
  },
  [0x03AD] = {
    [0] = {
      name = "ffxiv_ipc_currency_crystal_info",
      length = 32,
    },
  },
  [0x02D6] = {
    [0] = {
      name = "ffxiv_ipc_effect",
      length = 124,
    },
  },
  [0x025E] = {
    [0] = {
      name = "ffxiv_ipc_examine",
      length = 656,
    },
  },
  [0x0242] = {
    [0] = {
      name = "ffxiv_ipc_init_zone",
      length = 96,
    },
  },
  [0x03da] = {
    [0] = {
      name = "ffxiv_ipc_inventory_action_ack",
      length = 16,
    },
  },
  [0x01de] = {
    [0] = {
      name = "ffxiv_ipc_inventory_transaction",
      length = 36,
    },
  },
  [0x01fe] = {
    [0] = {
      name = "ffxiv_ipc_inventory_transaction_finish",
      length = 16,
    },
  },
  [0x0142] = {
    [0] = {
      name = "ffxiv_ipc_npc_spawn",
      length = 632,
    },
  },
  [0x0342] = {
    [0] = {
      name = "ffxiv_ipc_boss_npc_spawn",
      length = 640,
    },
  },
  [0x03cd] = {
    [0] = {
      name = "ffxiv_ipc_ping",
      length = 8,
    },
  },
  [0x035E] = {
    [0] = {
      name = "ffxiv_ipc_player_spawn",
      length = 624,
    },
  },
  [0x02D3] = {
    [0] = {
      name = "ffxiv_ipc_player_stats",
      length = 224,
    },
  },
  [0x01D4] = {
    [0] = {
      name = "ffxiv_ipc_retainer_information",
      length = 73,
    },
  },
  [0x0291] = {
    [0] = {
      name = "ffxiv_ipc_status_effect_list",
      length = 384,
    },
  },
  [0x016B] = {
    [0] = {
      name = "ffxiv_ipc_update_hp_mp_tp",
      length = 8,
    },
  },
  [0x028C] = {
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