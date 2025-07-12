--[[
    Task 2.1: Resource Management with 'to-be-closed'
    Uses Lua 5.4's <close> variables to safely handle file I/O for saving/loading high scores.
    This ensures files are closed even if an error occurs.
--]]

local HighScore = {}

function HighScore:save(score)
    local file <close> = io.open("highscore.txt", "w")
    if file then
        file:write(tostring(score))
    end
end

function HighScore:load()
    local file <close> = io.open("highscore.txt", "r")
    if file then
        local content = file:read("*a")
        return tonumber(content) or 0
    end
    return 0
end

return HighScore
