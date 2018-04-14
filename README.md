**!! Note, the bindings over at [Vladar4/sdl2_nim](https://github.com/Vladar4/sdl2_nim) are better documented and more cohesive.** These bindings may still be useful if you are using the official Nim [sdl2](https://github.com/nim-lang/sdl2) bindings.

sdl-gpu-nim
-----------

Nim bindings for the [SDL_gpu](https://github.com/grimfang4/sdl-gpu) hardware-accelerated 2D rendering library.

```nim
let screen = sdlgpu.init(640, 360, GPU_DEFAULT_INIT_FLAGS)
screen.circle(200, 200, 50, color(255,0,0,255))
screen.flip()
delay(1000)
sdlgpu.quit()
```