#include <FL/Enumerations.H>
#include <FL/Fl.H>
#include <FL/Fl_Button.H>
#include <FL/Fl_Multiline_Output.H>
#include <FL/Fl_Value_Output.H>
#include <FL/Fl_Window.H>
#include <chrono>
#include <cmath>
#include <list>
#include <string>
#include <thread>

struct CallbackData;
Fl_Multiline_Output *totals;

void column_up_callback(Fl_Widget *widget, void *data);
void column_down_callback(Fl_Widget *widget, void *data);
void any_button_callback(Fl_Widget *widget, void *data);
// Struct for a column in the odometer

struct Column {
  Fl_Button *up;
  Fl_Value_Output *number;
  Fl_Button *down;
  Column *next; // Pointer to the next column (left neighbor)

  // Constructor
  Column(int x, int y, int width, int height, int initialValue)
      : up(new Fl_Button(x, y, width, height, "+")),
        number(new Fl_Value_Output(x, y + height, width, height)),
        down(new Fl_Button(x, y + 2 * height, width, height, "-")),
        next(nullptr) {
    number->value(initialValue);
    number->textsize(16); // Adjust text size for better readability
    up->color(FL_WHITE);
    down->color(FL_WHITE);
  }

  // Attach widgets to the window
  void attach_to_window(Fl_Window &window, CallbackData *callbackData) {
    window.add(up);
    window.add(number);
    window.add(down);
    up->callback(column_up_callback, callbackData);     // Pass CallbackData
    down->callback(column_down_callback, callbackData); // Pass CallbackData
    up->user_data(this);   // Set user_data to the column
    down->user_data(this); // Set user_data to the column
  }

  // Increment the displayed value
  void increment() {
    int currentValue = number->value();
    currentValue++;

    if (currentValue > 9) {
      number->value(0); // Reset current column to 0
      if (next) {
        next->increment(); // Cascade to the next column
      }
    } else {
      number->value(currentValue);
    }
    totals->value("Working...");
  }

  // Decrement the displayed value
  void decrement() {
    int currentValue = number->value();
    currentValue--;

    if (currentValue < 0) {
      number->value(9); // Roll back to 9
      if (next) {
        next->decrement(); // Cascade to the next column
      }
    } else {
      number->value(currentValue);
    }
    totals->value("Working...");
  }
};

std::list<Column *> columns;

void labelChange(Fl_Multiline_Output *totals, std::list<Column *> columns) {
  std::string label;
  int i = 1;
  for (Column *col : columns) {
    label += std::to_string(
        static_cast<int>(col->number->value() * pow(10, (columns.size() - i))));
    if (i != 6) {
      label += " + ";
    }
    i++;
  }
  totals->value(label.c_str());
}

void column_up_callback(Fl_Widget *widget, void *data) {
  Column *column = static_cast<Column *>(data);
  if (column) {
    column->increment();
  }
  labelChange(totals, columns);
}
void column_down_callback(Fl_Widget *widget, void *data) {
  Column *column = static_cast<Column *>(data);
  if (column) {
    column->decrement();
  }
  labelChange(totals, columns);
}

// "Run Up" button callback
void runUp_button_callback(Fl_Widget *widget, void *data) {
  std::list<Column *> *columns = static_cast<std::list<Column *> *>(data);

  // Increment each column in order
  for (Column *place : *columns) {
    while (place->number->value() < 9) {
      columns->back()->increment();
      Fl::check();  // Keep UI responsive
      Fl::redraw(); // Redraw UI to reflect changes
      std::this_thread::sleep_for(std::chrono::microseconds(750));
    }
  }
  totals->value("Done!");
}

// "Run Down" button callback
void runDown_button_callback(Fl_Widget *widget, void *data) {
  std::list<Column *> *columns = static_cast<std::list<Column *> *>(data);

  // Increment each column in order
  for (Column *place : *columns) {
    while (place->number->value() > 0) {
      columns->back()->decrement();
      Fl::check();  // Keep UI responsive
      Fl::redraw(); // Redraw UI to reflect changes
      std::this_thread::sleep_for(std::chrono::microseconds(500));
    }
  }
  totals->value("Done!");
}
// Struct to bundle callback data
struct CallbackData {
  std::list<Column *> *columns; // Pointer to the list of Column objects
  Fl_Multiline_Output *totals;  // Pointer to the totals output widget
};

// Main function
int main() {
  Fl_Window window(350, 300, "Odometer");
  window.color(0xF2120200);

  int x = 300, y = 50, width = 50, height = 30;

  // Shared callback data
  CallbackData callbackData{&columns, totals};

  // Create columns and link them
  for (int i = 0; i < 6; ++i) {
    Column *col = new Column(x, y, width, height, 0);
    columns.push_front(col);
    x -= 60;
  }

  // Link columns for cascading behavior
  auto it = columns.begin();
  auto prev = it;
  ++it;
  while (it != columns.end()) {
    (*it)->next = *prev;
    prev = it;
    ++it;
  }

  // Attach columns to the window
  for (Column *col : columns) {
    col->attach_to_window(window, &callbackData); // Pass CallbackData
  }

  // Create totals display
  totals = new Fl_Multiline_Output(10, 200, 330, 80);
  totals->color(FL_WHITE);

  // Create the "Run Up" button
  Fl_Button runUp(95, 140, 80, 40, "Run Up");
  runUp.callback(runUp_button_callback, &columns); // Pass the columns list

  // Create the "Run Down" button
  Fl_Button runDown(175, 140, 80, 40, "Run Down");
  runDown.callback(runDown_button_callback, &columns); // Pass the columns list

  window.end();
  window.show();
  return Fl::run();
}
