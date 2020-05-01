ggsynth <- function(bitrate=44100)
{
  s = list()
  s$bitrate <- bitrate
  s$length <- 1
  s
}

ggvco <- function(s, shape, freq, length)
{
  v <- rep(1:s$bitrate * 2*pi * freq / s$bitrate, length)
  s$shape <- sapply(v, shape)
  s$length <- length
  s
}

ggvca <- function(s, volume) # volume can be scalar or vector
{
  s$shape <- s$shape * volume
  # normalize (in case volume > 1.0 (overdrive))
  ggclip(s)
}

ggclip <- function(s)
{
  s$shape[s$shape>1] <- 1
  s$shape[s$shape< -1] <- -1
  s
}

ggsawtooth <- function(x) x %% (2*pi) / (2*pi)

ggmix <- function(x, y)
{
  # assert that the bitrates of x and y match
  x$shape <- x$shape + y$shape
  ggclip(x)
}

ggplay <- function(s)
{
  require(audio)
  a <- audioSample(s$shape,rate=s$bitrate)
  play(a)
}
