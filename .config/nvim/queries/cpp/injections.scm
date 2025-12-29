; Injection for protobuf/textproto in any R"pb(...)pb" or R"proto(...)proto" literals

; (
;   (raw_string_literal
;     delimiter: (raw_string_delimiter) @delimiter
;     (raw_string_content) @injection.content  ; Match the UNNAMED raw_string_content node
;   )
;
;
;
;   (#eq? @delimiter "pb")
;   (#set! injection.language "textproto")
; )


;; This file defines syntax injections for the C++ tree-sitter parser.
;; It targets 'raw_string_content' only when a sibling 'raw_string_delimiter'
;; has the text "pb" (Protobuf).

; (
;   ;; 1. Target the raw_string_content node. This will be the injection site.
;   (raw_string_content @injection.content
;
;     ;; 2. Match a sibling/child 'raw_string_delimiter' node within the parent
;     ;;    'raw_string_literal' and capture its text as @delimiter.
;     ;;    (Note: Since 'raw_string_delimiter' is a child of the parent
;     ;;    'raw_string_literal', and the target is a sibling, this structure works.)
;     (raw_string_delimiter @delimiter)
;
;     ;; 3. Predicate: Check if the text of the captured delimiter node is exactly "pb".
;     (#eq? @delimiter "pb")
;
;     ;; 4. Command: Specify the 'proto' language to inject.
;     (#set! injection.language "proto")
;   )
; )
;
;
(raw_string_literal
  delimiter: (raw_string_delimiter) @delimiter
  (raw_string_content) @content
  ; --- Predicates go at the end ---
  (#eq? @delimiter "pb")
  (#set! injection.language "proto")
  (#set! injection.include-children)
)
