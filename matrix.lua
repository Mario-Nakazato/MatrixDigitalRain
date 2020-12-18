utf8 = require "utf8"

local function simbolo(x, y, velocidade, primeiro, brilho) -- Construtor
  
  local atributos = {
    
    x = x,
    y = y,
    valor,
    velocidade = velocidade,
    intervalo = love.math.random() /2,
    tempo = 0,
    primeiro = primeiro,
    brilho = brilho
    
  }
  
  local metodos = {}
  
  function metodos:setSimboloAleatorio()
    
    if math.random() < 0.16 then
      atributos.valor = math.random(0, 9)
    else
      atributos.valor = utf8.char(12448 +math.random(0, 96))
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
      atributos.y = -tamanho +atributos.velocidade *dt
    else
      atributos.y = atributos.y +atributos.velocidade *dt
    end
    
    atributos.tempo = atributos.tempo +dt
    if atributos.intervalo <= atributos.tempo then
      atributos.tempo = 0
      self:setSimboloAleatorio()
    end
    
  end
  
  return metodos

end

local function simbolos()
  
  local obj = {
    simbolos = {},
    total = math.random(4, math.floor(lt /tamanho) -1),
    velocidade = math.random() *lt /2 +128,
  }
  
  function obj:gerar(x)
    
    primeiro = math.random(1, 4) == 1
    
    y = math.random(-lt, -tamanho)
    
    for i = 1, self.total do
      brilho = math.random(1, 8) == 1 and not primeiro
      sim = simbolo(x, y, self.velocidade, primeiro, brilho)
      sim:setSimboloAleatorio()
      table.insert(self.simbolos, sim)
      y = y -tamanho
      primeiro = false
      
    end
    
  end
  
  function obj:desenhar()
    
    for c, v in pairs(self.simbolos) do
      
      v:desenhar()
      
    end
    
  end
  
  function obj:chuva(dt)
    
    for c, v in pairs(self.simbolos) do
      
      v:chuva(dt)
      
    end
    
  end
  
  return obj
  
end

matrix = {
  
  simbolos = simbolos,
  
}

return matrix