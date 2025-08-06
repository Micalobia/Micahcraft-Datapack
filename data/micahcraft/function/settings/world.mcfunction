function settings:entry/add_namespace {\
    key:"mk_world",\
    display:{text:"World",color:"dark_green"},\
}

function settings:entry/add_setting {\
    namespace:"mk_world",\
    type:"boolean",\
    key:"mk_world_trim_particles_enabled",\
    data:{\
        display:{text:"Show Trim Particles"},\
        default:true,\
    }\
}

function settings:entry/add_setting {\
    namespace:"mk_world",\
    type:"boolean",\
    key:"mk_world_trim_particles_self",\
    data:{\
        display:{text:"Show Trim Particles to yourself"},\
        default:true,\
    }\
}

function settings:entry/add_setting {\
    namespace:"mk_world",\
    type:"boolean",\
    key:"mk_world_drop_head",\
    data:{\
        display:{text:"Drop your head when killed by player"},\
        default:true,\
    }\
}