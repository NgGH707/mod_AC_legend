this.companions_unhold <- this.inherit("scripts/entity/tactical/actor", {
	m = {
		Item = null,
		Name = "Unhold"
	},
	function create()
	{
		this.m.Type = this.Const.EntityType.Unhold;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.Unhold.XP;
		this.m.IsActingImmediately = true;
		this.m.BloodSplatterOffset = this.createVec(0, 0);
		this.m.DecapitateSplatterOffset = this.createVec(40, -20);
		this.m.DecapitateBloodAmount = 3.0;
		this.actor.create();
		this.m.Sound[this.Const.Sound.ActorEvent.Death] = [
			"sounds/enemies/unhold_death_01.wav",
			"sounds/enemies/unhold_death_02.wav",
			"sounds/enemies/unhold_death_03.wav",
			"sounds/enemies/unhold_death_04.wav",
			"sounds/enemies/unhold_death_05.wav",
			"sounds/enemies/unhold_death_06.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Flee] = [
			"sounds/enemies/unhold_flee_01.wav",
			"sounds/enemies/unhold_flee_02.wav",
			"sounds/enemies/unhold_flee_03.wav",
			"sounds/enemies/unhold_flee_04.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.DamageReceived] = [
			"sounds/enemies/unhold_hurt_01.wav",
			"sounds/enemies/unhold_hurt_02.wav",
			"sounds/enemies/unhold_hurt_03.wav",
			"sounds/enemies/unhold_hurt_04.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Idle] = [
			"sounds/enemies/unhold_idle_01.wav",
			"sounds/enemies/unhold_idle_02.wav",
			"sounds/enemies/unhold_idle_03.wav",
			"sounds/enemies/unhold_idle_04.wav",
			"sounds/enemies/unhold_idle_05.wav",
			"sounds/enemies/unhold_idle_06.wav",
			"sounds/enemies/unhold_idle_07.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Other1] = [
			"sounds/enemies/unhold_confused_01.wav",
			"sounds/enemies/unhold_confused_02.wav",
			"sounds/enemies/unhold_confused_03.wav",
			"sounds/enemies/unhold_confused_04.wav"
		];
		this.m.SoundPitch = this.Math.rand(0.9, 1.1);
		this.m.SoundVolumeOverall = 1.25;
		this.m.AIAgent = this.new("scripts/companions/types/companions_unhold_agent");
		this.m.AIAgent.setActor(this);
	}

	function setItem( _i )
	{
		if (typeof _i == "instance")
		{
			this.m.Item = _i;
		}
		else
		{
			this.m.Item = this.WeakTableRef(_i);
		}
	}

	function setName( _n )
	{
		this.m.Name = _n;
	}

	function getName()
	{
		return this.m.Name;
	}

	function setVariant( _v )
	{
		this.getSprite("body").setBrush("bust_unhold_body_0" + _v);
		this.getSprite("head").setBrush("bust_unhold_head_0" + _v);
		this.setDirty(true);
	}

	function playSound( _type, _volume, _pitch = 1.0 )
	{
		if (_type == this.Const.Sound.ActorEvent.Move && this.Math.rand(1, 100) <= 50)
		{
			return;
		}

		this.actor.playSound(_type, _volume, _pitch);
	}

	function onDeath( _killer, _skill, _tile, _fatalityType )
	{
		local flip = this.Math.rand(1, 100) < 50;

		if (_tile != null)
		{
			this.m.IsCorpseFlipped = flip;
			this.spawnBloodPool(_tile, 1);
			local decal;
			local appearance = this.getItems().getAppearance();
			local sprite_body = this.getSprite("body");
			local sprite_head = this.getSprite("head");
			decal = _tile.spawnDetail(sprite_body.getBrush().Name + "_dead", this.Const.Tactical.DetailFlag.Corpse, flip);
			decal.Color = sprite_body.Color;
			decal.Saturation = sprite_body.Saturation;
			decal.Scale = 0.9;
			decal.setBrightness(0.9);

			if (appearance.CorpseArmor != "")
			{
				decal = _tile.spawnDetail(appearance.CorpseArmor, this.Const.Tactical.DetailFlag.Corpse, flip);
				decal.Scale = 0.9;
				decal.setBrightness(0.9);
			}

			if (_fatalityType != this.Const.FatalityType.Decapitated)
			{
				if (!appearance.HideCorpseHead)
				{
					decal = _tile.spawnDetail(sprite_head.getBrush().Name + "_dead", this.Const.Tactical.DetailFlag.Corpse, flip);
					decal.Color = sprite_head.Color;
					decal.Saturation = sprite_head.Saturation;
					decal.Scale = 0.9;
					decal.setBrightness(0.9);
				}

				if (appearance.HelmetCorpse.len() != 0)
				{
					decal = _tile.spawnDetail(appearance.HelmetCorpse, this.Const.Tactical.DetailFlag.Corpse, flip);
					decal.Scale = 0.9;
					decal.setBrightness(0.9);
				}
			}
			else if (_fatalityType == this.Const.FatalityType.Decapitated)
			{
				local layers = [];

				if (!appearance.HideCorpseHead)
				{
					layers.push(sprite_head.getBrush().Name + "_dead");
				}

				if (appearance.HelmetCorpse.len() != 0)
				{
					layers.push(appearance.HelmetCorpse);
				}

				local decap = this.Tactical.spawnHeadEffect(this.getTile(), layers, this.createVec(-75, 50), 90.0, sprite_head.getBrush().Name + "_dead_bloodpool");
				local idx = 0;

				if (!appearance.HideCorpseHead)
				{
					decap[idx].Color = sprite_head.Color;
					decap[idx].Saturation = sprite_head.Saturation;
					decap[idx].Scale = 0.9;
					decap[idx].setBrightness(0.9);
					idx = ++idx;
					idx = idx;
				}

				if (appearance.HelmetCorpse.len() != 0)
				{
					decap[idx].Scale = 0.9;
					decap[idx].setBrightness(0.9);
					idx = ++idx;
					idx = idx;
				}
			}

			if (_fatalityType == this.Const.FatalityType.Disemboweled)
			{
				decal = _tile.spawnDetail("bust_unhold_guts", this.Const.Tactical.DetailFlag.Corpse, flip);
				decal.Scale = 0.9;
			}
			else if (_skill && _skill.getProjectileType() == this.Const.ProjectileType.Arrow)
			{
				decal = _tile.spawnDetail(sprite_body.getBrush().Name + "_dead_arrows", this.Const.Tactical.DetailFlag.Corpse, flip);
				decal.Scale = 0.9;
			}
			else if (_skill && _skill.getProjectileType() == this.Const.ProjectileType.Javelin)
			{
				decal = _tile.spawnDetail(sprite_body.getBrush().Name + "_dead_javelin", this.Const.Tactical.DetailFlag.Corpse, flip);
				decal.Scale = 0.9;
			}

			this.spawnTerrainDropdownEffect(_tile);
			local corpse = clone this.Const.Corpse;
			corpse.CorpseName = "An Unhold";
			corpse.Tile = _tile;
			corpse.IsResurrectable = false;
			corpse.IsConsumable = true;
			corpse.Items = this.getItems();
			corpse.IsHeadAttached = _fatalityType != this.Const.FatalityType.Decapitated;
			_tile.Properties.set("Corpse", corpse);
			this.Tactical.Entities.addCorpse(_tile);
		}

		if (this.m.Item != null && !this.m.Item.isNull())
		{
			this.m.Item.setEntity(null);

			if (this.m.Item.getContainer() != null)
			{
				if (this.m.Item.getCurrentSlotType() == this.Const.ItemSlot.Bag)
				{
					this.m.Item.getContainer().removeFromBag(this.m.Item.get());
				}
				else
				{
					this.m.Item.getContainer().unequip(this.m.Item.get());
				}
			}

			this.m.Item = null;
		}

		this.actor.onDeath(_killer, _skill, _tile, _fatalityType);
	}

	function onFactionChanged()
	{
		this.actor.onFactionChanged();
		local flip = this.isAlliedWithPlayer();
		this.getSprite("body").setHorizontalFlipping(flip);
		this.getSprite("armor").setHorizontalFlipping(flip);
		this.getSprite("helmet").setHorizontalFlipping(flip);
		this.getSprite("head").setHorizontalFlipping(flip);
		this.getSprite("injury").setHorizontalFlipping(flip);

		if (!this.Tactical.State.isScenarioMode())
		{
			local f = this.World.FactionManager.getFaction(this.getFaction());

			if (f != null)
			{
				this.getSprite("socket").setBrush(f.getTacticalBase());
			}
		}
		else
		{
			this.getSprite("socket").setBrush(this.Const.FactionBase[this.getFaction()]);
		}
	}

	function onActorKilled( _actor, _tile, _skill )
	{
		this.actor.onActorKilled(_actor, _tile, _skill);

		if (this.getFaction() == this.Const.Faction.Player || this.getFaction() == this.Const.Faction.PlayerAnimals)
		{
			local XPgroup = _actor.getXPValue();
			local brothers = this.Tactical.Entities.getInstancesOfFaction(this.Const.Faction.Player);

			foreach( bro in brothers )
			{
				bro.addXP(this.Math.max(1, this.Math.floor(XPgroup / brothers.len())));
				local acc = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Accessory);

				if (acc != null && "setType" in acc)
				{
					if (acc.getType() != null)
					{
						acc.addXP(this.Math.max(1, this.Math.floor(XPgroup / brothers.len())));
					}
				}
			}
		}
	}

	function onInit()
	{
		this.actor.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.Unhold);
		b.IsImmuneToDisarm = true;
		b.IsImmuneToRotation = true;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.m.ActionPointCosts = this.Const.DefaultMovementAPCost;
		this.m.FatigueCosts = this.Const.DefaultMovementFatigueCost;
		this.m.Items.getAppearance().Body = "bust_unhold_body_02";
		this.addSprite("socket").setBrush("bust_base_player");
		local body = this.addSprite("body");
		body.setBrush("bust_unhold_body_02");
		body.varySaturation(0.1);
		body.varyColor(0.09, 0.09, 0.09);
		local injury_body = this.addSprite("injury");
		injury_body.Visible = false;
		injury_body.setBrush("bust_unhold_02_injured");
		this.addSprite("armor");
		local head = this.addSprite("head");
		head.setBrush("bust_unhold_head_02");
		head.Saturation = body.Saturation;
		head.Color = body.Color;
		this.addSprite("helmet");
		this.addDefaultStatusSprites();
		this.getSprite("status_rooted").Scale = 0.65;
		this.setSpriteOffset("status_rooted", this.createVec(-10, 16));
		this.setSpriteOffset("status_stunned", this.createVec(0, 10));
		this.setSpriteOffset("arrow", this.createVec(0, 10));
		this.m.Skills.add(this.new("scripts/skills/racial/unhold_racial"));
		this.m.Skills.add(this.new("scripts/skills/actives/sweep_skill"));
		this.m.Skills.add(this.new("scripts/skills/actives/sweep_zoc_skill"));
		this.m.Skills.add(this.new("scripts/skills/actives/fling_back_skill"));
		this.m.Skills.add(this.new("scripts/skills/actives/unstoppable_charge_skill"));
	}

	function applyCompanionScaling()
	{
		local variantHitpoints = this.m.Item.m.Variant == 1 ? 100 : 0;
		local variantBravery = this.m.Item.m.Variant == 1 ? 20 : 0;
		local variantInitiative = this.m.Item.m.Variant == 1 ? 10 : 0;
		local variantMeleeSkill = this.m.Item.m.Variant == 1 ? 5 : 0;
		local variantRangedDefense = this.m.Item.m.Variant == 3 ? 5 : 0;
		local variantArmor = this.m.Item.m.Variant == 1 ? 90 : 0;
		local propertiesNew = {
			ActionPoints = 9,
			Hitpoints = variantHitpoints + this.m.Item.m.Attributes.Hitpoints,
			Stamina = this.m.Item.m.Attributes.Stamina,
			Bravery = variantBravery + this.m.Item.m.Attributes.Bravery,
			Initiative = variantInitiative + this.m.Item.m.Attributes.Initiative,
			MeleeSkill = variantMeleeSkill + this.m.Item.m.Attributes.MeleeSkill,
			RangedSkill = this.m.Item.m.Attributes.RangedSkill,
			MeleeDefense = this.m.Item.m.Attributes.MeleeDefense,
			RangedDefense = variantRangedDefense + this.m.Item.m.Attributes.RangedDefense,
			Armor = [
				variantArmor
				variantArmor
			],
			FatigueEffectMult = 1.0,
			MoraleEffectMult = 1.0,
			FatigueRecoveryRate = 30
		};
		local propertiesBase = this.m.BaseProperties;
		propertiesBase.setValues(propertiesNew);
		this.m.CurrentProperties = propertiesBase;
		this.m.Hitpoints = propertiesBase.Hitpoints;

		foreach( quirk in this.m.Item.m.Quirks )
		{
			this.m.Skills.add(this.new(quirk));
		}

		if (this.m.Item.m.Variant == 1 && this.getSkills().getSkillByID("perk.killing_frenzy") == null)
		{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_killing_frenzy"));
		}

		this.m.AIAgent.addQuirkBehaviors();

		if (this.m.Item.m.Type == this.Const.Companions.TypeList.UnholdArmor)
		{
			if (this.m.Item.m.Variant == 1)
			{
				this.m.Items.equip(this.new("scripts/items/armor/barbarians/unhold_armor_heavy"));
				this.m.Items.equip(this.new("scripts/items/helmets/barbarians/unhold_helmet_heavy"));
			}
			else if (this.m.Item.m.Variant == 2)
			{
				this.m.Items.equip(this.new("scripts/items/armor/barbarians/unhold_armor_light"));
				this.m.Items.equip(this.new("scripts/items/helmets/barbarians/unhold_helmet_light"));
			}
		}
	}

});
