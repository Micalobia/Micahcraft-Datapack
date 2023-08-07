data remove storage blockstate:data read.candles
execute if block ~ ~ ~ #blockstate:candles[candles=1] run data modify storage blockstate:data read.candles set value 1
execute if block ~ ~ ~ #blockstate:candles[candles=2] run data modify storage blockstate:data read.candles set value 2
execute if block ~ ~ ~ #blockstate:candles[candles=3] run data modify storage blockstate:data read.candles set value 3
execute if block ~ ~ ~ #blockstate:candles[candles=4] run data modify storage blockstate:data read.candles set value 4