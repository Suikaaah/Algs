type t = Underway | Done

val yojson_of_t : t -> Yojson.Safe.t
val t_of_yojson : Yojson.Safe.t -> t
val print_str : unit -> t -> string
val is_done : t -> bool
