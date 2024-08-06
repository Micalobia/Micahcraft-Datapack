data remove storage micahcraft:settings setup
data remove storage micahcraft:settings users.default

function micahcraft:settings/add_page {\
    page:"general",\
    name:"General",\
    color:"dark_gray",\
}
function micahcraft:settings/add_page {\
    page:"hud",\
    name:"HUD",\
    color:"gold",\
}
function micahcraft:settings/add_page {\
    page:"world",\
    name:"World",\
    color:"dark_green",\
}
function micahcraft:settings/add_page {\
    page:"enchantments",\
    name:"Enchantments",\
    color:"light_purple",\
}


function micahcraft:settings/add_setting {\
    key:"day_counter.enabled",\
    name:"Day Counter",\
    page:"general",\
    description:"Whether or not to show the day counter at the start of every day",\
    default:"1b",\
    formatter:"micahcraft:settings/format/boolean",\
    change:"micahcraft:settings/change/boolean",\
}
function micahcraft:settings/add_setting {\
    key:"day_counter.sound",\
    name:"Counter Sound",\
    page:"general",\
    description:"Whether or not to play a sound when the day counter is shown",\
    default:"1b",\
    formatter:"micahcraft:settings/format/boolean",\
    change:"micahcraft:settings/change/boolean",\
}
function micahcraft:settings/add_setting {\
    key:"hud.coords",\
    name:"Coords",\
    page:"hud",\
    description:"Whether or not to show the coordinates when using the HUD command",\
    default:"1b",\
    formatter:"micahcraft:settings/format/boolean",\
    change:"micahcraft:settings/change/boolean",\
}
function micahcraft:settings/add_setting {\
    key:"hud.saturation",\
    name:"Saturation",\
    page:"hud",\
    description:"Whether or not to show the saturation when using the HUD command",\
    default:"1b",\
    formatter:"micahcraft:settings/format/boolean",\
    change:"micahcraft:settings/change/boolean",\
}
function micahcraft:settings/add_setting {\
    key:"hud.phantom",\
    name:"Phantoms",\
    page:"hud",\
    description:"Whether or not to show if phantoms can spawn on you when using the HUD command",\
    default:"0b",\
    formatter:"micahcraft:settings/format/boolean",\
    change:"micahcraft:settings/change/boolean",\
}
function micahcraft:settings/add_setting {\
    key:"hud.moon",\
    name:"Moon Phase",\
    page:"hud",\
    description:"Whether or not to show the moon phase when using the HUD command",\
    default:"0b",\
    formatter:"micahcraft:settings/format/boolean",\
    change:"micahcraft:settings/change/boolean",\
}
function micahcraft:settings/add_setting {\
    key:"hud.clock.enabled",\
    name:"Clock",\
    page:"hud",\
    description:"Whether or not to show the clock when using the HUD command",\
    default:"0b",\
    formatter:"micahcraft:settings/format/boolean",\
    change:"micahcraft:settings/change/boolean",\
}
function micahcraft:settings/add_setting {\
    key:"hud.clock.mode",\
    name:"24H Clock",\
    page:"hud",\
    description:"Whether or not the clock is in 24 hour mode or not",\
    default:"0b",\
    formatter:"micahcraft:settings/format/boolean",\
    change:"micahcraft:settings/change/boolean",\
}
function micahcraft:settings/add_setting {\
    key:"hud.theme",\
    name:"Theme",\
    page:"hud",\
    description:"Changes what the colors for the HUD are",\
    default:'0',\
    formatter:"micahcraft:settings/format/enum",\
    change:"micahcraft:settings/change/enum",\
}
function micahcraft:settings/add_setting {\
    key:"trim_particles.show",\
    name:"Trim Particles",\
    page:"world",\
    description:"Whether or not to show particles around yourself when certain trim materials are worn",\
    default:"1b",\
    formatter:"micahcraft:settings/format/boolean",\
    change:"micahcraft:settings/change/boolean",\
}
function micahcraft:settings/add_setting {\
    key:"trim_particles.show_self",\
    name:"Self Particles",\
    page:"world",\
    description:"Whether or not to show particles made by your own trims to yourself",\
    default:"1b",\
    formatter:"micahcraft:settings/format/boolean",\
    change:"micahcraft:settings/change/boolean",\
}
function micahcraft:settings/add_setting {\
    key:"player.drop_head",\
    name:"Drop Head",\
    page:"world",\
    description:"Whether or not to drop your player head when you're killed by another player",\
    default:"1b",\
    formatter:"micahcraft:settings/format/boolean",\
    change:"micahcraft:settings/change/player_head",\
}
function micahcraft:settings/add_setting {\
    key:"enchantments.veinmining.level",\
    name:"Vein Level",\
    page:"enchantments",\
    description:"How aggresively the veinmining algorithm tries to search for ore",\
    default:"0",\
    formatter:"micahcraft:settings/format/enum",\
    change:"micahcraft:settings/change/enum",\
}
function micahcraft:settings/add_setting {\
    key:"enchantments.veinmining.crouch",\
    name:"Veinmining",\
    page:"enchantments",\
    description:"The behavior of veinmining when crouched",\
    default:"0",\
    formatter:"micahcraft:settings/format/enum",\
    change:"micahcraft:settings/change/enum",\
}
function micahcraft:settings/add_setting {\
    key:"enchantments.quarry.crouch",\
    name:"Quarry",\
    page:"enchantments",\
    description:"The behavior of quarry when crouched",\
    default:"0",\
    formatter:"micahcraft:settings/format/enum",\
    change:"micahcraft:settings/change/enum",\
}
function micahcraft:settings/add_setting {\
    key:"enchantments.excavation.crouch",\
    name:"Excavation",\
    page:"enchantments",\
    description:"The behavior of excavation when crouched",\
    default:"0",\
    formatter:"micahcraft:settings/format/enum",\
    change:"micahcraft:settings/change/enum",\
}
function micahcraft:settings/add_setting {\
    key:"enchantments.displacement.safety",\
    name:"Displacement",\
    page:"enchantments",\
    description:"Whether Curse of Displacement will avoid fluids",\
    default:"0b",\
    formatter:"micahcraft:settings/format/enum",\
    change:"micahcraft:settings/change/boolean",\
}

data modify storage micahcraft:settings enums.'hud.theme' set value [\
    "§7Light",\
    "§8Dark",\
    "§9Solar Light",\
    "§1Solar Dark",\
    "§cR§aG§9B",\
]

data modify storage micahcraft:settings enums.'enchantments.veinmining.level' set value [\
    "§2Face",\
    "§6Edge",\
    "§4Corner",\
]

data modify storage micahcraft:settings enums.'enchantments.veinmining.crouch' set value [\
    "§8Nothing",\
    "§2Required",\
    "§4Inverted",\
]

data modify storage micahcraft:settings enums.'enchantments.quarry.crouch' set value [\
    "§8Nothing",\
    "§2Required",\
    "§4Inverted",\
]

data modify storage micahcraft:settings enums.'enchantments.excavation.crouch' set value [\
    "§8Nothing",\
    "§2Required",\
    "§4Inverted",\
]

data modify storage micahcraft:settings enums.'enchantments.displacement.safety' set value [\
    "§2Safe",\
    "§4Unsafe",\
]