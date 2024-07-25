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
    key:"hud.saturation",\
    name:"Saturation",\
    page:"hud",\
    description:"Whether or not to show the saturation when using the HUD command",\
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
    key:"hud.phantom",\
    name:"Phantoms",\
    page:"hud",\
    description:"Whether or not to show if phantoms can spawn on you when using the HUD command",\
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
    formatter:"micahcraft:settings/format/hud_theme",\
    change:"micahcraft:settings/change/hud_theme",\
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