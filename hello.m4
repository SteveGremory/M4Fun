define(`linux')
ifdef(`linux', `define(SAY_HELLO,print("Hello, world!"))' )

define(ADD, `eval($1 + $2)')
define(POW, `eval($1 ** $2)')
define(CMP, `ifelse($1, $2, $3, $4)')

define(SAY, `print($1)')
define(SAY_C, ``printf($1)'')

define(SAY_GOODBYE, print("Goodbye, Faggots."))
define(SAY_HELLO_C, ``printf("Hello, world!\n")'')

define(PRE_CALL_C, import pathlib
import ctypes)

define(CALL_C, libname = pathlib.Path().absolute() / "lib$1.so"
c_lib = ctypes.CDLL(libname)
result = c_lib.$2()
)

include(`main.py')

