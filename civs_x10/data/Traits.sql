/*
Thinking of using some kind of system for global variables, so the mod is easier to maintain, but probably not, too much work

CREATE TABLE x10_ModifierVariables (Variable_Name varchar(25), Value int);
INSERT INTO x10_ModifierVariables (Variable_Name , Value)
VALUES
	('ModwideModifier' , 10),
--Combat Modiers according to: Modifier_x10 = 25 ln( 10 * exp( Modifier_Vanilla / 25) - 9 )
	('CombatModifier1' , 9),
	('CombatModifier2' , 15),
	('CombatModifier5' , 29),
	('CombatModifier10' , 44),

(SELECT Value FROM ModifierVariables WHERE Variable_Name = 'ModwideModifier')

*/

---------------------------------------------------------
---------------------------------------------------------
--AMERICA
---------------------------------------------------------
---------------------------------------------------------

--Founding Fathers
UPDATE ModifierArguments
SET Value = 1000
WHERE (Name = 'BonusRate'
AND ModifierId LIKE '%BONUS_RATE%');

--FILM_STUDIO
UPDATE ModifierArguments
SET Value = 1000
WHERE (Name = 'Modifier'
AND ModifierId = 'FILMSTUDIO_ENHANCEDLATETOURISM');

--P51    
UPDATE Units
SET BaseMoves = 24 , Combat = 109, RangedCombat = 109 , Cost = 170
WHERE UnitType = 'UNIT_AMERICAN_P51';

UPDATE ModifierArguments
SET Value = 500
WHERE ModifierId = 'MUSTANG_MORE_EXPERIENCE';


--LEADER Teddy
--Corollary
UPDATE ModifierArguments
SET Value = 29
WHERE ModifierId = 'COMBAT_BONUS_HOME_CONTINENT_MODIFIER';

UPDATE ModifierArguments
SET Value = 10
WHERE ModifierId = 'TRAIT_NATIONAL_PARK_APPEAL_BONUS';

--rough rider
UPDATE ModifierArguments
SET Value = 44
WHERE ModifierId = 'ROUGH_RIDER_BONUS_ON_HILLS';

UPDATE ModifierArguments
SET Value = 500
WHERE Name = 'PercentDefeatedStrength'
AND ModifierId = 'ROUGH_RIDER_POST_COMBAT_CULTURE';

---------------------------------------------------------
---------------------------------------------------------
--ARABIA
---------------------------------------------------------
---------------------------------------------------------

--Last Prophet
--TODO maybe Prophet at start, but then name stupid? or spawn 9 apostles?
UPDATE ModifierArguments
SET Value = 10
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_SCIENCE_PER_FOREIGN_CITY_FOLLOWING_RELIGION');

--Madrasa
--TODO faith bonus
UPDATE Building_YieldChanges
SET YieldChange = 14
WHERE BuildingType = 'BUILDING_MADRASA';

--Mamluk
--TODO some better heal, for now give medic trait
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId)
VALUES ('ABILITY_MAMLUK', 'MEDIC_INCREASE_HEAL_RATE');


--LEADER Saladin
UPDATE ModifierArguments
SET Value = 99
WHERE ModifierId = 'TRAIT_RELIGIOUS_BUILDING_DISCOUNT';

UPDATE ModifierArguments
SET Value = 100
WHERE (Name = 'Multiplier'
AND ModifierId LIKE 'TRAIT_RELIGIOUS_BUILDING_MULTIPLIER_%');

---------------------------------------------------------
---------------------------------------------------------
--CIVILIZATION_BRAZIL
---------------------------------------------------------
---------------------------------------------------------

--TRAIT_CIVILIZATION_AMAZON
UPDATE ModifierArguments
SET Value = 10
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_AMAZON_RAINFOREST_COMMERCIALHUB_ADJACENCY';

UPDATE ModifierArguments
SET Value = 10
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_AMAZON_RAINFOREST_HOLYSITE_ADJACENCY';

UPDATE ModifierArguments
SET Value = 10
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_AMAZON_RAINFOREST_THEATER_ADJACENCY';

UPDATE ModifierArguments
SET Value = 10
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_AMAZON_RAINFOREST_CAMPUS_ADJACENCY';

UPDATE ModifierArguments
SET Value = 11
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_AMAZON_RAINFOREST_EXTRA_APPEAL';

--MINAS_GERAES
UPDATE Units
SET Combat = 60 + 44 , RangedCombat = 70 + 44 , AntiAirCombat = 65 +44
WHERE UnitType = 'UNIT_BRAZILIAN_MINAS_GERAES';


--"CIVILIZATION_BRAZIL"	"TRAIT_CIVILIZATION_STREET_CARNIVAL"
--GPP
UPDATE Project_GreatPersonPoints
SET Points = Points * 10
WHERE ProjectType = 'PROJECT_CARNIVAL';

--cost 0.5^10 *60 =~ 0
UPDATE Districts
SET Cost = 1
WHERE DistrictType = 'DISTRICT_STREET_CARNIVAL';

--Bonus
UPDATE Districts
SET Entertainment = 1 + 10
WHERE DistrictType = 'DISTRICT_STREET_CARNIVAL';

--LEADER Pedro
--refund
UPDATE ModifierArguments
SET Value = 90
WHERE ModifierId = 'TRAIT_GREAT_PERSON_REFUND';

---------------------------------------------------------
---------------------------------------------------------
--CHINA
---------------------------------------------------------
---------------------------------------------------------

--DYNASTIC_CYCLE"
--10% extra eureka -> 150% eureka nonsense, therefore  decrease leftover exponential 1−0,5×0,8^10=~95% , makes a 'bit' of sense, but very OP
UPDATE ModifierArguments
SET Value = 45
WHERE ModifierId = 'TRAIT_CIVIC_BOOST';

UPDATE ModifierArguments
SET Value = 45
WHERE ModifierId = 'TRAIT_TECHNOLOGY_BOOST';

--TRAIT_CIVILIZATION_IMPROVEMENT_GREAT_WALL
--40 Def
UPDATE Improvements
SET DefenseModifier = 25
WHERE ImprovementType = 'IMPROVEMENT_GREAT_WALL';

--adjacencies
UPDATE Adjacency_YieldChanges
SET YieldChange = 10
WHERE ID = 'GreatWall_Gold';

UPDATE Adjacency_YieldChanges
SET YieldChange = 10
WHERE ID = 'GreatWall_Culture';

--"TRAIT_CIVILIZATION_UNIT_CHINESE_CROUCHING_TIGER rangedcombat 40 + 44 
UPDATE Units
SET RangedCombat = 84
WHERE UnitType = 'UNIT_CHINESE_CROUCHING_TIGER';
--cost reduction (exponential, 160/180^10 *180 = 55 )
UPDATE Units
SET Cost = 55
WHERE UnitType = 'UNIT_CHINESE_CROUCHING_TIGER';

--LEADER Qin
--10 Charges 
UPDATE ModifierArguments
SET Value = 10
WHERE ModifierId = 'TRAIT_ADJUST_BUILDER_CHARGES';

--Wonder Production, exponential 15% to 1-0.85^10 = 80%
UPDATE ModifierArguments
SET Value = 80
WHERE ModifierId = 'TRAIT_BUILDER_WONDER_PERCENT';

---------------------------------------------------------
---------------------------------------------------------
--Egypt
---------------------------------------------------------
---------------------------------------------------------

--Iteru
UPDATE ModifierArguments
SET Value = 405
WHERE ModifierId = 'TRAIT_RIVER_FASTER_BUILDTIME_DISTRICT';

UPDATE ModifierArguments
SET Value = 405
WHERE ModifierId = 'TRAIT_RIVER_FASTER_BUILDTIME_WONDER';

--TRAIT_CIVILIZATION_IMPROVEMENT_SPHINX
UPDATE Improvement_YieldChanges
SET YieldChange = 10
WHERE (ImprovementType = 'IMPROVEMENT_SPHINX'
AND YieldType = 'YIELD_FAITH');

UPDATE Improvement_YieldChanges
SET YieldChange = 10
WHERE (ImprovementType = 'IMPROVEMENT_SPHINX'
AND YieldType = 'YIELD_CULTURE');

UPDATE Improvements
SET Appeal = 10
WHERE ImprovementType = 'IMPROVEMENT_SPHINX';

UPDATE Improvement_BonusYieldChanges
SET BonusYieldChange = 10
WHERE ImprovementType = 'IMPROVEMENT_SPHINX';

UPDATE ModifierArguments
SET Value = 2 * 10
WHERE Name = 'Amount'
AND ModifierId = 'SPHINX_WONDERADJACENCY_FAITH';

--TRAIT_CIVILIZATION_UNIT_EGYPTIAN_CHARIOT_ARCHER, Movement Bonus x10 
UPDATE ModifierArguments
SET Value = 2 + 10
WHERE (Name = 'Amount'
AND ModifierId = 'LIGHTCHARIOT_FASTER_CLEAR_TERRAIN');

--TRAIT_LEADER_MEDITERRANEAN
UPDATE ModifierArguments
SET Value = 4 * 10
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INTERNATIONAL_TRADE_GAIN_GOLD');

UPDATE ModifierArguments
SET Value = 2 * 10
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INCOMING_TRADE_GAIN_GOLD');

UPDATE ModifierArguments
SET Value = 2 * 10
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INCOMING_TRADE_OFFER_FOOD');


---------------------------------------------------------
---------------------------------------------------------
--England
---------------------------------------------------------
---------------------------------------------------------

--Museum 
--more than 10 slots break UI, therefore only 9 slots instead of 33.
UPDATE ModifierArguments
SET Value = 6
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_DOUBLE_ARCHAEOLOGY_SLOTS';

UPDATE ModifierArguments
SET Value = 2
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_SUPPORT_TWO_ARCHAEOLOGISTS';

--SEADOG, but more moves for now, prize ship chance=100% maybe?
UPDATE Units
SET BaseMoves = 10
WHERE UnitType = 'UNIT_ENGLISH_SEADOG';

--NAVY_DOCKYARD"
UPDATE ModifierArguments
SET Value = 20
WHERE Name = 'Amount'
AND ModifierId = 'ROYAL_NAVY_DOCKYARD_GOLD_FROM_FOREIGN_CONTINENT';

UPDATE ModifierArguments
SET Value = 10
WHERE ModifierId = 'ROYAL_NAVY_DOCKYARD_GRANT_MOVEMENT_BONUS';

UPDATE Districts
SET Cost = 1
WHERE DistrictType = 'DISTRICT_ROYAL_NAVY_DOCKYARD';

--Pax Brittanicy
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES 
    ('TRAIT_LEADER_PAX_BRITANNICA', 'TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_1'),
    ('TRAIT_LEADER_PAX_BRITANNICA', 'TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_2'),
    ('TRAIT_LEADER_PAX_BRITANNICA', 'TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_3'),
    ('TRAIT_LEADER_PAX_BRITANNICA', 'TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_4'),
    ('TRAIT_LEADER_PAX_BRITANNICA', 'TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_5'),
    ('TRAIT_LEADER_PAX_BRITANNICA', 'TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_6'),
    ('TRAIT_LEADER_PAX_BRITANNICA', 'TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_7'),
    ('TRAIT_LEADER_PAX_BRITANNICA', 'TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_8'),
    ('TRAIT_LEADER_PAX_BRITANNICA', 'TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_9');

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES 
    ('TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_1', 'MODIFIER_PLAYER_CITIES_GRANT_UNIT_BY_CLASS'),
    ('TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_2', 'MODIFIER_PLAYER_CITIES_GRANT_UNIT_BY_CLASS'),
    ('TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_3', 'MODIFIER_PLAYER_CITIES_GRANT_UNIT_BY_CLASS'),
    ('TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_4', 'MODIFIER_PLAYER_CITIES_GRANT_UNIT_BY_CLASS'),
    ('TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_5', 'MODIFIER_PLAYER_CITIES_GRANT_UNIT_BY_CLASS'),
    ('TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_6', 'MODIFIER_PLAYER_CITIES_GRANT_UNIT_BY_CLASS'),
    ('TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_7', 'MODIFIER_PLAYER_CITIES_GRANT_UNIT_BY_CLASS'),
    ('TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_8', 'MODIFIER_PLAYER_CITIES_GRANT_UNIT_BY_CLASS'),
    ('TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_9', 'MODIFIER_PLAYER_CITIES_GRANT_UNIT_BY_CLASS');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES 
    ('TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_1', 'UnitPromotionClassType', 'PROMOTION_CLASS_MELEE'),
    ('TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_2', 'UnitPromotionClassType', 'PROMOTION_CLASS_MELEE'),
    ('TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_3', 'UnitPromotionClassType', 'PROMOTION_CLASS_MELEE'),
    ('TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_4', 'UnitPromotionClassType', 'PROMOTION_CLASS_MELEE'),
    ('TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_5', 'UnitPromotionClassType', 'PROMOTION_CLASS_MELEE'),
    ('TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_6', 'UnitPromotionClassType', 'PROMOTION_CLASS_MELEE'),
    ('TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_7', 'UnitPromotionClassType', 'PROMOTION_CLASS_MELEE'),
    ('TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_8', 'UnitPromotionClassType', 'PROMOTION_CLASS_MELEE'),
    ('TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_9', 'UnitPromotionClassType', 'PROMOTION_CLASS_MELEE');

--REDCOAT 
UPDATE ModifierArguments
SET Value = 44
WHERE ModifierId = 'REDCOAT_FOREIGN_COMBAT';



---------------------------------------------------------
---------------------------------------------------------
--France
---------------------------------------------------------
---------------------------------------------------------

--TRAIT_CIVILIZATION_IMPROVEMENT_CHATEAU
UPDATE Improvements
SET Appeal = 10
WHERE ImprovementType = 'IMPROVEMENT_CHATEAU';

UPDATE Improvement_YieldChanges
SET YieldChange = 20
WHERE ImprovementType = 'IMPROVEMENT_CHATEAU';

UPDATE ModifierArguments
SET Value = 10
WHERE (Name = 'Amount'
AND ModifierId = 'CHATEAU_LUXURYADJACENCY_GOLD');

UPDATE ModifierArguments
SET Value = 20
WHERE (Name = 'Amount'
AND ModifierId = 'CHATEAU_WONDERADJACENCY_CULTURE');

--10x tourism
UPDATE ModifierArguments
SET Value = 1000
WHERE (Name = 'ScalingFactor'
AND ModifierId = 'TRAIT_WONDER_DOUBLETOURISM');

--ress. Wonders 20% to 90%, exponential scaling
UPDATE ModifierArguments
SET Value = 90
WHERE Name = 'Amount'
AND (ModifierId = 'TRAIT_ALHAMBRAPRODUCTION'
OR ModifierId = 'TRAIT_CHICHENITZAPRODUCTION'
OR ModifierId = 'TRAIT_FORBIDDENCITYPRODUCTION'
OR ModifierId = 'TRAIT_GREATZIMBABWEPRODUCTION'
OR ModifierId = 'TRAIT_HAGIASOPHIAPRODUCTION'
OR ModifierId = 'TRAIT_VENETIANARSENALPRODUCTION'
OR ModifierId = 'TRAIT_MONTSTMICHELPRODUCTION'
OR ModifierId = 'TRAIT_POTALAPALACEPRODUCTION'
OR ModifierId = 'TRAIT_BOLSHOITHEATREPRODUCTION'
OR ModifierId = 'TRAIT_HERMITAGEPRODUCTION'
OR ModifierId = 'TRAIT_RUHRVALLEYPRODUCTION'
OR ModifierId = 'TRAIT_OXFORDUNIVERSITYPRODUCTION'
OR ModifierId = 'TRAIT_BIGBENPRODUCTION');

--GARDE_IMPERIALE" combat bonus
UPDATE ModifierArguments
SET Value = 44
WHERE ModifierId = 'GARDE_CONTINENT_COMBAT';

UPDATE ModifierArguments
SET Value = 100
WHERE Name = 'Amount'
AND ModifierId = 'GARDE_GREAT_GENERAL_POINTS';


--"FLYING_SQUADRON_TRAIT", 10 spy and 10 vis
UPDATE ModifierArguments
SET Value = 10
WHERE (Name = 'Amount'
AND ModifierId = 'UNIQUE_LEADER_ADD_VISIBILITY');

UPDATE ModifierArguments
SET Value = 10
WHERE Name = 'Amount'
AND (ModifierId = 'UNIQUE_LEADER_ADD_SPY_CAPACITY'
OR ModifierId = 'UNIQUE_LEADER_ADD_SPY_UNIT');

---------------------------------------------------------
---------------------------------------------------------
--Germany
---------------------------------------------------------
---------------------------------------------------------

--TRAIT_CIVILIZATION_IMPERIAL_FREE_CITIES"
UPDATE ModifierArguments
SET Value = 10
WHERE ModifierId = 'TRAIT_EXTRA_DISTRICT_EACH_CITY';

--"TRAIT_CIVILIZATION_DISTRICT_HANSA"
UPDATE Districts
SET Cost = 1
WHERE DistrictType = 'DISTRICT_HANSA';

UPDATE Adjacency_YieldChanges
SET YieldChange = 20
WHERE ID = 'Commerical_Hub_Production';

UPDATE Adjacency_YieldChanges
SET YieldChange = 10
WHERE ID = 'Resource_Production';

--scale cost exponetially (430/480)^10*480
UPDATE Units
SET Cost = 160 , BaseSightRange = 12
WHERE UnitType = 'UNIT_GERMAN_UBOAT';

UPDATE ModifierArguments
SET Value = 44
WHERE ModifierId = 'UBOAT_OCEAN_COMBAT';

--LEADER BABAROSSA
UPDATE ModifierArguments
SET Value = 36
WHERE (Name = 'Amount'
AND ModifierId = 'COMBAT_BONUS_VS_CITY_STATES_MODIFIER');

--Militatry slots
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES 
    ('TRAIT_LEADER_HOLY_ROMAN_EMPEROR', 'TRAIT_MILITARY_GOVERNMENT_SLOT_1'),
    ('TRAIT_LEADER_HOLY_ROMAN_EMPEROR', 'TRAIT_MILITARY_GOVERNMENT_SLOT_2'),
    ('TRAIT_LEADER_HOLY_ROMAN_EMPEROR', 'TRAIT_MILITARY_GOVERNMENT_SLOT_3'),
    ('TRAIT_LEADER_HOLY_ROMAN_EMPEROR', 'TRAIT_MILITARY_GOVERNMENT_SLOT_4'),
    ('TRAIT_LEADER_HOLY_ROMAN_EMPEROR', 'TRAIT_MILITARY_GOVERNMENT_SLOT_5'),
    ('TRAIT_LEADER_HOLY_ROMAN_EMPEROR', 'TRAIT_MILITARY_GOVERNMENT_SLOT_6'),
    ('TRAIT_LEADER_HOLY_ROMAN_EMPEROR', 'TRAIT_MILITARY_GOVERNMENT_SLOT_7'),
    ('TRAIT_LEADER_HOLY_ROMAN_EMPEROR', 'TRAIT_MILITARY_GOVERNMENT_SLOT_8'),
    ('TRAIT_LEADER_HOLY_ROMAN_EMPEROR', 'TRAIT_MILITARY_GOVERNMENT_SLOT_9');

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES 
    ('TRAIT_MILITARY_GOVERNMENT_SLOT_1', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
    ('TRAIT_MILITARY_GOVERNMENT_SLOT_2', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
    ('TRAIT_MILITARY_GOVERNMENT_SLOT_3', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
    ('TRAIT_MILITARY_GOVERNMENT_SLOT_4', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
    ('TRAIT_MILITARY_GOVERNMENT_SLOT_5', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
    ('TRAIT_MILITARY_GOVERNMENT_SLOT_6', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
    ('TRAIT_MILITARY_GOVERNMENT_SLOT_7', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
    ('TRAIT_MILITARY_GOVERNMENT_SLOT_8', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
    ('TRAIT_MILITARY_GOVERNMENT_SLOT_9', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES 
    ('TRAIT_MILITARY_GOVERNMENT_SLOT_1', 'GovernmentSlotType', 'SLOT_MILITARY'),
    ('TRAIT_MILITARY_GOVERNMENT_SLOT_2', 'GovernmentSlotType', 'SLOT_MILITARY'),
    ('TRAIT_MILITARY_GOVERNMENT_SLOT_3', 'GovernmentSlotType', 'SLOT_MILITARY'),
    ('TRAIT_MILITARY_GOVERNMENT_SLOT_4', 'GovernmentSlotType', 'SLOT_MILITARY'),
    ('TRAIT_MILITARY_GOVERNMENT_SLOT_5', 'GovernmentSlotType', 'SLOT_MILITARY'),
    ('TRAIT_MILITARY_GOVERNMENT_SLOT_6', 'GovernmentSlotType', 'SLOT_MILITARY'),
    ('TRAIT_MILITARY_GOVERNMENT_SLOT_7', 'GovernmentSlotType', 'SLOT_MILITARY'),
    ('TRAIT_MILITARY_GOVERNMENT_SLOT_8', 'GovernmentSlotType', 'SLOT_MILITARY'),
    ('TRAIT_MILITARY_GOVERNMENT_SLOT_9', 'GovernmentSlotType', 'SLOT_MILITARY');

---------------------------------------------------------
---------------------------------------------------------
--Greece
---------------------------------------------------------
---------------------------------------------------------

--PLATOS_REPUBLIC
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES 
    ('TRAIT_CIVILIZATION_PLATOS_REPUBLIC', 'TRAIT_WILDCARD_GOVERNMENT_SLOT_1'),
    ('TRAIT_CIVILIZATION_PLATOS_REPUBLIC', 'TRAIT_WILDCARD_GOVERNMENT_SLOT_2'),
    ('TRAIT_CIVILIZATION_PLATOS_REPUBLIC', 'TRAIT_WILDCARD_GOVERNMENT_SLOT_3'),
    ('TRAIT_CIVILIZATION_PLATOS_REPUBLIC', 'TRAIT_WILDCARD_GOVERNMENT_SLOT_4'),
    ('TRAIT_CIVILIZATION_PLATOS_REPUBLIC', 'TRAIT_WILDCARD_GOVERNMENT_SLOT_5'),
    ('TRAIT_CIVILIZATION_PLATOS_REPUBLIC', 'TRAIT_WILDCARD_GOVERNMENT_SLOT_6'),
    ('TRAIT_CIVILIZATION_PLATOS_REPUBLIC', 'TRAIT_WILDCARD_GOVERNMENT_SLOT_7'),
    ('TRAIT_CIVILIZATION_PLATOS_REPUBLIC', 'TRAIT_WILDCARD_GOVERNMENT_SLOT_8'),
    ('TRAIT_CIVILIZATION_PLATOS_REPUBLIC', 'TRAIT_WILDCARD_GOVERNMENT_SLOT_9');

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES 
    ('TRAIT_WILDCARD_GOVERNMENT_SLOT_1', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
    ('TRAIT_WILDCARD_GOVERNMENT_SLOT_2', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
    ('TRAIT_WILDCARD_GOVERNMENT_SLOT_3', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
    ('TRAIT_WILDCARD_GOVERNMENT_SLOT_4', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
    ('TRAIT_WILDCARD_GOVERNMENT_SLOT_5', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
    ('TRAIT_WILDCARD_GOVERNMENT_SLOT_6', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
    ('TRAIT_WILDCARD_GOVERNMENT_SLOT_7', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
    ('TRAIT_WILDCARD_GOVERNMENT_SLOT_8', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
    ('TRAIT_WILDCARD_GOVERNMENT_SLOT_9', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES 
    ('TRAIT_WILDCARD_GOVERNMENT_SLOT_1', 'GovernmentSlotType', 'SLOT_WILDCARD'),
    ('TRAIT_WILDCARD_GOVERNMENT_SLOT_2', 'GovernmentSlotType', 'SLOT_WILDCARD'),
    ('TRAIT_WILDCARD_GOVERNMENT_SLOT_3', 'GovernmentSlotType', 'SLOT_WILDCARD'),
    ('TRAIT_WILDCARD_GOVERNMENT_SLOT_4', 'GovernmentSlotType', 'SLOT_WILDCARD'),
    ('TRAIT_WILDCARD_GOVERNMENT_SLOT_5', 'GovernmentSlotType', 'SLOT_WILDCARD'),
    ('TRAIT_WILDCARD_GOVERNMENT_SLOT_6', 'GovernmentSlotType', 'SLOT_WILDCARD'),
    ('TRAIT_WILDCARD_GOVERNMENT_SLOT_7', 'GovernmentSlotType', 'SLOT_WILDCARD'),
    ('TRAIT_WILDCARD_GOVERNMENT_SLOT_8', 'GovernmentSlotType', 'SLOT_WILDCARD'),
    ('TRAIT_WILDCARD_GOVERNMENT_SLOT_9', 'GovernmentSlotType', 'SLOT_WILDCARD');

--acropolis
UPDATE Districts
SET Cost = 1
WHERE DistrictType = 'DISTRICT_ACROPOLIS';

UPDATE Adjacency_YieldChanges
SET YieldChange = 20
WHERE ID = 'District_Culture_City_Center';

UPDATE DistrictModifiers
SET ModifierID = 'CIVIC_AWARD_TEN_INFLUENCE_TOKEN'
WHERE DistrictType = 'DISTRICT_ACROPOLIS';

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES ('CIVIC_AWARD_TEN_INFLUENCE_TOKEN', 'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('CIVIC_AWARD_TEN_INFLUENCE_TOKEN', 'Amount', 10);

--HOPLITE

--Only does change, if platform already has the fall-update. Mac, linux stay playable, but bonus is not applied. Remove when update released.
UPDATE ModifierArguments 
SET Value = 44
WHERE ModifierId = 'HOPLITE_NEIGHBOR_COMBAT_MODIFIER'
AND EXISTS (SELECT * FROM ModifierArguments WHERE ModifierId = 'HOPLITE_NEIGHBOR_COMBAT_MODIFIER');

--gorgo
UPDATE ModifierArguments
SET Value = 500
WHERE (Name = 'PercentDefeatedStrength'
AND ModifierId = 'UNIQUE_LEADER_CULTURE_KILLS');

--pericles
UPDATE ModifierArguments
SET Value = 50
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_CULTURE_PER_CITY_STATE_TRIBUTARY');



---------------------------------------------------------
---------------------------------------------------------
--india
---------------------------------------------------------
---------------------------------------------------------

--"TRAIT_CIVILIZATION_DHARMA"
-- TRAIT_GAINS_ALL_FOLLOWER_BELIEFS, no x10

--STEPWELL"
UPDATE Improvements
SET Housing = 20
WHERE ImprovementType = 'IMPROVEMENT_STEPWELL';

UPDATE Improvement_YieldChanges
SET YieldChange = 10
WHERE (YieldType = 'YIELD_FOOD'
AND ImprovementType = 'IMPROVEMENT_STEPWELL');

UPDATE Improvement_BonusYieldChanges
SET BonusYieldChange = 10
WHERE ImprovementType = 'IMPROVEMENT_STEPWELL';

UPDATE ModifierArguments
SET Value = 10
WHERE (Name = 'Amount'
AND ModifierId = 'STEPWELL_FARMADJACENCY_FOOD');

UPDATE ModifierArguments
SET Value = 10
WHERE (Name = 'Amount'
AND ModifierId = 'STEPWELL_HOLYSITEADJACENCY_FAITH');

UPDATE ModifierArguments
SET Value = 10
WHERE (Name = 'Amount'
AND ModifierId = 'STEPWELL_HOUSING_WITHTECH');


--Varu
UPDATE Units
SET BaseMoves = 1 , BaseSightRange = 12 , Combat = 64 , Cost = 480
WHERE UnitType = 'UNIT_INDIAN_VARU';

UPDATE ModifierArguments
SET Value = -29
WHERE (Name = 'Amount'
AND ModifierId = 'VARU_NEGATIVE_COMBAT_MODIFIER');

--Ghandi SATYAGRAHA 
UPDATE ModifierArguments
SET Value = 1000
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INCREASE_ENEMY_WAR_WEARINESS');

UPDATE ModifierArguments
SET Value = 50
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_FAITH_PEACEFUL_FOUNDERS');


---------------------------------------------------------
---------------------------------------------------------
--Japan
---------------------------------------------------------
---------------------------------------------------------

--"TRAIT_CIVILIZATION_ADJACENT_DISTRICTS"
UPDATE ModifierArguments
SET Value = 10
WHERE Name = 'Amount'
AND (ModifierId = 'TRAIT_ADJACENT_DISTRICTS_HOLYSITE_ADJACENCYFAITH'
OR ModifierId = 'TRAIT_ADJACENT_DISTRICTS_CAMPUS_ADJACENCYSCIENCE'
OR ModifierId = 'TRAIT_ADJACENT_DISTRICTS_HARBOR_ADJACENCYGOLD'
OR ModifierId = 'TRAIT_ADJACENT_DISTRICTS_COMMERCIALHUB_ADJACENCYGOLD'
OR ModifierId = 'TRAIT_ADJACENT_DISTRICTS_THEATER_ADJACENCYCULTURE'
OR ModifierId = 'TRAIT_ADJACENT_DISTRICTS_INDUSTRIALZONE_ADJACENCYPRODUCTION');

--Electronics FACTORY
UPDATE Building_YieldChanges
SET YieldChange = 13
WHERE BuildingType = 'BUILDING_ELECTRONICS_FACTORY';

UPDATE ModifierArguments
SET Value = 40
WHERE (Name = 'Amount'
AND ModifierId = 'ELECTRONICSFACTORY_CULTURE');

--SAMURAI
UPDATE Units
SET Cost = 63 , Combat = 66
WHERE UnitType = 'UNIT_JAPANESE_SAMURAI';

--DIVINE_WIND
UPDATE ModifierArguments
SET Value = 1000
WHERE Name = 'Amount'
AND (ModifierId = 'TRAIT_BOOST_ENCAMPMENT_PRODUCTION'
OR ModifierId = 'TRAIT_BOOST_HOLY_SITE_PRODUCTION'
OR ModifierId = 'TRAIT_BOOST_THEATER_DISTRICT_PRODUCTION');

UPDATE ModifierArguments
SET Value = 29
WHERE ModifierId = 'COMBAT_BONUS_LAND_ON_COAST_MODIFIER'
OR ModifierId = 'COMBAT_BONUS_NAVAL_SHALLOW_WATER_MODIFIER';


---------------------------------------------------------
---------------------------------------------------------
--Kongo
---------------------------------------------------------
---------------------------------------------------------

--NKISI
UPDATE ModifierArguments
SET Value = 500
WHERE Name = 'Amount'
AND (ModifierId = 'TRAIT_DOUBLE_WRITER_POINTS'
OR ModifierId = 'TRAIT_DOUBLE_ARTIST_POINTS'
OR ModifierId = 'TRAIT_DOUBLE_MUSICIAN_POINTS'
OR ModifierId = 'TRAIT_DOUBLE_MERCHANT_POINTS');

UPDATE ModifierArguments
SET Value = 20
WHERE Name = 'YieldChange'
AND (ModifierId = 'TRAIT_GREAT_WORK_FOOD_SCULPTURE'
OR ModifierId = 'TRAIT_GREAT_WORK_PRODUCTION_SCULPTURE'
OR ModifierId = 'TRAIT_GREAT_WORK_FOOD_ARTIFACT'
OR ModifierId = 'TRAIT_GREAT_WORK_PRODUCTION_ARTIFACT'
OR ModifierId = 'TRAIT_GREAT_WORK_PRODUCTION_RELIC'
OR ModifierId = 'TRAIT_GREAT_WORK_FOOD_RELIC');

UPDATE ModifierArguments
SET Value = 40
WHERE Name = 'YieldChange'
AND (ModifierId = 'TRAIT_GREAT_WORK_GOLD_SCULPTURE'
OR ModifierId = 'TRAIT_GREAT_WORK_GOLD_ARTIFACT'
OR ModifierId = 'TRAIT_GREAT_WORK_GOLD_RELIC');

--palace slots, 9 max, or UI is fucked
UPDATE ModifierArguments
SET Value = 8
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_EXTRA_PALACE_SLOTS');

--MBANZA
UPDATE Districts
SET Cost = 1
WHERE DistrictType = 'DISTRICT_MBANZA';

UPDATE Districts 
SET Housing=50 
WHERE DistrictType='DISTRICT_MBANZA';

UPDATE ModifierArguments
SET Value = 20
WHERE (Name = 'Amount'
AND ModifierId = 'MBANZA_FOOD');

UPDATE ModifierArguments
SET Value = 40
WHERE (Name = 'Amount'
AND ModifierId = 'MBANZA_GOLD');



--SHIELD_BEARER 
--not sure, if 10 Movement work like that
--UPDATE ModifierArguments SET Value=10 WHERE (Name='Ignore' AND ModifierId='NAGAO_FOREST_MOVEMENT');

UPDATE ModifierArguments
SET Value = 44
WHERE ModifierId = 'NAGAO_RANGED_DEFENSE';

--TRAIT_LEADER_RELIGIOUS_CONVERT
INSERT INTO TraitModifiers (TraitType , ModifierId)
VALUES
	('TRAIT_LEADER_RELIGIOUS_CONVERT' , 'TRAIT_FREE_APOSTLE_FINISH_MBANZA_1'),
	('TRAIT_LEADER_RELIGIOUS_CONVERT' , 'TRAIT_FREE_APOSTLE_FINISH_MBANZA_2'),
	('TRAIT_LEADER_RELIGIOUS_CONVERT' , 'TRAIT_FREE_APOSTLE_FINISH_MBANZA_3'),
	('TRAIT_LEADER_RELIGIOUS_CONVERT' , 'TRAIT_FREE_APOSTLE_FINISH_MBANZA_4'),
	('TRAIT_LEADER_RELIGIOUS_CONVERT' , 'TRAIT_FREE_APOSTLE_FINISH_MBANZA_5'),
	('TRAIT_LEADER_RELIGIOUS_CONVERT' , 'TRAIT_FREE_APOSTLE_FINISH_MBANZA_6'),
	('TRAIT_LEADER_RELIGIOUS_CONVERT' , 'TRAIT_FREE_APOSTLE_FINISH_MBANZA_7'),
	('TRAIT_LEADER_RELIGIOUS_CONVERT' , 'TRAIT_FREE_APOSTLE_FINISH_MBANZA_8'),
	('TRAIT_LEADER_RELIGIOUS_CONVERT' , 'TRAIT_FREE_APOSTLE_FINISH_MBANZA_9');

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_1' , 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_2' , 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_3' , 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_4' , 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_5' , 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_6' , 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_7' , 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_8' , 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_9' , 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES 
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_1' , 'DistrictType' , 'DISTRICT_MBANZA'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_1' , 'UnitType' , 'UNIT_APOSTLE'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_2' , 'DistrictType' , 'DISTRICT_MBANZA'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_2' , 'UnitType' , 'UNIT_APOSTLE'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_3' , 'DistrictType' , 'DISTRICT_MBANZA'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_3' , 'UnitType' , 'UNIT_APOSTLE'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_4' , 'DistrictType' , 'DISTRICT_MBANZA'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_4' , 'UnitType' , 'UNIT_APOSTLE'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_5' , 'DistrictType' , 'DISTRICT_MBANZA'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_5' , 'UnitType' , 'UNIT_APOSTLE'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_6' , 'DistrictType' , 'DISTRICT_MBANZA'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_6' , 'UnitType' , 'UNIT_APOSTLE'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_7' , 'DistrictType' , 'DISTRICT_MBANZA'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_7' , 'UnitType' , 'UNIT_APOSTLE'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_8' , 'DistrictType' , 'DISTRICT_MBANZA'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_8' , 'UnitType' , 'UNIT_APOSTLE'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_9' , 'DistrictType' , 'DISTRICT_MBANZA'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_9' , 'UnitType' , 'UNIT_APOSTLE');

INSERT INTO TraitModifiers (TraitType , ModifierId)
VALUES
	('TRAIT_LEADER_RELIGIOUS_CONVERT' , 'TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_1'),
	('TRAIT_LEADER_RELIGIOUS_CONVERT' , 'TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_2'),
	('TRAIT_LEADER_RELIGIOUS_CONVERT' , 'TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_3'),
	('TRAIT_LEADER_RELIGIOUS_CONVERT' , 'TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_4'),
	('TRAIT_LEADER_RELIGIOUS_CONVERT' , 'TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_5'),
	('TRAIT_LEADER_RELIGIOUS_CONVERT' , 'TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_6'),
	('TRAIT_LEADER_RELIGIOUS_CONVERT' , 'TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_7'),
	('TRAIT_LEADER_RELIGIOUS_CONVERT' , 'TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_8'),
	('TRAIT_LEADER_RELIGIOUS_CONVERT' , 'TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_9');

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_1' , 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_2' , 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_3' , 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_4' , 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_5' , 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_6' , 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_7' , 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_8' , 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_9' , 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES 
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_1' , 'DistrictType' , 'DISTRICT_THEATER'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_1' , 'UnitType' , 'UNIT_APOSTLE'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_2' , 'DistrictType' , 'DISTRICT_THEATER'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_2' , 'UnitType' , 'UNIT_APOSTLE'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_3' , 'DistrictType' , 'DISTRICT_THEATER'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_3' , 'UnitType' , 'UNIT_APOSTLE'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_4' , 'DistrictType' , 'DISTRICT_THEATER'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_4' , 'UnitType' , 'UNIT_APOSTLE'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_5' , 'DistrictType' , 'DISTRICT_THEATER'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_5' , 'UnitType' , 'UNIT_APOSTLE'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_6' , 'DistrictType' , 'DISTRICT_THEATER'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_6' , 'UnitType' , 'UNIT_APOSTLE'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_7' , 'DistrictType' , 'DISTRICT_THEATER'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_7' , 'UnitType' , 'UNIT_APOSTLE'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_8' , 'DistrictType' , 'DISTRICT_THEATER'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_8' , 'UnitType' , 'UNIT_APOSTLE'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_9' , 'DistrictType' , 'DISTRICT_THEATER'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_9' , 'UnitType' , 'UNIT_APOSTLE');

---------------------------------------------------------
---------------------------------------------------------
--Norway
---------------------------------------------------------
---------------------------------------------------------
--TRAIT_CIVILIZATION_BUILDING_STAVE_CHURCH
UPDATE ModifierArguments
SET Value = 10
WHERE Name = 'Amount'
AND (ModifierId = 'STAVE_CHURCH_FAITHWOODSADJACENCY'
OR ModifierId = 'STAVECHURCH_SEARESOURCE_PRODUCTION');

--"TRAIT_CIVILIZATION_UNIT_NORWEGIAN_BERSERKER"
UPDATE ModifierArguments
SET Value = 20
WHERE ModifierId = 'BERSERKER_FASTER_ENEMY_TERRITORY';

UPDATE ModifierArguments
SET Value = 36
WHERE ModifierId = 'UNIT_STRONG_WHEN_ATTACKING';

UPDATE ModifierArguments
SET Value = -36
WHERE ModifierId = 'UNIT_WEAK_WHEN_DEFENDING';

--LEADER Harald
--Thunderbolt

UPDATE ModifierArguments
SET Value = 500
WHERE ModifierId LIKE 'TRAIT_%_NAVAL_MELEE_PRODUCTION';

--Longship
UPDATE Units
SET Combat = 54
WHERE UnitType = 'UNIT_NORWEGIAN_LONGSHIP';

UPDATE ModifierArguments
SET Value = 10
WHERE ModifierId = 'LONGSHIP_FASTER_COAST';

---------------------------------------------------------
---------------------------------------------------------
--Rome
---------------------------------------------------------
---------------------------------------------------------

--Bath
UPDATE Districts
SET Cost = 1
WHERE DistrictType = 'DISTRICT_BATH';

UPDATE Districts
SET Housing = 20
WHERE DistrictType = 'DISTRICT_BATH';

UPDATE Districts
SET Entertainment = 10
WHERE DistrictType = 'DISTRICT_BATH';

--Legion
UPDATE Units
SET Combat = 51
WHERE UnitType = 'UNIT_ROMAN_LEGION';

UPDATE Units
SET Cost = 290
WHERE UnitType = 'UNIT_ROMAN_LEGION';

UPDATE Units
SET BuildCharges = 10
WHERE UnitType = 'UNIT_ROMAN_LEGION';

--Fort
UPDATE Improvements
SET DefenseModifier = 25
WHERE ImprovementType = 'IMPROVEMENT_ROMAN_FORT';

--TRAIT_FREE_ROADS_TO_CAPITAL BOOL
--TRAIT_FREE_TRADING_POSTS BOOL
UPDATE ModifierArguments
SET Value = 10
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_GOLD_FROM_DOMESTIC_TRADING_POSTS');

--TRAIT_ADJUST_NON_CAPITAL_FREE_CHEAPEST_BUILDING

UPDATE ModifierArguments
SET Value = 10
WHERE ModifierId = 'TRAIT_ADJUST_NON_CAPITAL_FREE_CHEAPEST_BUILDING';

---------------------------------------------------------
---------------------------------------------------------
--Russia
---------------------------------------------------------
---------------------------------------------------------

--Rodina
UPDATE ModifierArguments
SET Value = 10
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INCREASED_TUNDRA_FAITH');

UPDATE ModifierArguments
SET Value = 10
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INCREASED_TUNDRA_PRODUCTION');

UPDATE ModifierArguments
SET Value = 10
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INCREASED_TUNDRA_HILLS_FAITH');

UPDATE ModifierArguments
SET Value = 10
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INCREASED_TUNDRA_HILLS_PRODUCTION');

UPDATE ModifierArguments
SET Value = 26
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INCREASED_TILES');

--TRAIT_CIVILIZATION_DISTRICT_LAVRA
UPDATE Districts
SET Cost = 1
WHERE DistrictType = 'DISTRICT_LAVRA';

UPDATE District_GreatPersonPoints
SET PointsPerTurn = 11
WHERE (DistrictType = 'DISTRICT_LAVRA'
AND GreatPersonClassType = 'GREAT_PERSON_CLASS_PROPHET');

UPDATE District_GreatPersonPoints
SET PointsPerTurn = 10
WHERE (DistrictType = 'DISTRICT_LAVRA'
AND GreatPersonClassType = 'GREAT_PERSON_CLASS_WRITER');

UPDATE District_GreatPersonPoints
SET PointsPerTurn = 10
WHERE (DistrictType = 'DISTRICT_LAVRA'
AND GreatPersonClassType = 'GREAT_PERSON_CLASS_ARTIST');

UPDATE District_GreatPersonPoints
SET PointsPerTurn = 10
WHERE (DistrictType = 'DISTRICT_LAVRA'
AND GreatPersonClassType = 'GREAT_PERSON_CLASS_MUSICIAN');


--COSSACK
UPDATE Units
SET Combat = 91
WHERE UnitType = 'UNIT_RUSSIAN_COSSACK';

UPDATE Units
SET Cost = 430
WHERE UnitType = 'UNIT_RUSSIAN_COSSACK';

UPDATE ModifierArguments
SET Value = 29
WHERE ModifierId = 'COSSACK_LOCAL_COMBAT';

--peter 
--Grand Embassy, Siuwa's suggested solution
UPDATE ModifierArguments
SET Value = 0.3
WHERE (Name = 'TechCivicsPerYield'
AND ModifierId = 'TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS');


---------------------------------------------------------
---------------------------------------------------------
--Scythia
---------------------------------------------------------
---------------------------------------------------------

--Extra Cavalry 
UPDATE ModifierArguments
SET Value = 10
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_EXTRALIGHTCAVALRY');

UPDATE ModifierArguments
SET Value = 10
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_EXTRASAKAHORSEARCHER');

--Kurgan
UPDATE Improvement_YieldChanges
SET YieldChange = 10
WHERE ImprovementType = 'IMPROVEMENT_KURGAN';

UPDATE Improvement_BonusYieldChanges
SET BonusYieldChange = 10
WHERE ImprovementType = 'IMPROVEMENT_KURGAN';

UPDATE Adjacency_YieldChanges
SET YieldChange = 10
WHERE ID = 'Kurgan_Faith';

--Saka Horse Archer, more reach, more expensive
UPDATE Units
SET Cost = 280 , Combat = 1 , Range = 10
WHERE UnitType = 'UNIT_SCYTHIAN_HORSE_ARCHER';

--Killer of Cyros
UPDATE ModifierArguments
SET Value = 29
WHERE ModifierId = 'BONUS_VS_WOUNDED_UNITS';

UPDATE ModifierArguments
SET Value = 100
WHERE ModifierId = 'HEAL_AFTER_DEFEATING_UNIT';

---------------------------------------------------------
---------------------------------------------------------
--Spain
---------------------------------------------------------
---------------------------------------------------------

--MISSION
UPDATE Improvement_YieldChanges
SET YieldChange = 20
WHERE ImprovementType = 'IMPROVEMENT_MISSION';

UPDATE Improvement_BonusYieldChanges
SET BonusYieldChange = 20
WHERE ImprovementType = 'IMPROVEMENT_MISSION';

UPDATE ModifierArguments
SET Value = 20
WHERE (Name = 'Amount'
AND ModifierId = 'MISSION_NEWCONTINENT_FAITH');

UPDATE ModifierArguments
SET Value = 10
WHERE (Name = 'Amount'
AND ModifierId = 'MISSION_CAMPUSADJACENCY_SCIENCE');

--CONQUISTADOR
UPDATE ModifierArguments
SET Value = 44
WHERE ModifierId = 'CONQUISTADOR_SPECIFIC_UNIT_COMBAT';

--TRAIT_CIVILIZATION_TREASURE_FLEET
UPDATE ModifierArguments
SET Value = 10
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INTERCONTINENTAL_DOMESTIC_FOOD');

UPDATE ModifierArguments
SET Value = 60
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INTERCONTINENTAL_INTERNATIONAL_GOLD');

UPDATE ModifierArguments
SET Value = 10
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INTERCONTINENTAL_DOMESTIC_PRODUCTION');

--Nobody expects 
UPDATE ModifierArguments
SET Value = 10
WHERE ModifierId = 'TRAIT_ADJUST_INQUISITOR_CHARGES';

UPDATE ModifierArguments
SET Value = 25
WHERE ModifierId = 'COMBAT_BONUS_OTHER_RELIGION_MODIFIER';

---------------------------------------------------------
---------------------------------------------------------
--Sumeria
---------------------------------------------------------
---------------------------------------------------------

--First Civilization
UPDATE ModifierArguments
SET Value = 99
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_LEVY_DISCOUNT';

--goody huts not working, effect is only applied once, at beginning of game
/*
INSERT INTO DynamicModifiers (ModifierType, CollectionType, EffectType)
VALUES
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_1' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_IMPROVEMENT_GOODY_HUT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_2' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_IMPROVEMENT_GOODY_HUT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_3' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_IMPROVEMENT_GOODY_HUT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_4' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_IMPROVEMENT_GOODY_HUT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_5' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_IMPROVEMENT_GOODY_HUT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_6' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_IMPROVEMENT_GOODY_HUT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_7' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_IMPROVEMENT_GOODY_HUT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_8' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_IMPROVEMENT_GOODY_HUT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_9' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_IMPROVEMENT_GOODY_HUT');

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES
	('TRAIT_BARBARIAN_CAMP_GOODY_1' , 'MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_1'),
	('TRAIT_BARBARIAN_CAMP_GOODY_2' , 'MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_2'),
	('TRAIT_BARBARIAN_CAMP_GOODY_3' , 'MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_3'),
	('TRAIT_BARBARIAN_CAMP_GOODY_4' , 'MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_4'),
	('TRAIT_BARBARIAN_CAMP_GOODY_5' , 'MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_5'),
	('TRAIT_BARBARIAN_CAMP_GOODY_6' , 'MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_6'),
	('TRAIT_BARBARIAN_CAMP_GOODY_7' , 'MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_7'),
	('TRAIT_BARBARIAN_CAMP_GOODY_8' , 'MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_8'),
	('TRAIT_BARBARIAN_CAMP_GOODY_9' , 'MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_9');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES
	('TRAIT_BARBARIAN_CAMP_GOODY_1' , 'ImprovementType' , 'IMPROVEMENT_BARBARIAN_CAMP'),
	('TRAIT_BARBARIAN_CAMP_GOODY_2' , 'ImprovementType' , 'IMPROVEMENT_BARBARIAN_CAMP'),
	('TRAIT_BARBARIAN_CAMP_GOODY_3' , 'ImprovementType' , 'IMPROVEMENT_BARBARIAN_CAMP'),
	('TRAIT_BARBARIAN_CAMP_GOODY_4' , 'ImprovementType' , 'IMPROVEMENT_BARBARIAN_CAMP'),
	('TRAIT_BARBARIAN_CAMP_GOODY_5' , 'ImprovementType' , 'IMPROVEMENT_BARBARIAN_CAMP'),
	('TRAIT_BARBARIAN_CAMP_GOODY_6' , 'ImprovementType' , 'IMPROVEMENT_BARBARIAN_CAMP'),
	('TRAIT_BARBARIAN_CAMP_GOODY_7' , 'ImprovementType' , 'IMPROVEMENT_BARBARIAN_CAMP'),
	('TRAIT_BARBARIAN_CAMP_GOODY_8' , 'ImprovementType' , 'IMPROVEMENT_BARBARIAN_CAMP'),
	('TRAIT_BARBARIAN_CAMP_GOODY_9' , 'ImprovementType' , 'IMPROVEMENT_BARBARIAN_CAMP');

INSERT INTO Types (Type, Kind)
VALUES
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_1' , 'KIND_EFFECT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_2' , 'KIND_EFFECT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_3' , 'KIND_EFFECT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_4' , 'KIND_EFFECT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_5' , 'KIND_EFFECT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_6' , 'KIND_EFFECT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_7' , 'KIND_EFFECT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_8' , 'KIND_EFFECT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_9' , 'KIND_EFFECT'),
	('TRAIT_BARBARIAN_CAMP_GOODY_1' , 'KIND_TRAIT'),
	('TRAIT_BARBARIAN_CAMP_GOODY_2' , 'KIND_TRAIT'),
	('TRAIT_BARBARIAN_CAMP_GOODY_3' , 'KIND_TRAIT'),
	('TRAIT_BARBARIAN_CAMP_GOODY_4' , 'KIND_TRAIT'),
	('TRAIT_BARBARIAN_CAMP_GOODY_5' , 'KIND_TRAIT'),
	('TRAIT_BARBARIAN_CAMP_GOODY_6' , 'KIND_TRAIT'),
	('TRAIT_BARBARIAN_CAMP_GOODY_7' , 'KIND_TRAIT'),
	('TRAIT_BARBARIAN_CAMP_GOODY_8' , 'KIND_TRAIT'),
	('TRAIT_BARBARIAN_CAMP_GOODY_9' , 'KIND_TRAIT');

INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES
	('TRAIT_CIVILIZATION_FIRST_CIVILIZATION' , 'TRAIT_BARBARIAN_CAMP_GOODY_1'),
	('TRAIT_CIVILIZATION_FIRST_CIVILIZATION' , 'TRAIT_BARBARIAN_CAMP_GOODY_2'),
	('TRAIT_CIVILIZATION_FIRST_CIVILIZATION' , 'TRAIT_BARBARIAN_CAMP_GOODY_3'),
	('TRAIT_CIVILIZATION_FIRST_CIVILIZATION' , 'TRAIT_BARBARIAN_CAMP_GOODY_4'),
	('TRAIT_CIVILIZATION_FIRST_CIVILIZATION' , 'TRAIT_BARBARIAN_CAMP_GOODY_5'),
	('TRAIT_CIVILIZATION_FIRST_CIVILIZATION' , 'TRAIT_BARBARIAN_CAMP_GOODY_6'),
	('TRAIT_CIVILIZATION_FIRST_CIVILIZATION' , 'TRAIT_BARBARIAN_CAMP_GOODY_7'),
	('TRAIT_CIVILIZATION_FIRST_CIVILIZATION' , 'TRAIT_BARBARIAN_CAMP_GOODY_8'),
	('TRAIT_CIVILIZATION_FIRST_CIVILIZATION' , 'TRAIT_BARBARIAN_CAMP_GOODY_9');
*/

--ZIGGURAT
UPDATE Improvement_YieldChanges
SET YieldChange = 20
WHERE (YieldType = 'YIELD_SCIENCE'
AND ImprovementType = 'IMPROVEMENT_ZIGGURAT');

UPDATE Improvement_BonusYieldChanges
SET BonusYieldChange = 10
WHERE ImprovementType = 'IMPROVEMENT_ZIGGURAT';

UPDATE ModifierArguments
SET Value = 10
WHERE Name = 'Amount'
AND ModifierId = 'ZIGGURAT_RIVERADJACENCY_CULTURE';

--TRAIT_CIVILIZATION_UNIT_SUMERIAN_WAR_CART Rush early, so reduced cost for 10x the early rush
UPDATE Units
SET Cost = 5
WHERE UnitType = 'UNIT_SUMERIAN_WAR_CART';

--LEADER Gilgamesh
UPDATE ModifierArguments
SET Value = 50
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_ADJUST_JOINTWAR_EXPERIENCE';

---------------------------------------------------------
---------------------------------------------------------
--Other modifications
---------------------------------------------------------
---------------------------------------------------------

--10 blank civics for Germany and Greece
INSERT INTO Policies (PolicyType, Name, Description, PrereqCivic, GovernmentSlotType)
VALUES
    ('POLICY_BLANK_1', 'LOC_POLICY_BLANK_NAME', 'LOC_POLICY_BLANK_DESCRIPTION', 'CIVIC_CODE_OF_LAWS', 'SLOT_MILITARY' ),
    ('POLICY_BLANK_2', 'LOC_POLICY_BLANK_NAME', 'LOC_POLICY_BLANK_DESCRIPTION', 'CIVIC_CODE_OF_LAWS', 'SLOT_MILITARY' ),
    ('POLICY_BLANK_3', 'LOC_POLICY_BLANK_NAME', 'LOC_POLICY_BLANK_DESCRIPTION', 'CIVIC_CODE_OF_LAWS', 'SLOT_MILITARY' ),
    ('POLICY_BLANK_4', 'LOC_POLICY_BLANK_NAME', 'LOC_POLICY_BLANK_DESCRIPTION', 'CIVIC_CODE_OF_LAWS', 'SLOT_MILITARY' ),
    ('POLICY_BLANK_5', 'LOC_POLICY_BLANK_NAME', 'LOC_POLICY_BLANK_DESCRIPTION', 'CIVIC_CODE_OF_LAWS', 'SLOT_MILITARY' ),
    ('POLICY_BLANK_6', 'LOC_POLICY_BLANK_NAME', 'LOC_POLICY_BLANK_DESCRIPTION', 'CIVIC_CODE_OF_LAWS', 'SLOT_MILITARY' ),
    ('POLICY_BLANK_7', 'LOC_POLICY_BLANK_NAME', 'LOC_POLICY_BLANK_DESCRIPTION', 'CIVIC_CODE_OF_LAWS', 'SLOT_MILITARY' ),
    ('POLICY_BLANK_8', 'LOC_POLICY_BLANK_NAME', 'LOC_POLICY_BLANK_DESCRIPTION', 'CIVIC_CODE_OF_LAWS', 'SLOT_MILITARY' ),
    ('POLICY_BLANK_9', 'LOC_POLICY_BLANK_NAME', 'LOC_POLICY_BLANK_DESCRIPTION', 'CIVIC_CODE_OF_LAWS', 'SLOT_MILITARY' );
    
INSERT INTO Types (Type, Kind)
VALUES
    ('POLICY_BLANK_1', 'KIND_POLICY'),
    ('POLICY_BLANK_2', 'KIND_POLICY'),
    ('POLICY_BLANK_3', 'KIND_POLICY'),
    ('POLICY_BLANK_4', 'KIND_POLICY'),
    ('POLICY_BLANK_5', 'KIND_POLICY'),
    ('POLICY_BLANK_6', 'KIND_POLICY'),
    ('POLICY_BLANK_7', 'KIND_POLICY'),
    ('POLICY_BLANK_8', 'KIND_POLICY'),
    ('POLICY_BLANK_9', 'KIND_POLICY');
	

