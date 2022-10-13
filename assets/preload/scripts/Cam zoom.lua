-- Config
-- Edit aspects about this script below:

local camZoomPlayer = 0.8
local camZoomOpponent = 0.8


local zoomBasedOnNPS = true -- If the zoom should be based on your NPS 
local NPSAdditionRate = 0.04 -- How much nps should be added
local NPSRemovalMiss = 0.2 -- How much nps should be removed upon miss
local NPSRemovalRate = 0.01 -- How much nps should be removed every update

-- Actual script

local zoom = 0
local nps = 0
local oppNPS = 0


function goodNoteHit()
	if (curBeat) >= 8 and (curBeat) < 412 then	
		if(nps < 0.7) then nps = nps + NPSAdditionRate; end
	end
end
function onMiss()
	onNoteMiss()
end
function onNoteMiss()
	if(nps > 0) then nps = nps - NPSRemovalMiss; end
	if(nps < 0) then nps = 0; end
end
function opponentNoteHit()
	if (curBeat) >= 8 and (curBeat) < 412 then	
		oppNPS = oppNPS + NPSAdditionRate
	end
end

function onUpdate(elapsed)
	if (curBeat) >= 8 and (curBeat) < 412 then	
		if(zoomBasedOnNPS) then
			if(nps > 0) then nps = nps - NPSRemovalRate end
			if(oppNPS > 0) then oppNPS = oppNPS - NPSRemovalRate end
			if(nps < 0) then nps = 0; end
			if(oppNPS < 0) then oppNPS = 0; end
		end
	end
	if (curBeat) >= 8	 and (curBeat) < 412 then	
    	setProperty('defaultCamZoom',(mustHitSection and camZoomPlayer + (zoomBasedOnNPS and math.min(nps,0.4)) or camZoomOpponent + (zoomBasedOnNPS and math.min(oppNPS,0.4))))
	end
end

function onBeatHit()
	health = getProperty('health');

	if getProperty('health') > 0.0 then
       
        setProperty('health', health- 0.0012);

	end

	if songName == 'castoff' then

		if getProperty('curBeat') == 32 then
			doTweenAlpha('hudAlpha', 'camHUD', 0, 0.2, 'quintOut');
		
  	 	elseif getProperty('curBeat') == 38 then
			doTweenAlpha('hudAlpha', 'camHUD', 1, 0.9, 'quintOut');

		elseif getProperty('curBeat') == 232 then
			doTweenAlpha('hudAlpha', 'camHUD', 0, 0.2, 'quintOut');
	
		elseif getProperty('curBeat') == 238 then
			doTweenAlpha('hudAlpha', 'camHUD', 1, 0.9, 'quintOut');
		end
	end
end