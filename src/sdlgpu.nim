when defined(Windows):
  const libName* = "libSDL2_gpu.dll"
elif defined(Linux):
  const libName* = "libSDL2_gpu.so"
elif defined(MacOsX):
  const libName* = "libSDL2_gpu.dylib"
      
import sdl2 

# Compile-time versions
const
  SDL_GPU_VERSION_MAJOR* = 0
  SDL_GPU_VERSION_MINOR* = 11
  SDL_GPU_VERSION_PATCH* = 0

# These bindings are only for SDL2
const SDL_GPU_USE_SDL2* = true

# Check for bool support
const
  GPU_HAVE_STDC* = 1
  GPU_HAVE_C99* = 1
  GPU_HAVE_GNUC* = 1
  GPU_HAVE_MSVC* = 1

type GPU_bool* = bool
const
  GPU_FALSE* = 0
  GPU_TRUE* = 1


# A struct representing a rectangular area with floating point precision.
type GPU_Rect* {.bycopy.} = object
  x*, y*: cfloat
  w*, h*: cfloat

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


# Renderer ID object for identifying a specific renderer.
type GPU_RendererID* {.bycopy.} = object
  name*: cstring
  renderer*: GPU_RendererEnum
  major_version*: cint
  minor_version*: cint

# Comparison operations (for depth testing)
# Values chosen for direct OpenGL compatibility.
type GPU_ComparisonEnum* {.size: sizeof(cint).} = enum
  GPU_NEVER = 0x0200,
  GPU_LESS = 0x0201,
  GPU_EQUAL = 0x0202,
  GPU_LEQUAL = 0x0203,
  GPU_GREATER = 0x0204,
  GPU_NOTEQUAL = 0x0205,
  GPU_GEQUAL = 0x0206,
  GPU_ALWAYS = 0x0207

# Blend component functions
# Values chosen for direct OpenGL compatibility.
type GPU_BlendFuncEnum* {.size: sizeof(cint).} = enum
  GPU_FUNC_ZERO = 0,
  GPU_FUNC_ONE = 1,
  GPU_FUNC_SRC_COLOR = 0x00000300,
  GPU_FUNC_ONE_MINUS_SRC = 0x00000301,
  GPU_FUNC_SRC_ALPHA = 0x00000302,
  GPU_FUNC_ONE_MINUS_SRC_ALPHA = 0x00000303,
  GPU_FUNC_DST_ALPHA = 0x00000304,
  GPU_FUNC_ONE_MINUS_DST_ALPHA = 0x00000305,
  GPU_FUNC_DST_COLOR = 0x00000306,
  GPU_FUNC_ONE_MINUS_DST = 0x00000307


# Blend component equations
# Values chosen for direct OpenGL compatibility.
type GPU_BlendEqEnum* {.size: sizeof(cint).} = enum
  GPU_EQ_ADD = 0x00008006,
  GPU_EQ_SUBTRACT = 0x0000800A,
  GPU_EQ_REVERSE_SUBTRACT = 0x0000800B

# Blend mode storage struct
type GPU_BlendMode* {.bycopy.} = object
  source_color*: GPU_BlendFuncEnum
  dest_color*: GPU_BlendFuncEnum
  source_alpha*: GPU_BlendFuncEnum
  dest_alpha*: GPU_BlendFuncEnum
  color_equation*: GPU_BlendEqEnum
  alpha_equation*: GPU_BlendEqEnum

# Blend mode presets 
type GPU_BlendPresetEnum* {.size: sizeof(cint).} = enum
  GPU_BLEND_NORMAL = 0,
  GPU_BLEND_PREMULTIPLIED_ALPHA = 1,
  GPU_BLEND_MULTIPLY = 2,
  GPU_BLEND_ADD = 3,
  GPU_BLEND_SUBTRACT = 4,
  GPU_BLEND_MOD_ALPHA = 5,
  GPU_BLEND_SET_ALPHA = 6,
  GPU_BLEND_SET = 7,
  GPU_BLEND_NORMAL_KEEP_ALPHA = 8,
  GPU_BLEND_NORMAL_ADD_ALPHA = 9,
  GPU_BLEND_NORMAL_FACTOR_ALPHA = 10


# Image filtering options.  These affect the quality/interpolation of colors when images are scaled. 
type GPU_FilterEnum* {.size: sizeof(cint).} = enum
  GPU_FILTER_NEAREST = 0,
  GPU_FILTER_LINEAR = 1,
  GPU_FILTER_LINEAR_MIPMAP = 2

# Snap modes.  Blitting with these modes will align the sprite with the target's pixel grid.
type GPU_SnapEnum* {.size: sizeof(cint).} = enum
  GPU_SNAP_NONE = 0,
  GPU_SNAP_POSITION = 1,
  GPU_SNAP_DIMENSIONS = 2,
  GPU_SNAP_POSITION_AND_DIMENSIONS = 3

# Image wrapping options.  These affect how images handle src_rect coordinates beyond their dimensions when blitted.
type GPU_WrapEnum* {.size: sizeof(cint).} = enum
  GPU_WRAP_NONE = 0,
  GPU_WRAP_REPEAT = 1,
  GPU_WRAP_MIRRORED = 2


# Image format enum
type GPU_FormatEnum* {.size: sizeof(cint).} = enum
  GPU_FORMAT_LUMINANCE = 1,
  GPU_FORMAT_LUMINANCE_ALPHA = 2,
  GPU_FORMAT_RGB = 3,
  GPU_FORMAT_RGBA = 4,
  GPU_FORMAT_ALPHA = 5,
  GPU_FORMAT_RG = 6,
  GPU_FORMAT_YCbCr422 = 7,
  GPU_FORMAT_YCbCr420P = 8

# File format enum
type GPU_FileFormatEnum* {.size: sizeof(cint).} = enum
  GPU_FILE_AUTO = 0,
  GPU_FILE_PNG,
  GPU_FILE_BMP,

# A backend-neutral type that is intended to hold a backend-specific handle/pointer to a texture.
type GPU_TextureHandle = pointer

# Camera object that determines viewing transform.
type GPU_Camera* {.bycopy.} = object
  x*, y*, z*: cfloat
  angle*: cfloat
  zoom*: cfloat
  z_near*: cfloat
  z_far*: cfloat

# Container for the built-in shader attribute and uniform locations (indices).
type GPU_ShaderBlock* {.bycopy.} = object
  position_loc*: cint        # Attributes
  texcoord_loc*: cint
  color_loc*: cint           # Uniforms
  modelViewProjection_loc*: cint

const
  GPU_MODELVIEW* = 0
  GPU_PROJECTION* = 1

# Matrix stack data structure for global vertex transforms.
const GPU_MATRIX_STACK_MAX* = 5

type GPU_MatrixStack* {.bycopy.} = object
  storage_size*: cuint
  size*: cuint
  matrix*: ptr ptr float

# Rendering context data.  Only GPU_Targets which represent windows will store this.
type GPU_Context* {.bycopy.} = object
  context*: pointer          # SDL_GLContext
  failed*: GPU_bool          # SDL window ID
  windowID*: uint32          # Actual window dimensions
  window_w*: cint
  window_h*: cint            # Drawable region dimensions
  drawable_w*: cint
  drawable_h*: cint          # Window dimensions for restoring windowed mode after GPU_SetFullscreen(1,1).
  stored_window_w*: cint
  stored_window_h*: cint     # Internal state
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

# Important GPU features which may not be supported depending on a device's extension support.  Can be bitwise OR'd together.
type GPU_FeatureEnum* = uint32
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

# Combined feature flags
const
  GPU_FEATURE_ALL_BASE* = GPU_FEATURE_RENDER_TARGETS
  GPU_FEATURE_ALL_BLEND_PRESETS* = (GPU_FEATURE_BLEND_EQUATIONS or GPU_FEATURE_BLEND_FUNC_SEPARATE)
  GPU_FEATURE_ALL_GL_FORMATS* = (GPU_FEATURE_GL_BGR or GPU_FEATURE_GL_BGRA or GPU_FEATURE_GL_ABGR)
  GPU_FEATURE_BASIC_SHADERS* = (GPU_FEATURE_FRAGMENT_SHADER or GPU_FEATURE_VERTEX_SHADER)
  GPU_FEATURE_ALL_SHADERS* = (GPU_FEATURE_FRAGMENT_SHADER or GPU_FEATURE_VERTEX_SHADER or GPU_FEATURE_GEOMETRY_SHADER)

type GPU_WindowFlagEnum* = uint32

# Initialization flags for changing default init parameters.  Can be bitwise OR'ed together.
# Default (0) is to use late swap vsync and double buffering.
type GPU_InitFlagEnum* = uint32
const
  GPU_INIT_ENABLE_VSYNC* = 0x1.uint32
  GPU_INIT_DISABLE_VSYNC* = 0x2.uint32
  GPU_INIT_DISABLE_DOUBLE_BUFFER* = 0x4.uint32
  GPU_INIT_DISABLE_AUTO_VIRTUAL_RESOLUTION* = 0x8.uint32
  GPU_INIT_REQUEST_COMPATIBILITY_PROFILE* = 0x10.uint32
  GPU_INIT_USE_ROW_BY_ROW_TEXTURE_UPLOAD_FALLBACK* = 0x20.uint32
  GPU_INIT_USE_COPY_TEXTURE_UPLOAD_FALLBACK* = 0x40.uint32

const GPU_DEFAULT_INIT_FLAGS* = 0

const GPU_NONE* = 0x0.uint32

# Bit flags for geometry batching.
type GPU_BatchFlagEnum* = uint32
const
  GPU_BATCH_XY* = 0x1.uint32
  GPU_BATCH_XYZ* = 0x2.uint32
  GPU_BATCH_ST* = 0x4.uint32
  GPU_BATCH_RGB* = 0x8.uint32
  GPU_BATCH_RGBA*  = 0x10.uint32
  GPU_BATCH_RGB8* = 0x20.uint32
  GPU_BATCH_RGBA8* = 0x40.uint32

const
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

# Bit flags for blitting into a rectangular region.
type GPU_FlipEnum* = uint32
const
  GPU_FLIP_NONE* = 0x0.uint32
  GPU_FLIP_HORIZONTAL* = 0x1.uint32
  GPU_FLIP_VERTICAL* = 0x2.uint32

# Type enumeration for GPU_AttributeFormat specifications.
type GPU_TypeEnum* = uint32

# Use OpenGL's values for simpler translation
const   
  GPU_TYPE_BYTE* = 0x1400.uint32
  GPU_TYPE_UNSIGNED_BYTE* = 0x1401.uint32
  GPU_TYPE_SHORT* = 0x1402.uint32
  GPU_TYPE_UNSIGNED_SHORT* = 0x1403.uint32
  GPU_TYPE_INT* = 0x1404.uint32
  GPU_TYPE_UNSIGNED_INT* = 0x1405.uint32
  GPU_TYPE_FLOAT* = 0x1406.uint32 
  GPU_TYPE_DOUBLE* = 0x140A.uint32

# Shader type enum.
type GPU_ShaderEnum* {.size: sizeof(cint).} = enum
  GPU_VERTEX_SHADER = 0,
  GPU_FRAGMENT_SHADER = 1,
  GPU_GEOMETRY_SHADER = 2

const GPU_PIXEL_SHADER* = GPU_FRAGMENT_SHADER

# Type enumeration for the shader language used by the renderer.
type GPU_ShaderLanguageEnum* {.size: sizeof(cint).} = enum
  GPU_LANGUAGE_NONE = 0,
  GPU_LANGUAGE_ARB_ASSEMBLY = 1,
  GPU_LANGUAGE_GLSL = 2,
  GPU_LANGUAGE_GLSLES = 3,
  GPU_LANGUAGE_HLSL = 4,
  GPU_LANGUAGE_CG = 5


type GPU_AttributeFormat* {.bycopy.} = object
  is_per_sprite*: GPU_bool   # Per-sprite values are expanded to 4 vertices
  num_elems_per_value*: cint
  `type`*: GPU_TypeEnum      # GPU_TYPE_FLOAT, GPU_TYPE_INT, GPU_TYPE_UNSIGNED_INT, etc.
  normalize*: GPU_bool
  stride_bytes*: cint        # Number of bytes between two vertex specifications
  offset_bytes*: cint        # Number of bytes to skip at the beginning of 'values'

type GPU_Attribute* {.bycopy.} = object
  location*: cint
  values*: pointer           # Expect 4 values for each sprite
  format*: GPU_AttributeFormat

type GPU_AttributeSource* {.bycopy.} = object
  enabled*: GPU_bool
  num_values*: cint
  next_value*: pointer       # Automatic storage format
  per_vertex_storage_stride_bytes*: cint
  per_vertex_storage_offset_bytes*: cint
  per_vertex_storage_size*: cint # Over 0 means that the per-vertex storage has been automatically allocated
  per_vertex_storage*: pointer   # Could point to the attribute's values or to allocated storage
  attribute*: GPU_Attribute

# Type enumeration for error codes.
type GPU_ErrorEnum* {.size: sizeof(cint).} = enum
  GPU_ERROR_NONE = 0,
  GPU_ERROR_BACKEND_ERROR = 1,
  GPU_ERROR_DATA_ERROR = 2,
  GPU_ERROR_USER_ERROR = 3,
  GPU_ERROR_UNSUPPORTED_FUNCTION = 4,
  GPU_ERROR_NULL_ARGUMENT = 5,
  GPU_ERROR_FILE_NOT_FOUND = 6

type GPU_ErrorObject* {.bycopy.} = object
  function*: cstring
  error*: GPU_ErrorEnum
  details*: cstring

# Type enumeration for debug levels.
type GPU_DebugLevelEnum* {.size: sizeof(cint).} = enum
  GPU_DEBUG_LEVEL_0 = 0,
  GPU_DEBUG_LEVEL_1 = 1,
  GPU_DEBUG_LEVEL_2 = 2,
  GPU_DEBUG_LEVEL_3 = 3

const GPU_DEBUG_LEVEL_MAX* = GPU_DEBUG_LEVEL_3

# Type enumeration for logging levels.
type GPU_LogLevelEnum* {.size: sizeof(cint).} = enum
  GPU_LOG_INFO = 0,
  GPU_LOG_WARNING,
  GPU_LOG_ERROR

type
  # Renderer object which specializes the API to a particular backend.
  GPU_Renderer* {.bycopy.} = object
    id*: GPU_RendererID        # Struct identifier of the renderer.
    requested_id*: GPU_RendererID
    SDL_init_flags*: GPU_WindowFlagEnum
    GPU_init_flags*: GPU_InitFlagEnum
    shader_language*: GPU_ShaderLanguageEnum
    min_shader_version*: cint
    max_shader_version*: cint
    enabled_features*: GPU_FeatureEnum       # Current display target
    current_context_target*: ptr GPU_Target  # 0 for inverted, 1 for mathematical
    coordinate_mode*: GPU_bool               # Default is (0.5, 0.5) - images draw centered.
    default_image_anchor_x*: cfloat
    default_image_anchor_y*: cfloat
    impl*: ptr GPU_RendererImpl
  
  # Private implementation of renderer members
  GPU_RendererImpl* {.bycopy.} = object
  
  # Render target object for use as a blitting destination.
  # A GPU_Target can be created from a GPU_Image with GPU_LoadTarget().
  # A GPU_Target can also represent a separate window with GPU_CreateTargetFromWindow().  In that case, 'context' is allocated and filled in.
  # Note: You must have passed the SDL_WINDOW_OPENGL flag to SDL_CreateWindow() for OpenGL renderers to work with new windows.
  # Free the memory with GPU_FreeTarget() when you're done.
  GPU_Target* {.bycopy.} = object
    renderer*: ptr GPU_Renderer
    context_target*: ptr GPU_Target
    image*: ptr GPU_Image
    data*: pointer
    w*, h*: uint16
    using_virtual_resolution*: GPU_bool
    base_w*: uint16
    base_h*: uint16            # The true dimensions of the underlying image or window
    use_clip_rect*: GPU_bool
    clip_rect*: GPU_Rect
    use_color*: GPU_bool
    color*: sdl2.Color
    viewport*: GPU_Rect        # Perspective and object viewing transforms.
    camera*: GPU_Camera
    use_depth_test*: GPU_bool
    use_depth_write*: GPU_bool
    depth_function*: GPU_ComparisonEnum
    use_camera*: GPU_bool      # Renderer context data.  NULL if the target does not represent a window or rendering context.
    context*: ptr GPU_Context
    refcount*: cint
    is_alias*: GPU_bool

  GPU_Image* {.bycopy.} = object
    renderer*: ptr GPU_Renderer
    context_target*: ptr GPU_Target
    target*: ptr GPU_Target
    w*, h*: uint16
    using_virtual_resolution*: GPU_bool
    format*: GPU_FormatEnum
    num_layers*: cint
    bytes_per_pixel*: cint
    base_w*: uint16
    base_h*: uint16            # Original image dimensions
    texture_w*: uint16
    texture_h*: uint16         # Underlying texture dimensions
    has_mipmaps*: GPU_bool
    anchor_x*: cfloat          # Normalized coords for the point at which the image is blitted.  Default is (0.5, 0.5), that is, the image is drawn centered.
    anchor_y*: cfloat          # These are interpreted according to GPU_SetCoordinateMode() and range from (0.0 - 1.0) normally.
    color*: sdl2.Color
    use_blending*: GPU_bool
    blend_mode*: GPU_BlendMode
    filter_mode*: GPU_FilterEnum
    snap_mode*: GPU_SnapEnum
    wrap_mode_x*: GPU_WrapEnum
    wrap_mode_y*: GPU_WrapEnum
    data*: pointer
    refcount*: cint
    is_alias*: GPU_bool
  

proc getCompiledVersion*(): SDL_version {.cdecl.} =
  var v: SDL_version
  return v

proc getLinkedVersion*(): SDL_version 
  {.cdecl, importc: "GPU_GetLinkedVersion", dynlib: libName.}

# The window corresponding to 'windowID' will be used to create the rendering context instead of creating a new window.
proc setInitWindow*(windowID: uint32)
  {.cdecl, importc: "GPU_SetInitWindow", dynlib: libName.}

# Returns the window ID that has been set via GPU_SetInitWindow().
proc getInitWindow*(): uint32 
  {.cdecl, importc: "GPU_GetInitWindow", dynlib: libName.}
# Set special flags to use for initialization. Set these before calling GPU_Init().
# \param GPU_flags An OR'ed combination of GPU_InitFlagEnum flags.  Default flags (0) enable late swap vsync and double buffering.

proc setPreInitFlags*(GPU_flags: GPU_InitFlagEnum)
  {.cdecl, importc: "GPU_SetPreInitFlags", dynlib: libName.}

# Returns the current special flags to use for initialization.
proc getPreInitFlags*(): GPU_InitFlagEnum 
  {.cdecl, importc: "GPU_GetPreInitFlags", dynlib: libName.}

# Set required features to use for initialization. Set these before calling GPU_Init().
# \param features An OR'ed combination of GPU_FeatureEnum flags.  Required features will force GPU_Init() to create a renderer that supports all of the given flags or else fail.
proc setRequiredFeatures*(features: GPU_FeatureEnum)
  {.cdecl, importc: "GPU_SetRequiredFeatures", dynlib: libName.}

# Returns the current required features to use for initialization.
proc getRequiredFeatures*(): GPU_FeatureEnum 
  {.cdecl, importc: "GPU_GetRequiredFeatures", dynlib: libName.}

# Gets the default initialization renderer IDs for the current platform copied into the 'order' array and the number of renderer IDs into 'order_size'.  Pass NULL for 'order' to just get the size of the renderer order array.  Will return at most GPU_RENDERER_ORDER_MAX renderers.
proc getDefaultRendererOrder*(order_size: ptr cint; order: ptr GPU_RendererID)
  {.cdecl, importc: "GPU_GetDefaultRendererOrder", dynlib: libName.}

# Gets the current renderer ID order for initialization copied into the 'order' array and the number of renderer IDs into 'order_size'.  Pass NULL for 'order' to just get the size of the renderer order array.
proc getRendererOrder*(order_size: ptr cint; order: ptr GPU_RendererID)
  {.cdecl, importc: "GPU_GetRendererOrder", dynlib: libName.}

# Sets the renderer ID order to use for initialization.  If 'order' is NULL, it will restore the default order.
proc setRendererOrder*(order_size: cint; order: ptr GPU_RendererID)
  {.cdecl, importc: "GPU_SetRendererOrder", dynlib: libName.}

# Initializes SDL and SDL_gpu.  Creates a window and goes through the renderer order to create a renderer context.
proc init*(w, h: uint16; SDL_flags: GPU_WindowFlagEnum): ptr GPU_Target
  {. cdecl, importc: "GPU_Init", dynlib: libName.}

# Initializes SDL and SDL_gpu.  Creates a window and the requested renderer context.
proc initRenderer*(renderer_enum: GPU_RendererEnum; w, h: uint16;
                   SDL_flags: GPU_WindowFlagEnum): ptr GPU_Target 
  {.cdecl, importc: "GPU_InitRenderer", dynlib: libName.}

# Initializes SDL and SDL_gpu.  Creates a window and the requested renderer context.
# By requesting a renderer via ID, you can specify the major and minor versions of an individual renderer backend.
proc initRendererByID*(renderer_request: GPU_RendererID; w, h: uint16;
                       SDL_flags: GPU_WindowFlagEnum): ptr GPU_Target 
  {.cdecl, importc: "GPU_InitRendererByID", dynlib: libName.}

# Checks for important GPU features which may not be supported depending on a device's extension support.  Feature flags (GPU_FEATURE_*) can be bitwise OR'd together. 
# \return 1 if all of the passed features are enabled/supported
# \return 0 if any of the passed features are disabled/unsupported
proc isFeatureEnabled*(feature: GPU_FeatureEnum): GPU_bool 
  {.cdecl, importc: "GPU_IsFeatureEnabled", dynlib: libName.}

# Clean up the renderer state.
proc closeCurrentRenderer*()
  {.cdecl, importc: "GPU_CloseCurrentRenderer", dynlib: libName.}

# Clean up the renderer state and shut down SDL_gpu.
proc quit*()
  {.cdecl, importc: "GPU_Quit", dynlib: libName.}


const GPU_Log* = GPU_LogInfo

# Sets the global debug level.
# GPU_DEBUG_LEVEL_0: Normal
# GPU_DEBUG_LEVEL_1: Prints messages when errors are pushed via GPU_PushErrorCode()
# GPU_DEBUG_LEVEL_2: Elevates warning logs to error priority
# GPU_DEBUG_LEVEL_3: Elevates info logs to error priority
proc setDebugLevel*(level: GPU_DebugLevelEnum)
  {.cdecl, importc: "GPU_SetDebugLevel", dynlib: libName.}

# Returns the current global debug level.
proc getDebugLevel*(): GPU_DebugLevelEnum 
  {.cdecl, importc: "GPU_GetDebugLevel", dynlib: libName.}

# Prints an informational log message.
proc logInfo2*(format: cstring)
  {.varargs, cdecl, importc: "GPU_LogInfo", dynlib: libName.}

# Prints a warning log message.
proc logWarning2*(format: cstring)
  {.varargs, cdecl, importc: "GPU_LogWarning", dynlib: libName.}

# Prints an error log message.
proc logError2*(format: cstring)
  {.varargs, cdecl, importc: "GPU_LogError", dynlib: libName.}

# Sets a custom callback for handling logging.  Use stdio's vsnprintf() to process the va_list into a string.  Passing NULL as the callback will reset to the default internal logging.
proc setLogCallback*(callback: proc (log_level: GPU_LogLevelEnum; format: cstring; args: seq): cint {.cdecl.})
  {.cdecl, importc: "GPU_SetLogCallback", dynlib: libName.}

# Pushes a new error code into the error queue.  If the queue is full, the queue is not modified.
# \param function The name of the function that pushed the error
# \param error The error code to push on the error queue
# \param details Additional information string, can be NULL.
proc pushErrorCode*(function: cstring; error: GPU_ErrorEnum; details: cstring)
  {.varargs, cdecl, importc: "GPU_PushErrorCode", dynlib: libName.}

# Pops an error object from the error queue and returns it.  If the error queue is empty, it returns an error object with NULL function, GPU_ERROR_NONE error, and NULL details.
proc popErrorCode*(): GPU_ErrorObject 
  {.cdecl, importc: "GPU_PopErrorCode", dynlib: libName.}

# Gets the string representation of an error code.
proc getErrorString*(error: GPU_ErrorEnum): cstring 
  {.cdecl, importc: "GPU_GetErrorString", dynlib: libName.}

# Changes the maximum number of error objects that SDL_gpu will store.  This deletes all currently stored errors.
proc setErrorQueueMax*(max: cuint)
  {.cdecl, importc: "GPU_SetErrorQueueMax", dynlib: libName.}


# Returns an initialized GPU_RendererID.
proc makeRendererID*(name: cstring; renderer: GPU_RendererEnum;
                     major_version, minor_version: cint): GPU_RendererID 
  {.cdecl, importc: "GPU_MakeRendererID", dynlib: libName.}

# Gets the first registered renderer identifier for the given enum value.
proc getRendererID*(renderer: GPU_RendererEnum): GPU_RendererID 
  {.cdecl, importc: "GPU_GetRendererID", dynlib: libName.}

# Gets the number of registered (available) renderers.
proc getNumRegisteredRenderers*(): cint 
  {.cdecl, importc: "GPU_GetNumRegisteredRenderers", dynlib: libName.}

# Gets an array of identifiers for the registered (available) renderers.
proc getRegisteredRendererList*(renderers_array: ptr GPU_RendererID)
  {.cdecl, importc: "GPU_GetRegisteredRendererList", dynlib: libName.}

# Prepares a renderer for use by SDL_gpu.
proc registerRenderer*(id: GPU_RendererID;
                       create_renderer: proc (request: GPU_RendererID): ptr GPU_Renderer {.cdecl.};
                       free_renderer: proc (renderer: ptr GPU_Renderer) {.cdecl.})
  {.cdecl, importc: "GPU_RegisterRenderer", dynlib: libName.}


# Gets the next enum ID that can be used for a custom renderer.
proc reserveNextRendererEnum*(): GPU_RendererEnum 
  {.cdecl, importc: "GPU_ReserveNextRendererEnum", dynlib: libName.}

# Gets the number of active (created) renderers.
proc getNumActiveRenderers*(): cint 
  {.cdecl, importc: "GPU_GetNumActiveRenderers", dynlib: libName.}

# Gets an array of identifiers for the active renderers.
proc getActiveRendererList*(renderers_array: ptr GPU_RendererID)
  {.cdecl, importc: "GPU_GetActiveRendererList", dynlib: libName.}

# \return The current renderer
proc getCurrentRenderer*(): ptr GPU_Renderer 
  {.cdecl, importc: "GPU_GetCurrentRenderer", dynlib: libName.}

# Switches the current renderer to the renderer matching the given identifier.
proc setCurrentRenderer*(id: GPU_RendererID)
  {.cdecl, importc: "GPU_SetCurrentRenderer", dynlib: libName.}

# \return The renderer matching the given identifier.
proc getRenderer*(id: GPU_RendererID): ptr GPU_Renderer 
  {.cdecl, importc: "GPU_GetRenderer", dynlib: libName.}
proc freeRenderer*(renderer: ptr GPU_Renderer)
  {.cdecl, importc: "GPU_FreeRenderer", dynlib: libName.}

# Reapplies the renderer state to the backend API (e.g. OpenGL, Direct3D).  Use this if you want SDL_gpu to be able to render after you've used direct backend calls.
proc resetRendererState*()
  {.cdecl, importc: "GPU_ResetRendererState", dynlib: libName.}

# Sets the coordinate mode for this renderer.  Target and image coordinates will be either "inverted" (0,0 is the upper left corner, y increases downward) or "mathematical" (0,0 is the bottom-left corner, y increases upward).
# The default is inverted (0), as this is traditional for 2D graphics.
# \param inverted 0 is for inverted coordinates, 1 is for mathematical coordinates
proc setCoordinateMode*(use_math_coords: GPU_bool)
  {.cdecl, importc: "GPU_SetCoordinateMode", dynlib: libName.}
proc getCoordinateMode*(): GPU_bool 
  {.cdecl, importc: "GPU_GetCoordinateMode", dynlib: libName.}

# Sets the default image blitting anchor for newly created images.
proc setDefaultAnchor*(anchor_x, anchor_y: cfloat)
  {.cdecl, importc: "GPU_SetDefaultAnchor", dynlib: libName.}

# Returns the default image blitting anchor through the given variables.
proc getDefaultAnchor*(anchor_x, anchor_y: ptr cfloat)
  {.cdecl, importc: "GPU_GetDefaultAnchor", dynlib: libName.}


# \return The renderer's current context target.
proc getContextTarget*(): ptr GPU_Target 
  {.cdecl, importc: "GPU_GetContextTarget", dynlib: libName.}

# \return The target that is associated with the given windowID.
proc getWindowTarget*(windowID: uint32): ptr GPU_Target 
  {.cdecl, importc: "GPU_GetWindowTarget", dynlib: libName.}

# Creates a separate context for the given window using the current renderer and returns a GPU_Target that represents it.
proc createTargetFromWindow*(windowID: uint32): ptr GPU_Target 
  {.cdecl, importc: "GPU_CreateTargetFromWindow", dynlib: libName.}

# Makes the given window the current rendering destination for the given context target.
# This also makes the target the current context for image loading and window operations.
# If the target does not represent a window, this does nothing.
proc makeCurrent*(target: ptr GPU_Target; windowID: uint32)
  {.cdecl, importc: "GPU_MakeCurrent", dynlib: libName.}

# Change the actual size of the current context target's window.  This resets the virtual resolution and viewport of the context target.
# Aside from direct resolution changes, this should also be called in response to SDL_WINDOWEVENT_RESIZED window events for resizable windows.
proc setWindowResolution*(w, h: uint16): GPU_bool 
  {.cdecl, importc: "GPU_SetWindowResolution", dynlib: libName.}

# Enable/disable fullscreen mode for the current context target's window.
# On some platforms, this may destroy the renderer context and require that textures be reloaded.  Unfortunately, SDL does not provide a notification mechanism for this.
# \param enable_fullscreen If true, make the application go fullscreen.  If false, make the application go to windowed mode.
# \param use_desktop_resolution If true, lets the window change its resolution when it enters fullscreen mode (via SDL_WINDOW_FULLSCREEN_DESKTOP).
# \return 0 if the new mode is windowed, 1 if the new mode is fullscreen.
proc setFullscreen*(enable_fullscreen: GPU_bool; use_desktop_resolution: GPU_bool): GPU_bool 
  {.cdecl, importc: "GPU_SetFullscreen", dynlib: libName.}

# Returns true if the current context target's window is in fullscreen mode.
proc getFullscreen*(): GPU_bool 
  {.cdecl, importc: "GPU_GetFullscreen", dynlib: libName.}

# Enables/disables alpha blending for shape rendering on the current window.
proc setShapeBlending*(enable: GPU_bool)
  {.cdecl, importc: "GPU_SetShapeBlending", dynlib: libName.}

# Translates a blend preset into a blend mode.
proc getBlendModeFromPreset*(preset: GPU_BlendPresetEnum): GPU_BlendMode 
  {.cdecl, importc: "GPU_GetBlendModeFromPreset", dynlib: libName.}

# Sets the blending component functions for shape rendering.
proc setShapeBlendFunction*(source_color, dest_color, source_alpha, dest_alpha: GPU_BlendFuncEnum)
  {.cdecl, importc: "GPU_SetShapeBlendFunction", dynlib: libName.}

# Sets the blending component equations for shape rendering.
proc setShapeBlendEquation*(color_equation, alpha_equation: GPU_BlendEqEnum)
  {.cdecl, importc: "GPU_SetShapeBlendEquation", dynlib: libName.}

# Sets the blending mode for shape rendering on the current window, if supported by the renderer.
proc setShapeBlendMode*(mode: GPU_BlendPresetEnum)
  {.cdecl, importc: "GPU_SetShapeBlendMode", dynlib: libName.}

# Sets the thickness of lines for the current context. 
# \param thickness New line thickness in pixels measured across the line.  Default is 1.0f.
# \return The old thickness value
proc setLineThickness*(thickness: cfloat): cfloat 
  {.cdecl, importc: "GPU_SetLineThickness", dynlib: libName.}

# Returns the current line thickness value.
proc getLineThickness*(): cfloat 
  {.cdecl, importc: "GPU_GetLineThickness", dynlib: libName.}


# Creates a target that aliases the given target.  Aliases can be used to store target settings (e.g. viewports) for easy switching.
# GPU_FreeTarget() frees the alias's memory, but does not affect the original.
proc createAliasTarget*(target: ptr GPU_Target): ptr GPU_Target 
  {.cdecl, importc: "GPU_CreateAliasTarget", dynlib: libName.}

# Creates a new render target from the given image.  It can then be accessed from image->target.
proc loadTarget*(image: ptr GPU_Image): ptr GPU_Target 
  {.cdecl, importc: "GPU_LoadTarget", dynlib: libName.}

# Deletes a render target in the proper way for this renderer.
proc freeTarget*(target: ptr GPU_Target)
  {.cdecl, importc: "GPU_FreeTarget", dynlib: libName.}

# Change the logical size of the given target.  Rendering to this target will be scaled as if the dimensions were actually the ones given.
proc setVirtualResolution*(target: ptr GPU_Target; w: uint16; h: uint16)
  {.cdecl, importc: "GPU_SetVirtualResolution", dynlib: libName.}

# Query the logical size of the given target.
proc getVirtualResolution*(target: ptr GPU_Target; w: ptr uint16; h: ptr uint16)
  {.cdecl, importc: "GPU_GetVirtualResolution", dynlib: libName.}

# Converts screen space coordinates (such as from mouse input) to logical drawing coordinates.  This interacts with GPU_SetCoordinateMode() when the y-axis is flipped (screen space is assumed to be inverted: (0,0) in the upper-left corner).
proc getVirtualCoords*(target: ptr GPU_Target; x, y: ptr cfloat;
                       displayX, displayY: cfloat)
  {.cdecl, importc: "GPU_GetVirtualCoords", dynlib: libName.}

# Reset the logical size of the given target to its original value.
proc unsetVirtualResolution*(target: ptr GPU_Target)
  {.cdecl, importc: "GPU_UnsetVirtualResolution", dynlib: libName.}

# \return A GPU_Rect with the given values.
proc makeRect*(x, y, w, h: cfloat): GPU_Rect 
  {.cdecl, importc: "GPU_MakeRect", dynlib: libName.}

# \return An sdl2.Color with the given values.
proc makeColor*(r, g, b, a: uint8): sdl2.Color 
  {.cdecl, importc: "GPU_MakeColor", dynlib: libName.}

# Sets the given target's viewport.
proc setViewport*(target: ptr GPU_Target; viewport: GPU_Rect)
  {.cdecl, importc: "GPU_SetViewport", dynlib: libName.}

# Resets the given target's viewport to the entire target area.
proc unsetViewport*(target: ptr GPU_Target)
  {.cdecl, importc: "GPU_UnsetViewport", dynlib: libName.}

# \return A GPU_Camera with position (0, 0, 0), angle of 0, zoom of 1, and near/far clipping planes of -100 and 100.
proc getDefaultCamera*(): GPU_Camera 
  {.cdecl, importc: "GPU_GetDefaultCamera", dynlib: libName.}

# \return The camera of the given render target.  If target is NULL, returns the default camera.
proc getCamera*(target: ptr GPU_Target): GPU_Camera 
  {.cdecl, importc: "GPU_GetCamera", dynlib: libName.}

# Sets the current render target's current camera.
# \param target A pointer to the target that will copy this camera.
# \param cam A pointer to the camera data to use or NULL to use the default camera.
# \return The old camera.
proc setCamera*(target: ptr GPU_Target; cam: ptr GPU_Camera): GPU_Camera 
  {.cdecl, importc: "GPU_SetCamera", dynlib: libName.}

# Enables or disables using the built-in camera matrix transforms.
proc enableCamera*(target: ptr GPU_Target; use_camera: GPU_bool)
  {.cdecl, importc: "GPU_EnableCamera", dynlib: libName.}

# Returns 1 if the camera transforms are enabled, 0 otherwise.
proc isCameraEnabled*(target: ptr GPU_Target): GPU_bool 
  {.cdecl, importc: "GPU_IsCameraEnabled", dynlib: libName.}

# Attach a new depth buffer to the given target so that it can use depth testing.  Context targets automatically have a depth buffer already.
# If successful, also enables depth testing for this target.
proc addDepthBuffer*(target: ptr GPU_Target): GPU_bool 
  {.cdecl, importc: "GPU_AddDepthBuffer", dynlib: libName.}

# Enables or disables the depth test, which will skip drawing pixels/fragments behind other fragments.  Disabled by default.
# This has implications for alpha blending, where compositing might not work correctly depending on render order.
proc setDepthTest*(target: ptr GPU_Target; enable: GPU_bool)
  {.cdecl, importc: "GPU_SetDepthTest", dynlib: libName.}

# Enables or disables writing the depth (effective view z-coordinate) of new pixels to the depth buffer.  Enabled by default, but you must call GPU_SetDepthTest() to use it.
proc setDepthWrite*(target: ptr GPU_Target; enable: GPU_bool)
  {.cdecl, importc: "GPU_SetDepthWrite", dynlib: libName.}

# Sets the operation to perform when depth testing.
proc setDepthFunction*(target: ptr GPU_Target; compare_operation: GPU_ComparisonEnum)
  {.cdecl, importc: "GPU_SetDepthFunction", dynlib: libName.}

# \return The RGBA color of a pixel.
proc getPixel*(target: ptr GPU_Target; x, y: int16): sdl2.Color 
  {.cdecl, importc: "GPU_GetPixel", dynlib: libName.}

# Sets the clipping rect for the given render target.
proc setClipRect*(target: ptr GPU_Target; rect: GPU_Rect): GPU_Rect 
  {.cdecl, importc: "GPU_SetClipRect", dynlib: libName.}

# Sets the clipping rect for the given render target.
proc setClip*(target: ptr GPU_Target; x, y: int16; w, h: uint16): GPU_Rect 
  {.cdecl, importc: "GPU_SetClip", dynlib: libName.}

# Turns off clipping for the given target.
proc unsetClip*(target: ptr GPU_Target)
  {.cdecl, importc: "GPU_UnsetClip", dynlib: libName.}

# Returns GPU_TRUE if the given rects A and B overlap, in which case it also fills the given result rect with the intersection.  `result` can be NULL if you don't need the intersection.
proc intersectRect*(A, B: GPU_Rect; result: ptr GPU_Rect): GPU_bool 
  {.cdecl, importc: "GPU_IntersectRect", dynlib: libName.}

# Returns GPU_TRUE if the given target's clip rect and the given B rect overlap, in which case it also fills the given result rect with the intersection.  `result` can be NULL if you don't need the intersection.
# If the target doesn't have a clip rect enabled, this uses the whole target area.
proc intersectClipRect*(target: ptr GPU_Target; B: GPU_Rect; result: ptr GPU_Rect): GPU_bool 
  {.cdecl, importc: "GPU_IntersectClipRect", dynlib: libName.}

# Sets the modulation color for subsequent drawing of images and shapes on the given target. 
#  This has a cumulative effect with the image coloring functions.
#  e.g. GPU_SetRGB(image, 255, 128, 0); GPU_SetTargetRGB(target, 128, 128, 128);
#  Would make the image draw with color of roughly (128, 64, 0).
proc setTargetColor*(target: ptr GPU_Target; color: sdl2.Color)
  {.cdecl, importc: "GPU_SetTargetColor", dynlib: libName.}

# Sets the modulation color for subsequent drawing of images and shapes on the given target. 
#  This has a cumulative effect with the image coloring functions.
#  e.g. GPU_SetRGB(image, 255, 128, 0); GPU_SetTargetRGB(target, 128, 128, 128);
#  Would make the image draw with color of roughly (128, 64, 0).
proc setTargetRGB*(target: ptr GPU_Target; r, g, b: uint8)
  {.cdecl, importc: "GPU_SetTargetRGB", dynlib: libName.}

# Sets the modulation color for subsequent drawing of images and shapes on the given target. 
#  This has a cumulative effect with the image coloring functions.
#  e.g. GPU_SetRGB(image, 255, 128, 0); GPU_SetTargetRGB(target, 128, 128, 128);
#  Would make the image draw with color of roughly (128, 64, 0).
proc setTargetRGBA*(target: ptr GPU_Target; r, g, b, a: uint8)
  {.cdecl, importc: "GPU_SetTargetRGBA", dynlib: libName.}

# Unsets the modulation color for subsequent drawing of images and shapes on the given target. 
#  This has the same effect as coloring with pure opaque white (255, 255, 255, 255).
proc unsetTargetColor*(target: ptr GPU_Target)
  {.cdecl, importc: "GPU_UnsetTargetColor", dynlib: libName.}


# Load surface from an image file that is supported by this renderer.  Don't forget to SDL_FreeSurface() it.
proc loadSurface*(filename: cstring): ptr sdl2.Surface 
  {.cdecl, importc: "GPU_LoadSurface", dynlib: libName.}

# Load surface from an image file in memory.  Don't forget to SDL_FreeSurface() it.
proc loadSurface_RW*(rwops: ptr sdl2.RWops; free_rwops: GPU_bool): ptr sdl2.Surface 
  {.cdecl, importc: "GPU_LoadSurface_RW", dynlib: libName.}

# Save surface to a file.
# With a format of GPU_FILE_AUTO, the file type is deduced from the extension.  Supported formats are: png, bmp, tga.
# Returns 0 on failure.
proc saveSurface*(surface: ptr sdl2.Surface; filename: cstring;
                  format: GPU_FileFormatEnum): GPU_bool 
  {.cdecl, importc: "GPU_SaveSurface", dynlib: libName.}

# Save surface to a RWops stream.
# Does not support format of GPU_FILE_AUTO, because the file type cannot be deduced.  Supported formats are: png, bmp, tga.
# Returns 0 on failure.
proc saveSurface_RW*(surface: ptr sdl2.Surface; rwops: ptr sdl2.RWops;
                     free_rwops: GPU_bool; format: GPU_FileFormatEnum): GPU_bool 
  {.cdecl, importc: "GPU_SaveSurface_RW", dynlib: libName.}


# Create a new, blank image with the given format.  Don't forget to GPU_FreeImage() it.
# \param w Image width in pixels
# \param h Image height in pixels
# \param format Format of color channels.
proc createImage*(w, h: uint16; format: GPU_FormatEnum): ptr GPU_Image 
  {.cdecl, importc: "GPU_CreateImage", dynlib: libName.}

# Create a new image that uses the given native texture handle as the image texture.
proc createImageUsingTexture*(handle: GPU_TextureHandle; take_ownership: GPU_bool): ptr GPU_Image 
  {.cdecl, importc: "GPU_CreateImageUsingTexture", dynlib: libName.}

# Load image from an image file that is supported by this renderer.  Don't forget to GPU_FreeImage() it.
proc loadImage*(filename: cstring): ptr GPU_Image 
  {.cdecl, importc: "GPU_LoadImage", dynlib: libName.}

# Load image from an image file in memory.  Don't forget to GPU_FreeImage() it.
proc loadImage_RW*(rwops: ptr sdl2.RWops; free_rwops: GPU_bool): ptr GPU_Image 
  {.cdecl, importc: "GPU_LoadImage_RW", dynlib: libName.}

# Creates an image that aliases the given image.  Aliases can be used to store image settings (e.g. modulation color) for easy switching.
# GPU_FreeImage() frees the alias's memory, but does not affect the original.
proc createAliasImage*(image: ptr GPU_Image): ptr GPU_Image 
  {.cdecl, importc: "GPU_CreateAliasImage", dynlib: libName.}

# Copy an image to a new image.  Don't forget to GPU_FreeImage() both.
proc copyImage*(image: ptr GPU_Image): ptr GPU_Image 
  {.cdecl, importc: "GPU_CopyImage", dynlib: libName.}

# Deletes an image in the proper way for this renderer.  Also deletes the corresponding GPU_Target if applicable.  Be careful not to use that target afterward!
proc freeImage*(image: ptr GPU_Image)
  {.cdecl, importc: "GPU_FreeImage", dynlib: libName.}

# Change the logical size of the given image.  Rendering this image will scaled it as if the dimensions were actually the ones given.
proc setImageVirtualResolution*(image: ptr GPU_Image; w, h: uint16)
  {.cdecl, importc: "GPU_SetImageVirtualResolution", dynlib: libName.}

# Reset the logical size of the given image to its original value.
proc unsetImageVirtualResolution*(image: ptr GPU_Image)
  {.cdecl, importc: "GPU_UnsetImageVirtualResolution", dynlib: libName.}

# Update an image from surface data.  Ignores virtual resolution on the image so the number of pixels needed from the surface is known.
proc updateImage*(image: ptr GPU_Image; image_rect: ptr GPU_Rect;
                  surface: ptr sdl2.Surface; surface_rect: ptr GPU_Rect)
  {.cdecl, importc: "GPU_UpdateImage", dynlib: libName.}

# Update an image from an array of pixel data.  Ignores virtual resolution on the image so the number of pixels needed from the surface is known.
proc updateImageBytes*(image: ptr GPU_Image; image_rect: ptr GPU_Rect;
                        bytes: ptr cuchar; bytes_per_row: cint)
  {.cdecl, importc: "GPU_UpdateImageBytes", dynlib: libName.}

# Update an image from surface data, replacing its underlying texture to allow for size changes.  Ignores virtual resolution on the image so the number of pixels needed from the surface is known.
proc replaceImage*(image: ptr GPU_Image; surface: ptr sdl2.Surface;
                   surface_rect: ptr GPU_Rect): GPU_bool 
  {.cdecl, importc: "GPU_ReplaceImage", dynlib: libName.}

# Save image to a file.
# With a format of GPU_FILE_AUTO, the file type is deduced from the extension.  Supported formats are: png, bmp, tga.
# Returns 0 on failure.
proc saveImage*(image: ptr GPU_Image; filename: cstring;
                format: GPU_FileFormatEnum): GPU_bool 
  {.cdecl, importc: "GPU_SaveImage", dynlib: libName.}

# Save image to a RWops stream.
# Does not support format of GPU_FILE_AUTO, because the file type cannot be deduced.  Supported formats are: png, bmp, tga.
# Returns 0 on failure.
proc saveImage_RW*(image: ptr GPU_Image; rwops: ptr sdl2.RWops;
                   free_rwops: GPU_bool; format: GPU_FileFormatEnum): GPU_bool 
  {.cdecl, importc: "GPU_SaveImage_RW", dynlib: libName.}

# Loads mipmaps for the given image, if supported by the renderer.
proc generateMipmaps*(image: ptr GPU_Image)
  {.cdecl, importc: "GPU_GenerateMipmaps", dynlib: libName.}

# Sets the modulation color for subsequent drawing of the given image.
proc setColor*(image: ptr GPU_Image; color: sdl2.Color)
  {.cdecl, importc: "GPU_SetColor", dynlib: libName.}

# Sets the modulation color for subsequent drawing of the given image.
proc setRGB*(image: ptr GPU_Image; r, g, b: uint8)
  {.cdecl, importc: "GPU_SetRGB", dynlib: libName.}

# Sets the modulation color for subsequent drawing of the given image.
proc setRGBA*(image: ptr GPU_Image; r, g, b, a: uint8)
  {.cdecl, importc: "GPU_SetRGBA", dynlib: libName.}

# Unsets the modulation color for subsequent drawing of the given image.
#  This is equivalent to coloring with pure opaque white (255, 255, 255, 255).
proc unsetColor*(image: ptr GPU_Image)
  {.cdecl, importc: "GPU_UnsetColor", dynlib: libName.}

# Gets the current alpha blending setting.
proc getBlending*(image: ptr GPU_Image): GPU_bool 
  {.cdecl, importc: "GPU_GetBlending", dynlib: libName.}

# Enables/disables alpha blending for the given image.
proc setBlending*(image: ptr GPU_Image; enable: GPU_bool)
  {.cdecl, importc: "GPU_SetBlending", dynlib: libName.}

# Sets the blending component functions.
proc setBlendFunction*(image: ptr GPU_Image;
                       source_color, dest_color: GPU_BlendFuncEnum;
                       source_alpha, dest_alpha: GPU_BlendFuncEnum)
  {.cdecl, importc: "GPU_SetBlendFunction", dynlib: libName.}

# Sets the blending component equations.
proc setBlendEquation*(image: ptr GPU_Image; color_equation, alpha_equation: GPU_BlendEqEnum)
  {.cdecl, importc: "GPU_SetBlendEquation", dynlib: libName.}

# Sets the blending mode, if supported by the renderer.
proc setBlendMode*(image: ptr GPU_Image; mode: GPU_BlendPresetEnum)
  {.cdecl, importc: "GPU_SetBlendMode", dynlib: libName.}

# Sets the image filtering mode, if supported by the renderer.
proc setImageFilter*(image: ptr GPU_Image; filter: GPU_FilterEnum)
  {.cdecl, importc: "GPU_SetImageFilter", dynlib: libName.}

# Sets the image anchor, which is the point about which the image is blitted.  The default is to blit the image on-center (0.5, 0.5).  The anchor is in normalized coordinates (0.0-1.0).
proc setAnchor*(image: ptr GPU_Image; anchor_x, anchor_y: cfloat)
  {.cdecl, importc: "GPU_SetAnchor", dynlib: libName.}

# Returns the image anchor via the passed parameters.  The anchor is in normalized coordinates (0.0-1.0).
proc getAnchor*(image: ptr GPU_Image; anchor_x, anchor_y: ptr cfloat)
  {.cdecl, importc: "GPU_GetAnchor", dynlib: libName.}

# Gets the current pixel snap setting.  The default value is GPU_SNAP_POSITION_AND_DIMENSIONS.
proc getSnapMode*(image: ptr GPU_Image): GPU_SnapEnum 
  {.cdecl, importc: "GPU_GetSnapMode", dynlib: libName.}

# Sets the pixel grid snapping mode for the given image.
proc setSnapMode*(image: ptr GPU_Image; mode: GPU_SnapEnum)
  {.cdecl, importc: "GPU_SetSnapMode", dynlib: libName.}

# Sets the image wrapping mode, if supported by the renderer.
proc setWrapMode*(image: ptr GPU_Image; wrap_mode_x, wrap_mode_y: GPU_WrapEnum)
  {.cdecl, importc: "GPU_SetWrapMode", dynlib: libName.}

# Returns the backend-specific texture handle associated with the given image.  Note that SDL_gpu will be unaware of changes made to the texture.
proc getTextureHandle*(image: ptr GPU_Image): GPU_TextureHandle 
  {.cdecl, importc: "GPU_GetTextureHandle", dynlib: libName.}


# Copy sdl2.Surface data into a new GPU_Image.  Don't forget to SDL_FreeSurface() the surface and GPU_FreeImage() the image.
proc copyImageFromSurface*(surface: ptr sdl2.Surface): ptr GPU_Image 
  {.cdecl, importc: "GPU_CopyImageFromSurface", dynlib: libName.}

# Copy GPU_Target data into a new GPU_Image.  Don't forget to GPU_FreeImage() the image.
proc copyImageFromTarget*(target: ptr GPU_Target): ptr GPU_Image 
  {.cdecl, importc: "GPU_CopyImageFromTarget", dynlib: libName.}

# Copy GPU_Target data into a new sdl2.Surface.  Don't forget to SDL_FreeSurface() the surface.
proc copySurfaceFromTarget*(target: ptr GPU_Target): ptr sdl2.Surface 
  {.cdecl, importc: "GPU_CopySurfaceFromTarget", dynlib: libName.}

# Copy GPU_Image data into a new sdl2.Surface.  Don't forget to SDL_FreeSurface() the surface and GPU_FreeImage() the image.
proc copySurfaceFromImage*(image: ptr GPU_Image): ptr sdl2.Surface 
  {.cdecl, importc: "GPU_CopySurfaceFromImage", dynlib: libName.}


# Returns the magnitude (length) of the given vector.
proc vectorLength*(vec3: ptr cfloat): cfloat 
  {.cdecl, importc: "GPU_VectorLength", dynlib: libName.}

# Modifies the given vector so that it has a new length of 1.
proc vectorNormalize*(vec3: ptr cfloat)
  {.cdecl, importc: "GPU_VectorNormalize", dynlib: libName.}

# Returns the dot product of two vectors.
proc vectorDot*(A, B: ptr cfloat): cfloat 
  {.cdecl, importc: "GPU_VectorDot", dynlib: libName.}

# Performs the cross product of vectors A and B (result = A x B).  Do not use A or B as 'result'.
proc vectorCross*(result, A, B: ptr cfloat)
  {.cdecl, importc: "GPU_VectorCross", dynlib: libName.}

# Overwrite 'result' vector with the values from vector A.
proc vectorCopy*(result, A: ptr cfloat)
  {.cdecl, importc: "GPU_VectorCopy", dynlib: libName.}

# Multiplies the given matrix into the given vector (vec3 = matrix*vec3).
proc vectorApplyMatrix*(vec3, matrix_4x4: ptr cfloat)
  {.cdecl, importc: "GPU_VectorApplyMatrix", dynlib: libName.}

# Basic matrix operations (4x4)
# Overwrite 'result' matrix with the values from matrix A.
proc matrixCopy*(result, A: ptr cfloat)
  {.cdecl, importc: "GPU_MatrixCopy", dynlib: libName.}

# Fills 'result' matrix with the identity matrix.
proc matrixIdentity*(result: ptr cfloat)
  {.cdecl, importc: "GPU_MatrixIdentity", dynlib: libName.}

# Multiplies an orthographic projection matrix into the given matrix.
proc matrixOrtho*(result: ptr cfloat;
                  left, right, bottom, top: cfloat;
                  near, far: cfloat)
  {.cdecl, importc: "GPU_MatrixOrtho", dynlib: libName.}

# Multiplies a perspective projection matrix into the given matrix.
proc matrixFrustum*(result: ptr cfloat;
                    left, right, bottom, top: cfloat;
                    near, far: cfloat)
  {.cdecl, importc: "GPU_MatrixFrustum", dynlib: libName.}

# Multiplies a perspective projection matrix into the given matrix.
proc matrixPerspective*(result: ptr cfloat;
                        fovy, aspect: cfloat;
                        zNear, zFar: cfloat)
  {.cdecl, importc: "GPU_MatrixPerspective", dynlib: libName.}

# Multiplies a view matrix into the given matrix.
proc matrixLookAt*(matrix: ptr cfloat;
                   eye_x, eye_y, eye_z: cfloat;
                   target_x, target_y, target_z: cfloat;
                   up_x, up_y, up_z: cfloat)
  {.cdecl, importc: "GPU_MatrixLookAt", dynlib: libName.}

# Adds a translation into the given matrix.
proc matrixTranslate*(result: ptr cfloat; x, y, z: cfloat)
  {.cdecl, importc: "GPU_MatrixTranslate", dynlib: libName.}
# Multiplies a scaling matrix into the given matrix.

proc matrixScale*(result: ptr cfloat; sx, sy, sz: cfloat)
  {.cdecl, importc: "GPU_MatrixScale", dynlib: libName.}

# Multiplies a rotation matrix into the given matrix.
proc matrixRotate*(result: ptr cfloat; degrees, x, y, z: cfloat)
  {.cdecl, importc: "GPU_MatrixRotate", dynlib: libName.}

# Multiplies matrices A and B and stores the result in the given 'result' matrix (result = A*B).  Do not use A or B as 'result'.
proc matrixMultiply*(result: ptr cfloat; A, B: ptr cfloat)
  {.cdecl, importc: "GPU_MatrixMultiply", dynlib: libName.}

# Multiplies matrices 'result' and B and stores the result in the given 'result' matrix (result = result * B).
proc multiplyAndAssign*(result: ptr cfloat; B: ptr cfloat)
  {.cdecl, importc: "GPU_MultiplyAndAssign", dynlib: libName.}

# Matrix stack accessors
# Returns an internal string that represents the contents of matrix A.
proc getMatrixString*(A: ptr cfloat): cstring 
  {.cdecl, importc: "GPU_GetMatrixString", dynlib: libName.}

# Returns the current matrix from the top of the matrix stack.  Returns NULL if stack is empty.
proc getCurrentMatrix*(): ptr cfloat 
  {.cdecl, importc: "GPU_GetCurrentMatrix", dynlib: libName.}

# Returns the current modelview matrix from the top of the matrix stack.  Returns NULL if stack is empty.
proc getModelView*(): ptr cfloat 
  {.cdecl, importc: "GPU_GetModelView", dynlib: libName.}

# Returns the current projection matrix from the top of the matrix stack.  Returns NULL if stack is empty.
proc getProjection*(): ptr cfloat 
  {.cdecl, importc: "GPU_GetProjection", dynlib: libName.}

# Copies the current modelview-projection matrix into the given 'result' matrix (result = P*M).
proc getModelViewProjection*(result: ptr cfloat)
  {.cdecl, importc: "GPU_GetModelViewProjection", dynlib: libName.}

# Matrix stack manipulators

# Allocate new matrices for the given stack.
proc initMatrixStack* (stack: ptr GPU_MatrixStack)
  {.cdecl, importc: "GPU_InitMatrixStack", dynlib: libName.}

# Changes matrix mode to either GPU_PROJECTION or GPU_MODELVIEW.  Further matrix stack operations manipulate that particular stack.
proc matrixMode*(matrix_mode: cint)
  {.cdecl, importc: "GPU_MatrixMode", dynlib: libName.}

# Pushes the current matrix as a new matrix stack item.
proc pushMatrix*()
  {.cdecl, importc: "GPU_PushMatrix", dynlib: libName.}

# Removes the current matrix from the stack.
proc popMatrix*()
  {.cdecl, importc: "GPU_PopMatrix", dynlib: libName.}

# Fills current matrix with the identity matrix.
proc loadIdentity*()
  {.cdecl, importc: "GPU_LoadIdentity", dynlib: libName.}

# Copies a given matrix to be the current matrix.
proc loadMatrix*(matrix4x4: ptr cfloat)
  {.cdecl, importc: "GPU_LoadMatrix", dynlib: libName.}

# Multiplies an orthographic projection matrix into the current matrix.
proc ortho*(left, right, bottom, top, near, far: cfloat)
  {.cdecl, importc: "GPU_Ortho", dynlib: libName.}

# Multiplies a perspective projection matrix into the current matrix.
proc frustum*(left, right, bottom, top, near, far: cfloat)
  {.cdecl, importc: "GPU_Frustum", dynlib: libName.}

# Adds a translation into the current matrix.
proc translate*(x, y, z: cfloat)
  {.cdecl, importc: "GPU_Translate", dynlib: libName.}

# Multiplies a scaling matrix into the current matrix.
proc scale*(sx, sy, sz: cfloat)
  {.cdecl, importc: "GPU_Scale", dynlib: libName.}

# Multiplies a rotation matrix into the current matrix.
proc rotate*(degrees, x, y, z: cfloat)
  {.cdecl, importc: "GPU_Rotate", dynlib: libName.}

# Multiplies a given matrix into the current matrix.
proc multMatrix*(matrix4x4: ptr cfloat)
  {.cdecl, importc: "GPU_MultMatrix", dynlib: libName.}


# Clears the contents of the given render target.  Fills the target with color {0, 0, 0, 0}.
proc clear*(target: ptr GPU_Target)
  {.cdecl, importc: "GPU_Clear", dynlib: libName.}

# Fills the given render target with a color.
proc clearColor*(target: ptr GPU_Target; color: sdl2.Color)
  {.cdecl, importc: "GPU_ClearColor", dynlib: libName.}

# Fills the given render target with a color (alpha is 255, fully opaque).
proc clearRGB*(target: ptr GPU_Target; r, g, b: uint8)
  {.cdecl, importc: "GPU_ClearRGB", dynlib: libName.}

# Fills the given render target with a color.
proc clearRGBA*(target: ptr GPU_Target; r, g, b, a: uint8)
  {.cdecl, importc: "GPU_ClearRGBA", dynlib: libName.}

# Draws the given image to the given render target.
# \param src_rect The region of the source image to use.  Pass NULL for the entire image.
# \param x Destination x-position
# \param y Destination y-position
proc blit*(image: ptr GPU_Image; src_rect: ptr GPU_Rect;
           target: ptr GPU_Target;
           x, y: cfloat)
  {.cdecl, importc: "GPU_Blit", dynlib: libName.}

# Rotates and draws the given image to the given render target.
# \param src_rect The region of the source image to use.  Pass NULL for the entire image.
# \param x Destination x-position
# \param y Destination y-position
# \param degrees Rotation angle (in degrees)
proc blitRotate*(image: ptr GPU_Image; src_rect: ptr GPU_Rect;
                 target: ptr GPU_Target; x, y, degrees: cfloat)
  {.cdecl, importc: "GPU_BlitRotate", dynlib: libName.}

# Scales and draws the given image to the given render target.
# \param src_rect The region of the source image to use.  Pass NULL for the entire image.
# \param x Destination x-position
# \param y Destination y-position
# \param scaleX Horizontal stretch factor
# \param scaleY Vertical stretch factor
proc blitScale*(image: ptr GPU_Image; src_rect: ptr GPU_Rect;
                target: ptr GPU_Target; x, y, scaleX: cfloat;
                scaleY: cfloat)
  {.cdecl, importc: "GPU_BlitScale", dynlib: libName.}

# Scales, rotates, and draws the given image to the given render target.
# \param src_rect The region of the source image to use.  Pass NULL for the entire image.
# \param x Destination x-position
# \param y Destination y-position
# \param degrees Rotation angle (in degrees)
# \param scaleX Horizontal stretch factor
# \param scaleY Vertical stretch factor
proc blitTransform*(image: ptr GPU_Image; src_rect: ptr GPU_Rect;
                    target: ptr GPU_Target; x, y, degrees: cfloat;
                    scaleX, scaleY: cfloat)
  {.cdecl, importc: "GPU_BlitTransform", dynlib: libName.}

# Scales, rotates around a pivot point, and draws the given image to the given render target.  The drawing point (x, y) coincides with the pivot point on the src image (pivot_x, pivot_y).
# \param src_rect The region of the source image to use.  Pass NULL for the entire image.
# \param x Destination x-position
# \param y Destination y-position
# \param pivot_x Pivot x-position (in image coordinates)
# \param pivot_y Pivot y-position (in image coordinates)
# \param degrees Rotation angle (in degrees)
# \param scaleX Horizontal stretch factor
# \param scaleY Vertical stretch factor
proc blitTransformX*(image: ptr GPU_Image; src_rect: ptr GPU_Rect;
                     target: ptr GPU_Target;
                     x, y, pivot_x, pivot_y,
                     degrees, scaleX, scaleY: cfloat)
  {.cdecl, importc: "GPU_BlitTransformX", dynlib: libName.}

# Draws the given image to the given render target, scaling it to fit the destination region.
# \param src_rect The region of the source image to use.  Pass NULL for the entire image.
# \param dest_rect The region of the destination target image to draw upon.  Pass NULL for the entire target.
proc blitRect*(image: ptr GPU_Image; src_rect: ptr GPU_Rect;
               target: ptr GPU_Target; dest_rect: ptr GPU_Rect)
  {.cdecl, importc: "GPU_BlitRect", dynlib: libName.}

# Draws the given image to the given render target, scaling it to fit the destination region.
# \param src_rect The region of the source image to use.  Pass NULL for the entire image.
# \param dest_rect The region of the destination target image to draw upon.  Pass NULL for the entire target.
# \param degrees Rotation angle (in degrees)
# \param pivot_x Pivot x-position (in image coordinates)
# \param pivot_y Pivot y-position (in image coordinates)
# \param flip_direction A GPU_FlipEnum value (or bitwise OR'd combination) that specifies which direction the image should be flipped.
proc blitRectX*(image: ptr GPU_Image; src_rect: ptr GPU_Rect;
                target: ptr GPU_Target; dest_rect: ptr GPU_Rect; degrees: cfloat;
                pivot_x, pivot_y: cfloat; flip_direction: GPU_FlipEnum)
  {.cdecl, importc: "GPU_BlitRectX", dynlib: libName.}

# Renders triangles from the given set of vertices.  This lets you render arbitrary 2D geometry.  It is a direct path to the GPU, so the format is different than typical SDL_gpu calls.
# \param values A tightly-packed array of vertex position (e.g. x,y), texture coordinates (e.g. s,t), and color (e.g. r,g,b,a) values.  Texture coordinates and color values are expected to be already normalized to 0.0 - 1.0.  Pass NULL to render with only custom shader attributes.
# \param indices If not NULL, this is used to specify which vertices to use and in what order (i.e. it indexes the vertices in the 'values' array).
# \param flags Bit flags to control the interpretation of the 'values' array parameters.
proc triangleBatch*(image: ptr GPU_Image; target: ptr GPU_Target;
                    num_vertices: cushort; values: ptr cfloat; num_indices: cuint;
                    indices: ptr cushort; flags: GPU_BatchFlagEnum)
  {.cdecl, importc: "GPU_TriangleBatch", dynlib: libName.}

# Renders triangles from the given set of vertices.  This lets you render arbitrary 2D geometry.  It is a direct path to the GPU, so the format is different than typical SDL_gpu calls.
# \param values A tightly-packed array of vertex position (e.g. x,y), texture coordinates (e.g. s,t), and color (e.g. r,g,b,a) values.  Texture coordinates and color values are expected to be already normalized to 0.0 - 1.0 (or 0 - 255 for 8-bit color components).  Pass NULL to render with only custom shader attributes.
# \param indices If not NULL, this is used to specify which vertices to use and in what order (i.e. it indexes the vertices in the 'values' array).
# \param flags Bit flags to control the interpretation of the 'values' array parameters.
proc triangleBatchX*(image: ptr GPU_Image; target: ptr GPU_Target;
                     num_vertices: cushort; values: pointer; num_indices: cuint;
                     indices: ptr cushort; flags: GPU_BatchFlagEnum)
  {.cdecl, importc: "GPU_TriangleBatchX", dynlib: libName.}

# Send all buffered blitting data to the current context target.
proc flushBlitBuffer*()
  {.cdecl, importc: "GPU_FlushBlitBuffer", dynlib: libName.}

# Updates the given target's associated window.  For non-context targets (e.g. image targets), this will flush the blit buffer.
proc flip*(target: ptr GPU_Target)
  {.cdecl, importc: "GPU_Flip", dynlib: libName.}

# Renders a colored point.
# \param target The destination render target
# \param x x-coord of the point
# \param y y-coord of the point
# \param color The color of the shape to render
proc pixel*(target: ptr GPU_Target; x, y: cfloat; color: sdl2.Color)
  {.cdecl, importc: "GPU_Pixel", dynlib: libName.}

# Renders a colored line.
# \param target The destination render target
# \param x1 x-coord of starting point
# \param y1 y-coord of starting point
# \param x2 x-coord of ending point
# \param y2 y-coord of ending point
# \param color The color of the shape to render
proc line*(target: ptr GPU_Target; x1, y1, x2, y2: cfloat; color: sdl2.Color)
  {.cdecl, importc: "GPU_Line", dynlib: libName.}

# Renders a colored arc curve (circle segment).
# \param target The destination render target
# \param x x-coord of center point
# \param y y-coord of center point
# \param radius The radius of the circle / distance from the center point that rendering will occur
# \param start_angle The angle to start from, in degrees.  Measured clockwise from the positive x-axis.
# \param end_angle The angle to end at, in degrees.  Measured clockwise from the positive x-axis.
# \param color The color of the shape to render
proc arc*(target: ptr GPU_Target; x, y, radius, start_angle, end_angle: cfloat; color: sdl2.Color)
  {.cdecl, importc: "GPU_Arc", dynlib: libName.}

# Renders a colored filled arc (circle segment / pie piece).
# \param target The destination render target
# \param x x-coord of center point
# \param y y-coord of center point
# \param radius The radius of the circle / distance from the center point that rendering will occur
# \param start_angle The angle to start from, in degrees.  Measured clockwise from the positive x-axis.
# \param end_angle The angle to end at, in degrees.  Measured clockwise from the positive x-axis.
# \param color The color of the shape to render
proc arcFilled*(target: ptr GPU_Target; x, y, radius, start_angle, end_angle: cfloat; color: sdl2.Color)
  {.cdecl, importc: "GPU_ArcFilled", dynlib: libName.}

# Renders a colored circle outline.
# \param target The destination render target
# \param x x-coord of center point
# \param y y-coord of center point
# \param radius The radius of the circle / distance from the center point that rendering will occur
# \param color The color of the shape to render
proc circle*(target: ptr GPU_Target; x, y, radius: cfloat; color: sdl2.Color)
  {.cdecl, importc: "GPU_Circle", dynlib: libName.}

# Renders a colored filled circle.
# \param target The destination render target
# \param x x-coord of center point
# \param y y-coord of center point
# \param radius The radius of the circle / distance from the center point that rendering will occur
# \param color The color of the shape to render
proc circleFilled*(target: ptr GPU_Target; x, y, radius: cfloat; color: sdl2.Color)
  {.cdecl, importc: "GPU_CircleFilled", dynlib: libName.}

# Renders a colored ellipse outline.
# \param target The destination render target
# \param x x-coord of center point
# \param y y-coord of center point
# \param rx x-radius of ellipse
# \param ry y-radius of ellipse
# \param degrees The angle to rotate the ellipse
# \param color The color of the shape to render
proc ellipse*(target: ptr GPU_Target; x, y, rx, ry, degrees: cfloat; color: sdl2.Color)
  {.cdecl, importc: "GPU_Ellipse", dynlib: libName.}

# Renders a colored filled ellipse.
# \param target The destination render target
# \param x x-coord of center point
# \param y y-coord of center point
# \param rx x-radius of ellipse
# \param ry y-radius of ellipse
# \param degrees The angle to rotate the ellipse
# \param color The color of the shape to render
proc ellipseFilled*(target: ptr GPU_Target; x, y, rx, ry, degrees: cfloat; color: sdl2.Color)
  {.cdecl, importc: "GPU_EllipseFilled", dynlib: libName.}

# Renders a colored annular sector outline (ring segment).
# \param target The destination render target
# \param x x-coord of center point
# \param y y-coord of center point
# \param inner_radius The inner radius of the ring
# \param outer_radius The outer radius of the ring
# \param start_angle The angle to start from, in degrees.  Measured clockwise from the positive x-axis.
# \param end_angle The angle to end at, in degrees.  Measured clockwise from the positive x-axis.
# \param color The color of the shape to render
proc sector*(target: ptr GPU_Target, x, y, inner_radius, outer_radius, start_angle, end_angle: cfloat; color: sdl2.Color)
  {.cdecl, importc: "GPU_Sector", dynlib: libName.}

# Renders a colored filled annular sector (ring segment).
# \param target The destination render target
# \param x x-coord of center point
# \param y y-coord of center point
# \param inner_radius The inner radius of the ring
# \param outer_radius The outer radius of the ring
# \param start_angle The angle to start from, in degrees.  Measured clockwise from the positive x-axis.
# \param end_angle The angle to end at, in degrees.  Measured clockwise from the positive x-axis.
# \param color The color of the shape to render
proc sectorFilled*(target: ptr GPU_Target; x, y, inner_radius, outer_radius, start_angle, end_angle: cfloat; color: sdl2.Color)
  {.cdecl, importc: "GPU_SectorFilled", dynlib: libName.}

# Renders a colored triangle outline.
# \param target The destination render target
# \param x1 x-coord of first point
# \param y1 y-coord of first point
# \param x2 x-coord of second point
# \param y2 y-coord of second point
# \param x3 x-coord of third point
# \param y3 y-coord of third point
# \param color The color of the shape to render
proc tri*(target: ptr GPU_Target; x1, y1, x2, y2, x3, y3: cfloat; color: sdl2.Color)
  {.cdecl, importc: "GPU_Tri", dynlib: libName.}
# Renders a colored filled triangle.

# \param target The destination render target
# \param x1 x-coord of first point
# \param y1 y-coord of first point
# \param x2 x-coord of second point
# \param y2 y-coord of second point
# \param x3 x-coord of third point
# \param y3 y-coord of third point
# \param color The color of the shape to render
proc triFilled*(target: ptr GPU_Target; x1, y1, x2, y2, x3, y3: cfloat; color: sdl2.Color)
  {.cdecl, importc: "GPU_TriFilled", dynlib: libName.}

# Renders a colored rectangle outline.
# \param target The destination render target
# \param x1 x-coord of top-left corner
# \param y1 y-coord of top-left corner
# \param x2 x-coord of bottom-right corner
# \param y2 y-coord of bottom-right corner
# \param color The color of the shape to render
proc rectangle*(target: ptr GPU_Target; x1, y1, x2, y2: cfloat; color: sdl2.Color)
  {.cdecl, importc: "GPU_Rectangle", dynlib: libName.}

# Renders a colored rectangle outline.
# \param target The destination render target
# \param rect The rectangular area to draw
# \param color The color of the shape to render
proc rectangle2*(target: ptr GPU_Target; rect: GPU_Rect; color: sdl2.Color)
  {.cdecl, importc: "GPU_Rectangle2", dynlib: libName.}

# Renders a colored filled rectangle.
# \param target The destination render target
# \param x1 x-coord of top-left corner
# \param y1 y-coord of top-left corner
# \param x2 x-coord of bottom-right corner
# \param y2 y-coord of bottom-right corner
# \param color The color of the shape to render
proc rectangleFilled*(target: ptr GPU_Target; x1, y1, x2, y2: cfloat; color: sdl2.Color)
  {.cdecl, importc: "GPU_RectangleFilled", dynlib: libName.}

# Renders a colored filled rectangle.
# \param target The destination render target
# \param rect The rectangular area to draw
# \param color The color of the shape to render
proc rectangleFilled2*(target: ptr GPU_Target; rect: GPU_Rect; color: sdl2.Color)
  {.cdecl, importc: "GPU_RectangleFilled2", dynlib: libName.}

# Renders a colored rounded (filleted) rectangle outline.
# \param target The destination render target
# \param x1 x-coord of top-left corner
# \param y1 y-coord of top-left corner
# \param x2 x-coord of bottom-right corner
# \param y2 y-coord of bottom-right corner
# \param radius The radius of the corners
# \param color The color of the shape to render
proc rectangleRound*(target: ptr GPU_Target; x1, y1, x2, y2, radius: cfloat; color: sdl2.Color)
  {.cdecl, importc: "GPU_RectangleRound", dynlib: libName.}

# Renders a colored rounded (filleted) rectangle outline.
# \param target The destination render target
# \param rect The rectangular area to draw
# \param radius The radius of the corners
# \param color The color of the shape to render
proc rectangleRound2*(target: ptr GPU_Target; rect: GPU_Rect; radius: cfloat; color: sdl2.Color)
  {.cdecl, importc: "GPU_RectangleRound2", dynlib: libName.}

# Renders a colored filled rounded (filleted) rectangle.
# \param target The destination render target
# \param x1 x-coord of top-left corner
# \param y1 y-coord of top-left corner
# \param x2 x-coord of bottom-right corner
# \param y2 y-coord of bottom-right corner
# \param radius The radius of the corners
# \param color The color of the shape to render
proc rectangleRoundFilled*(target: ptr GPU_Target; x1, y1, x2, y2, radius: cfloat; color: sdl2.Color)
  {.cdecl, importc: "GPU_RectangleRoundFilled", dynlib: libName.}

# Renders a colored filled rounded (filleted) rectangle.
# \param target The destination render target
# \param rect The rectangular area to draw
# \param radius The radius of the corners
# \param color The color of the shape to render
proc rectangleRoundFilled2*(target: ptr GPU_Target; rect: GPU_Rect; radius: cfloat; color: sdl2.Color)
  {.cdecl, importc: "GPU_RectangleRoundFilled2", dynlib: libName.}

# Renders a colored polygon outline.  The vertices are expected to define a convex polygon.
# \param target The destination render target
# \param num_vertices Number of vertices (x and y pairs)
# \param vertices An array of vertex positions stored as interlaced x and y coords, e.g. {x1, y1, x2, y2, ...}
# \param color The color of the shape to render
proc polygon*(target: ptr GPU_Target; num_vertices: cuint; vertices: ptr cfloat; color: sdl2.Color)
  {.cdecl, importc: "GPU_Polygon", dynlib: libName.}

# Renders a colored sequence of line segments.
# \param target The destination render target
# \param num_vertices Number of vertices (x and y pairs)
# \param vertices An array of vertex positions stored as interlaced x and y coords, e.g. {x1, y1, x2, y2, ...}
# \param color The color of the shape to render
# \param close_loop Make a closed polygon by drawing a line at the end back to the start point
proc polyline*(target: ptr GPU_Target; num_vertices: cuint; vertices: ptr cfloat; color: sdl2.Color; close_loop: GPU_bool)
  {.cdecl, importc: "GPU_Polyline", dynlib: libName.}

# Renders a colored filled polygon.  The vertices are expected to define a convex polygon.
# \param target The destination render target
# \param num_vertices Number of vertices (x and y pairs)
# \param vertices An array of vertex positions stored as interlaced x and y coords, e.g. {x1, y1, x2, y2, ...}
# \param color The color of the shape to render
proc polygonFilled*(target: ptr GPU_Target; num_vertices: cuint; vertices: ptr cfloat; color: sdl2.Color)
  {.cdecl, importc: "GPU_PolygonFilled", dynlib: libName.}


# Creates a new, empty shader program.  You will need to compile shaders, attach them to the program, then link the program.
proc createShaderProgram*(): uint32 
  {.cdecl, importc: "GPU_CreateShaderProgram", dynlib: libName.}

# Deletes a shader program.
proc freeShaderProgram*(program_object: uint32)
  {.cdecl, importc: "GPU_FreeShaderProgram", dynlib: libName.}

# Loads shader source from an sdl2.RWops, compiles it, and returns the new shader object.
proc compileShader_RW*(shader_type: GPU_ShaderEnum; shader_source: ptr sdl2.RWops; free_rwops: GPU_bool): uint32 
  {.cdecl, importc: "GPU_CompileShader_RW", dynlib: libName.}

# Compiles shader source and returns the new shader object.
proc compileShader*(shader_type: GPU_ShaderEnum; shader_source: cstring): uint32 
  {.cdecl, importc: "GPU_CompileShader", dynlib: libName.}

# Loads shader source from a file, compiles it, and returns the new shader object.
proc loadShader*(shader_type: GPU_ShaderEnum; filename: cstring): uint32 
  {.cdecl, importc: "GPU_LoadShader", dynlib: libName.}

# Creates and links a shader program with the given shader objects.
proc linkShaders*(shader_object1, shader_object2: uint32): uint32 
  {.cdecl, importc: "GPU_LinkShaders", dynlib: libName.}

# Creates and links a shader program with the given shader objects.
proc linkManyShaders*(shader_objects: ptr uint32; count: cint): uint32 
  {.cdecl, importc: "GPU_LinkManyShaders", dynlib: libName.}

# Deletes a shader object.
proc freeShader*(shader_object: uint32)
  {.cdecl, importc: "GPU_FreeShader", dynlib: libName.}

# Attaches a shader object to a shader program for future linking.
proc attachShader*(program_object, shader_object: uint32)
  {.cdecl, importc: "GPU_AttachShader", dynlib: libName.}

# Detaches a shader object from a shader program.
proc detachShader*(program_object, shader_object: uint32)
  {.cdecl, importc: "GPU_DetachShader", dynlib: libName.}

# Links a shader program with any attached shader objects.
proc linkShaderProgram*(program_object: uint32): GPU_bool 
  {.cdecl, importc: "GPU_LinkShaderProgram", dynlib: libName.}

# \return The current shader program
proc getCurrentShaderProgram*(): uint32 
  {.cdecl, importc: "GPU_GetCurrentShaderProgram", dynlib: libName.}

# Returns 1 if the given shader program is a default shader for the current context, 0 otherwise.
proc isDefaultShaderProgram*(program_object: uint32): GPU_bool 
  {.cdecl, importc: "GPU_IsDefaultShaderProgram", dynlib: libName.}

# Activates the given shader program.  Passing NULL for 'block' will disable the built-in shader variables for custom shaders until a GPU_ShaderBlock is set again.
proc activateShaderProgram*(program_object: uint32; `block`: ptr GPU_ShaderBlock)
  {.cdecl, importc: "GPU_ActivateShaderProgram", dynlib: libName.}

# Deactivates the current shader program (activates program 0).
proc deactivateShaderProgram*()
  {.cdecl, importc: "GPU_DeactivateShaderProgram", dynlib: libName.}

# Returns the last shader log message.
proc getShaderMessage*(): cstring 
  {.cdecl, importc: "GPU_GetShaderMessage", dynlib: libName.}

# Returns an integer representing the location of the specified attribute shader variable.
proc getAttributeLocation*(program_object: uint32; attrib_name: cstring): cint 
  {.cdecl, importc: "GPU_GetAttributeLocation", dynlib: libName.}

# Returns a filled GPU_AttributeFormat object.
proc makeAttributeFormat*(num_elems_per_vertex: cint;
                          `type`: GPU_TypeEnum;
                          normalize: GPU_bool;
                          stride_bytes, offset_bytes: cint): GPU_AttributeFormat 
  {.cdecl, importc: "GPU_MakeAttributeFormat", dynlib: libName.}

# Returns a filled GPU_Attribute object.
proc makeAttribute*(location: cint; values: pointer; format: GPU_AttributeFormat): GPU_Attribute 
  {.cdecl, importc: "GPU_MakeAttribute", dynlib: libName.}

# Returns an integer representing the location of the specified uniform shader variable.
proc getUniformLocation*(program_object: uint32; uniform_name: cstring): cint 
  {.cdecl, importc: "GPU_GetUniformLocation", dynlib: libName.}

# Loads the given shader program's built-in attribute and uniform locations.
proc loadShaderBlock*(program_object: uint32;
                      position_name, texcoord_name, color_name, modelViewMatrix_name: cstring): GPU_ShaderBlock 
  {.cdecl, importc: "GPU_LoadShaderBlock", dynlib: libName.}

# Sets the current shader block to use the given attribute and uniform locations.
proc setShaderBlock*(`block`: GPU_ShaderBlock)
  {.cdecl, importc: "GPU_SetShaderBlock", dynlib: libName.}

# Gets the shader block for the current shader.
proc getShaderBlock*(): GPU_ShaderBlock 
  {.cdecl, importc: "GPU_GetShaderBlock", dynlib: libName.}

# Sets the given image unit to the given image so that a custom shader can sample multiple textures.
# \param image The source image/texture.  Pass NULL to disable the image unit.
# \param location The uniform location of a texture sampler
# \param image_unit The index of the texture unit to set.  0 is the first unit, which is used by SDL_gpu's blitting functions.  1 would be the second unit.
proc setShaderImage*(image: ptr GPU_Image; location, image_unit: cint)
  {.cdecl, importc: "GPU_SetShaderImage", dynlib: libName.}

# Fills "values" with the value of the uniform shader variable at the given location.
proc getUniformiv*(program_object: uint32; location: cint; values: ptr cint)
  {.cdecl, importc: "GPU_GetUniformiv", dynlib: libName.}

# Sets the value of the integer uniform shader variable at the given location.
#    This is equivalent to calling GPU_SetUniformiv(location, 1, 1, &value).
proc setUniformi*(location, value: cint)
  {.cdecl, importc: "GPU_SetUniformi", dynlib: libName.}

# Sets the value of the integer uniform shader variable at the given location.
proc setUniformiv*(location, num_elements_per_value: cuint; num_values: cint; values: ptr cint)
  {.cdecl, importc: "GPU_SetUniformiv", dynlib: libName.}

# Fills "values" with the value of the uniform shader variable at the given location.
proc getUniformuiv*(program_object: uint32; location: cint; values: ptr cuint)
  {.cdecl, importc: "GPU_GetUniformuiv", dynlib: libName.}

# Sets the value of the unsigned integer uniform shader variable at the given location.
#    This is equivalent to calling GPU_SetUniformuiv(location, 1, 1, &value).
proc setUniformui*(location: cint; value: cuint)
  {.cdecl, importc: "GPU_SetUniformui", dynlib: libName.}

# Sets the value of the unsigned integer uniform shader variable at the given location.
proc setUniformuiv*(location, num_elements_per_value: cuint; num_values: cint; values: ptr cuint)
  {.cdecl, importc: "GPU_SetUniformuiv", dynlib: libName.}

# Fills "values" with the value of the uniform shader variable at the given location.
proc getUniformfv*(program_object: uint32; location: cint; values: ptr cfloat)
  {.cdecl, importc: "GPU_GetUniformfv", dynlib: libName.}

# Sets the value of the floating point uniform shader variable at the given location.
# This is equivalent to calling GPU_SetUniformfv(location, 1, 1, &value).
proc setUniformf*(location: cint; value: cfloat)
  {.cdecl, importc: "GPU_SetUniformf", dynlib: libName.}

# Sets the value of the floating point uniform shader variable at the given location.
proc setUniformfv*(location, num_elements_per_value: cuint; num_values: cint; values: ptr cfloat)
  {.cdecl, importc: "GPU_SetUniformfv", dynlib: libName.}

# Fills "values" with the value of the uniform shader variable at the given location.  The results are identical to calling GPU_GetUniformfv().  Matrices are gotten in column-major order.
proc getUniformMatrixfv*(program_object: uint32; location: cint; values: ptr cfloat)
  {.cdecl, importc: "GPU_GetUniformMatrixfv", dynlib: libName.}

# Sets the value of the matrix uniform shader variable at the given location.  The size of the matrices sent is specified by num_rows and num_columns.  Rows and columns must be between 2 and 4.
proc setUniformMatrixfv*(location, num_matrices: cuint; num_rows, num_columns: cuint; transpose: GPU_bool; values: ptr cfloat)
  {.cdecl, importc: "GPU_SetUniformMatrixfv", dynlib: libName.}

# Sets a constant-value shader attribute that will be used for each rendered vertex.
proc setAttributef*(location: cint; value: cfloat)
  {.cdecl, importc: "GPU_SetAttributef", dynlib: libName.}

# Sets a constant-value shader attribute that will be used for each rendered vertex.
proc setAttributei*(location: cint; value: cint)
  {.cdecl, importc: "GPU_SetAttributei", dynlib: libName.}

# Sets a constant-value shader attribute that will be used for each rendered vertex.
proc setAttributeui*(location: cint; value: cuint)
  {.cdecl, importc: "GPU_SetAttributeui", dynlib: libName.}

# Sets a constant-value shader attribute that will be used for each rendered vertex.
proc setAttributefv*(location, num_elements: cuint; value: ptr cfloat)
  {.cdecl, importc: "GPU_SetAttributefv", dynlib: libName.}

# Sets a constant-value shader attribute that will be used for each rendered vertex.
proc setAttributeiv*(location, num_elements: cuint; value: ptr cint)
  {.cdecl, importc: "GPU_SetAttributeiv", dynlib: libName.}

# Sets a constant-value shader attribute that will be used for each rendered vertex.
proc setAttributeuiv*(location, num_elements: cuint; value: ptr cuint)
  {.cdecl, importc: "GPU_SetAttributeuiv", dynlib: libName.}

# Enables a shader attribute and sets its source data.
proc setAttributeSource*(num_values: cint; source: GPU_Attribute)
  {.cdecl, importc: "GPU_SetAttributeSource", dynlib: libName.}

