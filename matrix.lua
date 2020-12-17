utf8 = require "utf8"

local function simbolo(x, y, velocidade, primeiro, brilho) -- Construtor
  
  local obj = {
    x = x,
    y = y,
    valor,
    velocidade = velocidade,
    intervalo = love.math.random() /2,
    tempo = 0,
    primeiro = primeiro,
    brilho = brilho
  }
  
  function obj:setSimboloAleatorio()
    
    if math.random() < 0.16 then
      self.valor = math.random(0, 9)
    else
      self.valor = utf8.char(12448 +math.random(0, 96))
    end
    
  end
  
  function obj:desenhar()
    
    if self.primeiro or self.brilho then
      love.graphics.setColor(love.math.colorFromBytes(180, 255, 180))
    else
      love.graphics.setColor(love.math.colorFromBytes(0, 255, 70))
    end
    love.graphics.print(self.valor, self.x, self.y)
    
  end
  
  function obj:chuva(dt)
    
    if self.y > lt then
      self.y = -tamanho +self.velocidade *dt
    else
      self.y = self.y +self.velocidade *dt
    end
    
    self.tempo = self.tempo +dt
    if self.intervalo <= self.tempo then
      self.tempo = 0
      self:setSimboloAleatorio()
    end
    
  end
  
  return obj

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
  
  simbolo = simbolo,
  simbolos = simbolos,
  
}

return matrix