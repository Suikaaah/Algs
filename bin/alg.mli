type alg = { name : string; description : string option; status : Status.t }
type t = alg

val from_obj : Yojson.Safe.t -> t
val print : out_channel -> t -> unit
