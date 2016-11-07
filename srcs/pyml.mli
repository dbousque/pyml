

exception Unknown_return_type of string
exception Wrong_Pytype
exception Could_not_create_pipe

type pycommunication

type pymodule

type pyref

type pyobj =
	Pystr of string
	| Pyint of int
	| Pylist of pyobj list
	| Pyfloat of float
	| Pybool of bool
	| Pybytes of Bytes.t
	| Pyref of pyref
	| Pynone

val get_module : pycommunication -> string -> pymodule

val pycall_raw : pycommunication -> string -> string -> pyobj list -> pyobj
val get : pymodule -> string -> pyobj list -> pyobj
val call : pymodule -> string -> pyobj list -> unit
val get_string : pymodule -> string -> pyobj list -> string
val get_int : pymodule -> string -> pyobj list -> int
val get_float : pymodule -> string -> pyobj list -> float
val get_list : pymodule -> string -> pyobj list -> pyobj list

val close : pycommunication -> unit
val init : ?exec:string -> ?ocamlfind:bool -> ?pymlpy_dirpath:string -> string -> pycommunication