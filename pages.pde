class Pages {
  String page = "";
  String ORDERS = "ORDERS";
  String PAIDS = "PAIDS";
  String SETTINGS="String";
    String DASHBOARD="DASHBOARD";
     String NOTIFICATION="NOTIFICATION";
  boolean isOrders () {
    return page.equals (ORDERS);
  }
  boolean isSettings () {
  return page.equals (SETTINGS);
  }
  boolean isPaids () {
    return page.equals (PAIDS);
  }
 boolean isDashBoards() {
    return page.equals (DASHBOARD);
  }
   boolean isNotification() {
    return page.equals (NOTIFICATION);
  }
 
  void setOrders () {
    page = ORDERS;
  }
  void setSettings () {
    page = SETTINGS;
  }  
  void setPaids () {
    page = PAIDS;
  }  
  void setDashBoards () {
    page =DASHBOARD;
  }
   void setNotification () {
      page =NOTIFICATION;
  }

}
