return {
  cmd = { "neocmakelsp", "--stdio" },
  init_options = {
    format = {
      enable = true,
    },
    lint = {
      enable = true,
    },
    scan_cmake_in_package = true, -- default is true
  },
}
