--"TRAIT_CIVILIZATION_NKISI"
UPDATE ModifierArguments SET Value=1000 WHERE (Name='Amount' AND ModifierId='TRAIT_DOUBLE_WRITER_POINTS');
UPDATE ModifierArguments SET Value=1000 WHERE (Name='Amount' AND ModifierId='TRAIT_DOUBLE_ARTIST_POINTS');
UPDATE ModifierArguments SET Value=1000 WHERE (Name='Amount' AND ModifierId='TRAIT_DOUBLE_MUSICIAN_POINTS');
UPDATE ModifierArguments SET Value=1000 WHERE (Name='Amount' AND ModifierId='TRAIT_DOUBLE_MERCHANT_POINTS');

UPDATE 
        ModifierArguments 
SET    
        Value=20 
WHERE  
        Name='Amount' 
AND 
        ModifierId='TRAIT_GREAT_WORK_FOOD_SCULPTURE';


UPDATE 
        ModifierArguments 
SET 
        Value=20 
WHERE 
        Name='Amount' 
AND 
        ModifierId='TRAIT_GREAT_WORK_PRODUCTION_SCULPTURE';

UPDATE 
ModifierArguments 
SET Value=40 
WHERE 
Name='Amount' 
AND 
ModifierId='TRAIT_GREAT_WORK_GOLD_SCULPTURE';

UPDATE 
ModifierArguments 
SET 
    Value=20 
WHERE 
Name='Amount' 
AND ModifierId='TRAIT_GREAT_WORK_FOOD_ARTIFACT');

UPDATE ModifierArguments SET Value=20 WHERE (Name='Amount' AND ModifierId='TRAIT_GREAT_WORK_PRODUCTION_ARTIFACT');
UPDATE ModifierArguments SET Value=20 WHERE (Name='Amount' AND ModifierId='TRAIT_GREAT_WORK_FOOD_RELIC');


--"TRAIT_CIVILIZATION_MBANZA"
UPDATE Districts SET Cost=1 WHERE DistrictType='DISTRICT_MBANZA';
--UPDATE Districts SET Housing=50 WHERE DistrictType='DISTRICT_MBANZA';
UPDATE ModifierArguments SET Value=20 WHERE (Name='Amount' AND ModifierId='MBANZA_FOOD');
UPDATE ModifierArguments SET Value=40 WHERE (Name='Amount' AND ModifierId='MBANZA_GOLD');


--"TRAIT_CIVILIZATION_UNIT_KONGO_SHIELD_BEARER" NOT sure, if 10 Movement work like that
--UPDATE ModifierArguments SET Value=10 WHERE (Name='Ignore' AND ModifierId='NAGAO_FOREST_MOVEMENT');
UPDATE ModifierArguments SET Value=100 WHERE ModifierId='NAGAO_RANGED_DEFENSE';

--TRAIT_LEADER_RELIGIOUS_CONVERT
--"TRAIT_FREE_APOSTLE_FINISH_MBANZA" MULTIPLE APOSTES?
--"TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT"
--"TRAIT_GAINS_FOUNDER_BELIEF_MAJORITY_RELIGION" BOOL
