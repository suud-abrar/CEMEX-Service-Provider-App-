Pages page;

String[] head={"Dashboard", "Orders", "Paids", "Setting", "Notification"};
void setup() {
  fullScreen();
  initCommonPage ();
  initpaid();
  initorder();
  initnotification();
  initDashboard ();
  initsetting();
  page = new Pages ();
  page.setDashBoards ();
}
void draw() {
  background(#020F1D);
    CommonPageDraw();
  if (page.isDashBoards()) {
    dashboardDraw();
    fill(255);
    textAlign(LEFT, TOP);
    textSize(31.89);
    text(head[0], 342, 95);
  } else if (page.isOrders()) {
    orderDraw();
    fill(255);
    textAlign(LEFT, TOP);
    textSize(31.89);
    text(head[1], 342, 95);
  } else if (page.isPaids()) {
    paidDraw();
    fill(255);

    textAlign(LEFT, TOP);
    textSize(31.89);
    text(head[2], 342, 95);
  } else if (page.isSettings()) {
    settingDraw();
    fill(255);
    textAlign(LEFT, TOP);
    textSize(31.89);
    text(head[3], 342, 95);
  } else if (page.isNotification()) {
    notificationDraw();
    fill(255);
    textAlign(LEFT, TOP);
    textSize(31.89);
    text(head[4], 342, 95);
  }
}
void mousePressed () {
  navBar.mousePressed ();
  if (navBar.active (0)) {

    page.setDashBoards ();
  } else if (navBar.active (1)) {
    FactoryType.value="";
    page.setOrders();
  } else if (navBar.active (2)) {
    FType.value="";
    page.setPaids ();
  } else if (navBar.active (3)) {
    page.setSettings();
  } else if (navBar.active (4)) {
    page. setNotification ();
  }

  if (page.isOrders()) {
    ordermousePressed ();
  } else if (page.isPaids()) {
    paidmousePressed ();
  } else if (page.isNotification()) {
    notificationmousePressed();
  } else if (page.isSettings()) {
    settingmousePressed ();
  }
}
void mouseWheel (MouseEvent e) {
  ordermouseWheel (e);
  paidmouseWheel(e);
  notificationmousewheel(e);
  settingmouseWheel(e);
}
void keyPressed(){
settingkeyPressed();
}
