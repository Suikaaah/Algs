type t = Underway | Done

val from_obj : Yojson.Safe.t -> t
val print_str : unit -> t -> string
