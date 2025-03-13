function settings:entry/add_page {\
    key:"mk:enchantments",\
    name:"Enchantments",\
    color:"#aa46ee",\
}

function settings:entry/add_setting {\
    page:"mk:enchantments",\
    key:"enchantments:veinmining/level",\
    name:"Vein Level",\
    description:"How aggresively the veinmining algorithm tries to search for ore",\
    default:"2",\
    display:"enum",\
    type:"enum",\
}
function settings:entry/add_setting {\
    page:"mk:enchantments",\
    key:"enchantments:veinmining/crouch",\
    name:"Veinmining",\
    description:"The behavour of veinmining when crouched",\
    default:"0",\
    display:"enum",\
    type:"enum",\
}
function settings:entry/add_setting {\
    page:"mk:enchantments",\
    key:"enchantments:quarry/crouch",\
    name:"Quarry",\
    description:"The behavour of quarry when crouched",\
    default:"0",\
    display:"enum",\
    type:"enum",\
}
function settings:entry/add_setting {\
    page:"mk:enchantments",\
    key:"enchantments:excavation/crouch",\
    name:"Excavation",\
    description:"The behavour of excavation when crouched",\
    default:"0",\
    display:"enum",\
    type:"enum",\
}
function settings:entry/add_setting {\
    page:"mk:enchantments",\
    key:"enchantments:displacement/safety",\
    name:"Displacement",\
    description:"Whether Curse of Displacement will avoid fluids",\
    default:"0b",\
    display:"enum",\
    type:"boolean",\
}

function settings:entry/add_enum {\
    key:"enchantments:veinmining/level",\
    value:[\
        "§2Face",\
        "§6Edge",\
        "§4Corner",\
    ],\
}
function settings:entry/add_enum {\
    key:"enchantments:veinmining/crouch",\
    value:[\
        "§8Nothing",\
        "§2Required",\
        "§4Inverted",\
    ],\
}
function settings:entry/add_enum {\
    key:"enchantments:quarry/crouch",\
    value:[\
        "§8Nothing",\
        "§2Required",\
        "§4Inverted",\
    ],\
}
function settings:entry/add_enum {\
    key:"enchantments:excavation/crouch",\
    value:[\
        "§8Nothing",\
        "§2Required",\
        "§4Inverted",\
    ],\
}
function settings:entry/add_enum {\
    key:"enchantments:displacement/safety",\
    value:[\
        "§2Safe",\
        "§4Unsafe",\
    ],\
}