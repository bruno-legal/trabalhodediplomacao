vf = vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_colour();
vertex_format_add_texcoord();
vf = vertex_format_end();

vb = vertex_create_buffer();