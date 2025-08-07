$data modify storage micahcraft:dialog root.actions append value {\
    label: {\
        text: "Copy $(dimension) Location",\
        color: "#eac0ea",\
        bold: true,\
        shadow_color: [0.33, 0, 0.33, 0.8],\
    },\
    action: {\
        type: "copy_to_clipboard",\
        value: "$(x) ~ $(z)"\
    }\
}