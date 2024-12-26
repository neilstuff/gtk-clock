# gtk-clock

glib-compile-resources clock.gresource.xml --target=clock.gresource.c --generate-source
gcc clock.c clock.gresource.c -o clock -mwindows %GTK4-PKG-CONFIG%