# scrollbar api resource
API Scroll Bar interativa em DX.

# Sobre
API Criada para utilizar em suas gridlists mais facilmente. Resource aberto para alterações e aplicações em seus resources ```client - side```.
Foi deixado 2 ```arquivos``` : `api-scrollbar.zip` e `scroll.lua`.

# Functions
  - [dxCreateScrollBar](https://github.com/ThigasDevelopment/scrollbar/blob/main/README.md#dxcreatescrollbar)
    - [Syntax](https://github.com/ThigasDevelopment/scrollbar/blob/main/README.md#syntax) 
    - [Example](https://github.com/ThigasDevelopment/scrollbar/blob/main/README.md#example) 
  - [dxDestroyScrollBar](https://github.com/ThigasDevelopment/scrollbar/blob/main/README.md#dxdestroyscrollbar)
    - [Syntax](https://github.com/ThigasDevelopment/scrollbar/blob/main/README.md#syntax-1) 
    - [Example](https://github.com/ThigasDevelopment/scrollbar/blob/main/README.md#example-1) 
  - [dxGetPropertiesScrollBar](https://github.com/ThigasDevelopment/scrollbar/blob/main/README.md#dxgetpropertiesscrollbar)
    - [Syntax](https://github.com/ThigasDevelopment/scrollbar/blob/main/README.md#syntax-2) 
    - [Example](https://github.com/ThigasDevelopment/scrollbar/blob/main/README.md#example-2)
  - [dxUpdateScrollBarOffset](https://github.com/ThigasDevelopment/scrollbar/blob/main/README.md#dxupdatescrollbaroffset)
    - [Syntax](https://github.com/ThigasDevelopment/scrollbar/blob/main/README.md#syntax-3) 
    - [Example](https://github.com/ThigasDevelopment/scrollbar/blob/main/README.md#example-3) 
  
# dxCreateScrollBar

### Syntax

```lua
drawing dxCreateScrollBar (identify, x, y, width, height, colors, value, postGUI)
```

### Example

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

### Syntax

```lua
bool dxDestroyScrollBar (identify)
```

### Example

```lua
local identify = "scroll:items"

addCommandHandler ("destroy", function ()
    return (dxDestroyScrollBar (identify) and print ("Scroll Bar destruida com sucesso.") or print ("Ocorreu um erro ao destruir a Scroll Bar."))
end)
```

# dxGetPropertiesScrollBar

### Syntax

```lua
table dxGetPropertiesScrollBar (identify)
```

### Example

```lua
local identify = "scroll:items"

addCommandHandler ("get", function ()
    local data = dxGetPropertiesScrollBar (identify)
    if data and type (data) == "table" and next (data) then
        iprint (data)
        return
    end
    print ("Não existe nenhuma Scroll Bar com esse nome.")
end)
```

# dxUpdateScrollBarOffset

### Syntax

```lua
bool dxUpdateScrollBarOffset (identify, value)
```

### Example

```lua
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

function scrollValues (button)
    local scrollData = dxGetPropertiesScrollBar (identify)
    if not scrollData then
        return false
    end
    local data = scrollData.actual
    if button == "mouse_wheel_up" and (data - 1) > 0 then
        data = data - 1
    elseif button == "mouse_wheel_down" and (data + 1) < (#texts - visibleValues) then
        data = data + 1
    end
    dxUpdateScrollBarOffset (identify, data)
end
bindKey ("mouse_wheel_up", "down", scrollValues)
bindKey ("mouse_wheel_down", "down", scrollValues)
```
