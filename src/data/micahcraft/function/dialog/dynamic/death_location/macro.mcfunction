$data modify storage micahcraft:dialog root.actions append value {\
    label: {\
        text: "Copy Death Location",\
        color: "#eac0c0",\
        bold: true,\
        shadow_color: [0.33, 0, 0, 0.8]\
    },\
    action: {\
        type: "copy_to_clipboard",\
        value: "$(x) $(y) $(z)"\
    }\
}