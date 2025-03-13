function settings:entry/add_page {\
    key:"mk:world",\
    name:"World",\
    color:"dark_green",\
}

function settings:entry/add_setting {\
    page:"mk:world",\
    key:"trim:particles/enabled",\
    name:"Trim Particles",\
    description:"Whether or not particles will surround your player when certain trims are worn",\
    default:"1b",\
    display:"on_off",\
    type:"boolean",\
}
function settings:entry/add_setting {\
    page:"mk:world",\
    key:"trim:particles/self",\
    name:"Self Particles",\
    description:"Whether or not particles surrounding your player when certain trims are worn will show to yourself",\
    default:"1b",\
    display:"yes_no",\
    type:"boolean",\
}
function settings:entry/add_setting {\
    page:"mk:world",\
    key:"player:drop_head",\
    name:"Drop Head",\
    description:"Whether or not you will drop your own player head when you are killed by another player",\
    default:"1b",\
    display:"yes_no",\
    type:"boolean",\
}