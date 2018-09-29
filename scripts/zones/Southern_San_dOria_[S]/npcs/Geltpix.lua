-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Geltpix
-- @zone 80
-- !pos 154 -2 103
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc, 7043); -- Don't hurt poor Geltpix! Geltpix's just a merchant from Boodlix's Emporium in Jeuno. Kingdom vendors don't like gil, but Boodlix knows true value of new money.
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;