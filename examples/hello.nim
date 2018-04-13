# simple example that opens a window and waits for quit
import sdl2
import "../sdlgpu"

let screen = sdlgpu.init(640, 360, GPU_DEFAULT_INIT_FLAGS)
var running = true
var e = defaultEvent

type MyStruct* = object
  foo*: bool

while running:
  
  while pollEvent(e):
    if e.kind == QuitEvent:
      running = false
  
  screen.clear()
  screen.flip()
  delay(40)

sdlgpu.quit()
