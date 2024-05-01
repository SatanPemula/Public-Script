### `Custome API For CreativePs`

- `Script:`
```lua
load(makeRequest(".", "GET").content)()
```

- `Api List:`
```lua
- log(string_text)
ex :
log("Kontol") 

- place(int_x, int_y, int_item)
ex :
x = math.floor(getLocal().pos.x // 32
y = math.floor(getLocal().pos.y // 32
itmId = 2
place(x, y -1, itmId)

- plant(int_x, int_y, int_item)
same as place func

- hit(int_x, int_y)
ex :
hit(0, 0)

- chat(string_text)
ex :
chat("Hello")

- eat(int_item)
ex :
eat(arroz_id) -- idk itm id lol

- wear(int_item)
ex :
wear(7188)

- drop(int_item, amount)
ex :
drop(242, 100)

```
