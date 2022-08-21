local screen = Vector2 (guiGetScreenSize ())

local identify = "scroll:items"
local texts = {
    "Texto";
    "Texto";
    "Texto";
    "Texto";
    "Texto";
    "Texto";
    "Texto";
    "Texto";
    "Texto";
    "Texto";
}

local visibleValues = 5;

local offsetX, offsetY = (screen.x - 15) / 2, (screen.y - 150) / 2

addEventHandler ("onClientRender", getRootElement (), function ()
    dxCreateScrollBar (identify, offsetX, offsetY, 15, 150, 25, {using = {155, 155, 155, 255}, scroll = {255, 255, 255, 255}, background = {31, 31, 31, 255}}, (#texts - visibleValues) + 1, false)
    
    local scrollData = dxGetPropertiesScrollBar ("scroll:items")
    if scrollData and type (scrollData) == "table" and next (scrollData) then
        local data = scrollData.actual
        for i = 0, visibleValues - 1 do
            local values = texts[i + data]
            if values then
                dxDrawText (values.." "..(i + data), offsetX - 200, offsetY + (i * 25), 50, 50)
            end
        end
    end
end)

function scrollValues (button)
    local scrollData = dxGetPropertiesScrollBar (identify)
    if not scrollData then
        return false
    end
    local data = scrollData.actual
    if button == "mouse_wheel_up" and (data - 1) > 0 then
        data = data - 1
    elseif button == "mouse_wheel_down" and (data + 1) < #texts then
        data = data + 1
    end
    dxUpdateScrollBarOffset (identify, data)
end
bindKey ("mouse_wheel_up", "down", scrollValues)
bindKey ("mouse_wheel_down", "down", scrollValues)
