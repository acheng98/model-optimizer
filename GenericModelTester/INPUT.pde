// Main Tab for enabling user interface elements such as buttons, key presses, and mouse clicks
// Adapted from Ira Winder's INPUT tab in FluxMap

// Class that holds a button menu
Menu mainMenu, hideMenu;
int menuWidth = 250; 

// Button Offeset Values
int BUTTON_OFFSET_H = 45;
int BUTTON_OFFSET_W = 50;

// Menu Alignment on Screen
String align = "LEFT";

// Set this to true to display the main menu upon start
boolean showMainMenu = true;

// Define/Arrange how many buttons are in the Main Menu and 
// what they are named by editing this String array:
// [0] Name; [1] Abbreviated name
String[][] buttonNames = 
{ 
  { "Data Info", "d" },
  { "VOID", "" },
  { "Model Info", "m" },
  { "Simulate Light", "s" },
  { "Model Error", "e" },
  { "Point Source Model", "1" },
  { "Gaussian LED Model", "2" },
  { "Next Model Fit", "t" },
  { "VOID", "" },
  { "Increase Resolution", ">" },
  { "Decrease Resolution", "<" },
  { "Zoom In", "-" },
  { "Zoom Out", "+" },
  { "Reset View", "SPACE" }
};

// Hash Map of Button Names where Key is key-command and Value is buttonNames[] index
HashMap<String, Integer> bHash;

// This Strings is for the hideMenu, formatted as array for Menu Class Constructor
String[][] show = { {"Show Main Menu (h)", "h"} };

//void loadMenu(int canvasWidth, int canvasHeight) {
//  // Initializes Menu Items (canvas width, canvas height, button width[pix], button height[pix], 
//  // number of buttons to offset downward, String[] names of buttons)
//  String[][] hideText = show;
//  hideMenu = new Menu(canvasWidth, canvasHeight, max(int(width*.13), 160), 25, 0, hideText, align);
//  mainMenu = new Menu(canvasWidth, canvasHeight, max(int(width*.13), 160), 25, 2, buttonNames, align);
//  
//  // Hash Map of Button Names where Key is key-command and Value is buttonNames[] index
//  bHash = hashButtons(buttonNames);
//  
//  // Depress Active Buttons
//  hideMenu.buttons[0].isPressed = showMainMenu;
//  mainMenu.buttons[ bHash.get("f") ].isPressed = displayFixtures;
//  mainMenu.buttons[ bHash.get("r") ].isPressed = displayReadings;
//  mainMenu.buttons[ bHash.get("s") ].isPressed = displaySimulation;
//  
//  // Depress Selected Model Button
//  if (modelType.equals("point")) {
//    mainMenu.buttons[ bHash.get("1") ].isPressed = true;
//    mainMenu.buttons[ bHash.get("2") ].isPressed = false;
//  } else if (modelType.equals("gaussian")) {
//    mainMenu.buttons[ bHash.get("1") ].isPressed = false;
//    mainMenu.buttons[ bHash.get("2") ].isPressed = true;
//  }
//
//}
