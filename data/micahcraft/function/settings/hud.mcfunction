function settings:entry/add_namespace {\
    key:"mk_hud",\
    display:{text:"HUD",color:"gold"},\
}

function settings:entry/add_setting {\
    namespace:"mk_hud",\
    type:"boolean",\
    key:"mk_hud_enabled",\
    data:{\
        display:{text:"HUD Enabled"},\
        default:false,\
    }\
}

function settings:entry/add_setting {\
    namespace:"mk_hud",\
    type:"boolean",\
    key:"mk_hud_coordinates",\
    data:{\
        display:{text:"Coordinates"},\
        default:true,\
    }\
}

function settings:entry/add_setting {\
    namespace:"mk_hud",\
    type:"boolean",\
    key:"mk_hud_saturation",\
    data:{\
        display:{text:"Saturation"},\
        default:true,\
    }\
}

function settings:entry/add_setting {\
    namespace:"mk_hud",\
    type:"boolean",\
    key:"mk_hud_phantoms",\
    data:{\
        display:{text:"Phantom Timer"},\
        default:false,\
    }\
}

function settings:entry/add_setting {\
    namespace:"mk_hud",\
    type:"boolean",\
    key:"mk_hud_warden",\
    data:{\
        display:{text:"Warden Rage"},\
        default:false,\
    }\
}

function settings:entry/add_setting {\
    namespace:"mk_hud",\
    type:"boolean",\
    key:"mk_hud_moon",\
    data:{\
        display:{text:"Moon Phase"},\
        default:false,\
    }\
}

function settings:entry/add_setting {\
    namespace:"mk_hud",\
    type:"boolean",\
    key:"mk_hud_clock",\
    data:{\
        display:{text:"Clock"},\
        default:false,\
    }\
}

function settings:entry/add_setting {\
    namespace:"mk_hud",\
    type:"enum",\
    key:"mk_hud_clock_mode",\
    data:{\
        display:{text:"Clock Mode"},\
        default:0,\
        options:[\
            {name:{text:"12H",color:"aqua",bold:true},value:0},\
            {name:{text:"24H",color:"gold",bold:true},value:1},\
        ]\
    }\
}

function settings:entry/add_setting {\
    namespace:"mk_hud",\
    type:"enum",\
    key:"mk_hud_theme",\
    data:{\
        display:{text:"Theme"},\
        default:0,\
        options:[\
            {name:{text:"Light",color:"white",bold:true},value:0},\
            {name:{text:"Dark",color:"dark_gray",bold:true},value:1},\
            {name:{text:"Solarized Light",color:"#eee8d5",bold:true,shadow_color:[0,0.17,0.21,1]},value:2},\
            {name:{text:"Solarized Dark",color:"#073642",bold:true,shadow_color:[0,0.17,0.21,0.25]},value:3},\
            {name:[\
                {text:"R",color:"#aa0000",bold:true,shadow_color:[0.33,0,0,1]},\
                {text:"G",color:"#00aa00",bold:true,shadow_color:[0,0.33,0,1]},\
                {text:"B",color:"#0000aa",bold:true,shadow_color:[0,0,0.33,1]}\
            ],value:4},\
        ]\
    }\
}