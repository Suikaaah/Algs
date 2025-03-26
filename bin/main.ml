let read_algs filename =
  Yojson.Safe.from_file filename
  |> Yojson.Safe.Util.to_list |> List.map Alg.from_obj

let () =
  let algs = read_algs "oll.json" in
  let algs_done = List.filter Alg.is_done algs in
  let count, count_done = (List.length algs, List.length algs_done) in
  let percent = 100. *. float count_done /. float count in
  let open Printf in
  List.iter (printf "%a\n" Alg.print) algs;
  printf "%i/%i (%f%%)\n" count_done count percent
