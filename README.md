# Multiplier
The multiplier is designed by repeated addition method and style followed while designing is datapath and controller design.

In the datapath and controller design, the complex designs are divided into two parts :
1. Datapath
2. Controller

Datapath consists	of	the	functional	units	where	all	computations	are	carried	out. 
It consists	of	registers,	multiplexers,	bus,	adders,	multipliers,	counters,	andother	functional	blocks.	

Control	Path implements	a	finite-state	machine	and	provides control signals to	the	data path	in proper sequence.	
In	response to	the	control	signals, various	operations are	carried	out	by	the	data path.
It also	takes	inputs	from	the	data	path	regarding	various	status	information.

# Schematic
![sche](https://user-images.githubusercontent.com/99884583/224472176-f223e20e-3b7d-4d33-8d48-2892f1091ec4.png)
![sche](https://user-images.githubusercontent.com/99884583/224472119-869144f1-6a2b-43a3-b619-70c4dfa42f00.png)

In the above schematic the functional blocks like pipo1, pipo2, counter, adder, comparator etc are designed in the datapath block.
The control signals like clk, lda, ldb, ldp, clrp, decb were given through controller path design.
The signal eqz is a status signal given by datapath block to the controller block.

# Output
![output](https://user-images.githubusercontent.com/99884583/224472214-c3e9fe32-e7cb-4060-8b5a-4291a2e1493b.png)

