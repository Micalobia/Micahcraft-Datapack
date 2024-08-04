$fill ~ ~ ~ ~ ~ ~ light[level=$(level),waterlogged=false] replace #air
$fill ~ ~ ~ ~ ~ ~ light[level=$(level),waterlogged=false] replace light[waterlogged=false]
$fill ~ ~ ~ ~ ~ ~ light[level=$(level),waterlogged=true] replace water[level=0]
$fill ~ ~ ~ ~ ~ ~ light[level=$(level),waterlogged=true] replace light[waterlogged=true]
fill ~ ~ ~ ~ ~ ~ air replace light[level=0,waterlogged=false]
fill ~ ~ ~ ~ ~ ~ water replace light[level=0,waterlogged=true]