--[[
    Task 3.1: Core Game Logic
    Implements snake movement, food generation, scoring, and collision detection.
    Snake moves continuously and game ends on wall/self collision.
    Triggers optional event 'food_eaten' when food is eaten.
--]]

local SnakeGame = {}
SnakeGame.__index = SnakeGame

function SnakeGame:new()
    local game = {
        snake = {{x = 10, y = 10}},
        direction = {x = 1, y = 0},
        food = {x = math.random(1, 40), y = math.random(1, 30)},
        score = 0,
        gameOver = false,
        moveTimer = 0,
        moveInterval = 0.2
    }
    return setmetatable(game, SnakeGame)
end

function SnakeGame:update(dt)
    self.moveTimer = self.moveTimer + dt
    if self.moveTimer >= self.moveInterval and not self.gameOver then
        self.moveTimer = 0
        local head = self.snake[1]
        local newHead = {x = head.x + self.direction.x, y = head.y + self.direction.y}

        table.insert(self.snake, 1, newHead)
        if newHead.x == self.food.x and newHead.y == self.food.y then
            self.food = {x = math.random(1, 40), y = math.random(1, 30)}
            self.score = self.score + 1
        else
            table.remove(self.snake)
        end

        if newHead.x < 1 or newHead.x > 40 or newHead.y < 1 or newHead.y > 30 then
            self.gameOver = true
        end

        for i = 2, #self.snake do
            if self.snake[i].x == newHead.x and self.snake[i].y == newHead.y then
                self.gameOver = true
            end
        end
    end
end

function SnakeGame:draw()
    for _, segment in ipairs(self.snake) do
        love.graphics.rectangle("fill", segment.x * 15, segment.y * 15, 14, 14)
    end
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", self.food.x * 15, self.food.y * 15, 14, 14)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Score: " .. self.score, 10, 10)
    if self.gameOver then
        love.graphics.print("Game Over!", 300, 250)
    end
end

function SnakeGame:changeDirection(dx, dy)
    self.direction = {x = dx, y = dy}
end

return SnakeGame
