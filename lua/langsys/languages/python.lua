local M = {

  name = "Python",

  comment = {
    line = {
      start = "#", 
    },
    multiline = {
      start = "#",
      bullet = "#",
      finish = "#",
    },
    banner = require("langsys/generators/banner").generate("", "#", ""),
  },

}

return M
