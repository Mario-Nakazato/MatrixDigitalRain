utf8 = require "utf8"

local function simbolo(x, y, velocidade, primeiro, brilho) -- Construtor
    local atributos = {
        x = x,
        y = y,
        valor,
        velocidade = velocidade,
        intervalo = love.math.random() / 2,
        tempo = 0,
        primeiro = primeiro,
        brilho = brilho

    }

    local metodos = {}

    function metodos:setSimboloAleatorio()
        if math.random() < 0.16 then
            atributos.valor = math.random(0, 9)
        else
            atributos.valor = utf8.char(12448 + math.random(0, 96))
        end
    end

    function metodos:desenhar()
        if atributos.primeiro or atributos.brilho then
            love.graphics.setColor(love.math.colorFromBytes(180, 255, 180))
        else
            love.graphics.setColor(love.math.colorFromBytes(0, 255, 70))
        end
        love.graphics.print(atributos.valor, atributos.x, atributos.y)
    end

    function metodos:chuva(dt)
        if atributos.y > lt then
            atributos.y = -tamanho
        else
            atributos.y = atributos.y + atributos.velocidade * dt
        end

        atributos.tempo = atributos.tempo + dt
        if atributos.intervalo <= atributos.tempo then
            atributos.tempo = 0
            self:setSimboloAleatorio()
        end
    end

    return metodos
end

local function sequencia_simbolos(x)
    local atributos = {
        simbolos = {},
        total = math.random(4, math.floor(lt / tamanho) - 1),
        velocidade = math.random() * lt / 2 + 128,
    }

    primeiro = math.random(1, 4) == 1

    y = math.random(-lt, -tamanho)

    for i = 1, atributos.total do
        brilho = math.random(1, 8) == 1 and not primeiro
        sim = simbolo(x, y, atributos.velocidade, primeiro, brilho)
        sim:setSimboloAleatorio()
        table.insert(atributos.simbolos, sim)
        y = y - tamanho
        primeiro = false
    end

    local metodos = {}

    function metodos:desenhar()
        for c, v in pairs(atributos.simbolos) do
            v:desenhar()
        end
    end

    function metodos:chuva(dt)
        for c, v in pairs(atributos.simbolos) do
            v:chuva(dt)
        end
    end

    return metodos
end

local function instanciar(ct, lt, tamanho)
    local atributos = {
        ct = ct,
        lt = lt,
        tamanho = tamanho,
        tsims = {}
    }

    for i = 0, atributos.ct, atributos.tamanho do
        table.insert(atributos.tsims, sequencia_simbolos(i))
    end

    local metodos = {}

    function metodos:update(dt)
        for _, v in pairs(atributos.tsims) do
            v:chuva(dt)
        end
    end

    function metodos:draw()
        for _, v in pairs(atributos.tsims) do
            v:desenhar()
        end
    end

    return metodos
end

matrix = {

    instanciar = instanciar,

}

return matrix
