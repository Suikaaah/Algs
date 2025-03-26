type t = { name : string; description : string option; status : Status.t }

val from_obj : Yojson.Safe.t -> t
val print : out_channel -> t -> unit
val is_done : t -> bool
