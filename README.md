# co34pt_LiveCode - Files for my live coding setup

Here you can find all of the files required to run my Live Coding setup, including samples, setup files and the resulting code from gigs and rehearsals. This is an attempt to make aspects of my live coding practice open for deconstruction by others and help others learn a bit about live coding in SuperCollider, which has a whole host of different techniques, not all of which are common knowledge or easy to discover.

This repo contains code I use for SuperCollider and SuperDirt, howeverI mostly use SuperCollider, so the code for SuperDirt will be updated much more slowly

## Setup files

In the folder 'Setup/SuperCollider' you can find my setupfile for SuperCollider, in order to run any code found in the 'gigs' or 'rehearsals' folder you will need to run this setup.scd file. This file:

- Increases memory allocation
- Increases Buffer allocation
- Boots server and proxyspace
- Loads all samples in 'Sample' folder 
- Loads SynthDefs
- Starts SuperDirt 
- Activates StageLimiter

The optional requirements for StageLimiter and SuperDirt are:

- SuperCollider 3.6.6, preferably 3.7
- SuperDirt quark
- BatLib quark (for StageLimiter)

There are instructions in the setupfile on how to use it without these components

### SuperDirt & Tidal

I've also included some files to get SuperDirt running in Emacs. Currently my setup is using my Setupfile to get SuperDirt running using the setupfile and then using it from inside of Atom, but I do intend to update the Emacs setup eventually.

For more details about SuperDirt and Tidal in general go here: 
- https://github.com/musikinformatik/SuperDirt
- http://tidal.lurk.org/getting\_started.html
