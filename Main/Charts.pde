class Charts 
{
  final int SCREENX = 1000;
  final int SCREENY = 1000;
  final int startingXAxisValues = SCREENX + 50;
  final int startingYAxisValue = SCREENY - 50;
  
  // This function a string array and integer array that are of equal length
  // The String array represents the values on the x-axis
  // The integer array represnets the values of the String array
  // The indexes of both arrays correspond to eachother
  // e.j. String[] = ["JFK", "LAX"]; int[] = [10, 24];
  // The X-axis will have the values JFK and LAX
  // The Y-axis will have the values 10 and 24
  void barCharts(String[] xAxisValues, int[] yAxisValues, String chartTitle)
  {
    // Y-Axis line
    line(SCREENX * 0.1, SCREENY * 0.1, SCREENX * 0.1, SCREENY * 0.9);
    
    // X-Axis line
    line(SCREENX * 0.1, SCREENY * 0.9, SCREENX * 0.9, SCREENY * 0.9);
    
    // Width of each bar
    float barWidth = SCREENX * 0.8 / yAxisValues.length;
    
    // Highest Y-Axis Value
    int biggestYAxisValue = 0;
    int highestNumber = max(yAxisValues);
    
    // If the highest value is divisible by 5 set it equal to the highest value
    if(highestNumber % 5 == 0)
    {
      biggestYAxisValue = highestNumber;  
    }
    // If the highset value is not divisible by 5, the highest value is rounded to the next 5
    else
    {
      biggestYAxisValue = ((highestNumber / 5) + 1) * 5;
    }
    
    // Loop through all the values and print them on the screen
    for(int values = 0; values < xAxisValues.length; values++)
    {
      int offsetFromAxisForLabels = 10;
      // Print the X-Axis labels
      text(xAxisValues[values], (SCREENX * 0.1) + values * barWidth, (SCREENY * 0.9) + offsetFromAxisForLabels);
      
      // Print the Y-Axis labels
      text(yAxisValues[values], (SCREENX * 0.1) - offsetFromAxisForLabels, (SCREENY * 0.9) - ((yAxisValues[values] / biggestYAxisValue) * (SCREENY * 0.8)));
      
      // Print the bars
      rect((SCREENX * 0.1) + values * barWidth, (SCREENX * 0.1) + values * barWidth, barWidth, (yAxisValues[values] / biggestYAxisValue) * (SCREENY * 0.8));
      
      // Print the title
      textAlign(CENTER);
      int offsetFromTopForTitle = 20;
      text(chartTitle, SCREENX / 2, (SCREENY * 0.1) - offsetFromTopForTitle);
    }
  }
}





//class Charts
//{
//  Airport airports;
//  Date userDate;
//  int barWidth = 50;
//  int startX = 50;
//  int startY = height - 50;
//  int barGap = 20;
//  int maxData = 393; // Find the maximum value in the data


//  Charts (int [] monthOcc)
//  {
//    //int [] monthOccCharts = userDate.monthOcc;
//    this.startX = startX;
//    this.startY = startY;
//  }

//  Charts (String [] airports)
//  {
//  }




//  void drawDates(int [] monthOccCharts)
//  {
//    int change = 50;
//    for (int index = 0; index < monthOccCharts.length; index++)
//    {
//      println(monthOccCharts[index+1]);
//      //fill(0);
//      float x = startX + index * (barWidth + barGap);
//      float barHeight = map(monthOccCharts[index], 0, maxData, 0, height - 100);
//      float y = startY - barHeight;
//      rect(x, y, barWidth, barHeight);
//      //rect(x + change, y, monthOccCharts[index]/3, 30);
//      change += 30;
//    }
//  }

//  void drawAirports()
//  {
//  }




//  void draw()
//  {
//  }
//}
