-----------------------------------
-- Ability: Maintenance
-- Cures your automaton of status ailments. Special items required
-- Obtained: Puppetmaster Level 30
-- Recast Time: 1:30
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/pets")
require("scripts/globals/msg");

local idStrengths = {
    [18731] = 1, -- Automaton Oil
    [18732] = 2, -- Automaton Oil + 1
    [18733] = 3, -- Automaton Oil + 2
    [19185] = 4  -- Automaton Oil + 3
}

function onAbilityCheck(player,target,ability)
    if not player:getPet() then
        return dsp.msg.basic.REQUIRES_A_PET, 0
    elseif not player:getPetID() or not (player:getPetID() >= 69 and player:getPetID() <= 72) then
        return dsp.msg.basic.NO_EFFECT_ON_PET, 0
    else
        local id = player:getEquipID(dsp.slot.AMMO)
        if idStrengths[id] then
            return 0, 0
        else
            return dsp.msg.basic.UNABLE_TO_USE_JA, 0
        end
    end
end

function onUseAbility(player,target,ability)
    local id = player:getEquipID(dsp.slot.AMMO)
    local pet = player:getPet()

    local function removeStatus()
        --if pet:delStatusEffect(dsp.effect.DOOM) then return true end
        if pet:delStatusEffect(dsp.effect.PETRIFICATION) then return true end
        --if pet:delStatusEffect(dsp.effect.LULLABY) then return true end
        --if pet:delStatusEffect(dsp.effect.SLEEP_II) then return true end
        --if pet:delStatusEffect(dsp.effect.SLEEP) then return true end
        if pet:delStatusEffect(dsp.effect.SILENCE) then return true end
        if pet:delStatusEffect(dsp.effect.BANE) then return true end
        if pet:delStatusEffect(dsp.effect.CURSE_II) then return true end
        if pet:delStatusEffect(dsp.effect.CURSE) then return true end
        if pet:delStatusEffect(dsp.effect.PARALYSIS) then return true end
        if pet:delStatusEffect(dsp.effect.PLAGUE) then return true end
        if pet:delStatusEffect(dsp.effect.POISON) then return true end
        if pet:delStatusEffect(dsp.effect.DISEASE) then return true end
        if pet:delStatusEffect(dsp.effect.BLINDNESS) then return true end
        if pet:eraseStatusEffect() ~= 255 then return true end
        return false
    end

    local toremove = idStrengths[id] or 1
    local removed = 0

    repeat
        if not removeStatus() then break end
        toremove = toremove - 1
        removed = removed + 1
    until (toremove <= 0)

    player:removeAmmo()

    return removed
end
