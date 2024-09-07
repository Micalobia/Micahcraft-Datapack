function settings:entry/add_page {\
    key:"mk:hud",\
    name:"HUD",\
    color:"gold",\
}

function settings:entry/add_setting {\
    page:"mk:hud",\
    key:"hud:coords",\
    name:"Coords",\
    description:"Whether or not to show the day counter at the start of every day",\
    default:"1b",\
    display:"yes_no",\
    type:"boolean",\
}
function settings:entry/add_setting {\
    page:"mk:hud",\
    key:"hud:saturation",\
    name:"Saturation",\
    description:"Whether or not to show the saturation when using the HUD command",\
    default:"1b",\
    display:"yes_no",\
    type:"boolean",\
}
function settings:entry/add_setting {\
    page:"mk:hud",\
    key:"hud:phantom",\
    name:"Phantoms",\
    description:"Whether or not to show if phantoms can spawn on you when using the HUD command",\
    default:"0b",\
    display:"yes_no",\
    type:"boolean",\
}
function settings:entry/add_setting {\
    page:"mk:hud",\
    key:"hud:moon",\
    name:"Moon Phase",\
    description:"Whether or not to show the moon phase when using the HUD command",\
    default:"0b",\
    display:"yes_no",\
    type:"boolean",\
}
function settings:entry/add_setting {\
    page:"mk:hud",\
    key:"hud:clock",\
    name:"Clock",\
    description:"Whether or not to show the clock when using the HUD command",\
    default:"0b",\
    display:"yes_no",\
    type:"boolean",\
}
function settings:entry/add_setting {\
    page:"mk:hud",\
    key:"hud:clock/mode",\
    name:"Clock Mode",\
    description:"How to display the clock when it is enabled",\
    default:"0b",\
    display:"enum",\
    type:"boolean",\
}
function settings:entry/add_setting {\
    page:"mk:hud",\
    key:"hud:theme",\
    name:"Theme",\
    description:"Changes what the colors for the HUD are",\
    default:"0",\
    display:"enum",\
    type:"enum",\
}

function settings:entry/add_enum {\
    key:"hud:clock/mode",\
    value:["§912H","§624H"],\
}

function settings:entry/add_enum {\
    key:"hud:theme",\
    value:[\
        "§7Light",\
        "§8Dark",\
        "§9Solar Light",\
        "§1Solar Dark",\
        "§cR§aG§9B",\
    ],\
}