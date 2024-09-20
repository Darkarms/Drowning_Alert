--setup initial frame settings for flashing the screen
local flashFrame = CreateFrame("Frame", "FlashFrame", UIParent)
flashFrame:SetFrameStrata("BACKGROUND")
flashFrame:SetAllPoints(UIParent)
flashFrame:SetAlpha(0)

--create the texture for the flashing frame
local texture = flashFrame:CreateTexture()
texture:SetColorTexture(1, 0, 0, 0.5)
texture:SetAllPoints(frame)

local function FlashRed()
	
	flashFrame:Show()
	UIFrameFadeIn(flashFrame, 0.2, 0, 0.4)
	C_Timer.After(0.2, function()
		UIFrameFadeOut(flashframe, 0.2, 0.4, 0)
	end)
	
end

local function ResetFlash()
	
	flashFrame:SetAlpha(0)
	flashFrame:Hide()
	
end


		

local function CheckOxygen()
    local timer, initial, maxvalue, scale, paused, label = GetMirrorTimerInfo(2)
    local curValue = GetMirrorTimerProgress("BREATH")

	if(not (curValue <= 0) and not (maxvalue <= 0))
	then
		local availableOxygenPercentage = math.floor(curValue / maxvalue * 100)
		if(availableOxygenPercentage <= Drowning_Alert_Variables.AlertValue) then
			UIErrorsFrame:AddMessage("You are DROWNING!");
			PlaySound(8959)
			FlashRed()
		else
			ResetFlash()
		end
	end
	C_Timer.After(1, CheckOxygen)
end

C_Timer.After(1, CheckOxygen)

local f = CreateFrame("FRAME")

