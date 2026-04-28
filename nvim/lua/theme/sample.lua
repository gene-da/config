-- Metatable wizardry: prototype-based "class"
local Entity = {}
Entity.__index = Entity

function Entity:new(name)
  return setmetatable({
    name = name or 'unknown',
    energy = math.random(50, 100),
  }, self)
end

function Entity:__tostring()
  return ('<Entity %s | energy=%d>'):format(self.name, self.energy)
end

-- Closure factory (stateful function)
local function energy_decay(rate)
  return function(e)
    e.energy = math.max(0, e.energy - rate)
    return e.energy
  end
end

-- Functional-style map
local function map(tbl, fn)
  local out = {}
  for i, v in ipairs(tbl) do
    out[i] = fn(v)
  end
  return out
end

-- Coroutine generator (lazy sequence)
local function countdown(n)
  return coroutine.wrap(function()
    for i = n, 1, -1 do
      coroutine.yield(i)
    end
  end)
end

-- Pattern matching flex
local function parse_kv(str)
  local t = {}
  for k, v in str:gmatch '(%w+)%s*=%s*(%w+)' do
    t[k] = v
  end
  return t
end

-- Metatable operator overloading
local Vector = {}
Vector.__index = Vector

function Vector:new(x, y)
  return setmetatable({ x = x, y = y }, self)
end

function Vector.__add(a, b)
  return Vector:new(a.x + b.x, a.y + b.y)
end

function Vector:__tostring()
  return ('(%0.2f, %0.2f)'):format(self.x, self.y)
end

-- Demo
math.randomseed(os.time())

local e1 = Entity:new 'alpha'
local e2 = Entity:new 'beta'

local decay = energy_decay(7)

print(e1)
print(e2)

-- apply closure
decay(e1)
decay(e2)

print('After decay:', e1, e2)

-- functional map
local energies = map({ e1, e2 }, function(e)
  return e.energy
end)
print('Energy snapshot:', table.concat(energies, ', '))

-- coroutine usage
print 'Countdown:'
for i in countdown(5) do
  io.write(i .. ' ')
end
print()

-- pattern parsing
local config = parse_kv 'mode=fast retries=3 debug=true'
for k, v in pairs(config) do
  print(k, v)
end

-- operator overloading
local v1 = Vector:new(1, 2)
local v2 = Vector:new(3, 4)
local v3 = v1 + v2

print('Vector result:', v3)
