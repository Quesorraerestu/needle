function onCreate()

    luaDebugMode = true
	
	setProperty('defaultCamZoom', 0.8);

	setProperty('cameraSpeed', 2.2);

	setProperty('health', 2.0);

	setPropertyFromClass('ClientPrefs', 'timeBarType', 'Disabled');

	makeLuaSprite('sky', 'sky', -600, -300);
	setScrollFactor('sky', 1, 1);
    addLuaSprite('sky', false);

	makeLuaSprite('wall', 'wall', -500, -300);
	setScrollFactor('wall', 1, 1);
	scaleObject('wall', 1, 1)
    addLuaSprite('wall', false);

	makeLuaSprite('plank', 'plank', 1400, 700);
	setScrollFactor('plank', 1.2, 1);
	addLuaSprite('plank', true);
	
	makeLuaSprite('plank2', 'plank', -600, 700);
	setScrollFactor('plank2', 1.2, 1);
	addLuaSprite('plank2', true);
end