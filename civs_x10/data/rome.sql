--Bath
UPDATE Districts SET Cost=1 WHERE DistrictType='DISTRICT_BATH';
UPDATE Districts SET Housing=20 WHERE DistrictType='DISTRICT_BATH';
UPDATE Districts SET Entertainment=10 WHERE DistrictType='DISTRICT_BATH';
--Legion
UPDATE Units SET Combat=76 WHERE UnitType='UNIT_ROMAN_LEGION';
UPDATE Units SET BuildCharges=10 WHERE UnitType='UNIT_ROMAN_LEGION';

--LOC_UNIT_ROMAN_LEGION_DESCRIPTION"
--TRAIT_FREE_ROADS_TO_CAPITAL BOOL
--TRAIT_FREE_TRADING_POSTS BOOL
UPDATE ModifierArguments SET Value=10 WHERE (Name='Amount' AND ModifierId='TRAIT_GOLD_FROM_DOMESTIC_TRADING_POSTS');

--TRAIT_ADJUST_NON_CAPITAL_FREE_CHEAPEST_BUILDING

UPDATE ModifierArguments Set Value=10 WHERE ModifierId='TRAIT_ADJUST_NON_CAPITAL_FREE_CHEAPEST_BUILDING';
