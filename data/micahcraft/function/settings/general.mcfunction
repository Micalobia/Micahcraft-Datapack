function settings:entry/add_namespace {\
    key:"mk_general",\
    display:{text:"General", color:"#c0c0ff"},\
}

function settings:entry/add_setting {\
    namespace:"mk_general",\
    type:"boolean",\
    key:"mk_day_counter_enabled",\
    data:{\
        display:{text:"Day Counter"},\
        default:true,\
    }\
}

function settings:entry/add_setting {\
    namespace:"mk_general",\
    type:"boolean",\
    key:"mk_day_counter_sound",\
    data:{\
        display:{text:"Day Counter Sound"},\
        default:true,\
    }\
}