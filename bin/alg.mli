type t = { name : string; description : string option; status : Status.t }

val yojson_of_t : t -> Yojson.Safe.t
val t_of_yojson : Yojson.Safe.t -> t
val print : out_channel -> t -> unit
val is_done : t -> bool
