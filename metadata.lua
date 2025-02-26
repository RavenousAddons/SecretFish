local ADDON_NAME, ns = ...

local GetAddOnMetadata = C_AddOns.GetAddOnMetadata

ns.name = "Secret Fish"
ns.title = GetAddOnMetadata(ADDON_NAME, "Title")
ns.notes = GetAddOnMetadata(ADDON_NAME, "Notes")
ns.version = GetAddOnMetadata(ADDON_NAME, "Version")
ns.color = "975068"
ns.command = "secretfish"
ns.icon = "136245"
ns.prefix = ""