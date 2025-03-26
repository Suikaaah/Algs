type t = Underway | Done

val from_obj : Yojson.Safe.t -> t
val print_str : unit -> t -> string
val is_done : t -> bool
