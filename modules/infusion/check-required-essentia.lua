-- Import section

local component = require("component")

--

local function exec(pattern)
    local essentiaInNetwork = component.me_interface.getEssentiaInNetwork()
    -- Searches for each essentia in the pattern
    for patternName, patternAmount in pairs(pattern.essentia) do
        local found = false
        -- Checks all essentia in the network
        for _, essentia in ipairs(essentiaInNetwork) do
            if string.match(essentia.label, "(%w+)") == patternName then
                if patternAmount <= essentia.amount then
                    found = true
                end
                break
            end
        end

        if not found then
            return false
        end
    end

    return true
end

return exec