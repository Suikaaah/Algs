type t = Underway | Done

let from_obj obj =
  let exception Invalid_string in
  Suika.extract "status" obj |> function
  | "Underway" -> Underway
  | "Done" -> Done
  | _ -> raise Invalid_string

let print_str () = function Underway -> "[ ]" | Done -> "[✔]"
