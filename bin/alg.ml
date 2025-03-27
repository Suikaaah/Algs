open Ppx_yojson_conv_lib.Yojson_conv.Primitives

type t = { name : string; description : string option; status : Status.t }
[@@deriving yojson]

let print out { name; description; status } =
  let open Printf in
  fprintf out "%s"
    (match description with
    | Some x -> sprintf "%a %s (%s)" Status.print_str status name x
    | None -> sprintf "%a %s" Status.print_str status name)

let is_done { status; _ } = Status.is_done status
