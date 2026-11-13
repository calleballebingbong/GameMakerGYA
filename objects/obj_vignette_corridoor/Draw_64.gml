if (surface_exists(application_surface)) {
    shader_set(sh_vignette);
    shader_set_uniform_f(vignette_uniform, 0.3);
    draw_surface_stretched(
        application_surface,
        0, 0,
        display_get_gui_width(),
        display_get_gui_height()
    );
    shader_reset();
}