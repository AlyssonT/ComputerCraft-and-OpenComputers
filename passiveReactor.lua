local reactor = peripheral.wrap("bottom")
local redstoneBattery

function EstadoCaindo()
    reactor.setActive(false)

    redstoneBattery = redstone.getAnalogInput("left")
    while redstoneBattery>1 do
        sleep(5)
        redstoneBattery = redstone.getAnalogInput("left")
    end
end

function EstadoSubindo()
    reactor.setActive(true)

    redstoneBattery = redstone.getAnalogInput("left")
    while redstoneBattery<14 do
        sleep(5)
        redstoneBattery = redstone.getAnalogInput("left")
    end
end

print("Comecando")
while true do
    EstadoCaindo()
    EstadoSubindo()
end