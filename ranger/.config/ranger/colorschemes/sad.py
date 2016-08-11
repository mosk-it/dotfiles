# This file is part of ranger, the console file manager.
# License: GNU GPL version 3, see the file "AUTHORS" for details.

from ranger.gui.color import *
from ranger.colorschemes.default import Default


class Scheme(Default):
    progress_bar_color = green

    def use(self, context):
        fg, bg, attr = Default.use(self, context)


        if context.in_titlebar:
            if context.hostname:
                attr = bold
                fg = red
            elif context.directory:
                fg = yellow
            elif context.tab:
                pass
                fg = context.good and 47 or 33
            elif context.link:
                fg = cyan





        return fg, bg, attr
