local reactor = peripheral.wrap("bottom")
local energy

function estadoCaindo()
    reactor.setActive(false)
    
    energy = reactor.battery() .stored()
    while energy>1 do
        sleep(5)
        energy = reactor.battery().stored()
    end
end               

function estadoSubindo()
    reactor.setActive(true)
    
    energy = reactor.battery().stored()
    while energy<8300000 do
        sleep(5)
        energy = reactor.battery().stored()
    end
end

print("Comecando")
while true do
    estadoCaindo()
    estadoSubindo()
end
        
    

