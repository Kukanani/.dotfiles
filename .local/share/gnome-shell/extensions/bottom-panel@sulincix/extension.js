
const Main = imports.ui.main;
const PanelBox = Main.layoutManager.panelBox;

function init() { }

function enable() {
    let monitor = Main.layoutManager.primaryMonitor;
    PanelBox.set_pivot_point(0,monitor.height-PanelBox.height);
    PanelBox.set_position(0,monitor.height-PanelBox.height);
}

function disable() {
   let monitor = Main.layoutManager.primaryMonitor;  
   PanelBox.set_pivot_point(0,0);
   PanelBox.set_position(0,0);
}
