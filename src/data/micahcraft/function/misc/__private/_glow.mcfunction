$execute if block ~ ~ ~ #air run setblock ~ ~ ~ light[level=$(level),waterlogged=false] strict
$execute if block ~ ~ ~ light[waterlogged=false] run setblock ~ ~ ~ light[level=$(level),waterlogged=false] strict
$execute if block ~ ~ ~ water[level=0] unless block ~ ~ ~ bubble_column run setblock ~ ~ ~ light[level=$(level),waterlogged=true] strict
$execute if block ~ ~ ~ light[waterlogged=true] unless block ~ ~ ~ bubble_column run setblock ~ ~ ~ light[level=$(level),waterlogged=true] strict
execute if block ~ ~ ~ light[level=0,waterlogged=false] run setblock ~ ~ ~ air strict
execute if block ~ ~ ~ light[level=0,waterlogged=true] run setblock ~ ~ ~ water strict