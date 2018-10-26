def clear
  system 'clear'
end

def space
  puts ""
end

def line_break
  puts "*************************"
end

def menu_line_break
  puts " *************************"
end

def longer_line_break
  puts "***************************************"
end

def prompt
  TTY::Prompt.new
end

def menu_vertical_break
  puts " *                       *\n *       MAIN MENU       *\n *                       *                       "
end

def login_vertical_break
  puts "*                       *\n*         LOGIN         *\n*                       *                       "
end

def create_account_vertical_break
  puts "*                       *\n*     CREATE ACCOUNT    *\n*                       *                       "
end

def menu_box
  menu_line_break
  menu_vertical_break
  menu_line_break
  space
  longer_line_break
  space
end
