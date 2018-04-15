sdl-gpu-nim
-----------

Nim bindings for the [SDL_gpu](https://github.com/grimfang4/sdl-gpu) hardware-accelerated 2D rendering library.

To be used alongside the official Nim [sdl2](https://github.com/nim-lang/sdl2) bindings.

```nim
let screen = sdlgpu.init(640, 360, GPU_DEFAULT_INIT_FLAGS)
screen.circle(200, 200, 50, color(255,0,0,255))
screen.flip()
delay(1000)
sdlgpu.quit()
```