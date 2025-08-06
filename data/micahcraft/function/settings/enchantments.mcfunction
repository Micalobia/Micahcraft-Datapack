function settings:entry/add_namespace {\
    key:"mk_enchantments",\
    display:{text:"Enchantments",color:"dark_purple"},\
}

function settings:entry/add_setting {\
    namespace:"mk_enchantments",\
    type:"enum",\
    key:"mk_enchantments_veinmining_level",\
    data:{\
        display:{text:"Veinmine Strength"},\
        default:1,\
        options:[\
            {name:{text:"Face",color:"dark_green",bold:true},value:0},\
            {name:{text:"Edge",color:"gold",bold:true},value:1},\
            {name:{text:"Corner",color:"dark_red",bold:true},value:2}\
        ]\
    }\
}

function settings:entry/add_setting {\
    namespace:"mk_enchantments",\
    type:"enum",\
    key:"mk_enchantments_veinmining_crouch",\
    data:{\
        display:{text:"Veinmine Crouch"},\
        default:0,\
        options:[\
            {name:{text:"Nothing",color:"white",bold:true},value:0},\
            {name:{text:"Required",color:"dark_green",bold:true},value:1},\
            {name:{text:"Inverted",color:"red",bold:true},value:2}\
        ]\
    }\
}

function settings:entry/add_setting {\
    namespace:"mk_enchantments",\
    type:"enum",\
    key:"mk_enchantments_quarry_crouch",\
    data:{\
        display:{text:"Quarry Crouch"},\
        default:0,\
        options:[\
            {name:{text:"Nothing",color:"white",bold:true},value:0},\
            {name:{text:"Required",color:"dark_green",bold:true},value:1},\
            {name:{text:"Inverted",color:"red",bold:true},value:2}\
        ]\
    }\
}

function settings:entry/add_setting {\
    namespace:"mk_enchantments",\
    type:"enum",\
    key:"mk_enchantments_excavation_crouch",\
    data:{\
        display:{text:"Excavation Crouch"},\
        default:0,\
        options:[\
            {name:{text:"Nothing",color:"white",bold:true},value:0},\
            {name:{text:"Required",color:"dark_green",bold:true},value:1},\
            {name:{text:"Inverted",color:"red",bold:true},value:2}\
        ]\
    }\
}

function settings:entry/add_setting {\
    namespace:"mk_enchantments",\
    type:"boolean",\
    key:"mk_enchantments_displacement_safety",\
    data:{\
        display:{text:"Displacement Safety"},\
        default:true\
    }\
}