function slotsFront(a, b)
    for i = a, b do
        turtle.select(i)
        turtle.drop()
    end
end

function slotsDown(a, b)
    for i = a, b do
        turtle.select(i)
        turtle.dropDown()
    end
end

function currentFront()
    turlte.drop()
end

function currentDown()
    turlte.dropDown()
end