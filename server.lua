local items = {
    {color = "#C4C4C4", count = 1, item = 'snsmk2', chance = 300},
    {color = "#EBFA14", count = 3, item = 'case', chance = 70},
    {color = "#FF0000", count = 1, item = 'limitka', chance = 30},
    {color = "#1CFF9D", count = 100000, item = 'money', chance = 300},
    {color = "#1CFF9D", count = 50000, item = 'money', chance = 700},
    {color = "#EBFA14", count = 1, item = 'vipday', chance = 80},
    {color = "#EBFA14", count = 1, item = 'svipday', chance = 20},
    {color = "#FFA617", count = 1, item = 'revolvermk2', chance = 30},
    {color = "#C4C4C4", count = 1, item = 'mk2', chance = 300},
    {color = "#1CFF9D", count = 2500000, item = 'money', chance = 70},
    {color = "#1CFF9D", count = 1000000, item = 'money', chance = 150},
    {color = "#FFA617", count = 10, item = 'case', chance = 10},
    {color = "#FFA617", count = 1, item = 'vipmonth', chance = 5},
    {color = "#FF580A", count = 1, item = 'svipmonth', chance = 4},
    {color = "#FF0000", count = 1, item = 'sponsormonth', chance = 2},
    {color = "#EBFA14", count = 1, item = 'svipweek', chance = 11},
    {color = "#FF0000", count = 1, item = 'eliterank', chance = 5},
    {color = "#C4C4C4", count = 1, item = 'sns', chance = 200},
    {color = "#C4C4C4", count = 1, item = 'vintage', chance = 250},
    {color = "#FF0000", count = 1, item = 'micro', chance = 1},
    {color = "#FF580A", count = 1, item = 'p50', chance = 40},
    {color = "#C4C4C4", count = 100, item = 'pistol_ammo', chance = 100},
    {color = "#C4C4C4", count = 1, item = 'ceramic', chance = 150},
    {color = "#C4C4C4", count = 20, item = 'armor', chance = 200},
    {color = "#C4C4C4", count = 5, item = 'tlumik', chance = 100},
}

core_s.registerItem("case", function()
    local szanse = 0
    for _, item in ipairs(items) do
        szanse = szanse + item.chance
    end
    local michal =  0
    local selectedItem = nil
    for _, item in ipairs(items) do
        michal = michal + item.chance
        if math.random(1, szanse) <= michal then
            selectedItem = item
            break
        end
    end

    if selectedItem then
        core_s.additem(source, selectedItem.item, selectedItem.count)
        core_s.showNotification(source, "EKWIPUNEK", '+'.. selectedItem.count ..' '.. selectedItem.item)

        TriggerClientEvent('chat:addMessage', -1, '<span style="color:'.. selectedItem.color ..'">'.. GetPlayerName(source) .. ' wydropil ' .. selectedItem.item .. ' x' .. selectedItem.count .. '</span> <span style="color:#34eb80">https://sklep.kosmici.space</span>', '', '', '<span style="color:#34eb80">SKRZYNKI</span>', 0, 0, true)
    end
end)
