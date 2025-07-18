import lib.tea;
import lib.std;
import lib.math;

%%%
def PML_eval(s):
	try:
		return str(round(eval(s),4))
	except ZeroDivisionError:
		return "error: division by zero"
%%%;
let eval : String -> String;

type State = String;

let init = "";
let tstart = time();

let tick : Event -> State -> State;
let tick e s = case e
	| BtnPressed x -> s+x
	| _ -> forceUpdate s;

let mkBtn w n t =
	let pos = @(n-4*int (n/4), 4-int (n/4)) ° w;
	Btn t t pos @(w*.9,w*.9);

let btnLayout = concat [
	[ "C" , "B", "P" ]
];

let view : State -> Widget;
let view s =
	let w = width/5;
	let btns = Many (imap (mkBtn w) btnLayout);
	let inp = Btn s "inp" @(0,w*5) @(w*4,w);
	Many [inp, btns, Rect @((time ()-tstart)*10,0) @(300,300) BLUE];

setTick init tick view



