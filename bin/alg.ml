type t = { name : string; description : string option; status : Status.t }

let from_obj obj =
  {
    name = Suika.extract "name" obj;
    description = Suika.extract_opt "description" obj;
    status = Status.from_obj obj;
  }

let print out { name; description; status } =
  let open Printf in
  fprintf out "%s"
    (match description with
    | Some x -> sprintf "%a %s (%s)" Status.print_str status name x
    | None -> sprintf "%a %s" Status.print_str status name)

let is_done { status; _ } = Status.is_done status
