-- MyFirstAddon.lua
-- A basic WoW addon template for patch 12.0

local addonName, addon = ...

-- Create main frame
local frame = CreateFrame("Frame")

-- Initialize function
local function Initialize()
    print("Use /em, or /edit to open Edit Mode\nUse /rl to reload\nUse /cd for Cooldown Manager")
end

-- Event handler
local function OnEvent(self, event, ...)
    if event == "ADDON_LOADED" then
        local loadedAddon = ...
        if loadedAddon == addonName then
            Initialize()
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
    end
end

-- Register events
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", OnEvent)

-- Slash command 1: /editmode
SLASH_EDITMODE1 = "/editmode"
SLASH_EDITMODE2 = "/edit"
SLASH_EDITMODE3 = "/em"
SlashCmdList["EDITMODE"] = function(msg)
    ShowUIPanel(EditModeManagerFrame)
end
-- Slash command 4: /rl
SLASH_RL1 = "/rl"
SlashCmdList["RL"] = function(msg)
  C_UI.Reload()
end

-- Slash command 4: /cd
SLASH_CD1 = "/cd"
SLASH_CD2 = "/cooldown"
SlashCmdList["CD"] = function(msg)
    CooldownViewerSettings:SetShown(not CooldownViewerSettings:IsShown())
end


