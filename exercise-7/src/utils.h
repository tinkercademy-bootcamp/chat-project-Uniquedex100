#ifndef UTILS_H
#define UTILS_H

#include <concepts>
#include <stdexcept>
#include <string_view>
#include <string>

#include <ncurses.h>
#include "spdlog/spdlog.h"

namespace tt::chat {

template <std::same_as<bool> T, std::convertible_to<std::string_view> S>
void check_error(T test, S error_message) {
  if (test) {
    SPDLOG_ERROR("{}", error_message);
    throw std::runtime_error(error_message);
  }
}

inline void init_ncurses() {
  initscr();
  cbreak();
  noecho();
  keypad(stdscr, TRUE);
  scrollok(stdscr, TRUE);
  curs_set(1);
  clear();
  refresh();
}

inline void end_ncurses() {
  curs_set(1);
  endwin();
}

inline void print_output(const std::string& message) {
  int input_row = LINES - 2;
  move(input_row - 1, 0);
  insertln();
  printw("%s\n", message.c_str());
  refresh();
}

inline std::string get_input() {
  char input_buffer[256];
  int input_row = LINES - 2;
  move(input_row, 0);
  clrtoeol();
  printw("> ");
  refresh();
  echo();
  getnstr(input_buffer, sizeof(input_buffer) - 1);
  noecho();
  return std::string(input_buffer);
}

} // namespace tt::chat

#endif // UTILS_H
