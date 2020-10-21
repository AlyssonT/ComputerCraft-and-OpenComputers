--Criado por Álysson Tormen - 26/07/2019

local component = require("component")
local redstone = component.redstone
local sides = require("sides")
local event = require("event")

local ligacaoGauge = sides.north        --aqui você irá colocar o lado em que o sinal de redstone do seu gauge esta ligado   ( do IO port! )
local ligacaoCompressores = sides.top   --aqui você ira colocar o lado em que o sinal de redstone que deligara os compressores sairá    ( do IO port! )
local ladoDesligar = sides.bottom       --aqui voce ira colocar o lado em que sera o botao de desligar  ( do IO port! )
local pressaoLimite = 5                 --aqui voce ira colocar o valor da pressao limite

while true do
    local _,_,where,_,after = event.pull("redstone")
    print("rodando")
    local pressureGauge = after/2.0
    if pressureGauge >= pressaoLimite and where==ligacaoGauge then
        redstone.setOutput(ligacaoCompressores, 15)

        else redstone.setOutput(ligacaoCompressores, 0)
    end

    if after~=0 and where==ladoDesligar then
        redstone.setOutput(ligacaoCompressores, 15)
        break
    end
end
