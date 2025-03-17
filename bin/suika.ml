let extract_opt key obj = Yojson.Safe.Util.(member key obj |> to_string_option)
let extract key obj = extract_opt key obj |> Option.get
