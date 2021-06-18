function build(directory, config, parameters, level, seed)
	
	config.tooltipFields = config.tooltipFields or {}
	
	if config.tooltipFields ~= nil then
		--Recipientes
		if config.tooltipKind == "container" and config.slotCount ~= nil then
			local SC
			if parameters.slotCount == nil then SC = config.slotCount else SC = parameters.slotCount end
			config.tooltipFields.slotCountLabel = "Acomoda itens: "..SC
			if SC == 1 or SC == 91 then config.tooltipFields.slotCountLabel = "Acomoda "..SC.." itens" end
			if SC == 9 or SC == 12 or SC == 16 or SC == 40 or SC == 48 or SC == 56 or SC == 60 or SC == 80 or SC == 90 or SC == 100 or SC == 110 or SC == 120 or SC == 130 or SC == 140 or SC == 150 or SC == 160 or SC == 180 or SC == 200 or SC == 300 or SC == 540 or SC == 666 then config.tooltipFields.slotCountLabel = "Acomoda "..SC.." itens" end
			if SC == 24 or SC == 32 or SC == 64 or SC == 72 then config.tooltipFields.slotCountLabel = "Acomoda "..SC.." itens" end
			--sb.logInfo("tooltipFields: %s",config.tooltipFields)
			--sb.logInfo("config: %s",config)
			--sb.logInfo("parameters: %s",parameters)
			--sb.logInfo("level: %s",level)
			--sb.logInfo("seed: %s",seed)
			--sb.logInfo("directory: %s",directory)
		end
		--Augments
		if config.tooltipKind == "baseaugment" or config.tooltipKind == "baseAugment" or config.tooltipKind == "armoraugment" or (parameters ~= nil and (parameters.tooltipKind == "baseaugment" or parameters.tooltipKind == "baseAugment" or parameters.tooltipKind == "armoraugment")) then
		
			--NO AUGMENT INSERTED
			if parameters.currentAugment == nil then
				parameters.currentAugment = {}
				parameters.currentAugment.displayName = "^#6f6f6f;MÓDULO NÃO INSTALADO"
			end
			--
		end
		--Pets
		if config.tooltipKind == "filledcapturepod" then
			if parameters.shortdescription == "Peacekeeper Drone" then parameters.shortdescription = "Drone pacífico" end
			if parameters.tooltipFields ~= nil then
				if parameters.tooltipFields.subtitle == "Unknown" then parameters.tooltipFields.subtitle = "Desconhecido" end
				if parameters.tooltipFields.subtitle == "Drone pacífico" then parameters.tooltipFields.subtitle = "Drone pacífico" end
			end
			--Drone pacífico
			if parameters.description == "A deployable automated drone that fires explosive rounds." then parameters.description = "Um drone automatizado implantável que dispara tiros explosivos." end
			--Pet desconhecido
			if parameters.description == "Some indescribable horror" then parameters.description = "Algum terror indescritível" end
			--
		end
		
		--Raridade
		if parameters == nil or parameters.rarity == nil then
			if config.rarity == "common" or config.rarity == "Common" then config.tooltipFields.rarityLabel = "Comum" end
			if config.rarity == "uncommon" or config.rarity == "Uncommon" then config.tooltipFields.rarityLabel = "Incomum" end
			if config.rarity == "rare" or config.rarity == "Rare" then config.tooltipFields.rarityLabel = "Raro" end
			if config.rarity == "legendary" or config.rarity == "Legendary" then config.tooltipFields.rarityLabel = "Lendário" end
			if config.rarity == "essential" or config.rarity == "Essential" then config.tooltipFields.rarityLabel = "Essencial" end
		else
			if parameters.rarity == "common" or parameters.rarity == "Common" then config.tooltipFields.rarityLabel = "Comum" end
			if parameters.rarity == "uncommon" or parameters.rarity == "Uncommon" then config.tooltipFields.rarityLabel = "Incomum" end
			if parameters.rarity == "rare" or parameters.rarity == "Rare" then config.tooltipFields.rarityLabel = "Raro" end
			if parameters.rarity == "legendary" or parameters.rarity == "Legendary" then config.tooltipFields.rarityLabel = "Lendário" end
			if parameters.rarity == "essential" or parameters.rarity == "Essential" then config.tooltipFields.rarityLabel = "Essencial" end
		end
		--Tipo de item
		if config.twoHanded then config.tooltipFields.handednessLabel = "2-Manual" else config.tooltipFields.handednessLabel = "1-Manual" end

	end
	
	return config,parameters
end