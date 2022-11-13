# SonificationExperiment1
This patch is an audio visual generator in which attributes of both generated audio and visuals are used to modulate one another.

See the below link for the patch in action. Be sure to watch the volume, some frequencies may be a little shrill. 

https://www.youtube.com/watch?v=TR0TaRREaag


Having experimented with the Pen class in SuperCollider prior to constructing this patch, it seemed logical to continue exploring the visual capabilities of SC. The idea for this patch is to use values initially programmed to control the visual aspects of the Pen class in a musical way (this is essentially a form of sonification).    

As there were a great number of steps involved (some of which are present in the final Sonification patch) I only included some key stages of development for clarity. For example, the patch named "Basic Cube" is one of the main starting points for the Pen class visuals in the final patch. As you can see, the visuals were originally constructed from a Cube that has been drawn using the Pen class. This cube has then been deconstructed, rotated and modulated in a variety of ways using various algorithmic functions. This results in what looks like a series of 3 circles rotating around one another (one for each dimension of the cube).

\\
The SynthDef consists of;

1 x Envelope (EnvGen.kr(Env.perc())

1 x Phase Modulation Oscillator (PMOsc.ar)

2 x Exponential Lines (1 XLine in the carrier frequency argument of the PMOsc and another in the index argument of the PMOsc)

1 x Reverb (FreeVerb.ar)
//

Below is a rundown of which parameters are being modulated by which aspects of the visuals.

\\
ENVELOPE MODULATIONS.

The envelope attack time is modulated by the horizontal width of the pattern and the envelope release time is modulated by the master time of the whole patch. 

PHASE MODULATION OSCILLATOR MODULATIONS.

This is where it gets a little complicated. The end point of the XLine in the carrier frequency argument and the start point of the XLine in the index argument are both modulated by the vertical screen placement of the image.

Similarly the start point of the XLine in the carrier frequency argument and the end point of the XLine in the index argument are both modulated by the last two arguments in the Pen matrix.

The duration times of the XLines are modulated by the master time of the whole patch.

The modulator frequency is modulated by the horizontal screen placement of the image.

The modulator phase is modulated by the radius of the middle circle. 

REVERB MODULATIONS.

The reverb room size is modulated by the third argument of the Pen matrix and the reverb HF damp argument is modulated by the vertical width of the whole pattern.
//

The modulators were chosen according to which values matched the input values of specific parameters most effectively. As the patch is entirely randomised, the result will differ every time the code is evaluated. I find that there are some very desirable sounds emerging in almost every evaluation, although it can sometimes be difficult to perceive the relationship between audio and visual interaction. Maybe this is something for me to try and improve on if I was to further my explorations.

What really interests me is that the patch seems to accelerate exponentially as it progresses. I have no idea why!     
