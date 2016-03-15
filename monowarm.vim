" Each theme is contained in its own file and declares variables scoped to the
" file.  These variables represent the possible "modes" that airline can
" detect.  The mode is the return value of mode(), which gets converted to a
" readable string.  The following is a list currently supported modes: normal,
" insert, replace, visual, and inactive.
"
" Each mode can also have overrides.  These are small changes to the mode that
" don't require a completely different look.  "modified" and "paste" are two
" such supported overrides.  These are simply suffixed to the major mode,
" separated by an underscore.  For example, "normal_modified" would be normal
" mode where the current buffer is modified.
"
" The theming algorithm is a 2-pass system where the mode will draw over all
" parts of the statusline, and then the override is applied after.  This means
" it is possible to specify a subset of the theme in overrides, as it will
" simply overwrite the previous colors.  If you want simultaneous overrides,
" then they will need to change different parts of the statusline so they do
" not conflict with each other.
"
" First, let's define an empty dictionary and assign it to the "palette"
" variable. The # is a separator that maps with the directory structure. If
" you get this wrong, Vim will complain loudly.
let g:airline#themes#monowarm#palette = {}

let s:N1   = [ '#1c1c1c' , '#ffaf5f' , 234 , 215 ]
let s:N2   = [ '#af875f' , '#262626' , 137 , 235  ]
let s:N3   = [ '#121212' , '#af875f' , 233 , 137  , 'NONE' ]
let g:airline#themes#monowarm#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#monowarm#palette.normal_modified = {
      \ 'airline_c': [ '#121212' , '#af875f' , 233     , 137     , 'bold'     ] ,
      \ }

" let s:I1 = [ '#1c1c1c' , '#00ffaf' , 234 , 49  ]
" let s:I2 = [ '#1c1c1c' , '#00af87' , 234 , 36  ]
" let s:I3 = [ '#1c1c1c' , '#00875f' , 234 , 29  , 'NONE' ]
" let s:I1 = [ '#1c1c1c' , '#afd75f' , 234 , 49  ]
" let s:I2 = [ '#87af5f' , '#262626' , 234 , 36  ]
" let s:I3 = [ '#1c1c1c' , '#87af5f' , 234 , 29  , 'NONE' ]
let s:I1 = [ '#1c1c1c' , '#afaf5f' , 234 , 143 ]
let s:I2 = [ '#87875f' , '#262626' , 101 , 235 ]
let s:I3 = [ '#121212' , '#87875f' , 233 , 101 , 'NONE' ]
let g:airline#themes#monowarm#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#monowarm#palette.insert_modified = {
      \ 'airline_c': [ '#262626' , '#87875f' , 235     , 101     , 'bold'     ] ,
      \ }
let g:airline#themes#monowarm#palette.insert_paste = {
      \ 'airline_a': [ s:I1[0]   , '#d78700' , s:I1[2] , 172     , ''     ] ,
      \ }

let s:R1 = [ '#1c1c1c' , '#ff5f5f' , 234 , 203 ]
let s:R2 = [ '#af5f5f' , '#262626' , 131 , 235 ]
let s:R3 = [ '#121212' , '#af5f5f' , 233 , 131 , 'NONE' ]
let g:airline#themes#monowarm#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#monowarm#palette.replace_modified = {
      \ 'airline_c': [ '#121212' , '#af5f5f' , 233     , 131     , 'bold'     ] ,
      \ }

let s:V1 = [ '#1c1c1c' , '#87afaf' , 234 , 109 ]
let s:V2 = [ '#5f8787' , '#262626' , 66  , 235 ]
let s:V3 = [ '#121212' , '#5f8787' , 233 , 66  , 'NONE' ]
let g:airline#themes#monowarm#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#monowarm#palette.visual_modified = {
      \ 'airline_c': [ '#121212' , '#5f8787' , 233     , 66      , 'bold'     ] ,
      \ }


let s:IA1 = [ '#262626' , '#585858' , 235 , 240 , '' ]
let s:IA2 = [ '#585858' , '#262626' , 240 , 235 , '' ]
let s:IA3 = [ '#262626' , '#585858' , 235 , 240 , '' ]
let g:airline#themes#monowarm#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
 let g:airline#themes#monowarm#palette.inactive_modified = {
      \ 'airline_c': [ '#262626' , '#585858' , 235 , 240 , 'bold' ] ,
      \ }


" Accents are used to give parts within a section a slightly different look or
" color. Here we are defining a "red" accent, which is used by the 'readonly'
" part by default. Only the foreground colors are specified, so the background
" colors are automatically extracted from the underlying section colors. What
" this means is that regardless of which section the part is defined in, it
" will be red instead of the section's foreground color. You can also have
" multiple parts with accents within a section.
let g:airline#themes#monowarm#palette.accents = {
      \ 'red': [ '#870000' , '' , 88 , '', 'bold'  ]
      \ }


" Here we define the color map for ctrlp.  We check for the g:loaded_ctrlp
" variable so that related functionality is loaded iff the user is using
" ctrlp. Note that this is optional, and if you do not define ctrlp colors
" they will be chosen automatically from the existing palette.
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#monowarm#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ '#d7d7ff' , '#5f00af' , 189 , 55  , ''     ],
      \ [ '#ffffff' , '#875fd7' , 231 , 98  , ''     ],
      \ [ '#5f00af' , '#ffffff' , 55  , 231 , 'bold' ])

