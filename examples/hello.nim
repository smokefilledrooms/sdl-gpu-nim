import sdl2
import "../sdlgpu"
# simple example that opens a window and waits for quit

var screen = GPU_Init(640, 360, GPU_DEFAULT_INIT_FLAGS)
var running = true
var e = defaultEvent

while running:
  
  while pollEvent(e):
    if e.kind == QuitEvent:
      running = false
  
  GPU_Clear(screen)   # preferred syntax would be screen.clear() once I fix the bindings names
  GPU_Flip(screen)
  delay(40)

GPU_Quit()
