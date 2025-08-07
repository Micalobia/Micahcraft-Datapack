$data modify storage micahcraft:dialog root.actions append value {\
    label: {\
        text: "Copy Current Location",\
        color: "#dfc0ff",\
        bold: true,\
        shadow_color: [0.25, 0, 0.5, 0.8]\
    },\
    action: {\
        type: "copy_to_clipboard",\
        value: "$(x) $(y) $(z)"\
    }\
}