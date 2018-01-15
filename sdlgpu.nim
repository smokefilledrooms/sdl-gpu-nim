when defined(Windows):
  const libName* = "libSDL2_gpu.dll"
elif defined(Linux):
  const libName* = "libSDL2_gpu.so"
elif defined(MacOsX):
  const libName* = "libSDL2_gpu.dylib"
      
      
import sdl2 


type
    SDL_Color = sdl2.Color
##  Use SDL's DLL defines

#import
 # begin_code

##  Compile-time versions

const
  SDL_GPU_VERSION_MAJOR* = 0
  SDL_GPU_VERSION_MINOR* = 11
  SDL_GPU_VERSION_PATCH* = 0

##  Auto-detect if we're using the SDL2 API by the headers available.

const SDL_GPU_USE_SDL2* = true
##  Check for bool support
const
    GPU_HAVE_STDC* = 1
const
  GPU_HAVE_C99* = 1
const
  GPU_HAVE_GNUC* = 1
const
  GPU_HAVE_MSVC* = 1

type GPU_bool* = bool
const
  GPU_FALSE* = 0
  GPU_TRUE* = 1


## !
##  \defgroup Initialization Initialization
##  \defgroup Logging Debugging, Logging, and Error Handling
##  \defgroup RendererSetup Renderer Setup
##  \defgroup RendererControls Renderer Controls
##  \defgroup ContextControls Context Controls
##  \defgroup TargetControls Target Controls
##  \defgroup SurfaceControls Surface Controls
##  \defgroup ImageControls Image Controls
##  \defgroup Conversions Surface, Image, and Target Conversions
##  \defgroup Matrix Matrix Controls
##  \defgroup Rendering Rendering
##  \defgroup Shapes Shapes
##  \defgroup ShaderInterface Shader Interface
## 
## ! \ingroup Rendering
##  A struct representing a rectangular area with floating point precision.
##  \see GPU_MakeRect() 
## 

type
  GPU_Rect* {.bycopy.} = object
    x*: cfloat
    y*: cfloat
    w*: cfloat
    h*: cfloat


const
  GPU_RENDERER_ORDER_MAX* = 10

type
  GPU_RendererEnum* = uint32

const 
    GPU_RENDERER_UNKNOWN* = 0.uint32
    GPU_RENDERER_OPENGL_1_BASE* = 1.uint32
    GPU_RENDERER_OPENGL_1* = 2.uint32
    GPU_RENDERER_OPENGL_2* = 3.uint32
    GPU_RENDERER_OPENGL_3* = 4.uint32
    GPU_RENDERER_OPENGL_4* = 5.uint32
    GPU_RENDERER_GLES_1* = 11.uint32
    GPU_RENDERER_GLES_2* = 12.uint32 
    GPU_RENDERER_GLES_3* = 13.uint32
    GPU_RENDERER_D3D9* = 21.uint32
    GPU_RENDERER_D3D10* = 22.uint32
    GPU_RENDERER_D3D11* = 23.uint32

const
  GPU_RENDERER_CUSTOM_0* = 1000

## ! \ingroup Initialization
##  \ingroup RendererSetup
##  \ingroup RendererControls
##  Renderer ID object for identifying a specific renderer.
##  \see GPU_MakeRendererID()
##  \see GPU_InitRendererByID()
## 

type
  GPU_RendererID* {.bycopy.} = object
    name*: cstring
    renderer*: GPU_RendererEnum
    major_version*: cint
    minor_version*: cint


## ! \ingroup ImageControls
##  Blend component functions
##  \see GPU_SetBlendFunction()
##  Values chosen for direct OpenGL compatibility.
## 

type
  GPU_BlendFuncEnum* {.size: sizeof(cint).} = enum
    GPU_FUNC_ZERO = 0, GPU_FUNC_ONE = 1, GPU_FUNC_SRC_COLOR = 0x00000300,
    GPU_FUNC_ONE_MINUS_SRC = 0x00000301, GPU_FUNC_SRC_ALPHA = 0x00000302,
    GPU_FUNC_ONE_MINUS_SRC_ALPHA = 0x00000303, GPU_FUNC_DST_ALPHA = 0x00000304,
    GPU_FUNC_ONE_MINUS_DST_ALPHA = 0x00000305, GPU_FUNC_DST_COLOR = 0x00000306,
    GPU_FUNC_ONE_MINUS_DST = 0x00000307


## ! \ingroup ImageControls
##  Blend component equations
##  \see GPU_SetBlendEquation()
##  Values chosen for direct OpenGL compatibility.
## 

type
  GPU_BlendEqEnum* {.size: sizeof(cint).} = enum
    GPU_EQ_ADD = 0x00008006, GPU_EQ_SUBTRACT = 0x0000800A,
    GPU_EQ_REVERSE_SUBTRACT = 0x0000800B


## ! \ingroup ImageControls
##  Blend mode storage struct

type
  GPU_BlendMode* {.bycopy.} = object
    source_color*: GPU_BlendFuncEnum
    dest_color*: GPU_BlendFuncEnum
    source_alpha*: GPU_BlendFuncEnum
    dest_alpha*: GPU_BlendFuncEnum
    color_equation*: GPU_BlendEqEnum
    alpha_equation*: GPU_BlendEqEnum


## ! \ingroup ImageControls
##  Blend mode presets 
##  \see GPU_SetBlendMode()
##  \see GPU_GetBlendModeFromPreset()
## 

type
  GPU_BlendPresetEnum* {.size: sizeof(cint).} = enum
    GPU_BLEND_NORMAL = 0, GPU_BLEND_PREMULTIPLIED_ALPHA = 1, GPU_BLEND_MULTIPLY = 2,
    GPU_BLEND_ADD = 3, GPU_BLEND_SUBTRACT = 4, GPU_BLEND_MOD_ALPHA = 5,
    GPU_BLEND_SET_ALPHA = 6, GPU_BLEND_SET = 7, GPU_BLEND_NORMAL_KEEP_ALPHA = 8,
    GPU_BLEND_NORMAL_ADD_ALPHA = 9, GPU_BLEND_NORMAL_FACTOR_ALPHA = 10


## ! \ingroup ImageControls
##  Image filtering options.  These affect the quality/interpolation of colors when images are scaled. 
##  \see GPU_SetImageFilter()
## 

type
  GPU_FilterEnum* {.size: sizeof(cint).} = enum
    GPU_FILTER_NEAREST = 0, GPU_FILTER_LINEAR = 1, GPU_FILTER_LINEAR_MIPMAP = 2


## ! \ingroup ImageControls
##  Snap modes.  Blitting with these modes will align the sprite with the target's pixel grid.
##  \see GPU_SetSnapMode()
##  \see GPU_GetSnapMode()
## 

type
  GPU_SnapEnum* {.size: sizeof(cint).} = enum
    GPU_SNAP_NONE = 0, GPU_SNAP_POSITION = 1, GPU_SNAP_DIMENSIONS = 2,
    GPU_SNAP_POSITION_AND_DIMENSIONS = 3


## ! \ingroup ImageControls
##  Image wrapping options.  These affect how images handle src_rect coordinates beyond their dimensions when blitted.
##  \see GPU_SetWrapMode()
## 

type
  GPU_WrapEnum* {.size: sizeof(cint).} = enum
    GPU_WRAP_NONE = 0, GPU_WRAP_REPEAT = 1, GPU_WRAP_MIRRORED = 2


## ! \ingroup ImageControls
##  Image format enum
##  \see GPU_CreateImage()
## 

type
  GPU_FormatEnum* {.size: sizeof(cint).} = enum
    GPU_FORMAT_LUMINANCE = 1, GPU_FORMAT_LUMINANCE_ALPHA = 2, GPU_FORMAT_RGB = 3,
    GPU_FORMAT_RGBA = 4, GPU_FORMAT_ALPHA = 5, GPU_FORMAT_RG = 6,
    GPU_FORMAT_YCbCr422 = 7, GPU_FORMAT_YCbCr420P = 8


## ! \ingroup ImageControls
##  File format enum
##  \see GPU_SaveSurface()
##  \see GPU_SaveImage()
##  \see GPU_SaveSurface_RW()
##  \see GPU_SaveImage_RW()
## 

type
  GPU_FileFormatEnum* {.size: sizeof(cint).} = enum
    GPU_FILE_AUTO = 0, GPU_FILE_PNG, GPU_FILE_BMP, GPU_FILE_TGA


## ! \ingroup ImageControls
##  Image object for containing pixel/texture data.
##  A GPU_Image can be created with GPU_CreateImage(), GPU_LoadImage(), GPU_CopyImage(), or GPU_CopyImageFromSurface().
##  Free the memory with GPU_FreeImage() when you're done.
##  \see GPU_CreateImage()
##  \see GPU_LoadImage()
##  \see GPU_CopyImage()
##  \see GPU_CopyImageFromSurface()
##  \see GPU_Target
## 


## ! \ingroup TargetControls
##  Camera object that determines viewing transform.
##  \see GPU_SetCamera() 
##  \see GPU_GetDefaultCamera() 
##  \see GPU_GetCamera()
## 

type
  GPU_Camera* {.bycopy.} = object
    x*: cfloat
    y*: cfloat
    z*: cfloat
    angle*: cfloat
    zoom*: cfloat


## ! \ingroup ShaderInterface
##  Container for the built-in shader attribute and uniform locations (indices).
##  \see GPU_LoadShaderBlock()
##  \see GPU_SetShaderBlock()
## 

type
  GPU_ShaderBlock* {.bycopy.} = object
    position_loc*: cint        ##  Attributes
    texcoord_loc*: cint
    color_loc*: cint           ##  Uniforms
    modelViewProjection_loc*: cint


const
  GPU_MODELVIEW* = 0
  GPU_PROJECTION* = 1

## ! \ingroup Matrix
##  Matrix stack data structure for global vertex transforms.

const GPU_MATRIX_STACK_MAX = 5
type

  GPU_MatrixStack* {.bycopy.} = object
    size*: cuint
    matrix*: array[GPU_MATRIX_STACK_MAX, array[16, cfloat]]


## ! \ingroup ContextControls
##  Rendering context data.  Only GPU_Targets which represent windows will store this.

type
  GPU_Context* {.bycopy.} = object
    context*: pointer          ## ! SDL_GLContext
    failed*: GPU_bool          ## ! SDL window ID
    windowID*: uint32          ## ! Actual window dimensions
    window_w*: cint
    window_h*: cint            ## ! Drawable region dimensions
    drawable_w*: cint
    drawable_h*: cint          ## ! Window dimensions for restoring windowed mode after GPU_SetFullscreen(1,1).
    stored_window_w*: cint
    stored_window_h*: cint     ## ! Internal state
    current_shader_program*: uint32
    default_textured_shader_program*: uint32
    default_untextured_shader_program*: uint32
    current_shader_block*: GPU_ShaderBlock
    default_textured_shader_block*: GPU_ShaderBlock
    default_untextured_shader_block*: GPU_ShaderBlock
    shapes_use_blending*: GPU_bool
    shapes_blend_mode*: GPU_BlendMode
    line_thickness*: cfloat
    use_texturing*: GPU_bool
    matrix_mode*: cint
    projection_matrix*: GPU_MatrixStack
    modelview_matrix*: GPU_MatrixStack
    data*: pointer


## ! \ingroup TargetControls
##  Render target object for use as a blitting destination.
##  A GPU_Target can be created from a GPU_Image with GPU_LoadTarget().
##  A GPU_Target can also represent a separate window with GPU_CreateTargetFromWindow().  In that case, 'context' is allocated and filled in.
##  Note: You must have passed the SDL_WINDOW_OPENGL flag to SDL_CreateWindow() for OpenGL renderers to work with new windows.
##  Free the memory with GPU_FreeTarget() when you're done.
##  \see GPU_LoadTarget()
##  \see GPU_CreateTargetFromWindow()
##  \see GPU_FreeTarget()
## 
type
  GPU_FeatureEnum* = uint32

const
    GPU_FEATURE_NON_POWER_OF_TWO* = 0x1.uint32
    GPU_FEATURE_RENDER_TARGETS* = 0x2.uint32
    GPU_FEATURE_BLEND_EQUATIONS* = 0x4.uint32
    GPU_FEATURE_BLEND_FUNC_SEPARATE* = 0x8.uint32
    GPU_FEATURE_BLEND_EQUATIONS_SEPARATE* = 0x10.uint32
    GPU_FEATURE_GL_BGR* = 0x20.uint32
    GPU_FEATURE_GL_BGRA* = 0x40.uint32
    GPU_FEATURE_GL_ABGR* = 0x80.uint32
    GPU_FEATURE_VERTEX_SHADER* = 0x100.uint32
    GPU_FEATURE_FRAGMENT_SHADER* = 0x200.uint32
    GPU_FEATURE_PIXEL_SHADER* = 0x400.uint32
    GPU_FEATURE_GEOMETRY_SHADER* = 0x800.uint32
    GPU_FEATURE_WRAP_REPEAT_MIRRORED* = 0x1000.uint32

## ! Combined feature flags

let
  GPU_FEATURE_ALL_BASE* = GPU_FEATURE_RENDER_TARGETS
  GPU_FEATURE_ALL_BLEND_PRESETS* = (
    GPU_FEATURE_BLEND_EQUATIONS or GPU_FEATURE_BLEND_FUNC_SEPARATE)
  GPU_FEATURE_ALL_GL_FORMATS* = (
    GPU_FEATURE_GL_BGR or GPU_FEATURE_GL_BGRA or GPU_FEATURE_GL_ABGR)
  GPU_FEATURE_BASIC_SHADERS* = (
    GPU_FEATURE_FRAGMENT_SHADER or GPU_FEATURE_VERTEX_SHADER)
  GPU_FEATURE_ALL_SHADERS* = (GPU_FEATURE_FRAGMENT_SHADER or
      GPU_FEATURE_VERTEX_SHADER or GPU_FEATURE_GEOMETRY_SHADER)

type
  GPU_WindowFlagEnum* = uint32

## ! \ingroup Initialization
##  Initialization flags for changing default init parameters.  Can be bitwise OR'ed together.
##  Default (0) is to use late swap vsync and double buffering.
##  \see GPU_SetPreInitFlags()
##  \see GPU_GetPreInitFlags()
## 

type
  GPU_InitFlagEnum* = uint32

const
  GPU_INIT_ENABLE_VSYNC* = 0x1.uint32

  GPU_INIT_DISABLE_VSYNC* = 0x2.uint32

  GPU_INIT_DISABLE_DOUBLE_BUFFER* = 0x4.uint32

  GPU_INIT_DISABLE_AUTO_VIRTUAL_RESOLUTION* = 0x8.uint32

  GPU_INIT_REQUEST_COMPATIBILITY_PROFILE* = 0x10.uint32
  
  GPU_INIT_USE_ROW_BY_ROW_TEXTURE_UPLOAD_FALLBACK = 0x20.uint32

  GPU_INIT_USE_COPY_TEXTURE_UPLOAD_FALLBACK = 0x40.uint32

const
  GPU_DEFAULT_INIT_FLAGS* = 0

const GPU_NONE* = 0x0.uint32

## ! \ingroup Rendering
##  Bit flags for geometry batching.
##  \see GPU_TriangleBatch()
##  \see GPU_TriangleBatchX()
## 

type
  GPU_BatchFlagEnum* = uint32
const
  GPU_BATCH_XY* = 0x1.uint32

  GPU_BATCH_XYZ* = 0x2.uint32

  GPU_BATCH_ST* = 0x4.uint32

  GPU_BATCH_RGB* = 0x8.uint32

  GPU_BATCH_RGBA*  = 0x10.uint32

  GPU_BATCH_RGB8* = 0x20.uint32

  GPU_BATCH_RGBA8* = 0x40.uint32

let
  GPU_BATCH_XY_ST* = (GPU_BATCH_XY or GPU_BATCH_ST)
  GPU_BATCH_XYZ_ST* = (GPU_BATCH_XYZ or GPU_BATCH_ST)
  GPU_BATCH_XY_RGB* = (GPU_BATCH_XY or GPU_BATCH_RGB)
  GPU_BATCH_XYZ_RGB* = (GPU_BATCH_XYZ or GPU_BATCH_RGB)
  GPU_BATCH_XY_RGBA* = (GPU_BATCH_XY or GPU_BATCH_RGBA)
  GPU_BATCH_XYZ_RGBA* = (GPU_BATCH_XYZ or GPU_BATCH_RGBA)
  GPU_BATCH_XY_ST_RGBA* = (GPU_BATCH_XY or GPU_BATCH_ST or GPU_BATCH_RGBA)
  GPU_BATCH_XYZ_ST_RGBA* = (GPU_BATCH_XYZ or GPU_BATCH_ST or GPU_BATCH_RGBA)
  GPU_BATCH_XY_RGB8* = (GPU_BATCH_XY or GPU_BATCH_RGB8)
  GPU_BATCH_XYZ_RGB8* = (GPU_BATCH_XYZ or GPU_BATCH_RGB8)
  GPU_BATCH_XY_RGBA8* = (GPU_BATCH_XY or GPU_BATCH_RGBA8)
  GPU_BATCH_XYZ_RGBA8* = (GPU_BATCH_XYZ or GPU_BATCH_RGBA8)
  GPU_BATCH_XY_ST_RGBA8* = (GPU_BATCH_XY or GPU_BATCH_ST or GPU_BATCH_RGBA8)
  GPU_BATCH_XYZ_ST_RGBA8* = (GPU_BATCH_XYZ or GPU_BATCH_ST or GPU_BATCH_RGBA8)

## ! Bit flags for blitting into a rectangular region.
##  \see GPU_BlitRect
##  \see GPU_BlitRectX
## 

type
  GPU_FlipEnum* = uint32
const
  GPU_FLIP_NONE* = 0x0.uint32

  GPU_FLIP_HORIZONTAL* = 0x1.uint32

  GPU_FLIP_VERTICAL* = 0x2.uint32

## ! \ingroup ShaderInterface
##  Type enumeration for GPU_AttributeFormat specifications.
## 

type
  GPU_TypeEnum* = uint32

##  Use OpenGL's values for simpler translation

const   
  GPU_TYPE_BYTE* = 0x1400.uint32

  GPU_TYPE_UNSIGNED_BYTE* =0x1401.uint32

  GPU_TYPE_SHORT* = 0x1402.uint32

  GPU_TYPE_UNSIGNED_SHORT* = 0x1403.uint32

  GPU_TYPE_INT* = 0x1404

  GPU_TYPE_UNSIGNED_INT* =0x1405.uint32

  GPU_TYPE_FLOAT* = 0x1406.uint32 

  GPU_TYPE_DOUBLE* = 0x140A.uint32

## ! \ingroup ShaderInterface
##  Shader type enum.
##  \see GPU_LoadShader()
##  \see GPU_CompileShader()
##  \see GPU_CompileShader_RW()
## 

type
  GPU_ShaderEnum* {.size: sizeof(cint).} = enum
    GPU_VERTEX_SHADER = 0, GPU_FRAGMENT_SHADER = 1, GPU_GEOMETRY_SHADER = 2

const
  GPU_PIXEL_SHADER = GPU_FRAGMENT_SHADER

## ! \ingroup ShaderInterface
##  Type enumeration for the shader language used by the renderer.
## 

type
  GPU_ShaderLanguageEnum* {.size: sizeof(cint).} = enum
    GPU_LANGUAGE_NONE = 0, GPU_LANGUAGE_ARB_ASSEMBLY = 1, GPU_LANGUAGE_GLSL = 2,
    GPU_LANGUAGE_GLSLES = 3, GPU_LANGUAGE_HLSL = 4, GPU_LANGUAGE_CG = 5


## ! \ingroup ShaderInterface

type
  GPU_AttributeFormat* {.bycopy.} = object
    is_per_sprite*: GPU_bool   ##  Per-sprite values are expanded to 4 vertices
    num_elems_per_value*: cint
    `type`*: GPU_TypeEnum      ##  GPU_TYPE_FLOAT, GPU_TYPE_INT, GPU_TYPE_UNSIGNED_INT, etc.
    normalize*: GPU_bool
    stride_bytes*: cint        ##  Number of bytes between two vertex specifications
    offset_bytes*: cint        ##  Number of bytes to skip at the beginning of 'values'
  

## ! \ingroup ShaderInterface

type
  GPU_Attribute* {.bycopy.} = object
    location*: cint
    values*: pointer           ##  Expect 4 values for each sprite
    format*: GPU_AttributeFormat


## ! \ingroup ShaderInterface

type
  GPU_AttributeSource* {.bycopy.} = object
    enabled*: GPU_bool
    num_values*: cint
    next_value*: pointer       ##  Automatic storage format
    per_vertex_storage_stride_bytes*: cint
    per_vertex_storage_offset_bytes*: cint
    per_vertex_storage_size*: cint ##  Over 0 means that the per-vertex storage has been automatically allocated
    per_vertex_storage*: pointer ##  Could point to the attribute's values or to allocated storage
    attribute*: GPU_Attribute


## ! \ingroup Logging
##  Type enumeration for error codes.
##  \see GPU_PushErrorCode()
##  \see GPU_PopErrorCode()
## 

type
  GPU_ErrorEnum* {.size: sizeof(cint).} = enum
    GPU_ERROR_NONE = 0, GPU_ERROR_BACKEND_ERROR = 1, GPU_ERROR_DATA_ERROR = 2,
    GPU_ERROR_USER_ERROR = 3, GPU_ERROR_UNSUPPORTED_FUNCTION = 4,
    GPU_ERROR_NULL_ARGUMENT = 5, GPU_ERROR_FILE_NOT_FOUND = 6


## ! \ingroup Logging

type
  GPU_ErrorObject* {.bycopy.} = object
    function*: cstring
    error*: GPU_ErrorEnum
    details*: cstring


## ! \ingroup Logging
##  Type enumeration for debug levels.
##  \see GPU_SetDebugLevel()
##  \see GPU_GetDebugLevel()
## 

type
  GPU_DebugLevelEnum* {.size: sizeof(cint).} = enum
    GPU_DEBUG_LEVEL_0 = 0, GPU_DEBUG_LEVEL_1 = 1, GPU_DEBUG_LEVEL_2 = 2,
    GPU_DEBUG_LEVEL_3 = 3

const
  GPU_DEBUG_LEVEL_MAX = GPU_DEBUG_LEVEL_3

## ! \ingroup Logging
##  Type enumeration for logging levels.
##  \see GPU_SetLogCallback()
## 

type
  GPU_LogLevelEnum* {.size: sizeof(cint).} = enum
    GPU_LOG_INFO = 0, GPU_LOG_WARNING, GPU_LOG_ERROR


type

  GPU_Renderer* {.bycopy.} = object
    id*: GPU_RendererID        ## ! Struct identifier of the renderer.
    requested_id*: GPU_RendererID
    SDL_init_flags*: GPU_WindowFlagEnum
    GPU_init_flags*: GPU_InitFlagEnum
    shader_language*: GPU_ShaderLanguageEnum
    min_shader_version*: cint
    max_shader_version*: cint
    enabled_features*: GPU_FeatureEnum ## ! Current display target
    current_context_target*: ptr GPU_Target ## ! 0 for inverted, 1 for mathematical
    coordinate_mode*: GPU_bool ## ! Default is (0.5, 0.5) - images draw centered.
    default_image_anchor_x*: cfloat
    default_image_anchor_y*: cfloat
    impl*: ptr GPU_RendererImpl


  GPU_RendererImpl* {.bycopy.} = object
  GPU_Target* {.bycopy.} = object
    renderer*: ptr GPU_Renderer
    context_target*: ptr GPU_Target
    image*: ptr GPU_Image
    data*: pointer
    w*: uint16
    h*: uint16
    using_virtual_resolution*: GPU_bool
    base_w*: uint16
    base_h*: uint16            ##  The true dimensions of the underlying image or window
    use_clip_rect*: GPU_bool
    clip_rect*: GPU_Rect
    use_color*: GPU_bool
    color*: SDL_Color
    viewport*: GPU_Rect        ## ! Perspective and object viewing transforms.
    camera*: GPU_Camera
    use_camera*: GPU_bool      ## ! Renderer context data.  NULL if the target does not represent a window or rendering context.
    context*: ptr GPU_Context
    refcount*: cint
    is_alias*: GPU_bool

  GPU_Image* {.bycopy.} = object
    renderer*: ptr GPU_Renderer
    context_target*: ptr GPU_Target
    target*: ptr GPU_Target
    w* {.importc.}: uint16
    h*: uint16
    using_virtual_resolution*: GPU_bool
    format*: GPU_FormatEnum
    num_layers*: cint
    bytes_per_pixel*: cint
    base_w*: uint16
    base_h*: uint16            ##  Original image dimensions
    texture_w*: uint16
    texture_h*: uint16         ##  Underlying texture dimensions
    has_mipmaps*: GPU_bool
    anchor_x*: cfloat          ##  Normalized coords for the point at which the image is blitted.  Default is (0.5, 0.5), that is, the image is drawn centered.
    anchor_y*: cfloat          ##  These are interpreted according to GPU_SetCoordinateMode() and range from (0.0 - 1.0) normally.
    color*: SDL_Color
    use_blending*: GPU_bool
    blend_mode*: GPU_BlendMode
    filter_mode*: GPU_FilterEnum
    snap_mode*: GPU_SnapEnum
    wrap_mode_x*: GPU_WrapEnum
    wrap_mode_y*: GPU_WrapEnum
    data*: pointer
    refcount*: cint
    is_alias*: GPU_bool


## ! \ingroup Initialization
##  Important GPU features which may not be supported depending on a device's extension support.  Can be bitwise OR'd together.
##  \see GPU_IsFeatureEnabled()
##  \see GPU_SetRequiredFeatures()
## 


##  Private implementation of renderer members

  

## ! Renderer object which specializes the API to a particular backend.

## ! \ingroup Initialization
##   @{
##  Visual C does not support static inline

proc GPU_GetCompiledVersion*(): SDL_version {.cdecl.} =
  var v: SDL_version
  return v

proc GPU_GetLinkedVersion*(): SDL_version {.cdecl, importc: "GPU_GetLinkedVersion",
    dynlib: libName.}
## ! The window corresponding to 'windowID' will be used to create the rendering context instead of creating a new window.

proc GPU_SetInitWindow*(windowID: uint32) {.cdecl, importc: "GPU_SetInitWindow",
    dynlib: libName.}
## ! Returns the window ID that has been set via GPU_SetInitWindow().

proc GPU_GetInitWindow*(): uint32 {.cdecl, importc: "GPU_GetInitWindow",
                                 dynlib: libName.}
## ! Set special flags to use for initialization. Set these before calling GPU_Init().
##  \param GPU_flags An OR'ed combination of GPU_InitFlagEnum flags.  Default flags (0) enable late swap vsync and double buffering.

proc GPU_SetPreInitFlags*(GPU_flags: GPU_InitFlagEnum) {.cdecl,
    importc: "GPU_SetPreInitFlags", dynlib: libName.}
## ! Returns the current special flags to use for initialization.

proc GPU_GetPreInitFlags*(): GPU_InitFlagEnum {.cdecl,
    importc: "GPU_GetPreInitFlags", dynlib: libName.}
## ! Set required features to use for initialization. Set these before calling GPU_Init().
##  \param features An OR'ed combination of GPU_FeatureEnum flags.  Required features will force GPU_Init() to create a renderer that supports all of the given flags or else fail.

proc GPU_SetRequiredFeatures*(features: GPU_FeatureEnum) {.cdecl,
    importc: "GPU_SetRequiredFeatures", dynlib: libName.}
## ! Returns the current required features to use for initialization.

proc GPU_GetRequiredFeatures*(): GPU_FeatureEnum {.cdecl,
    importc: "GPU_GetRequiredFeatures", dynlib: libName.}
## ! Gets the default initialization renderer IDs for the current platform copied into the 'order' array and the number of renderer IDs into 'order_size'.  Pass NULL for 'order' to just get the size of the renderer order array.  Will return at most GPU_RENDERER_ORDER_MAX renderers.

proc GPU_GetDefaultRendererOrder*(order_size: ptr cint; order: ptr GPU_RendererID) {.
    cdecl, importc: "GPU_GetDefaultRendererOrder", dynlib: libName.}
## ! Gets the current renderer ID order for initialization copied into the 'order' array and the number of renderer IDs into 'order_size'.  Pass NULL for 'order' to just get the size of the renderer order array.

proc GPU_GetRendererOrder*(order_size: ptr cint; order: ptr GPU_RendererID) {.cdecl,
    importc: "GPU_GetRendererOrder", dynlib: libName.}
## ! Sets the renderer ID order to use for initialization.  If 'order' is NULL, it will restore the default order.

proc GPU_SetRendererOrder*(order_size: cint; order: ptr GPU_RendererID) {.cdecl,
    importc: "GPU_SetRendererOrder", dynlib: libName.}
## ! Initializes SDL and SDL_gpu.  Creates a window and goes through the renderer order to create a renderer context.
##  \see GPU_SetRendererOrder()
## 

proc GPU_Init*(w: uint16; h: uint16; SDL_flags: GPU_WindowFlagEnum): ptr GPU_Target {.
    cdecl, importc: "GPU_Init", dynlib: libName.}
## ! Initializes SDL and SDL_gpu.  Creates a window and the requested renderer context.

proc GPU_InitRenderer*(renderer_enum: GPU_RendererEnum; w: uint16; h: uint16;
                      SDL_flags: GPU_WindowFlagEnum): ptr GPU_Target {.cdecl,
    importc: "GPU_InitRenderer", dynlib: libName.}
## ! Initializes SDL and SDL_gpu.  Creates a window and the requested renderer context.
##  By requesting a renderer via ID, you can specify the major and minor versions of an individual renderer backend.
##  \see GPU_MakeRendererID
## 

proc GPU_InitRendererByID*(renderer_request: GPU_RendererID; w: uint16; h: uint16;
                          SDL_flags: GPU_WindowFlagEnum): ptr GPU_Target {.cdecl,
    importc: "GPU_InitRendererByID", dynlib: libName.}
## ! Checks for important GPU features which may not be supported depending on a device's extension support.  Feature flags (GPU_FEATURE_*) can be bitwise OR'd together. 
##  \return 1 if all of the passed features are enabled/supported
##  \return 0 if any of the passed features are disabled/unsupported
## 

proc GPU_IsFeatureEnabled*(feature: GPU_FeatureEnum): GPU_bool {.cdecl,
    importc: "GPU_IsFeatureEnabled", dynlib: libName.}
## ! Clean up the renderer state.

proc GPU_CloseCurrentRenderer*() {.cdecl, importc: "GPU_CloseCurrentRenderer",
                                 dynlib: libName.}
## ! Clean up the renderer state and shut down SDL_gpu.

proc GPU_Quit*() {.cdecl, importc: "GPU_Quit", dynlib: libName.}
##  End of Initialization
## ! @}
##  Debugging, logging, and error handling

const
  GPU_Log* = GPU_LogInfo

## ! \ingroup Logging
##   @{
## ! Sets the global debug level.
##  GPU_DEBUG_LEVEL_0: Normal
##  GPU_DEBUG_LEVEL_1: Prints messages when errors are pushed via GPU_PushErrorCode()
##  GPU_DEBUG_LEVEL_2: Elevates warning logs to error priority
##  GPU_DEBUG_LEVEL_3: Elevates info logs to error priority
## 

proc GPU_SetDebugLevel*(level: GPU_DebugLevelEnum) {.cdecl,
    importc: "GPU_SetDebugLevel", dynlib: libName.}
## ! Returns the current global debug level.

proc GPU_GetDebugLevel*(): GPU_DebugLevelEnum {.cdecl, importc: "GPU_GetDebugLevel",
    dynlib: libName.}
## ! Prints an informational log message.

proc GPU_LogInfo2*(format: cstring) {.varargs, cdecl, importc: "GPU_LogInfo",
                                  dynlib: libName.}
## ! Prints a warning log message.

proc GPU_LogWarning2*(format: cstring) {.varargs, cdecl, importc: "GPU_LogWarning",
                                     dynlib: libName.}
## ! Prints an error log message.

proc GPU_LogError2*(format: cstring) {.varargs, cdecl, importc: "GPU_LogError",
                                   dynlib: libName.}
## ! Sets a custom callback for handling logging.  Use stdio's vsnprintf() to process the va_list into a string.  Passing NULL as the callback will reset to the default internal logging.

proc GPU_SetLogCallback*(callback: proc (log_level: GPU_LogLevelEnum;
                                      format: cstring; args: seq): cint {.cdecl.}) {.
    cdecl, importc: "GPU_SetLogCallback", dynlib: libName.}
## ! Pushes a new error code into the error queue.  If the queue is full, the queue is not modified.
##  \param function The name of the function that pushed the error
##  \param error The error code to push on the error queue
##  \param details Additional information string, can be NULL.
## 

proc GPU_PushErrorCode*(function: cstring; error: GPU_ErrorEnum; details: cstring) {.
    varargs, cdecl, importc: "GPU_PushErrorCode", dynlib: libName.}
## ! Pops an error object from the error queue and returns it.  If the error queue is empty, it returns an error object with NULL function, GPU_ERROR_NONE error, and NULL details.

proc GPU_PopErrorCode*(): GPU_ErrorObject {.cdecl, importc: "GPU_PopErrorCode",
    dynlib: libName.}
## ! Gets the string representation of an error code.

proc GPU_GetErrorString*(error: GPU_ErrorEnum): cstring {.cdecl,
    importc: "GPU_GetErrorString", dynlib: libName.}
## ! Changes the maximum number of error objects that SDL_gpu will store.  This deletes all currently stored errors.

proc GPU_SetErrorQueueMax*(max: cuint) {.cdecl, importc: "GPU_SetErrorQueueMax",
                                      dynlib: libName.}
##  End of Logging
## ! @}
## ! \ingroup RendererSetup
##   @{
## ! Returns an initialized GPU_RendererID.

proc GPU_MakeRendererID*(name: cstring; renderer: GPU_RendererEnum;
                        major_version: cint; minor_version: cint): GPU_RendererID {.
    cdecl, importc: "GPU_MakeRendererID", dynlib: libName.}
## ! Gets the first registered renderer identifier for the given enum value.

proc GPU_GetRendererID*(renderer: GPU_RendererEnum): GPU_RendererID {.cdecl,
    importc: "GPU_GetRendererID", dynlib: libName.}
## ! Gets the number of registered (available) renderers.

proc GPU_GetNumRegisteredRenderers*(): cint {.cdecl,
    importc: "GPU_GetNumRegisteredRenderers", dynlib: libName.}
## ! Gets an array of identifiers for the registered (available) renderers.

proc GPU_GetRegisteredRendererList*(renderers_array: ptr GPU_RendererID) {.cdecl,
    importc: "GPU_GetRegisteredRendererList", dynlib: libName.}
## ! Prepares a renderer for use by SDL_gpu.

proc GPU_RegisterRenderer*(id: GPU_RendererID; create_renderer: proc (
    request: GPU_RendererID): ptr GPU_Renderer {.cdecl.}; free_renderer: proc (
    renderer: ptr GPU_Renderer) {.cdecl.}) {.cdecl, importc: "GPU_RegisterRenderer",
    dynlib: libName.}
##  End of RendererSetup
## ! @}
## ! \ingroup RendererControls
##   @{
## ! Gets the next enum ID that can be used for a custom renderer.

proc GPU_ReserveNextRendererEnum*(): GPU_RendererEnum {.cdecl,
    importc: "GPU_ReserveNextRendererEnum", dynlib: libName.}
## ! Gets the number of active (created) renderers.

proc GPU_GetNumActiveRenderers*(): cint {.cdecl,
                                       importc: "GPU_GetNumActiveRenderers",
                                       dynlib: libName.}
## ! Gets an array of identifiers for the active renderers.

proc GPU_GetActiveRendererList*(renderers_array: ptr GPU_RendererID) {.cdecl,
    importc: "GPU_GetActiveRendererList", dynlib: libName.}
## ! \return The current renderer

proc GPU_GetCurrentRenderer*(): ptr GPU_Renderer {.cdecl,
    importc: "GPU_GetCurrentRenderer", dynlib: libName.}
## ! Switches the current renderer to the renderer matching the given identifier.

proc GPU_SetCurrentRenderer*(id: GPU_RendererID) {.cdecl,
    importc: "GPU_SetCurrentRenderer", dynlib: libName.}
## ! \return The renderer matching the given identifier.

proc GPU_GetRenderer*(id: GPU_RendererID): ptr GPU_Renderer {.cdecl,
    importc: "GPU_GetRenderer", dynlib: libName.}
proc GPU_FreeRenderer*(renderer: ptr GPU_Renderer) {.cdecl,
    importc: "GPU_FreeRenderer", dynlib: libName.}
## ! Reapplies the renderer state to the backend API (e.g. OpenGL, Direct3D).  Use this if you want SDL_gpu to be able to render after you've used direct backend calls.

proc GPU_ResetRendererState*() {.cdecl, importc: "GPU_ResetRendererState",
                               dynlib: libName.}
## ! Sets the coordinate mode for this renderer.  Target and image coordinates will be either "inverted" (0,0 is the upper left corner, y increases downward) or "mathematical" (0,0 is the bottom-left corner, y increases upward).
##  The default is inverted (0), as this is traditional for 2D graphics.
##  \param inverted 0 is for inverted coordinates, 1 is for mathematical coordinates

proc GPU_SetCoordinateMode*(use_math_coords: GPU_bool) {.cdecl,
    importc: "GPU_SetCoordinateMode", dynlib: libName.}
proc GPU_GetCoordinateMode*(): GPU_bool {.cdecl, importc: "GPU_GetCoordinateMode",
                                       dynlib: libName.}
## ! Sets the default image blitting anchor for newly created images.
##  \see GPU_SetAnchor
## 

proc GPU_SetDefaultAnchor*(anchor_x: cfloat; anchor_y: cfloat) {.cdecl,
    importc: "GPU_SetDefaultAnchor", dynlib: libName.}
## ! Returns the default image blitting anchor through the given variables.
##  \see GPU_GetAnchor
## 

proc GPU_GetDefaultAnchor*(anchor_x: ptr cfloat; anchor_y: ptr cfloat) {.cdecl,
    importc: "GPU_GetDefaultAnchor", dynlib: libName.}
##  End of RendererControls
## ! @}
##  Context / window controls
## ! \ingroup ContextControls
##   @{
## ! \return The renderer's current context target.

proc GPU_GetContextTarget*(): ptr GPU_Target {.cdecl,
    importc: "GPU_GetContextTarget", dynlib: libName.}
## ! \return The target that is associated with the given windowID.

proc GPU_GetWindowTarget*(windowID: uint32): ptr GPU_Target {.cdecl,
    importc: "GPU_GetWindowTarget", dynlib: libName.}
## ! Creates a separate context for the given window using the current renderer and returns a GPU_Target that represents it.

proc GPU_CreateTargetFromWindow*(windowID: uint32): ptr GPU_Target {.cdecl,
    importc: "GPU_CreateTargetFromWindow", dynlib: libName.}
## ! Makes the given window the current rendering destination for the given context target.
##  This also makes the target the current context for image loading and window operations.
##  If the target does not represent a window, this does nothing.
## 

proc GPU_MakeCurrent*(target: ptr GPU_Target; windowID: uint32) {.cdecl,
    importc: "GPU_MakeCurrent", dynlib: libName.}
## ! Change the actual size of the current context target's window.  This resets the virtual resolution and viewport of the context target.
##  Aside from direct resolution changes, this should also be called in response to SDL_WINDOWEVENT_RESIZED window events for resizable windows.

proc GPU_SetWindowResolution*(w: uint16; h: uint16): GPU_bool {.cdecl,
    importc: "GPU_SetWindowResolution", dynlib: libName.}
## ! Enable/disable fullscreen mode for the current context target's window.
##  On some platforms, this may destroy the renderer context and require that textures be reloaded.  Unfortunately, SDL does not provide a notification mechanism for this.
##  \param enable_fullscreen If true, make the application go fullscreen.  If false, make the application go to windowed mode.
##  \param use_desktop_resolution If true, lets the window change its resolution when it enters fullscreen mode (via SDL_WINDOW_FULLSCREEN_DESKTOP).
##  \return 0 if the new mode is windowed, 1 if the new mode is fullscreen.

proc GPU_SetFullscreen*(enable_fullscreen: GPU_bool;
                       use_desktop_resolution: GPU_bool): GPU_bool {.cdecl,
    importc: "GPU_SetFullscreen", dynlib: libName.}
## ! Returns true if the current context target's window is in fullscreen mode.

proc GPU_GetFullscreen*(): GPU_bool {.cdecl, importc: "GPU_GetFullscreen",
                                   dynlib: libName.}
## ! Enables/disables alpha blending for shape rendering on the current window.

proc GPU_SetShapeBlending*(enable: GPU_bool) {.cdecl,
    importc: "GPU_SetShapeBlending", dynlib: libName.}
## ! Translates a blend preset into a blend mode.

proc GPU_GetBlendModeFromPreset*(preset: GPU_BlendPresetEnum): GPU_BlendMode {.
    cdecl, importc: "GPU_GetBlendModeFromPreset", dynlib: libName.}
## ! Sets the blending component functions for shape rendering.

proc GPU_SetShapeBlendFunction*(source_color: GPU_BlendFuncEnum;
                               dest_color: GPU_BlendFuncEnum;
                               source_alpha: GPU_BlendFuncEnum;
                               dest_alpha: GPU_BlendFuncEnum) {.cdecl,
    importc: "GPU_SetShapeBlendFunction", dynlib: libName.}
## ! Sets the blending component equations for shape rendering.

proc GPU_SetShapeBlendEquation*(color_equation: GPU_BlendEqEnum;
                               alpha_equation: GPU_BlendEqEnum) {.cdecl,
    importc: "GPU_SetShapeBlendEquation", dynlib: libName.}
## ! Sets the blending mode for shape rendering on the current window, if supported by the renderer.

proc GPU_SetShapeBlendMode*(mode: GPU_BlendPresetEnum) {.cdecl,
    importc: "GPU_SetShapeBlendMode", dynlib: libName.}
## ! Sets the thickness of lines for the current context. 
##  \param thickness New line thickness in pixels measured across the line.  Default is 1.0f.
##  \return The old thickness value
## 

proc GPU_SetLineThickness*(thickness: cfloat): cfloat {.cdecl,
    importc: "GPU_SetLineThickness", dynlib: libName.}
## ! Returns the current line thickness value.

proc GPU_GetLineThickness*(): cfloat {.cdecl, importc: "GPU_GetLineThickness",
                                    dynlib: libName.}
##  End of ContextControls
## ! @}
## ! \ingroup TargetControls
##   @{
## ! Creates a target that aliases the given target.  Aliases can be used to store target settings (e.g. viewports) for easy switching.
##  GPU_FreeTarget() frees the alias's memory, but does not affect the original.

proc GPU_CreateAliasTarget*(target: ptr GPU_Target): ptr GPU_Target {.cdecl,
    importc: "GPU_CreateAliasTarget", dynlib: libName.}
## ! Creates a new render target from the given image.  It can then be accessed from image->target.

proc GPU_LoadTarget*(image: ptr GPU_Image): ptr GPU_Target {.cdecl,
    importc: "GPU_LoadTarget", dynlib: libName.}
## ! Deletes a render target in the proper way for this renderer.

proc GPU_FreeTarget*(target: ptr GPU_Target) {.cdecl, importc: "GPU_FreeTarget",
    dynlib: libName.}
## ! Change the logical size of the given target.  Rendering to this target will be scaled as if the dimensions were actually the ones given.

proc GPU_SetVirtualResolution*(target: ptr GPU_Target; w: uint16; h: uint16) {.cdecl,
    importc: "GPU_SetVirtualResolution", dynlib: libName.}
## ! Query the logical size of the given target.

proc GPU_GetVirtualResolution*(target: ptr GPU_Target; w: ptr uint16; h: ptr uint16) {.
    cdecl, importc: "GPU_GetVirtualResolution", dynlib: libName.}
## ! Converts screen space coordinates (such as from mouse input) to logical drawing coordinates.  This interacts with GPU_SetCoordinateMode() when the y-axis is flipped (screen space is assumed to be inverted: (0,0) in the upper-left corner).

proc GPU_GetVirtualCoords*(target: ptr GPU_Target; x: ptr cfloat; y: ptr cfloat;
                          displayX: cfloat; displayY: cfloat) {.cdecl,
    importc: "GPU_GetVirtualCoords", dynlib: libName.}
## ! Reset the logical size of the given target to its original value.

proc GPU_UnsetVirtualResolution*(target: ptr GPU_Target) {.cdecl,
    importc: "GPU_UnsetVirtualResolution", dynlib: libName.}
## ! \return A GPU_Rect with the given values.

proc GPU_MakeRect*(x: cfloat; y: cfloat; w: cfloat; h: cfloat): GPU_Rect {.cdecl,
    importc: "GPU_MakeRect", dynlib: libName.}
## ! \return An SDL_Color with the given values.

proc GPU_MakeColor*(r: uint8; g: uint8; b: uint8; a: uint8): SDL_Color {.cdecl,
    importc: "GPU_MakeColor", dynlib: libName.}
## ! Sets the given target's viewport.

proc GPU_SetViewport*(target: ptr GPU_Target; viewport: GPU_Rect) {.cdecl,
    importc: "GPU_SetViewport", dynlib: libName.}
## ! Resets the given target's viewport to the entire target area.

proc GPU_UnsetViewport*(target: ptr GPU_Target) {.cdecl,
    importc: "GPU_UnsetViewport", dynlib: libName.}
## ! \return A GPU_Camera with position (0, 0, -10), angle of 0, and zoom of 1.

proc GPU_GetDefaultCamera*(): GPU_Camera {.cdecl, importc: "GPU_GetDefaultCamera",
                                        dynlib: libName.}
## ! \return The camera of the given render target.  If target is NULL, returns the default camera.

proc GPU_GetCamera*(target: ptr GPU_Target): GPU_Camera {.cdecl,
    importc: "GPU_GetCamera", dynlib: libName.}
## ! Sets the current render target's current camera.
##  \param target A pointer to the target that will copy this camera.
##  \param cam A pointer to the camera data to use or NULL to use the default camera.
##  \return The old camera.

proc GPU_SetCamera*(target: ptr GPU_Target; cam: ptr GPU_Camera): GPU_Camera {.cdecl,
    importc: "GPU_SetCamera", dynlib: libName.}
## ! Enables or disables using the built-in camera matrix transforms.

proc GPU_EnableCamera*(target: ptr GPU_Target; use_camera: GPU_bool) {.cdecl,
    importc: "GPU_EnableCamera", dynlib: libName.}
## ! Returns 1 if the camera transforms are enabled, 0 otherwise.

proc GPU_IsCameraEnabled*(target: ptr GPU_Target): GPU_bool {.cdecl,
    importc: "GPU_IsCameraEnabled", dynlib: libName.}
## ! \return The RGBA color of a pixel.

proc GPU_GetPixel*(target: ptr GPU_Target; x: int16; y: int16): SDL_Color {.cdecl,
    importc: "GPU_GetPixel", dynlib: libName.}
## ! Sets the clipping rect for the given render target.

proc GPU_SetClipRect*(target: ptr GPU_Target; rect: GPU_Rect): GPU_Rect {.cdecl,
    importc: "GPU_SetClipRect", dynlib: libName.}
## ! Sets the clipping rect for the given render target.

proc GPU_SetClip*(target: ptr GPU_Target; x: int16; y: int16; w: uint16; h: uint16): GPU_Rect {.
    cdecl, importc: "GPU_SetClip", dynlib: libName.}
## ! Turns off clipping for the given target.

proc GPU_UnsetClip*(target: ptr GPU_Target) {.cdecl, importc: "GPU_UnsetClip",
    dynlib: libName.}
## ! Returns GPU_TRUE if the given rects A and B overlap, in which case it also fills the given result rect with the intersection.  `result` can be NULL if you don't need the intersection.

proc GPU_IntersectRect*(A: GPU_Rect; B: GPU_Rect; result: ptr GPU_Rect): GPU_bool {.
    cdecl, importc: "GPU_IntersectRect", dynlib: libName.}
## ! Returns GPU_TRUE if the given target's clip rect and the given B rect overlap, in which case it also fills the given result rect with the intersection.  `result` can be NULL if you don't need the intersection.
##  If the target doesn't have a clip rect enabled, this uses the whole target area.
## 

proc GPU_IntersectClipRect*(target: ptr GPU_Target; B: GPU_Rect; result: ptr GPU_Rect): GPU_bool {.
    cdecl, importc: "GPU_IntersectClipRect", dynlib: libName.}
## ! Sets the modulation color for subsequent drawing of images and shapes on the given target. 
##   This has a cumulative effect with the image coloring functions.
##   e.g. GPU_SetRGB(image, 255, 128, 0); GPU_SetTargetRGB(target, 128, 128, 128);
##   Would make the image draw with color of roughly (128, 64, 0).
## 

proc GPU_SetTargetColor*(target: ptr GPU_Target; color: SDL_Color) {.cdecl,
    importc: "GPU_SetTargetColor", dynlib: libName.}
## ! Sets the modulation color for subsequent drawing of images and shapes on the given target. 
##   This has a cumulative effect with the image coloring functions.
##   e.g. GPU_SetRGB(image, 255, 128, 0); GPU_SetTargetRGB(target, 128, 128, 128);
##   Would make the image draw with color of roughly (128, 64, 0).
## 

proc GPU_SetTargetRGB*(target: ptr GPU_Target; r: uint8; g: uint8; b: uint8) {.cdecl,
    importc: "GPU_SetTargetRGB", dynlib: libName.}
## ! Sets the modulation color for subsequent drawing of images and shapes on the given target. 
##   This has a cumulative effect with the image coloring functions.
##   e.g. GPU_SetRGB(image, 255, 128, 0); GPU_SetTargetRGB(target, 128, 128, 128);
##   Would make the image draw with color of roughly (128, 64, 0).
## 

proc GPU_SetTargetRGBA*(target: ptr GPU_Target; r: uint8; g: uint8; b: uint8; a: uint8) {.
    cdecl, importc: "GPU_SetTargetRGBA", dynlib: libName.}
## ! Unsets the modulation color for subsequent drawing of images and shapes on the given target. 
##   This has the same effect as coloring with pure opaque white (255, 255, 255, 255).
## 

proc GPU_UnsetTargetColor*(target: ptr GPU_Target) {.cdecl,
    importc: "GPU_UnsetTargetColor", dynlib: libName.}
##  End of TargetControls
## ! @}
## ! \ingroup SurfaceControls
##   @{
## ! Load surface from an image file that is supported by this renderer.  Don't forget to SDL_FreeSurface() it.

proc GPU_LoadSurface*(filename: cstring): ptr sdl2.Surface {.cdecl,
    importc: "GPU_LoadSurface", dynlib: libName.}
## ! Load surface from an image file in memory.  Don't forget to SDL_FreeSurface() it.

proc GPU_LoadSurface_RW*(rwops: ptr sdl2.RWops; free_rwops: GPU_bool): ptr sdl2.Surface {.
    cdecl, importc: "GPU_LoadSurface_RW", dynlib: libName.}
## ! Save surface to a file.
##  With a format of GPU_FILE_AUTO, the file type is deduced from the extension.  Supported formats are: png, bmp, tga.
##  Returns 0 on failure.

proc GPU_SaveSurface*(surface: ptr sdl2.Surface; filename: cstring;
                     format: GPU_FileFormatEnum): GPU_bool {.cdecl,
    importc: "GPU_SaveSurface", dynlib: libName.}
## ! Save surface to a RWops stream.
##  Does not support format of GPU_FILE_AUTO, because the file type cannot be deduced.  Supported formats are: png, bmp, tga.
##  Returns 0 on failure.

proc GPU_SaveSurface_RW*(surface: ptr sdl2.Surface; rwops: ptr sdl2.RWops;
                        free_rwops: GPU_bool; format: GPU_FileFormatEnum): GPU_bool {.
    cdecl, importc: "GPU_SaveSurface_RW", dynlib: libName.}
##  End of SurfaceControls
## ! @}
## ! \ingroup ImageControls
##   @{
## ! Create a new, blank image with the given format.  Don't forget to GPU_FreeImage() it.
##  \param w Image width in pixels
##  \param h Image height in pixels
##  \param format Format of color channels.
## 

proc GPU_CreateImage*(w: uint16; h: uint16; format: GPU_FormatEnum): ptr GPU_Image {.
    cdecl, importc: "GPU_CreateImage", dynlib: libName.}
## ! Create a new image that uses the given native texture handle as the image texture.

proc GPU_CreateImageUsingTexture*(handle: uint32; take_ownership: GPU_bool): ptr GPU_Image {.
    cdecl, importc: "GPU_CreateImageUsingTexture", dynlib: libName.}
## ! Load image from an image file that is supported by this renderer.  Don't forget to GPU_FreeImage() it.

proc GPU_LoadImage*(filename: cstring): ptr GPU_Image {.cdecl,
    importc: "GPU_LoadImage", dynlib: libName.}
## ! Load image from an image file in memory.  Don't forget to GPU_FreeImage() it.

proc GPU_LoadImage_RW*(rwops: ptr sdl2.RWops; free_rwops: GPU_bool): ptr GPU_Image {.
    cdecl, importc: "GPU_LoadImage_RW", dynlib: libName.}
## ! Creates an image that aliases the given image.  Aliases can be used to store image settings (e.g. modulation color) for easy switching.
##  GPU_FreeImage() frees the alias's memory, but does not affect the original.

proc GPU_CreateAliasImage*(image: ptr GPU_Image): ptr GPU_Image {.cdecl,
    importc: "GPU_CreateAliasImage", dynlib: libName.}
## ! Copy an image to a new image.  Don't forget to GPU_FreeImage() both.

proc GPU_CopyImage*(image: ptr GPU_Image): ptr GPU_Image {.cdecl,
    importc: "GPU_CopyImage", dynlib: libName.}
## ! Deletes an image in the proper way for this renderer.  Also deletes the corresponding GPU_Target if applicable.  Be careful not to use that target afterward!

proc GPU_FreeImage*(image: ptr GPU_Image) {.cdecl, importc: "GPU_FreeImage",
                                        dynlib: libName.}
## ! Change the logical size of the given image.  Rendering this image will scaled it as if the dimensions were actually the ones given.

proc GPU_SetImageVirtualResolution*(image: ptr GPU_Image; w: uint16; h: uint16) {.cdecl,
    importc: "GPU_SetImageVirtualResolution", dynlib: libName.}
## ! Reset the logical size of the given image to its original value.

proc GPU_UnsetImageVirtualResolution*(image: ptr GPU_Image) {.cdecl,
    importc: "GPU_UnsetImageVirtualResolution", dynlib: libName.}
## ! Update an image from surface data.  Ignores virtual resolution on the image so the number of pixels needed from the surface is known.

proc GPU_UpdateImage*(image: ptr GPU_Image; image_rect: ptr GPU_Rect;
                     surface: ptr sdl2.Surface; surface_rect: ptr GPU_Rect) {.cdecl,
    importc: "GPU_UpdateImage", dynlib: libName.}
## ! Update an image from an array of pixel data.  Ignores virtual resolution on the image so the number of pixels needed from the surface is known.

proc GPU_UpdateImageBytes*(image: ptr GPU_Image; image_rect: ptr GPU_Rect;
                          bytes: ptr cuchar; bytes_per_row: cint) {.cdecl,
    importc: "GPU_UpdateImageBytes", dynlib: libName.}
## ! Update an image from surface data, replacing its underlying texture to allow for size changes.  Ignores virtual resolution on the image so the number of pixels needed from the surface is known.

proc GPU_ReplaceImage*(image: ptr GPU_Image; surface: ptr sdl2.Surface;
                      surface_rect: ptr GPU_Rect): GPU_bool {.cdecl,
    importc: "GPU_ReplaceImage", dynlib: libName.}
## ! Save image to a file.
##  With a format of GPU_FILE_AUTO, the file type is deduced from the extension.  Supported formats are: png, bmp, tga.
##  Returns 0 on failure.

proc GPU_SaveImage*(image: ptr GPU_Image; filename: cstring;
                   format: GPU_FileFormatEnum): GPU_bool {.cdecl,
    importc: "GPU_SaveImage", dynlib: libName.}
## ! Save image to a RWops stream.
##  Does not support format of GPU_FILE_AUTO, because the file type cannot be deduced.  Supported formats are: png, bmp, tga.
##  Returns 0 on failure.

proc GPU_SaveImage_RW*(image: ptr GPU_Image; rwops: ptr sdl2.RWops;
                      free_rwops: GPU_bool; format: GPU_FileFormatEnum): GPU_bool {.
    cdecl, importc: "GPU_SaveImage_RW", dynlib: libName.}
## ! Loads mipmaps for the given image, if supported by the renderer.

proc GPU_GenerateMipmaps*(image: ptr GPU_Image) {.cdecl,
    importc: "GPU_GenerateMipmaps", dynlib: libName.}
## ! Sets the modulation color for subsequent drawing of the given image.

proc GPU_SetColor*(image: ptr GPU_Image; color: SDL_Color) {.cdecl,
    importc: "GPU_SetColor", dynlib: libName.}
## ! Sets the modulation color for subsequent drawing of the given image.

proc GPU_SetRGB*(image: ptr GPU_Image; r: uint8; g: uint8; b: uint8) {.cdecl,
    importc: "GPU_SetRGB", dynlib: libName.}
## ! Sets the modulation color for subsequent drawing of the given image.

proc GPU_SetRGBA*(image: ptr GPU_Image; r: uint8; g: uint8; b: uint8; a: uint8) {.cdecl,
    importc: "GPU_SetRGBA", dynlib: libName.}
## ! Unsets the modulation color for subsequent drawing of the given image.
##   This is equivalent to coloring with pure opaque white (255, 255, 255, 255).

proc GPU_UnsetColor*(image: ptr GPU_Image) {.cdecl, importc: "GPU_UnsetColor",
    dynlib: libName.}
## ! Gets the current alpha blending setting.

proc GPU_GetBlending*(image: ptr GPU_Image): GPU_bool {.cdecl,
    importc: "GPU_GetBlending", dynlib: libName.}
## ! Enables/disables alpha blending for the given image.

proc GPU_SetBlending*(image: ptr GPU_Image; enable: GPU_bool) {.cdecl,
    importc: "GPU_SetBlending", dynlib: libName.}
## ! Sets the blending component functions.

proc GPU_SetBlendFunction*(image: ptr GPU_Image; source_color: GPU_BlendFuncEnum;
                          dest_color: GPU_BlendFuncEnum;
                          source_alpha: GPU_BlendFuncEnum;
                          dest_alpha: GPU_BlendFuncEnum) {.cdecl,
    importc: "GPU_SetBlendFunction", dynlib: libName.}
## ! Sets the blending component equations.

proc GPU_SetBlendEquation*(image: ptr GPU_Image; color_equation: GPU_BlendEqEnum;
                          alpha_equation: GPU_BlendEqEnum) {.cdecl,
    importc: "GPU_SetBlendEquation", dynlib: libName.}
## ! Sets the blending mode, if supported by the renderer.

proc GPU_SetBlendMode*(image: ptr GPU_Image; mode: GPU_BlendPresetEnum) {.cdecl,
    importc: "GPU_SetBlendMode", dynlib: libName.}
## ! Sets the image filtering mode, if supported by the renderer.

proc GPU_SetImageFilter*(image: ptr GPU_Image; filter: GPU_FilterEnum) {.cdecl,
    importc: "GPU_SetImageFilter", dynlib: libName.}
## ! Sets the image anchor, which is the point about which the image is blitted.  The default is to blit the image on-center (0.5, 0.5).  The anchor is in normalized coordinates (0.0-1.0).

proc GPU_SetAnchor*(image: ptr GPU_Image; anchor_x: cfloat; anchor_y: cfloat) {.cdecl,
    importc: "GPU_SetAnchor", dynlib: libName.}
## ! Returns the image anchor via the passed parameters.  The anchor is in normalized coordinates (0.0-1.0).

proc GPU_GetAnchor*(image: ptr GPU_Image; anchor_x: ptr cfloat; anchor_y: ptr cfloat) {.
    cdecl, importc: "GPU_GetAnchor", dynlib: libName.}
## ! Gets the current pixel snap setting.  The default value is GPU_SNAP_POSITION_AND_DIMENSIONS.

proc GPU_GetSnapMode*(image: ptr GPU_Image): GPU_SnapEnum {.cdecl,
    importc: "GPU_GetSnapMode", dynlib: libName.}
## ! Sets the pixel grid snapping mode for the given image.

proc GPU_SetSnapMode*(image: ptr GPU_Image; mode: GPU_SnapEnum) {.cdecl,
    importc: "GPU_SetSnapMode", dynlib: libName.}
## ! Sets the image wrapping mode, if supported by the renderer.

proc GPU_SetWrapMode*(image: ptr GPU_Image; wrap_mode_x: GPU_WrapEnum;
                     wrap_mode_y: GPU_WrapEnum) {.cdecl,
    importc: "GPU_SetWrapMode", dynlib: libName.}
##  End of ImageControls
## ! @}
##  Surface / Image / Target conversions
## ! \ingroup Conversions
##   @{
## ! Copy sdl2.Surface data into a new GPU_Image.  Don't forget to SDL_FreeSurface() the surface and GPU_FreeImage() the image.

proc GPU_CopyImageFromSurface*(surface: ptr sdl2.Surface): ptr GPU_Image {.cdecl,
    importc: "GPU_CopyImageFromSurface", dynlib: libName.}
## ! Copy GPU_Target data into a new GPU_Image.  Don't forget to GPU_FreeImage() the image.

proc GPU_CopyImageFromTarget*(target: ptr GPU_Target): ptr GPU_Image {.cdecl,
    importc: "GPU_CopyImageFromTarget", dynlib: libName.}
## ! Copy GPU_Target data into a new sdl2.Surface.  Don't forget to SDL_FreeSurface() the surface.

proc GPU_CopySurfaceFromTarget*(target: ptr GPU_Target): ptr sdl2.Surface {.cdecl,
    importc: "GPU_CopySurfaceFromTarget", dynlib: libName.}
## ! Copy GPU_Image data into a new sdl2.Surface.  Don't forget to SDL_FreeSurface() the surface and GPU_FreeImage() the image.

proc GPU_CopySurfaceFromImage*(image: ptr GPU_Image): ptr sdl2.Surface {.cdecl,
    importc: "GPU_CopySurfaceFromImage", dynlib: libName.}
##  End of Conversions
## ! @}
## ! \ingroup Matrix
##   @{
##  Basic vector operations (3D)
## ! Returns the magnitude (length) of the given vector.

proc GPU_VectorLength*(vec3: ptr cfloat): cfloat {.cdecl, importc: "GPU_VectorLength",
    dynlib: libName.}
## ! Modifies the given vector so that it has a new length of 1.

proc GPU_VectorNormalize*(vec3: ptr cfloat) {.cdecl, importc: "GPU_VectorNormalize",
    dynlib: libName.}
## ! Returns the dot product of two vectors.

proc GPU_VectorDot*(A: ptr cfloat; B: ptr cfloat): cfloat {.cdecl,
    importc: "GPU_VectorDot", dynlib: libName.}
## ! Performs the cross product of vectors A and B (result = A x B).  Do not use A or B as 'result'.

proc GPU_VectorCross*(result: ptr cfloat; A: ptr cfloat; B: ptr cfloat) {.cdecl,
    importc: "GPU_VectorCross", dynlib: libName.}
## ! Overwrite 'result' vector with the values from vector A.

proc GPU_VectorCopy*(result: ptr cfloat; A: ptr cfloat) {.cdecl,
    importc: "GPU_VectorCopy", dynlib: libName.}
## ! Multiplies the given matrix into the given vector (vec3 = matrix*vec3).

proc GPU_VectorApplyMatrix*(vec3: ptr cfloat; matrix_4x4: ptr cfloat) {.cdecl,
    importc: "GPU_VectorApplyMatrix", dynlib: libName.}
##  Basic matrix operations (4x4)
## ! Overwrite 'result' matrix with the values from matrix A.

proc GPU_MatrixCopy*(result: ptr cfloat; A: ptr cfloat) {.cdecl,
    importc: "GPU_MatrixCopy", dynlib: libName.}
## ! Fills 'result' matrix with the identity matrix.

proc GPU_MatrixIdentity*(result: ptr cfloat) {.cdecl, importc: "GPU_MatrixIdentity",
    dynlib: libName.}
## ! Multiplies an orthographic projection matrix into the given matrix.

proc GPU_MatrixOrtho*(result: ptr cfloat; left: cfloat; right: cfloat; bottom: cfloat;
                     top: cfloat; near: cfloat; far: cfloat) {.cdecl,
    importc: "GPU_MatrixOrtho", dynlib: libName.}
## ! Multiplies a perspective projection matrix into the given matrix.

proc GPU_MatrixFrustum*(result: ptr cfloat; left: cfloat; right: cfloat; bottom: cfloat;
                       top: cfloat; near: cfloat; far: cfloat) {.cdecl,
    importc: "GPU_MatrixFrustum", dynlib: libName.}
## ! Multiplies a perspective projection matrix into the given matrix.

proc GPU_MatrixPerspective*(result: ptr cfloat; fovy: cfloat; aspect: cfloat;
                           zNear: cfloat; zFar: cfloat) {.cdecl,
    importc: "GPU_MatrixPerspective", dynlib: libName.}
## ! Multiplies a view matrix into the given matrix.

proc GPU_MatrixLookAt*(matrix: ptr cfloat; eye_x: cfloat; eye_y: cfloat; eye_z: cfloat;
                      target_x: cfloat; target_y: cfloat; target_z: cfloat;
                      up_x: cfloat; up_y: cfloat; up_z: cfloat) {.cdecl,
    importc: "GPU_MatrixLookAt", dynlib: libName.}
## ! Adds a translation into the given matrix.

proc GPU_MatrixTranslate*(result: ptr cfloat; x: cfloat; y: cfloat; z: cfloat) {.cdecl,
    importc: "GPU_MatrixTranslate", dynlib: libName.}
## ! Multiplies a scaling matrix into the given matrix.

proc GPU_MatrixScale*(result: ptr cfloat; sx: cfloat; sy: cfloat; sz: cfloat) {.cdecl,
    importc: "GPU_MatrixScale", dynlib: libName.}
## ! Multiplies a rotation matrix into the given matrix.

proc GPU_MatrixRotate*(result: ptr cfloat; degrees: cfloat; x: cfloat; y: cfloat;
                      z: cfloat) {.cdecl, importc: "GPU_MatrixRotate",
                                 dynlib: libName.}
## ! Multiplies matrices A and B and stores the result in the given 'result' matrix (result = A*B).  Do not use A or B as 'result'.
##  \see GPU_MultiplyAndAssign
## 

proc GPU_Multiply4x4*(result: ptr cfloat; A: ptr cfloat; B: ptr cfloat) {.cdecl,
    importc: "GPU_Multiply4x4", dynlib: libName.}
## ! Multiplies matrices 'result' and B and stores the result in the given 'result' matrix (result = result * B).

proc GPU_MultiplyAndAssign*(result: ptr cfloat; B: ptr cfloat) {.cdecl,
    importc: "GPU_MultiplyAndAssign", dynlib: libName.}
##  Matrix stack accessors
## ! Returns an internal string that represents the contents of matrix A.

proc GPU_GetMatrixString*(A: ptr cfloat): cstring {.cdecl,
    importc: "GPU_GetMatrixString", dynlib: libName.}
## ! Returns the current matrix from the top of the matrix stack.  Returns NULL if stack is empty.

proc GPU_GetCurrentMatrix*(): ptr cfloat {.cdecl, importc: "GPU_GetCurrentMatrix",
                                       dynlib: libName.}
## ! Returns the current modelview matrix from the top of the matrix stack.  Returns NULL if stack is empty.

proc GPU_GetModelView*(): ptr cfloat {.cdecl, importc: "GPU_GetModelView",
                                   dynlib: libName.}
## ! Returns the current projection matrix from the top of the matrix stack.  Returns NULL if stack is empty.

proc GPU_GetProjection*(): ptr cfloat {.cdecl, importc: "GPU_GetProjection",
                                    dynlib: libName.}
## ! Copies the current modelview-projection matrix into the given 'result' matrix (result = P*M).

proc GPU_GetModelViewProjection*(result: ptr cfloat) {.cdecl,
    importc: "GPU_GetModelViewProjection", dynlib: libName.}
##  Matrix stack manipulators
## ! Changes matrix mode to either GPU_PROJECTION or GPU_MODELVIEW.  Further matrix stack operations manipulate that particular stack.

proc GPU_MatrixMode*(matrix_mode: cint) {.cdecl, importc: "GPU_MatrixMode",
                                       dynlib: libName.}
## ! Pushes the current matrix as a new matrix stack item.

proc GPU_PushMatrix*() {.cdecl, importc: "GPU_PushMatrix", dynlib: libName.}
## ! Removes the current matrix from the stack.

proc GPU_PopMatrix*() {.cdecl, importc: "GPU_PopMatrix", dynlib: libName.}
## ! Fills current matrix with the identity matrix.

proc GPU_LoadIdentity*() {.cdecl, importc: "GPU_LoadIdentity", dynlib: libName.}
## ! Multiplies an orthographic projection matrix into the current matrix.

proc GPU_Ortho*(left: cfloat; right: cfloat; bottom: cfloat; top: cfloat; near: cfloat;
               far: cfloat) {.cdecl, importc: "GPU_Ortho", dynlib: libName.}
## ! Multiplies a perspective projection matrix into the current matrix.

proc GPU_Frustum*(left: cfloat; right: cfloat; bottom: cfloat; top: cfloat; near: cfloat;
                 far: cfloat) {.cdecl, importc: "GPU_Frustum", dynlib: libName.}
## ! Adds a translation into the current matrix.

proc GPU_Translate*(x: cfloat; y: cfloat; z: cfloat) {.cdecl, importc: "GPU_Translate",
    dynlib: libName.}
## ! Multiplies a scaling matrix into the current matrix.

proc GPU_Scale*(sx: cfloat; sy: cfloat; sz: cfloat) {.cdecl, importc: "GPU_Scale",
    dynlib: libName.}
## ! Multiplies a rotation matrix into the current matrix.

proc GPU_Rotate*(degrees: cfloat; x: cfloat; y: cfloat; z: cfloat) {.cdecl,
    importc: "GPU_Rotate", dynlib: libName.}
## ! Multiplies a given matrix into the current matrix.

proc GPU_MultMatrix*(matrix4x4: ptr cfloat) {.cdecl, importc: "GPU_MultMatrix",
    dynlib: libName.}
##  End of Matrix
## ! @}
## ! \ingroup Rendering
##   @{
## ! Clears the contents of the given render target.  Fills the target with color {0, 0, 0, 0}.

proc GPU_Clear*(target: ptr GPU_Target) {.cdecl, importc: "GPU_Clear",
                                      dynlib: libName.}
## ! Fills the given render target with a color.

proc GPU_ClearColor*(target: ptr GPU_Target; color: SDL_Color) {.cdecl,
    importc: "GPU_ClearColor", dynlib: libName.}
## ! Fills the given render target with a color (alpha is 255, fully opaque).

proc GPU_ClearRGB*(target: ptr GPU_Target; r: uint8; g: uint8; b: uint8) {.cdecl,
    importc: "GPU_ClearRGB", dynlib: libName.}
## ! Fills the given render target with a color.

proc GPU_ClearRGBA*(target: ptr GPU_Target; r: uint8; g: uint8; b: uint8; a: uint8) {.cdecl,
    importc: "GPU_ClearRGBA", dynlib: libName.}
## ! Draws the given image to the given render target.
##  \param src_rect The region of the source image to use.  Pass NULL for the entire image.
##  \param x Destination x-position
##  \param y Destination y-position

proc GPU_Blit*(image: ptr GPU_Image; src_rect: ptr GPU_Rect; target: ptr GPU_Target;
              x: cfloat; y: cfloat) {.cdecl, importc: "GPU_Blit",
                                  dynlib: libName.}
## ! Rotates and draws the given image to the given render target.
##  \param src_rect The region of the source image to use.  Pass NULL for the entire image.
##  \param x Destination x-position
##  \param y Destination y-position
##  \param degrees Rotation angle (in degrees)

proc GPU_BlitRotate*(image: ptr GPU_Image; src_rect: ptr GPU_Rect;
                    target: ptr GPU_Target; x: cfloat; y: cfloat; degrees: cfloat) {.
    cdecl, importc: "GPU_BlitRotate", dynlib: libName.}
## ! Scales and draws the given image to the given render target.
##  \param src_rect The region of the source image to use.  Pass NULL for the entire image.
##  \param x Destination x-position
##  \param y Destination y-position
##  \param scaleX Horizontal stretch factor
##  \param scaleY Vertical stretch factor

proc GPU_BlitScale*(image: ptr GPU_Image; src_rect: ptr GPU_Rect;
                   target: ptr GPU_Target; x: cfloat; y: cfloat; scaleX: cfloat;
                   scaleY: cfloat) {.cdecl, importc: "GPU_BlitScale",
                                   dynlib: libName.}
## ! Scales, rotates, and draws the given image to the given render target.
##  \param src_rect The region of the source image to use.  Pass NULL for the entire image.
##  \param x Destination x-position
##  \param y Destination y-position
##  \param degrees Rotation angle (in degrees)
##  \param scaleX Horizontal stretch factor
##  \param scaleY Vertical stretch factor

proc GPU_BlitTransform*(image: ptr GPU_Image; src_rect: ptr GPU_Rect;
                       target: ptr GPU_Target; x: cfloat; y: cfloat; degrees: cfloat;
                       scaleX: cfloat; scaleY: cfloat) {.cdecl,
    importc: "GPU_BlitTransform", dynlib: libName.}
## ! Scales, rotates around a pivot point, and draws the given image to the given render target.  The drawing point (x, y) coincides with the pivot point on the src image (pivot_x, pivot_y).
##  \param src_rect The region of the source image to use.  Pass NULL for the entire image.
##  \param x Destination x-position
##  \param y Destination y-position
##  \param pivot_x Pivot x-position (in image coordinates)
##  \param pivot_y Pivot y-position (in image coordinates)
##  \param degrees Rotation angle (in degrees)
##  \param scaleX Horizontal stretch factor
##  \param scaleY Vertical stretch factor

proc GPU_BlitTransformX*(image: ptr GPU_Image; src_rect: ptr GPU_Rect;
                        target: ptr GPU_Target; x: cfloat; y: cfloat; pivot_x: cfloat;
                        pivot_y: cfloat; degrees: cfloat; scaleX: cfloat;
                        scaleY: cfloat) {.cdecl, importc: "GPU_BlitTransformX",
                                        dynlib: libName.}
## ! Draws the given image to the given render target, scaling it to fit the destination region.
##  \param src_rect The region of the source image to use.  Pass NULL for the entire image.
##  \param dest_rect The region of the destination target image to draw upon.  Pass NULL for the entire target.
## 

proc GPU_BlitRect*(image: ptr GPU_Image; src_rect: ptr GPU_Rect;
                  target: ptr GPU_Target; dest_rect: ptr GPU_Rect) {.cdecl,
    importc: "GPU_BlitRect", dynlib: libName.}
## ! Draws the given image to the given render target, scaling it to fit the destination region.
##  \param src_rect The region of the source image to use.  Pass NULL for the entire image.
##  \param dest_rect The region of the destination target image to draw upon.  Pass NULL for the entire target.
##  \param degrees Rotation angle (in degrees)
##  \param pivot_x Pivot x-position (in image coordinates)
##  \param pivot_y Pivot y-position (in image coordinates)
##  \param flip_direction A GPU_FlipEnum value (or bitwise OR'd combination) that specifies which direction the image should be flipped.
## 

proc GPU_BlitRectX*(image: ptr GPU_Image; src_rect: ptr GPU_Rect;
                   target: ptr GPU_Target; dest_rect: ptr GPU_Rect; degrees: cfloat;
                   pivot_x: cfloat; pivot_y: cfloat; flip_direction: GPU_FlipEnum) {.
    cdecl, importc: "GPU_BlitRectX", dynlib: libName.}
## ! Renders triangles from the given set of vertices.  This lets you render arbitrary 2D geometry.  It is a direct path to the GPU, so the format is different than typical SDL_gpu calls.
##  \param values A tightly-packed array of vertex position (e.g. x,y), texture coordinates (e.g. s,t), and color (e.g. r,g,b,a) values.  Texture coordinates and color values are expected to be already normalized to 0.0 - 1.0.  Pass NULL to render with only custom shader attributes.
##  \param indices If not NULL, this is used to specify which vertices to use and in what order (i.e. it indexes the vertices in the 'values' array).
##  \param flags Bit flags to control the interpretation of the 'values' array parameters.
## 

proc GPU_TriangleBatch*(image: ptr GPU_Image; target: ptr GPU_Target;
                       num_vertices: cushort; values: ptr cfloat; num_indices: cuint;
                       indices: ptr cushort; flags: GPU_BatchFlagEnum) {.cdecl,
    importc: "GPU_TriangleBatch", dynlib: libName.}
## ! Renders triangles from the given set of vertices.  This lets you render arbitrary 2D geometry.  It is a direct path to the GPU, so the format is different than typical SDL_gpu calls.
##  \param values A tightly-packed array of vertex position (e.g. x,y), texture coordinates (e.g. s,t), and color (e.g. r,g,b,a) values.  Texture coordinates and color values are expected to be already normalized to 0.0 - 1.0 (or 0 - 255 for 8-bit color components).  Pass NULL to render with only custom shader attributes.
##  \param indices If not NULL, this is used to specify which vertices to use and in what order (i.e. it indexes the vertices in the 'values' array).
##  \param flags Bit flags to control the interpretation of the 'values' array parameters.
## 

proc GPU_TriangleBatchX*(image: ptr GPU_Image; target: ptr GPU_Target;
                        num_vertices: cushort; values: pointer; num_indices: cuint;
                        indices: ptr cushort; flags: GPU_BatchFlagEnum) {.cdecl,
    importc: "GPU_TriangleBatchX", dynlib: libName.}
## ! Send all buffered blitting data to the current context target.

proc GPU_FlushBlitBuffer*() {.cdecl, importc: "GPU_FlushBlitBuffer",
                            dynlib: libName.}
## ! Updates the given target's associated window.  For non-context targets (e.g. image targets), this will flush the blit buffer.

proc GPU_Flip*(target: ptr GPU_Target) {.cdecl, importc: "GPU_Flip",
                                     dynlib: libName.}
##  End of Rendering
## ! @}
## ! \ingroup Shapes
##   @{
## ! Renders a colored point.
##  \param target The destination render target
##  \param x x-coord of the point
##  \param y y-coord of the point
##  \param color The color of the shape to render
## 

proc GPU_Pixel*(target: ptr GPU_Target; x: cfloat; y: cfloat; color: SDL_Color) {.cdecl,
    importc: "GPU_Pixel", dynlib: libName.}
## ! Renders a colored line.
##  \param target The destination render target
##  \param x1 x-coord of starting point
##  \param y1 y-coord of starting point
##  \param x2 x-coord of ending point
##  \param y2 y-coord of ending point
##  \param color The color of the shape to render
## 

proc GPU_Line*(target: ptr GPU_Target; x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat;
              color: SDL_Color) {.cdecl, importc: "GPU_Line", dynlib: libName.}
## ! Renders a colored arc curve (circle segment).
##  \param target The destination render target
##  \param x x-coord of center point
##  \param y y-coord of center point
##  \param radius The radius of the circle / distance from the center point that rendering will occur
##  \param start_angle The angle to start from, in degrees.  Measured clockwise from the positive x-axis.
##  \param end_angle The angle to end at, in degrees.  Measured clockwise from the positive x-axis.
##  \param color The color of the shape to render
## 

proc GPU_Arc*(target: ptr GPU_Target; x: cfloat; y: cfloat; radius: cfloat;
             start_angle: cfloat; end_angle: cfloat; color: SDL_Color) {.cdecl,
    importc: "GPU_Arc", dynlib: libName.}
## ! Renders a colored filled arc (circle segment / pie piece).
##  \param target The destination render target
##  \param x x-coord of center point
##  \param y y-coord of center point
##  \param radius The radius of the circle / distance from the center point that rendering will occur
##  \param start_angle The angle to start from, in degrees.  Measured clockwise from the positive x-axis.
##  \param end_angle The angle to end at, in degrees.  Measured clockwise from the positive x-axis.
##  \param color The color of the shape to render
## 

proc GPU_ArcFilled*(target: ptr GPU_Target; x: cfloat; y: cfloat; radius: cfloat;
                   start_angle: cfloat; end_angle: cfloat; color: SDL_Color) {.cdecl,
    importc: "GPU_ArcFilled", dynlib: libName.}
## ! Renders a colored circle outline.
##  \param target The destination render target
##  \param x x-coord of center point
##  \param y y-coord of center point
##  \param radius The radius of the circle / distance from the center point that rendering will occur
##  \param color The color of the shape to render
## 

proc GPU_Circle*(target: ptr GPU_Target; x: cfloat; y: cfloat; radius: cfloat;
                color: SDL_Color) {.cdecl, importc: "GPU_Circle",
                                  dynlib: libName.}
## ! Renders a colored filled circle.
##  \param target The destination render target
##  \param x x-coord of center point
##  \param y y-coord of center point
##  \param radius The radius of the circle / distance from the center point that rendering will occur
##  \param color The color of the shape to render
## 

proc GPU_CircleFilled*(target: ptr GPU_Target; x: cfloat; y: cfloat; radius: cfloat;
                      color: SDL_Color) {.cdecl, importc: "GPU_CircleFilled",
                                        dynlib: libName.}
## ! Renders a colored ellipse outline.
##  \param target The destination render target
##  \param x x-coord of center point
##  \param y y-coord of center point
##  \param rx x-radius of ellipse
##  \param ry y-radius of ellipse
##  \param degrees The angle to rotate the ellipse
##  \param color The color of the shape to render
## 

proc GPU_Ellipse*(target: ptr GPU_Target; x: cfloat; y: cfloat; rx: cfloat; ry: cfloat;
                 degrees: cfloat; color: SDL_Color) {.cdecl, importc: "GPU_Ellipse",
    dynlib: libName.}
## ! Renders a colored filled ellipse.
##  \param target The destination render target
##  \param x x-coord of center point
##  \param y y-coord of center point
##  \param rx x-radius of ellipse
##  \param ry y-radius of ellipse
##  \param degrees The angle to rotate the ellipse
##  \param color The color of the shape to render
## 

proc GPU_EllipseFilled*(target: ptr GPU_Target; x: cfloat; y: cfloat; rx: cfloat;
                       ry: cfloat; degrees: cfloat; color: SDL_Color) {.cdecl,
    importc: "GPU_EllipseFilled", dynlib: libName.}
## ! Renders a colored annular sector outline (ring segment).
##  \param target The destination render target
##  \param x x-coord of center point
##  \param y y-coord of center point
##  \param inner_radius The inner radius of the ring
##  \param outer_radius The outer radius of the ring
##  \param start_angle The angle to start from, in degrees.  Measured clockwise from the positive x-axis.
##  \param end_angle The angle to end at, in degrees.  Measured clockwise from the positive x-axis.
##  \param color The color of the shape to render
## 

proc GPU_Sector*(target: ptr GPU_Target; x: cfloat; y: cfloat; inner_radius: cfloat;
                outer_radius: cfloat; start_angle: cfloat; end_angle: cfloat;
                color: SDL_Color) {.cdecl, importc: "GPU_Sector",
                                  dynlib: libName.}
## ! Renders a colored filled annular sector (ring segment).
##  \param target The destination render target
##  \param x x-coord of center point
##  \param y y-coord of center point
##  \param inner_radius The inner radius of the ring
##  \param outer_radius The outer radius of the ring
##  \param start_angle The angle to start from, in degrees.  Measured clockwise from the positive x-axis.
##  \param end_angle The angle to end at, in degrees.  Measured clockwise from the positive x-axis.
##  \param color The color of the shape to render
## 

proc GPU_SectorFilled*(target: ptr GPU_Target; x: cfloat; y: cfloat;
                      inner_radius: cfloat; outer_radius: cfloat;
                      start_angle: cfloat; end_angle: cfloat; color: SDL_Color) {.
    cdecl, importc: "GPU_SectorFilled", dynlib: libName.}
## ! Renders a colored triangle outline.
##  \param target The destination render target
##  \param x1 x-coord of first point
##  \param y1 y-coord of first point
##  \param x2 x-coord of second point
##  \param y2 y-coord of second point
##  \param x3 x-coord of third point
##  \param y3 y-coord of third point
##  \param color The color of the shape to render
## 

proc GPU_Tri*(target: ptr GPU_Target; x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat;
             x3: cfloat; y3: cfloat; color: SDL_Color) {.cdecl, importc: "GPU_Tri",
    dynlib: libName.}
## ! Renders a colored filled triangle.
##  \param target The destination render target
##  \param x1 x-coord of first point
##  \param y1 y-coord of first point
##  \param x2 x-coord of second point
##  \param y2 y-coord of second point
##  \param x3 x-coord of third point
##  \param y3 y-coord of third point
##  \param color The color of the shape to render
## 

proc GPU_TriFilled*(target: ptr GPU_Target; x1: cfloat; y1: cfloat; x2: cfloat;
                   y2: cfloat; x3: cfloat; y3: cfloat; color: SDL_Color) {.cdecl,
    importc: "GPU_TriFilled", dynlib: libName.}
## ! Renders a colored rectangle outline.
##  \param target The destination render target
##  \param x1 x-coord of top-left corner
##  \param y1 y-coord of top-left corner
##  \param x2 x-coord of bottom-right corner
##  \param y2 y-coord of bottom-right corner
##  \param color The color of the shape to render
## 

proc GPU_Rectangle*(target: ptr GPU_Target; x1: cfloat; y1: cfloat; x2: cfloat;
                   y2: cfloat; color: SDL_Color) {.cdecl, importc: "GPU_Rectangle",
    dynlib: libName.}
## ! Renders a colored rectangle outline.
##  \param target The destination render target
##  \param rect The rectangular area to draw
##  \param color The color of the shape to render
## 

proc GPU_Rectangle2*(target: ptr GPU_Target; rect: GPU_Rect; color: SDL_Color) {.cdecl,
    importc: "GPU_Rectangle2", dynlib: libName.}
## ! Renders a colored filled rectangle.
##  \param target The destination render target
##  \param x1 x-coord of top-left corner
##  \param y1 y-coord of top-left corner
##  \param x2 x-coord of bottom-right corner
##  \param y2 y-coord of bottom-right corner
##  \param color The color of the shape to render
## 

proc GPU_RectangleFilled*(target: ptr GPU_Target; x1: cfloat; y1: cfloat; x2: cfloat;
                         y2: cfloat; color: SDL_Color) {.cdecl,
    importc: "GPU_RectangleFilled", dynlib: libName.}
## ! Renders a colored filled rectangle.
##  \param target The destination render target
##  \param rect The rectangular area to draw
##  \param color The color of the shape to render
## 

proc GPU_RectangleFilled2*(target: ptr GPU_Target; rect: GPU_Rect; color: SDL_Color) {.
    cdecl, importc: "GPU_RectangleFilled2", dynlib: libName.}
## ! Renders a colored rounded (filleted) rectangle outline.
##  \param target The destination render target
##  \param x1 x-coord of top-left corner
##  \param y1 y-coord of top-left corner
##  \param x2 x-coord of bottom-right corner
##  \param y2 y-coord of bottom-right corner
##  \param radius The radius of the corners
##  \param color The color of the shape to render
## 

proc GPU_RectangleRound*(target: ptr GPU_Target; x1: cfloat; y1: cfloat; x2: cfloat;
                        y2: cfloat; radius: cfloat; color: SDL_Color) {.cdecl,
    importc: "GPU_RectangleRound", dynlib: libName.}
## ! Renders a colored rounded (filleted) rectangle outline.
##  \param target The destination render target
##  \param rect The rectangular area to draw
##  \param radius The radius of the corners
##  \param color The color of the shape to render
## 

proc GPU_RectangleRound2*(target: ptr GPU_Target; rect: GPU_Rect; radius: cfloat;
                         color: SDL_Color) {.cdecl, importc: "GPU_RectangleRound2",
    dynlib: libName.}
## ! Renders a colored filled rounded (filleted) rectangle.
##  \param target The destination render target
##  \param x1 x-coord of top-left corner
##  \param y1 y-coord of top-left corner
##  \param x2 x-coord of bottom-right corner
##  \param y2 y-coord of bottom-right corner
##  \param radius The radius of the corners
##  \param color The color of the shape to render
## 

proc GPU_RectangleRoundFilled*(target: ptr GPU_Target; x1: cfloat; y1: cfloat;
                              x2: cfloat; y2: cfloat; radius: cfloat; color: SDL_Color) {.
    cdecl, importc: "GPU_RectangleRoundFilled", dynlib: libName.}
## ! Renders a colored filled rounded (filleted) rectangle.
##  \param target The destination render target
##  \param rect The rectangular area to draw
##  \param radius The radius of the corners
##  \param color The color of the shape to render
## 

proc GPU_RectangleRoundFilled2*(target: ptr GPU_Target; rect: GPU_Rect;
                               radius: cfloat; color: SDL_Color) {.cdecl,
    importc: "GPU_RectangleRoundFilled2", dynlib: libName.}
## ! Renders a colored polygon outline.  The vertices are expected to define a convex polygon.
##  \param target The destination render target
##  \param num_vertices Number of vertices (x and y pairs)
##  \param vertices An array of vertex positions stored as interlaced x and y coords, e.g. {x1, y1, x2, y2, ...}
##  \param color The color of the shape to render
## 

proc GPU_Polygon*(target: ptr GPU_Target; num_vertices: cuint; vertices: ptr cfloat;
                 color: SDL_Color) {.cdecl, importc: "GPU_Polygon",
                                   dynlib: libName.}
## ! Renders a colored filled polygon.  The vertices are expected to define a convex polygon.
##  \param target The destination render target
##  \param num_vertices Number of vertices (x and y pairs)
##  \param vertices An array of vertex positions stored as interlaced x and y coords, e.g. {x1, y1, x2, y2, ...}
##  \param color The color of the shape to render
## 

proc GPU_PolygonFilled*(target: ptr GPU_Target; num_vertices: cuint;
                       vertices: ptr cfloat; color: SDL_Color) {.cdecl,
    importc: "GPU_PolygonFilled", dynlib: libName.}
##  End of Shapes
## ! @}
## ! \ingroup ShaderInterface
##   @{
## ! Creates a new, empty shader program.  You will need to compile shaders, attach them to the program, then link the program.
##  \see GPU_AttachShader
##  \see GPU_LinkShaderProgram
## 

proc GPU_CreateShaderProgram*(): uint32 {.cdecl, importc: "GPU_CreateShaderProgram",
                                       dynlib: libName.}
## ! Deletes a shader program.

proc GPU_FreeShaderProgram*(program_object: uint32) {.cdecl,
    importc: "GPU_FreeShaderProgram", dynlib: libName.}
## ! Loads shader source from an sdl2.RWops, compiles it, and returns the new shader object.

proc GPU_CompileShader_RW*(shader_type: GPU_ShaderEnum;
                          shader_source: ptr sdl2.RWops; free_rwops: GPU_bool): uint32 {.
    cdecl, importc: "GPU_CompileShader_RW", dynlib: libName.}
## ! Compiles shader source and returns the new shader object.

proc GPU_CompileShader*(shader_type: GPU_ShaderEnum; shader_source: cstring): uint32 {.
    cdecl, importc: "GPU_CompileShader", dynlib: libName.}
## ! Loads shader source from a file, compiles it, and returns the new shader object.

proc GPU_LoadShader*(shader_type: GPU_ShaderEnum; filename: cstring): uint32 {.cdecl,
    importc: "GPU_LoadShader", dynlib: libName.}
## ! Creates and links a shader program with the given shader objects.

proc GPU_LinkShaders*(shader_object1: uint32; shader_object2: uint32): uint32 {.cdecl,
    importc: "GPU_LinkShaders", dynlib: libName.}
## ! Creates and links a shader program with the given shader objects.

proc GPU_LinkManyShaders*(shader_objects: ptr uint32; count: cint): uint32 {.cdecl,
    importc: "GPU_LinkManyShaders", dynlib: libName.}
## ! Deletes a shader object.

proc GPU_FreeShader*(shader_object: uint32) {.cdecl, importc: "GPU_FreeShader",
    dynlib: libName.}
## ! Attaches a shader object to a shader program for future linking.

proc GPU_AttachShader*(program_object: uint32; shader_object: uint32) {.cdecl,
    importc: "GPU_AttachShader", dynlib: libName.}
## ! Detaches a shader object from a shader program.

proc GPU_DetachShader*(program_object: uint32; shader_object: uint32) {.cdecl,
    importc: "GPU_DetachShader", dynlib: libName.}
## ! Links a shader program with any attached shader objects.

proc GPU_LinkShaderProgram*(program_object: uint32): GPU_bool {.cdecl,
    importc: "GPU_LinkShaderProgram", dynlib: libName.}
## ! \return The current shader program

proc GPU_GetCurrentShaderProgram*(): uint32 {.cdecl,
    importc: "GPU_GetCurrentShaderProgram", dynlib: libName.}
## ! Returns 1 if the given shader program is a default shader for the current context, 0 otherwise.

proc GPU_IsDefaultShaderProgram*(program_object: uint32): GPU_bool {.cdecl,
    importc: "GPU_IsDefaultShaderProgram", dynlib: libName.}
## ! Activates the given shader program.  Passing NULL for 'block' will disable the built-in shader variables for custom shaders until a GPU_ShaderBlock is set again.

proc GPU_ActivateShaderProgram*(program_object: uint32;
                               `block`: ptr GPU_ShaderBlock) {.cdecl,
    importc: "GPU_ActivateShaderProgram", dynlib: libName.}
## ! Deactivates the current shader program (activates program 0).

proc GPU_DeactivateShaderProgram*() {.cdecl,
                                    importc: "GPU_DeactivateShaderProgram",
                                    dynlib: libName.}
## ! Returns the last shader log message.

proc GPU_GetShaderMessage*(): cstring {.cdecl, importc: "GPU_GetShaderMessage",
                                     dynlib: libName.}
## ! Returns an integer representing the location of the specified attribute shader variable.

proc GPU_GetAttributeLocation*(program_object: uint32; attrib_name: cstring): cint {.
    cdecl, importc: "GPU_GetAttributeLocation", dynlib: libName.}
## ! Returns a filled GPU_AttributeFormat object.

proc GPU_MakeAttributeFormat*(num_elems_per_vertex: cint; `type`: GPU_TypeEnum;
                             normalize: GPU_bool; stride_bytes: cint;
                             offset_bytes: cint): GPU_AttributeFormat {.cdecl,
    importc: "GPU_MakeAttributeFormat", dynlib: libName.}
## ! Returns a filled GPU_Attribute object.

proc GPU_MakeAttribute*(location: cint; values: pointer; format: GPU_AttributeFormat): GPU_Attribute {.
    cdecl, importc: "GPU_MakeAttribute", dynlib: libName.}
## ! Returns an integer representing the location of the specified uniform shader variable.

proc GPU_GetUniformLocation*(program_object: uint32; uniform_name: cstring): cint {.
    cdecl, importc: "GPU_GetUniformLocation", dynlib: libName.}
## ! Loads the given shader program's built-in attribute and uniform locations.

proc GPU_LoadShaderBlock*(program_object: uint32; position_name: cstring;
                         texcoord_name: cstring; color_name: cstring;
                         modelViewMatrix_name: cstring): GPU_ShaderBlock {.cdecl,
    importc: "GPU_LoadShaderBlock", dynlib: libName.}
## ! Sets the current shader block to use the given attribute and uniform locations.

proc GPU_SetShaderBlock*(`block`: GPU_ShaderBlock) {.cdecl,
    importc: "GPU_SetShaderBlock", dynlib: libName.}
## ! Gets the shader block for the current shader.

proc GPU_GetShaderBlock*(): GPU_ShaderBlock {.cdecl, importc: "GPU_GetShaderBlock",
    dynlib: libName.}
## ! Sets the given image unit to the given image so that a custom shader can sample multiple textures.
##     \param image The source image/texture.  Pass NULL to disable the image unit.
##     \param location The uniform location of a texture sampler
##     \param image_unit The index of the texture unit to set.  0 is the first unit, which is used by SDL_gpu's blitting functions.  1 would be the second unit.

proc GPU_SetShaderImage*(image: ptr GPU_Image; location: cint; image_unit: cint) {.
    cdecl, importc: "GPU_SetShaderImage", dynlib: libName.}
## ! Fills "values" with the value of the uniform shader variable at the given location.

proc GPU_GetUniformiv*(program_object: uint32; location: cint; values: ptr cint) {.
    cdecl, importc: "GPU_GetUniformiv", dynlib: libName.}
## ! Sets the value of the integer uniform shader variable at the given location.
##     This is equivalent to calling GPU_SetUniformiv(location, 1, 1, &value).

proc GPU_SetUniformi*(location: cint; value: cint) {.cdecl,
    importc: "GPU_SetUniformi", dynlib: libName.}
## ! Sets the value of the integer uniform shader variable at the given location.

proc GPU_SetUniformiv*(location: cint; num_elements_per_value: cint;
                      num_values: cint; values: ptr cint) {.cdecl,
    importc: "GPU_SetUniformiv", dynlib: libName.}
## ! Fills "values" with the value of the uniform shader variable at the given location.

proc GPU_GetUniformuiv*(program_object: uint32; location: cint; values: ptr cuint) {.
    cdecl, importc: "GPU_GetUniformuiv", dynlib: libName.}
## ! Sets the value of the unsigned integer uniform shader variable at the given location.
##     This is equivalent to calling GPU_SetUniformuiv(location, 1, 1, &value).

proc GPU_SetUniformui*(location: cint; value: cuint) {.cdecl,
    importc: "GPU_SetUniformui", dynlib: libName.}
## ! Sets the value of the unsigned integer uniform shader variable at the given location.

proc GPU_SetUniformuiv*(location: cint; num_elements_per_value: cint;
                       num_values: cint; values: ptr cuint) {.cdecl,
    importc: "GPU_SetUniformuiv", dynlib: libName.}
## ! Fills "values" with the value of the uniform shader variable at the given location.

proc GPU_GetUniformfv*(program_object: uint32; location: cint; values: ptr cfloat) {.
    cdecl, importc: "GPU_GetUniformfv", dynlib: libName.}
## ! Sets the value of the floating point uniform shader variable at the given location.
##     This is equivalent to calling GPU_SetUniformfv(location, 1, 1, &value).

proc GPU_SetUniformf*(location: cint; value: cfloat) {.cdecl,
    importc: "GPU_SetUniformf", dynlib: libName.}
## ! Sets the value of the floating point uniform shader variable at the given location.

proc GPU_SetUniformfv*(location: cint; num_elements_per_value: cint;
                      num_values: cint; values: ptr cfloat) {.cdecl,
    importc: "GPU_SetUniformfv", dynlib: libName.}
## ! Fills "values" with the value of the uniform shader variable at the given location.  The results are identical to calling GPU_GetUniformfv().  Matrices are gotten in column-major order.

proc GPU_GetUniformMatrixfv*(program_object: uint32; location: cint;
                            values: ptr cfloat) {.cdecl,
    importc: "GPU_GetUniformMatrixfv", dynlib: libName.}
## ! Sets the value of the matrix uniform shader variable at the given location.  The size of the matrices sent is specified by num_rows and num_columns.  Rows and columns must be between 2 and 4.

proc GPU_SetUniformMatrixfv*(location: cint; num_matrices: cint; num_rows: cint;
                            num_columns: cint; transpose: GPU_bool;
                            values: ptr cfloat) {.cdecl,
    importc: "GPU_SetUniformMatrixfv", dynlib: libName.}
## ! Sets a constant-value shader attribute that will be used for each rendered vertex.

proc GPU_SetAttributef*(location: cint; value: cfloat) {.cdecl,
    importc: "GPU_SetAttributef", dynlib: libName.}
## ! Sets a constant-value shader attribute that will be used for each rendered vertex.

proc GPU_SetAttributei*(location: cint; value: cint) {.cdecl,
    importc: "GPU_SetAttributei", dynlib: libName.}
## ! Sets a constant-value shader attribute that will be used for each rendered vertex.

proc GPU_SetAttributeui*(location: cint; value: cuint) {.cdecl,
    importc: "GPU_SetAttributeui", dynlib: libName.}
## ! Sets a constant-value shader attribute that will be used for each rendered vertex.

proc GPU_SetAttributefv*(location: cint; num_elements: cint; value: ptr cfloat) {.cdecl,
    importc: "GPU_SetAttributefv", dynlib: libName.}
## ! Sets a constant-value shader attribute that will be used for each rendered vertex.

proc GPU_SetAttributeiv*(location: cint; num_elements: cint; value: ptr cint) {.cdecl,
    importc: "GPU_SetAttributeiv", dynlib: libName.}
## ! Sets a constant-value shader attribute that will be used for each rendered vertex.

proc GPU_SetAttributeuiv*(location: cint; num_elements: cint; value: ptr cuint) {.cdecl,
    importc: "GPU_SetAttributeuiv", dynlib: libName.}
## ! Enables a shader attribute and sets its source data.

proc GPU_SetAttributeSource*(num_values: cint; source: GPU_Attribute) {.cdecl,
    importc: "GPU_SetAttributeSource", dynlib: libName.}
##  End of ShaderInterface
## ! @}

