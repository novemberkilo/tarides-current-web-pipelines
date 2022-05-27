module Generator = struct
  open QCheck

  type job_result = [%import: State.job_result]
  [@@deriving qcheck]
end

let () =
  let suite =
    List.map QCheck_alcotest.to_alcotest
      [ ]
  in
  Alcotest.run "current-web-pipelines" [ ("suite", suite) ]