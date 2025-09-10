local tokens = require("tokens")

local Scanner = {}

function Scanner:new(source)
    local o = {}
    setmetatable(o, self)
    self.__index = self

    o.source = source
    o.tokens = {}
    o.start = 1
    o.current = 1
    o.line = 1

    return o
end

function Scanner:scanTokens()
    while not self:isAtEnd() do
        self.start = self.current
        self:scanToken()
    end

    table.insert(self.tokens, { type = "EOF", lexeme = "", literal = nil, line = self.line })
    return self.tokens
end

function Scanner:isAtEnd()
    return self.current > #self.source
end

function Scanner:scanToken()
    local ch = self:advance()

    if ch == tokens.BANG then
        if self:match(tokens.EQUAL) then
            self:addToken(tokens.BANG_EQUAL)
        else
            self:addToken(tokens.BANG)
        end

    elseif ch == tokens.EQUAL then
        if self:match(tokens.EQUAL) then
            self:addToken(tokens.EQUAL_EQUAL)
        else
            self:addToken(tokens.EQUAL)
        end
     
    elseif ch == tokens.LESS then
        if self:match(tokens.EQUAL) then
            self:addToken(tokens.LESS_EQUAL)
        else
            self:addToken(tokens.LESS)
        end
    elseif ch == tokens.GREATER then
        if self:match(tokens.EQUAL) then
            self:addToken(tokens.GREATER_EQUAL)
        else
            self:addToken(tokens.GREATER)
        end
    elseif ch == tokens.SLASH then
        if self:match(tokens.SLASH) then
            while self:peek() ~= "\n" and not self:isAtEnd() do
                self:advance()
            end
        else
            self:addToken(tokens.SLASH)
        end
    elseif ch == " " or ch == "\r" or ch == "\t" then
        -- Ignore whitespace.
    elseif ch == "\n" then
        self.line = self.line + 1
    elseif ch == tokens.DOUBLE_QUOTE then
        self:string()
    elseif self:isDigit(ch) then
        self:number()
    elseif self:isAlpha(ch) then
        self:identifier()
    elseif tokens[ch] ~= nil then
        self:addToken(tokens[ch])
    else
        error("Unexpected character at line " .. self.line .. ": " .. ch)
    end
end

function Scanner:advance()
    local ch = self.source:sub(self.current, self.current)
    self.current = self.current + 1
    return ch
end

function Scanner:match(expected)
    if self:isAtEnd() then
        return false
    end
    if self.source:sub(self.current, self.current) ~= expected then
        return false
    end

    self.current = self.current + 1
    return true
end

function Scanner:peek()
    if self:isAtEnd() then
        return "\0"
    end
    return self.source:sub(self.current, self.current)
end

function Scanner:peekNext()
    if self.current + 1 > #self.source then
        return "\0"
    end
    return self.source:sub(self.current + 1, self.current + 1)
end

function Scanner:isDigit(ch)
    return ch >= "0" and ch <= "9"
end

function Scanner:string()
    while self:peek() ~= '"' and not self:isAtEnd() do
        if self:peek() == "\n" then
            self.line = self.line + 1
        end
        self:advance()
    end

    if self:isAtEnd() then
        error("Unterminated string at line " .. self.line)
    end

    self:advance()   -- The closing ".

    local value = self.source:sub(self.start + 1, self.current - 2)
    self:addToken("STRING", value)
end

function Scanner:addToken(type, literal)
    local text = self.source:sub(self.start, self.current - 1)
    table.insert(self.tokens, { type = type, lexeme = text, literal = literal, line = self.line })
end

function Scanner:isAlpha(ch)
    return (ch >= "a" and ch <= "z") or (ch >= "A" and ch <= "Z") or ch == "_"
end

function Scanner:isAlphaNumeric(ch)
    return self:isAlpha(ch) or self:isDigit(ch)
end

function Scanner:identifier()
    while self:isAlphaNumeric(self:peek()) do
        self:advance()
    end

    local text = self.source:sub(self.start, self.current - 1)
    local type = tokens.KEYWORDS[text] ~= nil and text or tokens.IDENTIFIER

    self:addToken(type)
end

return Scanner
