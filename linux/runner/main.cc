#include <stdlib.h>
#include <unistd.h>
#include <string>
#include "my_application.h"
#include <native_splash_screen_linux/native_splash_screen_linux_plugin.h>

// Flutter's libflutter_linux_gtk.so exports its own _Unwind_RaiseException,
// which breaks LuaJIT inside libmpv. Re-exec once with the system libgcc_s first.
static void use_system_unwinder(char** argv) {
  if (getenv("ANIBLA_UNWIND_FIXED")) return;  // already re-exec'd
  setenv("ANIBLA_UNWIND_FIXED", "1", 1);

  std::string preload = "libgcc_s.so.1";
  if (const char* old = getenv("LD_PRELOAD")) {
    if (*old) preload += std::string(":") + old;
  }
  setenv("LD_PRELOAD", preload.c_str(), 1);

  execv("/proc/self/exe", argv);  // if this fails we just continue normally
}


int main(int argc, char** argv) {
  gtk_init(&argc, &argv);
  show_splash_screen();
  use_system_unwinder(argv);

  g_autoptr(MyApplication) app = my_application_new();
  return g_application_run(G_APPLICATION(app), argc, argv);
}
