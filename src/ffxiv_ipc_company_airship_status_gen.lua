-- This file is generated by tools/json2lua.js

local ffxiv_ipc_company_airship_status = Proto("ffxiv_ipc_company_airship_status", "FFXIV-IPC CompanyAirshipStatus")

local company_airship_status_fields = {
}

ffxiv_ipc_company_airship_status.fields = company_airship_status_fields

function ffxiv_ipc_company_airship_status.dissector(tvbuf, pktinfo, root)
  local tree = root:add(ffxiv_ipc_company_airship_status, tvbuf)
  pktinfo.cols.info:set("CompanyAirshipStatus")

  local len = tvbuf:len()

  -- dissect company_airship_status_item
  local company_airship_status_item_dissector = Dissector.get('ffxiv_ipc_company_airship_status_item')
  local company_airship_status_item_pos = 0
  local company_airship_status_item_len = 36
  local company_airship_status_item_count = 4

  while company_airship_status_item_pos + company_airship_status_item_len <= len do
    local company_airship_status_item_tvbr = tvbuf:range(company_airship_status_item_pos, 36)
    company_airship_status_item_dissector:call(company_airship_status_item_tvbr:tvb(), pktinfo, root)
    company_airship_status_item_pos = company_airship_status_item_pos + company_airship_status_item_len
    company_airship_status_item_count = company_airship_status_item_count - 1
    if company_airship_status_item_count <= 0 then
      break
    end
  end

  return len
end