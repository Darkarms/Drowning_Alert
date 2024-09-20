--set default values if none are set
Drowning_Alert_Variables = Drowning_Alert_Variables or {}
Drowning_Alert_Variables.AlertValue = Drowning_Alert_Variables.AlertValue or 30

-- create the options panel
local optionsPanel = CreateFrame("Frame", "DrowningAlertOptionsPanel", InterfaceOptionsFramePanelContainer)
optionsPanel.name = "DrowningAlert"

--add panel to the interface options
InterfaceOptions_AddCategory(optionsPanel)

-- set options panel attributes
local title = optionsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetPoint("TOPLEFT", 16, -16)
title:SetText("Drowning Alert Settings")

local slider = CreateFrame("Slider", "WhenToWarn", optionsPanel, "OptionsSliderTemplate")
slider:SetWidth(200)
slider:SetHeight(20)
slider:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -40)
slider:SetMinMaxValues(1, 100)
slider:SetValueStep(1)
slider:SetObeyStepOnDrag(true)
slider:SetValue(Drowning_Alert_Variables.AlertValue)

_G[slider:GetName() .. 'Low']:SetText('1')
_G[slider:GetName() .. 'High']:SetText('100')
_G[slider:GetName() .. 'Text']:SetText('Alert Percentage: ' .. Drowning_Alert_Variables.AlertValue )

slider:SetScript("OnValueChanged", function(self, value)

	Drowning_Alert_Variables.AlertValue = value
	_G[slider:GetName() .. 'Text']:SetText('Alert Percentage: ' .. math.floor(Drowning_Alert_Variables.AlertValue))

end)

local function OptionsPanel_OnShow(self)

	slider:SetValue(Drowning_Alert_Variables.AlertValue or 20)

end

optionsPanel:SetScript("OnShow", OptionsPanel_OnShow)


