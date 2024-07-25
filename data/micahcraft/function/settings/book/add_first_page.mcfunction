data modify storage micahcraft:settings page set value \
[\
    {"text":"Settings"},\
    {"storage":"micahcraft:misc","nbt":"newline"},\
    {"text":"==================="},\
    {"storage":"micahcraft:misc","nbt":"newline"},\
    {"storage":"micahcraft:misc","nbt":"newline"},\
]
function micahcraft:util/loop {nbt:"storage micahcraft:settings setup.pages.info",function:"micahcraft:settings/__private/generate_page_line"}
data modify storage micahcraft:settings book append from storage micahcraft:settings page