class Charts
{
  Airport airports;
  Date userDate;
  int barWidth = 50;
  int startX = 50;
  int startY = height - 50;
  int barGap = 20;
  int maxData = 393; // Find the maximum value in the data


  Charts (int [] monthOcc)
  {
    //int [] monthOccCharts = userDate.monthOcc;
    this.startX = startX;
    this.startY = startY;
  }

  Charts (String [] airports)
  {
  }




  void drawDates(int [] monthOccCharts)
  {
    int change = 50;
    for (int index = 0; index < monthOccCharts.length; index++)
    {
      println(monthOccCharts[index+1]);
      //fill(0);
      float x = startX + index * (barWidth + barGap);
      float barHeight = map(monthOccCharts[index], 0, maxData, 0, height - 100);
      float y = startY - barHeight;
      rect(x, y, barWidth, barHeight);
      //rect(x + change, y, monthOccCharts[index]/3, 30);
      change += 30;
    }
  }

  void drawAirports()
  {
  }




  void draw()
  {
  }
}
