function settings:entry/add_page {\
    key:"mk:general",\
    name:"General",\
    color:"dark_gray",\
}

function settings:entry/add_setting {\
    page:"mk:general",\
    key:"day_counter:enabled",\
    name:"Day Counter",\
    description:"Whether or not to show the day counter at the start of every day",\
    default:"1b",\
    display:"on_off",\
    type:"boolean",\
}

function settings:entry/add_setting {\
    page:"mk:general",\
    key:"day_counter:sound",\
    name:"Counter Sound",\
    description:"Whether or not to to play a sound when the day counter is shown",\
    default:"1b",\
    display:"yes_no",\
    type:"boolean",\
}