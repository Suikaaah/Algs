type t = Underway | Done [@@deriving yojson]

let print_str () = function Underway -> "[ ]" | Done -> "[✔]"
let is_done = function Underway -> false | Done -> true
