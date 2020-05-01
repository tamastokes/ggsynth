# ggsynth
A simple synthetizer library in R (currently not) with a ggplot2-like syntax, primarily for prototyping and educational purposes.

## Prerequisites
* R
* "audio" package

## Usage
### Some examples
```
ggplay(ggmix(ggvca(ggvco(ggsynth(), sin, 220, 1),0.5),ggvca(ggvco(ggsynth(), ggsawtooth, 880, 1),0.5)))

ggplay(ggvca(ggvco(ggsynth(), sin, 440, 1),seq(0,1,0.01)))

```
