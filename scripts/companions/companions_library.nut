local gt = this.getroottable();

if (!("Companions" in gt.Const))
{
	gt.Const.Companions <- {};
}

gt.Const.Companions.NameList <- [
	"Wardog",
	"Armored Wardog",
	"Heavily Armored Wardog",
	"Warhound",
	"Armored Warhound",
	"Heavily Armored Warhound",
	"Wolf",
	"Direwolf",
	"Frenzied Direwolf",
	"Hyena",
	"Frenzied Hyena",
	"Webknecht",
	"Serpent",
	"Nachzehrer",
	"Alp",
	"Unhold",
	"Armored Unhold",
	"Schrat",
	"Lindwurm",
	"Necromancer",
	"Warbear",
	"White Wolf"	
];
gt.Const.Companions.TypeList <- {
	Wardog = 0,
	WardogArmor = 1,
	WardogArmorHeavy = 2,
	Warhound = 3,
	WarhoundArmor = 4,
	WarhoundArmorHeavy = 5,
	Warwolf = 6,
	Direwolf = 7,
	DirewolfFrenzied = 8,
	Hyena = 9,
	HyenaFrenzied = 10,
	Spider = 11,
	Snake = 12,
	Nacho = 13,
	Alp = 14,
	Unhold = 15,
	UnholdArmor = 16,
	Schrat = 17,
	Noodle = 18,
	TomeReanimation = 19,
	Warbear = 20,
	Whitewolf = 21	
};
gt.Const.Companions.Library <- [
	{
		ID = "accessory.wardog",
		Type = this.Const.Companions.TypeList.Wardog,
		function Name()
		{
			return this.Const.Companions.CanineNames[this.Math.rand(0, this.Const.Companions.CanineNames.len() - 1)];
		}

		NameUnleashed = "Wardog Collar",
		Description = "A strong and loyal dog bred for war. Can be unleashed in battle for scouting, tracking or running down routing enemies.",
		DescriptionUnleashed = "The collar of a wardog that has been unleashed onto the battlefield.",
		function IconLeashed( variant )
		{
			return "tools/dog_01_0" + variant + "_70x70.png";
		}

		IconUnleashed = "tools/dog_01_leash_70x70.png",
		Value = 200,
		PartyStrength = 11,
		MaxPerCompany = 12,
		function Variant()
		{
			return this.Math.rand(1, 4);
		}

		BasicQuirks = [
			"scripts/skills/perks/perk_pathfinder",
			"scripts/skills/perks/perk_steel_brow"
		],
		BasicAttributes = {
			Hitpoints = 50,
			Stamina = 130,
			Bravery = 40,
			Initiative = 130,
			MeleeSkill = 50,
			RangedSkill = 0,
			MeleeDefense = 20,
			RangedDefense = 25
		},
		PreferredAttribute = this.Const.Attributes.MeleeSkill,
		Script = "scripts/companions/types/companions_wardog",
		ArmorScript = null,
		UnleashSounds = [
			"sounds/combat/unleash_wardog_01.wav",
			"sounds/combat/unleash_wardog_02.wav",
			"sounds/combat/unleash_wardog_03.wav",
			"sounds/combat/unleash_wardog_04.wav"
		],
		InventorySounds = [
			"sounds/inventory/wardog_inventory_01.wav",
			"sounds/inventory/wardog_inventory_02.wav",
			"sounds/inventory/wardog_inventory_03.wav"
		],
		Unleash = {
			Script = "scripts/companions/onequip/companions_unleash",
			function Icon( variant )
			{
				return "skills/wardog_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/wardog_0" + variant + "_sw_ac.png";
			}

			Overlay = "active_83",
			onActorDied = true
		},
		Leash = {
			Script = "scripts/companions/onequip/companions_leash",
			function Icon( variant )
			{
				return "skills/wardog_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/wardog_0" + variant + "_sw_ac.png";
			}

			Overlay = "active_83"
		}
	},
	{
		ID = "accessory.armored_wardog",
		Type = this.Const.Companions.TypeList.WardogArmor,
		function Name()
		{
			return this.Const.Companions.CanineNames[this.Math.rand(0, this.Const.Companions.CanineNames.len() - 1)];
		}

		NameUnleashed = "Wardog Collar",
		Description = "A strong and loyal dog bred for war. Can be unleashed in battle for scouting, tracking or running down routing enemies. This one wears a leather coat for protection against cutting wounds.",
		DescriptionUnleashed = "The collar of a wardog that has been unleashed onto the battlefield.",
		function IconLeashed( variant )
		{
			return "tools/dog_01_0" + variant + "_armor_01_70x70.png";
		}

		IconUnleashed = "tools/dog_01_leash_70x70.png",
		Value = 400,
		PartyStrength = 11,
		MaxPerCompany = 12,
		function Variant()
		{
			return this.Math.rand(1, 4);
		}

		BasicQuirks = [
			"scripts/skills/perks/perk_pathfinder",
			"scripts/skills/perks/perk_steel_brow"
		],
		BasicAttributes = {
			Hitpoints = 50,
			Stamina = 130,
			Bravery = 40,
			Initiative = 130,
			MeleeSkill = 50,
			RangedSkill = 0,
			MeleeDefense = 20,
			RangedDefense = 25
		},
		PreferredAttribute = this.Const.Attributes.MeleeSkill,
		Script = "scripts/companions/types/companions_wardog",
		ArmorScript = "scripts/items/armor/special/wardog_armor",
		UnleashSounds = [
			"sounds/combat/unleash_wardog_01.wav",
			"sounds/combat/unleash_wardog_02.wav",
			"sounds/combat/unleash_wardog_03.wav",
			"sounds/combat/unleash_wardog_04.wav"
		],
		InventorySounds = [
			"sounds/inventory/wardog_inventory_01.wav",
			"sounds/inventory/wardog_inventory_02.wav",
			"sounds/inventory/wardog_inventory_03.wav"
		],
		Unleash = {
			Script = "scripts/companions/onequip/companions_unleash",
			function Icon( variant )
			{
				return "skills/wardog_light_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/wardog_light_0" + variant + "_sw_ac.png";
			}

			Overlay = "active_83",
			onActorDied = true
		},
		Leash = {
			Script = "scripts/companions/onequip/companions_leash",
			function Icon( variant )
			{
				return "skills/wardog_light_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/wardog_light_0" + variant + "_sw_ac.png";
			}

			Overlay = "active_83"
		}
	},
	{
		ID = "accessory.heavily_armored_wardog",
		Type = this.Const.Companions.TypeList.WardogArmorHeavy,
		function Name()
		{
			return this.Const.Companions.CanineNames[this.Math.rand(0, this.Const.Companions.CanineNames.len() - 1)];
		}

		NameUnleashed = "Wardog Collar",
		Description = "A strong and loyal dog bred for war. Can be unleashed in battle for scouting, tracking or running down routing enemies. This one wears a heavy hide coat for protection.",
		DescriptionUnleashed = "The collar of a wardog that has been unleashed onto the battlefield.",
		function IconLeashed( variant )
		{
			return "tools/dog_01_0" + variant + "_armor_02_70x70.png";
		}

		IconUnleashed = "tools/dog_01_leash_70x70.png",
		Value = 600,
		PartyStrength = 11,
		MaxPerCompany = 12,
		function Variant()
		{
			return this.Math.rand(1, 4);
		}

		BasicQuirks = [
			"scripts/skills/perks/perk_pathfinder",
			"scripts/skills/perks/perk_steel_brow"
		],
		BasicAttributes = {
			Hitpoints = 50,
			Stamina = 130,
			Bravery = 40,
			Initiative = 130,
			MeleeSkill = 50,
			RangedSkill = 0,
			MeleeDefense = 20,
			RangedDefense = 25
		},
		PreferredAttribute = this.Const.Attributes.MeleeSkill,
		Script = "scripts/companions/types/companions_wardog",
		ArmorScript = "scripts/items/armor/special/wardog_heavy_armor",
		UnleashSounds = [
			"sounds/combat/unleash_wardog_01.wav",
			"sounds/combat/unleash_wardog_02.wav",
			"sounds/combat/unleash_wardog_03.wav",
			"sounds/combat/unleash_wardog_04.wav"
		],
		InventorySounds = [
			"sounds/inventory/wardog_inventory_01.wav",
			"sounds/inventory/wardog_inventory_02.wav",
			"sounds/inventory/wardog_inventory_03.wav"
		],
		Unleash = {
			Script = "scripts/companions/onequip/companions_unleash",
			function Icon( variant )
			{
				return "skills/wardog_heavy_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/wardog_heavy_0" + variant + "_sw_ac.png";
			}

			Overlay = "active_83",
			onActorDied = true
		},
		Leash = {
			Script = "scripts/companions/onequip/companions_leash",
			function Icon( variant )
			{
				return "skills/wardog_heavy_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/wardog_heavy_0" + variant + "_sw_ac.png";
			}

			Overlay = "active_83"
		}
	},
	{
		ID = "accessory.warhound",
		Type = this.Const.Companions.TypeList.Warhound,
		function Name()
		{
			return this.Const.Companions.CanineNames[this.Math.rand(0, this.Const.Companions.CanineNames.len() - 1)];
		}

		NameUnleashed = "Warhound Collar",
		Description = "A strong and loyal dog bred for war. Can be unleashed in battle for scouting, tracking or running down routing enemies.",
		DescriptionUnleashed = "The collar of a warhound that has been unleashed onto the battlefield.",
		function IconLeashed( variant )
		{
			return "tools/hound_0" + variant + "_70x70.png";
		}

		IconUnleashed = "tools/hound_01_leash_70x70.png",
		Value = 250,
		PartyStrength = 12,
		MaxPerCompany = 12,
		function Variant()
		{
			return this.Math.rand(1, 2);
		}

		BasicQuirks = [
			"scripts/skills/perks/perk_pathfinder",
			"scripts/skills/perks/perk_steel_brow"
		],
		BasicAttributes = {
			Hitpoints = 70,
			Stamina = 140,
			Bravery = 50,
			Initiative = 110,
			MeleeSkill = 55,
			RangedSkill = 0,
			MeleeDefense = 20,
			RangedDefense = 20
		},
		PreferredAttribute = this.Const.Attributes.MeleeSkill,
		Script = "scripts/companions/types/companions_warhound",
		ArmorScript = null,
		UnleashSounds = [
			"sounds/combat/unleash_wardog_01.wav",
			"sounds/combat/unleash_wardog_02.wav",
			"sounds/combat/unleash_wardog_03.wav",
			"sounds/combat/unleash_wardog_04.wav"
		],
		InventorySounds = [
			"sounds/inventory/wardog_inventory_01.wav",
			"sounds/inventory/wardog_inventory_02.wav",
			"sounds/inventory/wardog_inventory_03.wav"
		],
		Unleash = {
			Script = "scripts/companions/onequip/companions_unleash",
			function Icon( variant )
			{
				return "skills/warhound_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/warhound_0" + variant + "_sw_ac.png";
			}

			Overlay = "active_165",
			onActorDied = true
		},
		Leash = {
			Script = "scripts/companions/onequip/companions_leash",
			function Icon( variant )
			{
				return "skills/warhound_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/warhound_0" + variant + "_sw_ac.png";
			}

			Overlay = "active_165"
		}
	},
	{
		ID = "accessory.armored_warhound",
		Type = this.Const.Companions.TypeList.WarhoundArmor,
		function Name()
		{
			return this.Const.Companions.CanineNames[this.Math.rand(0, this.Const.Companions.CanineNames.len() - 1)];
		}

		NameUnleashed = "Warhound Collar",
		Description = "A strong and loyal northern hound bred for war. Can be unleashed in battle for scouting, tracking or running down routing enemies. This one wears a leather coat for protection against cutting wounds.",
		DescriptionUnleashed = "The collar of a warhound that has been unleashed onto the battlefield.",
		function IconLeashed( variant )
		{
			return "tools/hound_0" + variant + "_armor_01_70x70.png";
		}

		IconUnleashed = "tools/hound_01_leash_70x70.png",
		Value = 450,
		PartyStrength = 12,
		MaxPerCompany = 12,
		function Variant()
		{
			return this.Math.rand(1, 2);
		}

		BasicQuirks = [
			"scripts/skills/perks/perk_pathfinder",
			"scripts/skills/perks/perk_steel_brow"
		],
		BasicAttributes = {
			Hitpoints = 70,
			Stamina = 140,
			Bravery = 50,
			Initiative = 110,
			MeleeSkill = 55,
			RangedSkill = 0,
			MeleeDefense = 20,
			RangedDefense = 20
		},
		PreferredAttribute = this.Const.Attributes.MeleeSkill,
		Script = "scripts/companions/types/companions_warhound",
		ArmorScript = "scripts/items/armor/special/wardog_armor",
		UnleashSounds = [
			"sounds/combat/unleash_wardog_01.wav",
			"sounds/combat/unleash_wardog_02.wav",
			"sounds/combat/unleash_wardog_03.wav",
			"sounds/combat/unleash_wardog_04.wav"
		],
		InventorySounds = [
			"sounds/inventory/wardog_inventory_01.wav",
			"sounds/inventory/wardog_inventory_02.wav",
			"sounds/inventory/wardog_inventory_03.wav"
		],
		Unleash = {
			Script = "scripts/companions/onequip/companions_unleash",
			function Icon( variant )
			{
				return "skills/warhound_light_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/warhound_light_0" + variant + "_sw_ac.png";
			}

			Overlay = "active_165",
			onActorDied = true
		},
		Leash = {
			Script = "scripts/companions/onequip/companions_leash",
			function Icon( variant )
			{
				return "skills/warhound_light_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/warhound_light_0" + variant + "_sw_ac.png";
			}

			Overlay = "active_165"
		}
	},
	{
		ID = "accessory.heavily_armored_warhound",
		Type = this.Const.Companions.TypeList.WarhoundArmorHeavy,
		function Name()
		{
			return this.Const.Companions.CanineNames[this.Math.rand(0, this.Const.Companions.CanineNames.len() - 1)];
		}

		NameUnleashed = "Warhound Collar",
		Description = "A strong and loyal northern hound bred for war. Can be unleashed in battle for scouting, tracking or running down routing enemies. This one wears a heavy hide coat for protection.",
		DescriptionUnleashed = "The collar of a warhound that has been unleashed onto the battlefield.",
		function IconLeashed( variant )
		{
			return "tools/hound_0" + variant + "_armor_02_70x70.png";
		}

		IconUnleashed = "tools/hound_01_leash_70x70.png",
		Value = 750,
		PartyStrength = 12,
		MaxPerCompany = 12,
		function Variant()
		{
			return this.Math.rand(1, 2);
		}

		BasicQuirks = [
			"scripts/skills/perks/perk_pathfinder",
			"scripts/skills/perks/perk_steel_brow"
		],
		BasicAttributes = {
			Hitpoints = 70,
			Stamina = 140,
			Bravery = 50,
			Initiative = 110,
			MeleeSkill = 55,
			RangedSkill = 0,
			MeleeDefense = 20,
			RangedDefense = 20
		},
		PreferredAttribute = this.Const.Attributes.MeleeSkill,
		Script = "scripts/companions/types/companions_warhound",
		ArmorScript = "scripts/items/armor/special/wardog_heavy_armor",
		UnleashSounds = [
			"sounds/combat/unleash_wardog_01.wav",
			"sounds/combat/unleash_wardog_02.wav",
			"sounds/combat/unleash_wardog_03.wav",
			"sounds/combat/unleash_wardog_04.wav"
		],
		InventorySounds = [
			"sounds/inventory/wardog_inventory_01.wav",
			"sounds/inventory/wardog_inventory_02.wav",
			"sounds/inventory/wardog_inventory_03.wav"
		],
		Unleash = {
			Script = "scripts/companions/onequip/companions_unleash",
			function Icon( variant )
			{
				return "skills/warhound_heavy_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/warhound_heavy_0" + variant + "_sw_ac.png";
			}

			Overlay = "active_165",
			onActorDied = true
		},
		Leash = {
			Script = "scripts/companions/onequip/companions_leash",
			function Icon( variant )
			{
				return "skills/warhound_heavy_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/warhound_heavy_0" + variant + "_sw_ac.png";
			}

			Overlay = "active_165"
		}
	},
	{
		ID = "accessory.warwolf",
		Type = this.Const.Companions.TypeList.Warwolf,
		function Name()
		{
			return this.Const.Companions.CanineNames[this.Math.rand(0, this.Const.Companions.CanineNames.len() - 1)];
		}

		NameUnleashed = "Wolf Collar",
		Description = "A strong and wild wolf, tamed to be a loyal companion in battle. Can be unleashed in battle for scouting, tracking or running down routing enemies.",
		DescriptionUnleashed = "The collar of a wolf that has been unleashed onto the battlefield.",
		function IconLeashed( variant )
		{
			if (variant == 1)
			{
				return "tools/wolf_02_70x70.png";
			}
			else
			{
				return "tools/wolf_01_70x70.png";
			}
		}

		IconUnleashed = "tools/hound_01_leash_70x70.png",
		Value = 800,
		PartyStrength = 13,
		MaxPerCompany = 6,
		function Variant()
		{
			return this.Math.rand(1, 2);
		}

		BasicQuirks = [
			"scripts/skills/perks/perk_pathfinder",
			"scripts/skills/perks/perk_steel_brow"
		],
		BasicAttributes = {
			Hitpoints = 90,
			Stamina = 150,
			Bravery = 60,
			Initiative = 135,
			MeleeSkill = 65,
			RangedSkill = 0,
			MeleeDefense = 25,
			RangedDefense = 25
		},
		PreferredAttribute = this.Const.Attributes.MeleeSkill,
		Script = "scripts/companions/types/companions_warwolf",
		ArmorScript = null,
		UnleashSounds = [
			"sounds/enemies/wolf_idle_00.wav",
			"sounds/enemies/wolf_idle_01.wav",
			"sounds/enemies/wolf_idle_02.wav",
			"sounds/enemies/wolf_idle_03.wav",
			"sounds/enemies/wolf_idle_04.wav",
			"sounds/enemies/wolf_idle_06.wav",
			"sounds/enemies/wolf_idle_07.wav",
			"sounds/enemies/wolf_idle_08.wav",
			"sounds/enemies/wolf_idle_09.wav"
		],
		InventorySounds = [
			"sounds/enemies/wolf_idle_08.wav"
		],
		Unleash = {
			Script = "scripts/companions/onequip/companions_unleash",
			function Icon( variant )
			{
				return "skills/wolf_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/wolf_0" + variant + "_sw_ac.png";
			}

			Overlay = "active_83",
			onActorDied = true
		},
		Leash = {
			Script = "scripts/companions/onequip/companions_leash",
			function Icon( variant )
			{
				return "skills/wolf_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/wolf_0" + variant + "_sw_ac.png";
			}

			Overlay = "active_83"
		}
	},
	{
		ID = "accessory.direwolf",
		Type = this.Const.Companions.TypeList.Direwolf,
		function Name()
		{
			return this.Const.Companions.CanineNames[this.Math.rand(0, this.Const.Companions.CanineNames.len() - 1)];
		}

		NameUnleashed = "Direwolf Collar",
		Description = "A direwolf, tamed to be a loyal companion in battle. Can be unleashed in battle for scouting, tracking or running down routing enemies.",
		DescriptionUnleashed = "The collar of a direwolf that has been unleashed onto the battlefield.",
		function IconLeashed( variant )
		{
			return "tools/direwolf_0" + variant + "_ac.png";
		}

		IconUnleashed = "tools/hound_01_leash_70x70.png",
		Value = 1000,
		PartyStrength = 18,
		MaxPerCompany = 4,
		function Variant()
		{
			return this.Math.rand(1, 3);
		}

		BasicQuirks = [
			"scripts/skills/perks/perk_coup_de_grace",
			"scripts/skills/perks/perk_berserk",
			"scripts/skills/perks/perk_pathfinder"
		],
		BasicAttributes = {
			Hitpoints = 130,
			Stamina = 180,
			Bravery = 50,
			Initiative = 150,
			MeleeSkill = 60,
			RangedSkill = 0,
			MeleeDefense = 10,
			RangedDefense = 10
		},
		PreferredAttribute = this.Const.Attributes.MeleeSkill,
		Script = "scripts/companions/types/companions_direwolf",
		ArmorScript = null,
		UnleashSounds = [
			"sounds/enemies/werewolf_idle_01.wav",
			"sounds/enemies/werewolf_idle_02.wav",
			"sounds/enemies/werewolf_idle_03.wav",
			"sounds/enemies/werewolf_idle_05.wav",
			"sounds/enemies/werewolf_idle_06.wav",
			"sounds/enemies/werewolf_idle_07.wav",
			"sounds/enemies/werewolf_idle_08.wav"
		],
		InventorySounds = [
			"sounds/enemies/werewolf_idle_11.wav"
		],
		Unleash = {
			Script = "scripts/companions/onequip/companions_unleash",
			function Icon( variant )
			{
				return "skills/direwolf_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/direwolf_0" + variant + "_sw_ac.png";
			}

			Overlay = "",
			onActorDied = true
		},
		Leash = {
			Script = "scripts/companions/onequip/companions_leash",
			function Icon( variant )
			{
				return "skills/direwolf_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/direwolf_0" + variant + "_sw_ac.png";
			}

			Overlay = ""
		}
	},
	{
		ID = "accessory.direwolf_frenzied",
		Type = this.Const.Companions.TypeList.DirewolfFrenzied,
		function Name()
		{
			return this.Const.Companions.CanineNames[this.Math.rand(0, this.Const.Companions.CanineNames.len() - 1)];
		}

		NameUnleashed = "Direwolf Collar",
		Description = "A frenzied direwolf, tamed to be a loyal companion in battle. Can be unleashed in battle for scouting, tracking or running down routing enemies.",
		DescriptionUnleashed = "The collar of a direwolf that has been unleashed onto the battlefield.",
		function IconLeashed( variant )
		{
			return "tools/direwolf_frenzy_0" + variant + "_ac.png";
		}

		IconUnleashed = "tools/hound_01_leash_70x70.png",
		Value = 1500,
		PartyStrength = 27,
		MaxPerCompany = 2,
		function Variant()
		{
			return this.Math.rand(1, 3);
		}

		BasicQuirks = [
			"scripts/skills/perks/perk_coup_de_grace",
			"scripts/skills/perks/perk_berserk",
			"scripts/skills/perks/perk_pathfinder",
			"scripts/skills/perks/perk_overwhelm",
			"scripts/skills/perks/perk_relentless"
		],
		BasicAttributes = {
			Hitpoints = 150,
			Stamina = 180,
			Bravery = 70,
			Initiative = 150,
			MeleeSkill = 65,
			RangedSkill = 0,
			MeleeDefense = 10,
			RangedDefense = 10
		},
		PreferredAttribute = this.Const.Attributes.MeleeSkill,
		Script = "scripts/companions/types/companions_direwolf_frenzied",
		ArmorScript = null,
		UnleashSounds = [
			"sounds/enemies/werewolf_idle_01.wav",
			"sounds/enemies/werewolf_idle_02.wav",
			"sounds/enemies/werewolf_idle_03.wav",
			"sounds/enemies/werewolf_idle_05.wav",
			"sounds/enemies/werewolf_idle_06.wav",
			"sounds/enemies/werewolf_idle_07.wav",
			"sounds/enemies/werewolf_idle_08.wav"
		],
		InventorySounds = [
			"sounds/enemies/werewolf_idle_11.wav"
		],
		Unleash = {
			Script = "scripts/companions/onequip/companions_unleash",
			function Icon( variant )
			{
				return "skills/direwolf_frenzy_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/direwolf_frenzy_0" + variant + "_sw_ac.png";
			}

			Overlay = "",
			onActorDied = true
		},
		Leash = {
			Script = "scripts/companions/onequip/companions_leash",
			function Icon( variant )
			{
				return "skills/direwolf_frenzy_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/direwolf_frenzy_0" + variant + "_sw_ac.png";
			}

			Overlay = ""
		}
	},
	{
		ID = "accessory.hyena",
		Type = this.Const.Companions.TypeList.Hyena,
		function Name()
		{
			return this.Const.Companions.CanineNames[this.Math.rand(0, this.Const.Companions.CanineNames.len() - 1)];
		}

		NameUnleashed = "Hyena Collar",
		Description = "A hyena, tamed to be a loyal companion in battle. Can be unleashed in battle for scouting, tracking or running down routing enemies.",
		DescriptionUnleashed = "The collar of a hyena that has been unleashed onto the battlefield.",
		function IconLeashed( variant )
		{
			return "tools/hyena_0" + variant + "_ac.png";
		}

		IconUnleashed = "tools/hound_01_leash_70x70.png",
		Value = 1050,
		PartyStrength = 18,
		MaxPerCompany = 4,
		function Variant()
		{
			return this.Math.rand(1, 3);
		}

		BasicQuirks = [
			"scripts/skills/perks/perk_coup_de_grace",
			"scripts/skills/perks/perk_backstabber",
			"scripts/skills/perks/perk_pathfinder"
		],
		BasicAttributes = {
			Hitpoints = 120,
			Stamina = 180,
			Bravery = 50,
			Initiative = 90,
			MeleeSkill = 60,
			RangedSkill = 0,
			MeleeDefense = 10,
			RangedDefense = 10
		},
		PreferredAttribute = this.Const.Attributes.MeleeSkill,
		Script = "scripts/companions/types/companions_hyena",
		ArmorScript = null,
		UnleashSounds = [
			"sounds/enemies/dlc6/hyena_idle_02.wav",
			"sounds/enemies/dlc6/hyena_idle_05.wav",
			"sounds/enemies/dlc6/hyena_idle_07.wav",
			"sounds/enemies/dlc6/hyena_idle_09.wav",
			"sounds/enemies/dlc6/hyena_idle_11.wav"
		],
		InventorySounds = [
			"sounds/enemies/dlc6/hyena_idle_21.wav"
		],
		Unleash = {
			Script = "scripts/companions/onequip/companions_unleash",
			function Icon( variant )
			{
				return "skills/hyena_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/hyena_0" + variant + "_sw_ac.png";
			}

			Overlay = "",
			onActorDied = true
		},
		Leash = {
			Script = "scripts/companions/onequip/companions_leash",
			function Icon( variant )
			{
				return "skills/hyena_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/hyena_0" + variant + "_sw_ac.png";
			}

			Overlay = ""
		}
	},
	{
		ID = "accessory.hyena_frenzied",
		Type = this.Const.Companions.TypeList.HyenaFrenzied,
		function Name()
		{
			return this.Const.Companions.CanineNames[this.Math.rand(0, this.Const.Companions.CanineNames.len() - 1)];
		}

		NameUnleashed = "Hyena Collar",
		Description = "A frenzied hyena, tamed to be a loyal companion in battle. Can be unleashed in battle for scouting, tracking or running down routing enemies.",
		DescriptionUnleashed = "The collar of a hyena that has been unleashed onto the battlefield.",
		function IconLeashed( variant )
		{
			return "tools/hyena_0" + variant + "_ac.png";
		}

		IconUnleashed = "tools/hound_01_leash_70x70.png",
		Value = 1550,
		PartyStrength = 27,
		MaxPerCompany = 2,
		function Variant()
		{
			return this.Math.rand(4, 6);
		}

		BasicQuirks = [
			"scripts/skills/perks/perk_coup_de_grace",
			"scripts/skills/perks/perk_backstabber",
			"scripts/skills/perks/perk_pathfinder",
			"scripts/skills/perks/perk_overwhelm",
			"scripts/skills/perks/perk_relentless"
		],
		BasicAttributes = {
			Hitpoints = 140,
			Stamina = 180,
			Bravery = 70,
			Initiative = 130,
			MeleeSkill = 65,
			RangedSkill = 0,
			MeleeDefense = 10,
			RangedDefense = 10
		},
		PreferredAttribute = this.Const.Attributes.MeleeSkill,
		Script = "scripts/companions/types/companions_hyena_frenzied",
		ArmorScript = null,
		UnleashSounds = [
			"sounds/enemies/dlc6/hyena_idle_02.wav",
			"sounds/enemies/dlc6/hyena_idle_05.wav",
			"sounds/enemies/dlc6/hyena_idle_07.wav",
			"sounds/enemies/dlc6/hyena_idle_09.wav",
			"sounds/enemies/dlc6/hyena_idle_11.wav"
		],
		InventorySounds = [
			"sounds/enemies/dlc6/hyena_idle_21.wav"
		],
		Unleash = {
			Script = "scripts/companions/onequip/companions_unleash",
			function Icon( variant )
			{
				return "skills/hyena_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/hyena_0" + variant + "_sw_ac.png";
			}

			Overlay = "",
			onActorDied = true
		},
		Leash = {
			Script = "scripts/companions/onequip/companions_leash",
			function Icon( variant )
			{
				return "skills/hyena_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/hyena_0" + variant + "_sw_ac.png";
			}

			Overlay = ""
		}
	},
	{
		ID = "accessory.spider",
		Type = this.Const.Companions.TypeList.Spider,
		function Name()
		{
			return this.Const.Companions.SlitherachnoNames[this.Math.rand(0, this.Const.Companions.SlitherachnoNames.len() - 1)];
		}

		NameUnleashed = "Webknecht Collar",
		Description = "A webknecht, tamed to be a loyal companion in battle. Can be unleashed in battle for scouting, tracking or running down routing enemies.",
		DescriptionUnleashed = "The collar of a webknecht that has been unleashed onto the battlefield.",
		function IconLeashed( variant )
		{
			return "tools/spider_01_ac.png";
		}

		IconUnleashed = "tools/hound_01_leash_70x70.png",
		Value = 700,
		PartyStrength = 13,
		MaxPerCompany = 6,
		function Variant()
		{
			return this.Math.rand(1, 4);
		}

		BasicQuirks = [
			"scripts/skills/perks/perk_pathfinder",
			"scripts/skills/perks/perk_backstabber",
			"scripts/skills/perks/perk_fast_adaption",
			"scripts/skills/perks/perk_footwork"
		],
		BasicAttributes = {
			Hitpoints = 60,
			Stamina = 130,
			Bravery = 45,
			Initiative = 150,
			MeleeSkill = 60,
			RangedSkill = 0,
			MeleeDefense = 10,
			RangedDefense = 20
		},
		PreferredAttribute = this.Const.Attributes.MeleeSkill,
		Script = "scripts/companions/types/companions_spider",
		ArmorScript = null,
		UnleashSounds = [
			"sounds/enemies/dlc2/giant_spider_idle_04.wav",
			"sounds/enemies/dlc2/giant_spider_idle_10.wav",
			"sounds/enemies/dlc2/giant_spider_idle_11.wav",
			"sounds/enemies/dlc2/giant_spider_idle_12.wav",
			"sounds/enemies/dlc2/giant_spider_idle_14.wav",
			"sounds/enemies/dlc2/giant_spider_idle_15.wav"
		],
		InventorySounds = [
			"sounds/enemies/dlc2/giant_spider_idle_11.wav",
			"sounds/enemies/dlc2/giant_spider_idle_12.wav"
		],
		Unleash = {
			Script = "scripts/companions/onequip/companions_unleash",
			function Icon( variant )
			{
				return "skills/spider_01_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/spider_01_sw_ac.png";
			}

			Overlay = "",
			onActorDied = true
		},
		Leash = {
			Script = "scripts/companions/onequip/companions_leash",
			function Icon( variant )
			{
				return "skills/spider_01_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/spider_01_sw_ac.png";
			}

			Overlay = ""
		}
	},
	{
		ID = "accessory.snake",
		Type = this.Const.Companions.TypeList.Snake,
		function Name()
		{
			return this.Const.Companions.SlitherachnoNames[this.Math.rand(0, this.Const.Companions.SlitherachnoNames.len() - 1)];
		}

		NameUnleashed = "Serpent Collar",
		Description = "A serpent, tamed to be a loyal companion in battle. Can be unleashed in battle for scouting, tracking or running down routing enemies.",
		DescriptionUnleashed = "The collar of a serpent that has been unleashed onto the battlefield.",
		function IconLeashed( variant )
		{
			return "tools/snake_0" + variant + "_ac.png";
		}

		IconUnleashed = "tools/hound_01_leash_70x70.png",
		Value = 900,
		PartyStrength = 18,
		MaxPerCompany = 4,
		function Variant()
		{
			return this.Math.rand(1, 4);
		}

		BasicQuirks = [
			"scripts/skills/perks/perk_pathfinder",
			"scripts/skills/perks/perk_backstabber",
			"scripts/skills/perks/perk_relentless"
		],
		BasicAttributes = {
			Hitpoints = 130,
			Stamina = 110,
			Bravery = 100,
			Initiative = 50,
			MeleeSkill = 65,
			RangedSkill = 0,
			MeleeDefense = 10,
			RangedDefense = 25
		},
		PreferredAttribute = this.Const.Attributes.MeleeSkill,
		Script = "scripts/companions/types/companions_snake",
		ArmorScript = null,
		UnleashSounds = [
			"sounds/enemies/dlc6/snake_idle_04.wav",
			"sounds/enemies/dlc6/snake_idle_05.wav"
		],
		InventorySounds = [
			"sounds/enemies/dlc6/snake_idle_04.wav",
			"sounds/enemies/dlc6/snake_idle_05.wav"
		],
		Unleash = {
			Script = "scripts/companions/onequip/companions_unleash",
			function Icon( variant )
			{
				return "skills/snake_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/snake_0" + variant + "_sw_ac.png";
			}

			Overlay = "",
			onActorDied = true
		},
		Leash = {
			Script = "scripts/companions/onequip/companions_leash",
			function Icon( variant )
			{
				return "skills/snake_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/snake_0" + variant + "_sw_ac.png";
			}

			Overlay = ""
		}
	},
	{
		ID = "accessory.nacho",
		Type = this.Const.Companions.TypeList.Nacho,
		function Name()
		{
			return this.Const.Companions.GutturalNames[this.Math.rand(0, this.Const.Companions.GutturalNames.len() - 1)];
		}

		NameUnleashed = "Nachzehrer Collar",
		Description = "A nachzehrer, tamed to be a loyal companion in battle. Can be unleashed in battle for scouting, tracking or running down routing enemies.",
		DescriptionUnleashed = "The collar of a nachzehrer that has been unleashed onto the battlefield.",
		function IconLeashed( variant )
		{
			return "tools/nacho_0" + variant + "_ac.png";
		}

		IconUnleashed = "tools/hound_01_leash_70x70.png",
		Value = 950,
		PartyStrength = 27,
		MaxPerCompany = 4,
		function Variant()
		{
			return this.Math.rand(1, 3);
		}

		BasicQuirks = [
			"scripts/skills/perks/perk_pathfinder"
		],
		BasicAttributes = {
			Hitpoints = 80,
			Stamina = 130,
			Bravery = 50,
			Initiative = 125,
			MeleeSkill = 60,
			RangedSkill = 0,
			MeleeDefense = 10,
			RangedDefense = 15
		},
		PreferredAttribute = this.Const.Attributes.MeleeSkill,
		Script = "scripts/companions/types/companions_nacho",
		ArmorScript = null,
		UnleashSounds = [
			"sounds/enemies/ghoul_idle_02.wav",
			"sounds/enemies/ghoul_idle_04.wav",
			"sounds/enemies/ghoul_idle_07.wav",
			"sounds/enemies/ghoul_idle_10.wav",
			"sounds/enemies/ghoul_idle_11.wav",
			"sounds/enemies/ghoul_idle_16.wav",
			"sounds/enemies/ghoul_idle_18.wav",
			"sounds/enemies/ghoul_idle_19.wav",
			"sounds/enemies/ghoul_idle_20.wav",
			"sounds/enemies/ghoul_idle_21.wav",
			"sounds/enemies/ghoul_idle_22.wav",
			"sounds/enemies/ghoul_idle_26.wav"
		],
		InventorySounds = [
			"sounds/enemies/ghoul_idle_02.wav",
			"sounds/enemies/ghoul_idle_04.wav",
			"sounds/enemies/ghoul_idle_07.wav",
			"sounds/enemies/ghoul_idle_10.wav",
			"sounds/enemies/ghoul_idle_11.wav",
			"sounds/enemies/ghoul_idle_16.wav",
			"sounds/enemies/ghoul_idle_18.wav",
			"sounds/enemies/ghoul_idle_19.wav",
			"sounds/enemies/ghoul_idle_20.wav",
			"sounds/enemies/ghoul_idle_21.wav",
			"sounds/enemies/ghoul_idle_22.wav",
			"sounds/enemies/ghoul_idle_26.wav"
		],
		Unleash = {
			Script = "scripts/companions/onequip/companions_unleash",
			function Icon( variant )
			{
				return "skills/nacho_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/nacho_0" + variant + "_sw_ac.png";
			}

			Overlay = "",
			onActorDied = true
		},
		Leash = {
			Script = "scripts/companions/onequip/companions_leash",
			function Icon( variant )
			{
				return "skills/nacho_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/nacho_0" + variant + "_sw_ac.png";
			}

			Overlay = ""
		}
	},
	{
		ID = "accessory.alp",
		Type = this.Const.Companions.TypeList.Alp,
		function Name()
		{
			return this.Const.Companions.SpookNames[this.Math.rand(0, this.Const.Companions.SpookNames.len() - 1)];
		}

		NameUnleashed = "Alp Collar",
		Description = "An alp, tamed to be a loyal companion in battle. Can be unleashed in battle for scouting, tracking or running down routing enemies.",
		DescriptionUnleashed = "The collar of an alp that has been unleashed onto the battlefield.",
		function IconLeashed( variant )
		{
			return "tools/alp_0" + variant + "_ac.png";
		}

		IconUnleashed = "tools/hound_01_leash_70x70.png",
		Value = 2000,
		PartyStrength = 37,
		MaxPerCompany = 2,
		function Variant()
		{
			return this.Math.rand(1, 3);
		}

		BasicQuirks = [
			"scripts/skills/perks/perk_underdog"
		],
		BasicAttributes = {
			Hitpoints = 100,
			Stamina = 100,
			Bravery = 100,
			Initiative = 60,
			MeleeSkill = 0,
			RangedSkill = 0,
			MeleeDefense = 10,
			RangedDefense = 10
		},
		PreferredAttribute = this.Const.Attributes.Hitpoints,
		Script = "scripts/companions/types/companions_alp",
		ArmorScript = null,
		UnleashSounds = [
			"sounds/enemies/dlc2/alp_hurt_01.wav",
			"sounds/enemies/dlc2/alp_hurt_02.wav"
		],
		InventorySounds = [
			"sounds/enemies/dlc2/alp_hurt_01.wav",
			"sounds/enemies/dlc2/alp_hurt_02.wav"
		],
		Unleash = {
			Script = "scripts/companions/onequip/companions_unleash",
			function Icon( variant )
			{
				return "skills/alp_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/alp_0" + variant + "_sw_ac.png";
			}

			Overlay = "",
			onActorDied = true
		},
		Leash = {
			Script = "scripts/companions/onequip/companions_leash",
			function Icon( variant )
			{
				return "skills/alp_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/alp_0" + variant + "_sw_ac.png";
			}

			Overlay = ""
		}
	},
	{
		ID = "accessory.unhold",
		Type = this.Const.Companions.TypeList.Unhold,
		function Name()
		{
			return this.Const.Companions.GutturalNames[this.Math.rand(0, this.Const.Companions.GutturalNames.len() - 1)];
		}

		NameUnleashed = "Unhold Collar",
		Description = "A unhold, tamed to be a loyal companion in battle. Can be unleashed in battle for scouting, tracking or running down routing enemies.",
		DescriptionUnleashed = "The collar of a unhold that has been unleashed onto the battlefield.",
		function IconLeashed( variant )
		{
			return "tools/unhold_0" + variant + "_ac.png";
		}

		IconUnleashed = "tools/hound_01_leash_70x70.png",
		Value = 2500,
		PartyStrength = 46,
		MaxPerCompany = 1,
		function Variant()
		{
			return this.Math.rand(1, 3);
		}

		BasicQuirks = [
			"scripts/skills/perks/perk_crippling_strikes",
			"scripts/skills/perks/perk_pathfinder",
			"scripts/skills/perks/perk_steel_brow",
			"scripts/skills/perks/perk_battering_ram",
			"scripts/skills/perks/perk_stalwart",
			"scripts/skills/perks/perk_hold_out"
		],
		BasicAttributes = {
			Hitpoints = 500,
			Stamina = 400,
			Bravery = 130,
			Initiative = 75,
			MeleeSkill = 70,
			RangedSkill = 0,
			MeleeDefense = 10,
			RangedDefense = 0
		},
		PreferredAttribute = this.Const.Attributes.MeleeSkill,
		Script = "scripts/companions/types/companions_unhold",
		ArmorScript = null,
		UnleashSounds = [
			"sounds/enemies/unhold_confused_01.wav",
			"sounds/enemies/unhold_confused_02.wav",
			"sounds/enemies/unhold_confused_03.wav",
			"sounds/enemies/unhold_confused_04.wav"
		],
		InventorySounds = [
			"sounds/enemies/unhold_confused_01.wav",
			"sounds/enemies/unhold_confused_02.wav",
			"sounds/enemies/unhold_confused_03.wav",
			"sounds/enemies/unhold_confused_04.wav"
		],
		Unleash = {
			Script = "scripts/companions/onequip/companions_unleash",
			function Icon( variant )
			{
				return "skills/unhold_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/unhold_0" + variant + "_sw_ac.png";
			}

			Overlay = "",
			onActorDied = true
		},
		Leash = {
			Script = "scripts/companions/onequip/companions_leash",
			function Icon( variant )
			{
				return "skills/unhold_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/unhold_0" + variant + "_sw_ac.png";
			}

			Overlay = ""
		}
	},
	{
		ID = "accessory.armored_unhold",
		Type = this.Const.Companions.TypeList.UnholdArmor,
		function Name()
		{
			return this.Const.Companions.GutturalNames[this.Math.rand(0, this.Const.Companions.GutturalNames.len() - 1)];
		}

		NameUnleashed = "Unhold Collar",
		Description = "A armored unhold, tamed to be a loyal companion in battle. Can be unleashed in battle for scouting, tracking or running down routing enemies.",
		DescriptionUnleashed = "The collar of an armored unhold that has been unleashed onto the battlefield.",
		function IconLeashed( variant )
		{
			return "tools/unhold_armor_0" + variant + "_ac.png";
		}

		IconUnleashed = "tools/hound_01_leash_70x70.png",
		Value = 2650,
		PartyStrength = 47,
		MaxPerCompany = 1,
		function Variant()
		{
			return this.Math.rand(1, 2);
		}

		BasicQuirks = [
			"scripts/skills/perks/perk_crippling_strikes",
			"scripts/skills/perks/perk_pathfinder",
			"scripts/skills/perks/perk_steel_brow",
			"scripts/skills/perks/perk_battering_ram",
			"scripts/skills/perks/perk_stalwart",
			"scripts/skills/perks/perk_hold_out"
		],
		BasicAttributes = {
			Hitpoints = 500,
			Stamina = 400,
			Bravery = 130,
			Initiative = 75,
			MeleeSkill = 70,
			RangedSkill = 0,
			MeleeDefense = 10,
			RangedDefense = 0
		},
		PreferredAttribute = this.Const.Attributes.MeleeSkill,
		Script = "scripts/companions/types/companions_unhold",
		ArmorScript = null,
		UnleashSounds = [
			"sounds/enemies/unhold_confused_01.wav",
			"sounds/enemies/unhold_confused_02.wav",
			"sounds/enemies/unhold_confused_03.wav",
			"sounds/enemies/unhold_confused_04.wav"
		],
		InventorySounds = [
			"sounds/enemies/unhold_confused_01.wav",
			"sounds/enemies/unhold_confused_02.wav",
			"sounds/enemies/unhold_confused_03.wav",
			"sounds/enemies/unhold_confused_04.wav"
		],
		Unleash = {
			Script = "scripts/companions/onequip/companions_unleash",
			function Icon( variant )
			{
				return "skills/unhold_armor_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/unhold_armor_0" + variant + "_sw_ac.png";
			}

			Overlay = "",
			onActorDied = true
		},
		Leash = {
			Script = "scripts/companions/onequip/companions_leash",
			function Icon( variant )
			{
				return "skills/unhold_armor_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/unhold_armor_0" + variant + "_sw_ac.png";
			}

			Overlay = ""
		}
	},
	{
		ID = "accessory.schrat",
		Type = this.Const.Companions.TypeList.Schrat,
		function Name()
		{
			return this.Const.Companions.TreefolkNames[this.Math.rand(0, this.Const.Companions.TreefolkNames.len() - 1)];
		}

		NameUnleashed = "Schrat Collar",
		Description = "A schrat, tamed to be a loyal companion in battle. Can be unleashed in battle for scouting, tracking or running down routing enemies.",
		DescriptionUnleashed = "The collar of a schrat that has been unleashed onto the battlefield.",
		function IconLeashed( variant )
		{
			return "tools/schrat_0" + variant + "_ac.png";
		}

		IconUnleashed = "tools/schrat_00_ac.png",
		Value = 3500,
		PartyStrength = 55,
		MaxPerCompany = 1,
		function Variant()
		{
			return this.Math.rand(1, 2);
		}

		BasicQuirks = [
			"scripts/skills/perks/perk_pathfinder",
			"scripts/skills/perks/perk_crippling_strikes",
			"scripts/skills/perks/perk_steel_brow",
			"scripts/skills/perks/perk_hold_out"
		],
		BasicAttributes = {
			Hitpoints = 600,
			Stamina = 400,
			Bravery = 200,
			Initiative = 60,
			MeleeSkill = 70,
			RangedSkill = 0,
			MeleeDefense = -5,
			RangedDefense = -5
		},
		PreferredAttribute = this.Const.Attributes.MeleeSkill,
		Script = "scripts/companions/types/companions_schrat",
		ArmorScript = null,
		UnleashSounds = [
			"sounds/enemies/dlc2/schrat_hurt_shield_up_01.wav",
			"sounds/enemies/dlc2/schrat_hurt_shield_up_02.wav",
			"sounds/enemies/dlc2/schrat_hurt_shield_up_03.wav"
		],
		InventorySounds = [
			"sounds/enemies/dlc2/schrat_hurt_shield_up_01.wav",
			"sounds/enemies/dlc2/schrat_hurt_shield_up_02.wav",
			"sounds/enemies/dlc2/schrat_hurt_shield_up_03.wav"
		],
		Unleash = {
			Script = "scripts/companions/onequip/companions_unleash",
			function Icon( variant )
			{
				return "skills/schrat_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/schrat_0" + variant + "_sw_ac.png";
			}

			Overlay = "",
			onActorDied = true
		},
		Leash = {
			Script = "scripts/companions/onequip/companions_leash",
			function Icon( variant )
			{
				return "skills/schrat_0" + variant + "_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/schrat_0" + variant + "_sw_ac.png";
			}

			Overlay = ""
		}
	},
	{
		ID = "accessory.noodle",
		Type = this.Const.Companions.TypeList.Noodle,
		function Name()
		{
			return this.Const.Companions.SlitherachnoNames[this.Math.rand(0, this.Const.Companions.SlitherachnoNames.len() - 1)];
		}

		NameUnleashed = "Lindwurm Collar",
		Description = "A lindwurm, tamed to be a loyal companion in battle. Can be unleashed in battle for scouting, tracking or running down routing enemies.",
		DescriptionUnleashed = "The collar of a lindwurm that has been unleashed onto the battlefield.",
		function IconLeashed( variant )
		{
			return "tools/noodle_01_ac.png";
		}

		IconUnleashed = "tools/noodle_00_ac.png",
		Value = 5000,
		PartyStrength = 64,
		MaxPerCompany = 1,
		function Variant()
		{
			return 1;
		}

		BasicQuirks = [
			"scripts/skills/perks/perk_pathfinder",
			"scripts/skills/perks/perk_hold_out",
			"scripts/skills/perks/perk_reach_advantage",
			"scripts/skills/perks/perk_fearsome",
			"scripts/skills/perks/perk_underdog"
		],
		BasicAttributes = {
			Hitpoints = 1100,
			Stamina = 400,
			Bravery = 180,
			Initiative = 80,
			MeleeSkill = 75,
			RangedSkill = 0,
			MeleeDefense = 10,
			RangedDefense = -10
		},
		PreferredAttribute = this.Const.Attributes.MeleeSkill,
		Script = "scripts/companions/types/companions_noodle",
		ArmorScript = null,
		UnleashSounds = [
			"sounds/enemies/lindwurm_hurt_01.wav",
			"sounds/enemies/lindwurm_hurt_02.wav",
			"sounds/enemies/lindwurm_hurt_03.wav",
			"sounds/enemies/lindwurm_hurt_04.wav"
		],
		InventorySounds = [
			"sounds/enemies/lindwurm_hurt_01.wav",
			"sounds/enemies/lindwurm_hurt_02.wav",
			"sounds/enemies/lindwurm_hurt_03.wav",
			"sounds/enemies/lindwurm_hurt_04.wav"
		],
		Unleash = {
			Script = "scripts/companions/onequip/companions_unleash",
			function Icon( variant )
			{
				return "skills/noodle_01_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/noodle_01_sw_ac.png";
			}

			Overlay = "",
			onActorDied = true
		},
		Leash = {
			Script = "scripts/companions/onequip/companions_leash",
			function Icon( variant )
			{
				return "skills/noodle_01_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/noodle_01_sw_ac.png";
			}

			Overlay = ""
		}
	},
	{
		ID = "accessory.tome_reanimation",
		Type = this.Const.Companions.TypeList.TomeReanimation,
		function Name()
		{
			return "Tome of Reanimation";
		}

		NameUnleashed = "Tome of Reanimation",
		Description = "A mysterious tome that details the finer points of reanimating the dead.",
		DescriptionUnleashed = "A mysterious tome that details the finer points of reanimating the dead.",
		function IconLeashed( variant )
		{
			return "tools/tome_01_ac.png";
		}

		IconUnleashed = "tools/tome_01_ac.png",
		Value = 3000,
		PartyStrength = 37,
		MaxPerCompany = 1,
		function Variant()
		{
			return 1;
		}

		BasicQuirks = [],
		BasicAttributes = {
			Hitpoints = 0,
			Stamina = 0,
			Bravery = 0,
			Initiative = 0,
			MeleeSkill = 0,
			RangedSkill = 0,
			MeleeDefense = 0,
			RangedDefense = 0
		},
		PreferredAttribute = this.Const.Attributes.MeleeSkill,
		Script = null,
		ArmorScript = null,
		UnleashSounds = [
			"sounds/enemies/necromancer_01.wav",
			"sounds/enemies/necromancer_02.wav",
			"sounds/enemies/necromancer_03.wav"
		],
		InventorySounds = [
			"sounds/combat/armor_leather_impact_03.wav"
		],
		Unleash = {
			Script = "scripts/companions/onequip/companions_raise",
			function Icon( variant )
			{
				return "skills/tome_01_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/tome_01_sw_ac.png";
			}

			Overlay = "",
			onActorDied = false
		},
		Leash = {
			Script = "scripts/companions/onequip/companions_blank",
			function Icon( variant )
			{
				return "skills/tome_01_ac.png";
			}

			function IconDisabled( variant )
			{
				return "skills/tome_01_sw_ac.png";
			}

			Overlay = ""
		}
	},
	{
		ID = "accessory.legend_warbear",
		Type = this.Const.Companions.TypeList.Warbear,
		function Name()
		{
			return this.Const.Companions.CanineNames[this.Math.rand(0, this.Const.Companions.CanineNames.len() - 1)];
		}

		NameUnleashed = "Warbear Collar",
		Description = "A Warbear, tamed to be a loyal companion in battle. Can be unleashed in battle for scouting, tracking or running down routing enemies.",
		DescriptionUnleashed = "The collar of a warbear that has been unleashed onto the battlefield.",
		function IconLeashed( variant )
		{
			return "tools/warbear_01_70x70.png";
		}

		IconUnleashed = "tools/dog_01_leash_70x70.png",
		Value = 2000,
		PartyStrength = 36,
		MaxPerCompany = 1,
		function Variant()
		{
			return this.Math.rand(1, 4);
		}

		BasicQuirks = [
			"scripts/skills/perks/perk_pathfinder",
			"scripts/skills/perks/perk_hold_out",
			"scripts/skills/perks/perk_berserk"
		],
		BasicAttributes = {
			Hitpoints = 400,
			Bravery = 80,
			Stamina = 300,
			MeleeSkill = 70,
			RangedSkill = 0,
			MeleeDefense = 10,
			RangedDefense = 0,
			Initiative = 75
		},
		PreferredAttribute = this.Const.Attributes.MeleeSkill,
		Script = "scripts/companions/types/companions_warbear",
		ArmorScript = null,
		UnleashSounds = [
			"sounds/enemies/bear_idle1.wav",
			"sounds/enemies/bear_idle2.wav"
		],
		InventorySounds = [
			"sounds/enemies/bear_idle1.wav"
		],
		Unleash = {
			Script = "scripts/companions/onequip/companions_unleash",
			function Icon( variant )
			{
				return "skills/bear_square.png";
			}

			function IconDisabled( variant )
			{
				return "skills/bear_square_bw.png";
			}

			Overlay = "active_165",
			onActorDied = true
		},
		Leash = {
			Script = "scripts/companions/onequip/companions_leash",
			function Icon( variant )
			{
				return "skills/bear_square.png";
			}

			function IconDisabled( variant )
			{
				return "skills/bear_square_bw.png";
			}

			Overlay = "active_165"
		}
	},
	{
		ID = "accessory.legend_white_warwolf",
		Type = this.Const.Companions.TypeList.Whitewolf,
		function Name()
		{
			return this.Const.Companions.CanineNames[this.Math.rand(0, this.Const.Companions.CanineNames.len() - 1)];
		}

		NameUnleashed = "White wolf Collar",
		Description = "A White wolf, tamed to be a loyal companion in battle. Can be unleashed in battle for scouting, tracking or running down routing enemies.",
		DescriptionUnleashed = "The collar of a white wolf that has been unleashed onto the battlefield.",
		function IconLeashed( variant )
		{
			return "tools/legend_white_wolf_01_70x70.png";
		}

		IconUnleashed = "tools/legend_white_wolf_leash_70x70.png",
		Value = 6000,
		PartyStrength = 72,
		MaxPerCompany = 1,
		function Variant()
		{
			return this.Math.rand(1, 4);
		}

		BasicQuirks = [
			"scripts/skills/perks/perk_pathfinder",
			"scripts/skills/perks/perk_steel_brow",
			"scripts/skills/perks/perk_coup_de_grace",
			"scripts/skills/perks/perk_berserk",
			"scripts/skills/perks/perk_nimble",
			"scripts/skills/perks/perk_overwhelm"
		],
		BasicAttributes = {
			Hitpoints = 200,
			Bravery = 100,
			Stamina = 200,
			MeleeSkill = 60,
			RangedSkill = 0,
			MeleeDefense = 20,
			RangedDefense = 20,
			Initiative = 150
		},
		PreferredAttribute = this.Const.Attributes.MeleeSkill,
		Script = "scripts/companions/types/companions_whitewolf",
		ArmorScript = null,
		UnleashSounds = [
			"sounds/enemies/wolf_idle_00.wav",
			"sounds/enemies/wolf_idle_01.wav",
			"sounds/enemies/wolf_idle_02.wav",
			"sounds/enemies/wolf_idle_03.wav",
			"sounds/enemies/wolf_idle_04.wav",
			"sounds/enemies/wolf_idle_06.wav",
			"sounds/enemies/wolf_idle_07.wav",
			"sounds/enemies/wolf_idle_08.wav",
			"sounds/enemies/wolf_idle_09.wav"
		],
		InventorySounds = [
			"sounds/enemies/wolf_idle_08.wav"
		],
		Unleash = {
			Script = "scripts/companions/onequip/companions_unleash",
			function Icon( variant )
			{
				return "skills/unleash_white_wolf.png";
			}

			function IconDisabled( variant )
			{
				return "skills/unleash_white_wolf_bw.png";
			}

			Overlay = "active_83",
			onActorDied = true
		},
		Leash = {
			Script = "scripts/companions/onequip/companions_leash",
			function Icon( variant )
			{
				return "skills/unleash_white_wolf.png";
			}

			function IconDisabled( variant )
			{
				return "skills/unleash_white_wolf_bw.png";
			}

			Overlay = "active_83"
		}
	}	
];
