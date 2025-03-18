type status = Underway | Done
type t = status

val from_obj : Yojson.Safe.t -> t
val print_str : unit -> t -> string
