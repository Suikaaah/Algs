open Printf

type status = Underway | Done
type alg = { name : string; description : string option; status : status }

exception Invalid_string

module Status : sig
  type t = status

  val from_obj : Yojson.Safe.t -> t
  val print_str : unit -> t -> string
end = struct
  type t = status

  let from_obj obj =
    Suika.extract "status" obj |> function
    | "Underway" -> Underway
    | "Done" -> Done
    | _ -> raise Invalid_string

  let print_str () = function Underway -> "[ ]" | Done -> "[✔]"
end

module Alg : sig
  type t = alg

  val from_obj : Yojson.Safe.t -> t
  val print : out_channel -> t -> unit
end = struct
  type t = alg

  let from_obj obj =
    {
      name = Suika.extract "name" obj;
      description = Suika.extract_opt "description" obj;
      status = Status.from_obj obj;
    }

  let print out { name; description; status } =
    fprintf out "%s"
      (match description with
      | Some x -> sprintf "%a %s (%s)" Status.print_str status name x
      | None -> sprintf "%a %s" Status.print_str status name)
end

let read_algs filename =
  Yojson.Safe.from_file filename
  |> Yojson.Safe.Util.to_list |> List.map Alg.from_obj

let () =
  let algs = read_algs "oll.json" in
  let algs_done = List.filter (fun alg -> alg.status = Done) algs in
  let count, count_done = (List.length algs, List.length algs_done) in
  let percent = 100. *. float count_done /. float count in
  List.iter (printf "%a\n" Alg.print) algs;
  printf "%i/%i (%f%%)" count_done count percent
