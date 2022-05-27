module Generator = struct
  open QCheck

  type 'output job_result = [%import: 'output Current_web_pipelines.State.job_result]
  [@@deriving qcheck]

  type 'output job = [%import: 'output Current_web_pipelines.State.job]
  [@@deriving qcheck]

  let gen_name = Gen.(oneofl Corpus.muppets)

  let gen_colour = Gen.(oneofl Corpus.colours)
end

let () =
  let suite =
    List.map QCheck_alcotest.to_alcotest
      [ ]
  in
  Alcotest.run "current-web-pipelines" [ ("suite", suite) ]
