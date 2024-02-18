package gen0d

import "core:strings"

import zd "0d/odin"
import "0d/odin/std"

main :: proc() {
    arg, main_container_name, diagram_names := std.parse_command_line_args ()
    palette := std.initialize_component_palette (diagram_names, components_to_include_in_project)
    std.run (&palette, arg, main_container_name, diagram_names, start_function)
}

start_function :: proc (arg: string, main_container : ^zd.Eh) {
    filename := zd.new_datum_string (arg)
    msg := zd.make_message("", filename, zd.make_cause (main_container, nil) )
    main_container.handler(main_container, msg)
}


components_to_include_in_project :: proc (leaves: ^[dynamic]zd.Leaf_Template) {
    zd.append_leaf (leaves, std.string_constant ("<br>package generated<br>import \"core:fmt\"<br>import \"0d/odin/0d\"<br><br>"))

    zd.append_leaf (leaves, std.string_constant ("<br>generated_components_to_include_in_project :: proc (leaves: ^[dynamic]zd.Leaf_Template) {"))
    zd.append_leaf (leaves, std.string_constant ("}"))

    zd.append_leaf (leaves, std.string_constant ("null.js"))

    zd.append_leaf (leaves, zd.Leaf_Template { name = "br2nl", instantiate = br2nl })
    zd.append_leaf (leaves, zd.Leaf_Template { name = "rmBrackets", instantiate = rmBrackets })

    zd.append_leaf (leaves, std.string_constant ("stripHTML"))
    zd.append_leaf (leaves, std.string_constant ("stripHTML.ohm"))
    zd.append_leaf (leaves, std.string_constant ("stripHTML.rwr"))

    zd.append_leaf (leaves, std.string_constant ("encodejson"))
    zd.append_leaf (leaves, std.string_constant ("encodejson.ohm"))
    zd.append_leaf (leaves, std.string_constant ("encodejson.rwr"))
    zd.append_leaf (leaves, std.string_constant ("decode"))
    zd.append_leaf (leaves, std.string_constant ("decode.ohm"))
    zd.append_leaf (leaves, std.string_constant ("decode.rwr"))

    zd.append_leaf (leaves, std.string_constant ("namesandcode"))
    zd.append_leaf (leaves, std.string_constant ("namesandcode.ohm"))
    zd.append_leaf (leaves, std.string_constant ("namesandcode.rwr"))
    zd.append_leaf (leaves, std.string_constant ("namesandcodesupport.js"))

    zd.append_leaf (leaves, std.string_constant ("delconn"))
    zd.append_leaf (leaves, std.string_constant ("delconn.ohm"))
    zd.append_leaf (leaves, std.string_constant ("delconn.rwr"))

    zd.append_leaf (leaves, std.string_constant ("extractcodespecs"))
    zd.append_leaf (leaves, std.string_constant ("extractcodespecs.ohm"))
    zd.append_leaf (leaves, std.string_constant ("extractcodespecs.rwr"))

    zd.append_leaf (leaves, std.string_constant ("codesnippets"))
    zd.append_leaf (leaves, std.string_constant ("codesnippets.ohm"))
    zd.append_leaf (leaves, std.string_constant ("genprocs.rwr"))

    zd.append_leaf (leaves, std.string_constant ("rmHTML"))
    zd.append_leaf (leaves, std.string_constant ("rmHTML.ohm"))
    zd.append_leaf (leaves, std.string_constant ("rmHTML.rwr"))


}

br2nl :: proc(name: string, owner : ^zd.Eh) -> ^zd.Eh {
    handler :: proc (eh: ^zd.Eh, msg: ^zd.Message) {
	s := msg.datum.repr (msg.datum)
	r, _ := strings.replace_all (s, "<br>", "\n")
        zd.send (eh=eh, port="", datum=zd.new_datum_string (r), causingMessage=msg)
    }
    name_with_id := zd.gensym("br2nl")
    return zd.make_leaf (name_with_id, owner, nil, handler)
}

rmBrackets :: proc(name: string, owner : ^zd.Eh) -> ^zd.Eh {
    handler :: proc (eh: ^zd.Eh, msg: ^zd.Message) {
	s := msg.datum.repr (msg.datum)
	r0, _ := strings.replace_all (s, "⟪", "")
	r, _ := strings.replace_all (r0, "⟫", "")
        zd.send (eh=eh, port="", datum=zd.new_datum_string (r), causingMessage=msg)
    }
    name_with_id := zd.gensym("br2nl")
    return zd.make_leaf (name_with_id, owner, nil, handler)
}


