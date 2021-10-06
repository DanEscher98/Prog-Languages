import curses

def main():
    stdscr = curses.initscr()
    while True:
        key = stdscr.getch()
        if key == 27: # This is the escape key code
             curses.endwin()
             break

main()
