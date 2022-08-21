# scrollbar api resource
API Scroll Bar interativa em DX.

# Sobre
API Criada para utilizar em suas gridlists mais facilmente. Resource aberto para alterações e aplicações em seus resources ```client - side```.

# Functions
  - [dxCreateScrollBar](https://github.com/ThigasDevelopment/scrollbar/blob/main/README.md#dxcreatescrollbar)
    - [Syntax]() 
    - [Example]() 
  - [dxDestroyScrollBar](https://github.com/ThigasDevelopment/scrollbar/blob/main/README.md#dxdestroyscrollbar)
  
# dxCreateScrollBar

Syntax

```lua
drawing dxCreateScrollBar (identify, x, y, width, height, colors, value, postGUI)
```

Example

```lua
local screen = Vector2 (guiGetScreenSize ())

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
    dxCreateScrollBar ("scroll:items", offsetX, offsetY, 15, 150, 25, {using = {155, 155, 155, 255}, scroll = {255, 255, 255, 255}, background = {31, 31, 31, 255}}, (#texts - visibleValues) + 1, false)
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
```

# dxDestroyScrollBar

Syntax

```lua
bool dxDestroyScrollBar (identify)
```

Example

```lua
addCommandHandler ("destroy", function ()
    return (dxDestroyScrollBar ("scroll:items") and print ("Scroll Bar destruida com sucesso.") or print ("Ocorreu um erro ao destruir a Scroll Bar."))
end)
```
