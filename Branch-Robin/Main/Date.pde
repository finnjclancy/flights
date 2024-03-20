/* //<>//
  This class will sort through the flights based on the dates entered by the
 user, either a date range such as flexible dates or specific dates for departure and returns.
 */
class Date
{
  // date of desired flight set by user in some way
  String date = "01/02/2022 00:00";
  int date2 = 02;
  String[] justDates = new String[linesSplit.length];
  int [] monthOcc = new int [11];

  // constructor
  Date(String linesSplit[][])
  {
    //this.lineSplit[][] = lineSplit[][];
    println("Please put in your desired flight date (DD/MM/YYYY HH:MM)");
  }

  // used to create an array with just the dates of all the flights to compare it to our string more easily
  void getDates(String linesSplit[][])
  {
    int newArrayIndex = 0;
    int index = 1;
    for (; index < linesSplit.length; )
    {
      justDates[newArrayIndex] = linesSplit[index][0];
      newArrayIndex++;
      index++;
    }
    findFlightsString(justDates, linesSplit);
    findFlightsInt(justDates, linesSplit);
    visualiseMonths(justDates);
  }

  // used to compare our input string with the dates in the new justDates array and used to then print the whole flight with this date
  void findFlightsString (String[] justDates, String linesSplit[][])
  {
    int flightCount = 0;
    println("This is what was found: ");
    for (int index = 0; index < justDates.length; index++)
    {
      if (justDates[index] != null && justDates[index].equals(date)) // maybe use .equals
      {
        flightCount++;
        for (int rowIndex = index + 1; rowIndex < index+2; rowIndex++)
        {
          for (int columnIndex = 0; columnIndex < 20; columnIndex++)
          {
            if (columnIndex < 19)
            {
              //print(linesSplit[rowIndex][columnIndex] + ", ");
            } else
            {
              //println(linesSplit[rowIndex][columnIndex]);
            }
          }
        }
      }
    }
    if (flightCount==0)
    {
      println("There are no flights with this date or there has been an error with the date you put in");
      println("Verify that the date you put in is correct and try again");
    }
    else
    {
      println("There are " + flightCount + " results to your search.");
    }
  }



  void findFlightsInt (String[] justDates, String linesSplit[][])
  {
    int flightCount = 0;
    String dateString = "";
    if (date2 < 10)
    {
      dateString = "0" + date2;
    } else
    {
      dateString += date2;
    }

    println("This is what was found: ");
    for (int index = 1; index < justDates.length; index++)
    {
      if (justDates[index] != null)
      {
        String [] justDatesSplit = justDates[index].split("/");
        if (justDatesSplit[1] != null && justDatesSplit[1].equals(dateString)) // maybe use .equals
        {
          flightCount++;
          for (int rowIndex = index + 1; rowIndex < index+2; rowIndex++)
          {
            for (int columnIndex = 0; columnIndex < 20; columnIndex++)
            {
              if (columnIndex < 19)
              {
                //print(linesSplit[rowIndex][columnIndex] + ", ");
              } else
              {
                //println(linesSplit[rowIndex][columnIndex]);
              }
            }
          }
        }
      }
    }
    if (flightCount==0)
    {
      println("There are no flights with this date or there has been an error with the date you put in");
      println("Verify that the date you put in is correct and try again");
    } else
    {
      println("There are " + flightCount + " results to your search.");
    }
  }







  void visualiseMonths(String[] justDates)
  {
    int jan = 0;
    int feb = 0;
    int mar = 0;
    int apr = 0;
    int may = 0;
    int jun = 0;
    int jul = 0;
    int aug = 0;
    int sep = 0;
    int oct = 0;
    int nov = 0;
    int dez = 0;
    for (int index = 0; index < justDates.length - 1; index++)
    {
      String [] onlyMonth = justDates[index].split("/");
      String monthIndex = onlyMonth[1];        // if it is DD/MM/YYYY
      switch (monthIndex)
      {
      case "01":
        jan++;
        monthOcc[0]= jan;
        break;

      case "02":
        feb++;
        monthOcc[1]= feb;
        break;

      case "03":
        mar++;
        monthOcc[2]= mar;
        break;

      case "04":
        apr++;
        monthOcc[3]= apr;
        break;

      case "05":
        may++;
        monthOcc[4]= may;
        break;

      case "06":
        jun++;
        monthOcc[5]= jun;
        break;

      case "07":
        jul++;
        monthOcc[6]= jul;
        break;

      case "08":
        aug++;
        monthOcc[7]= aug;
        break;

      case "09":
        sep++;
        monthOcc[8]= sep;
        break;

      case "10":
        oct++;
        monthOcc[9]= oct;
        break;

      case "11":
        nov++;
        monthOcc[10]= nov;
        break;

      case "12":
        dez++;
        monthOcc[11]= dez;
        break;
      }
    }
    //println(monthOcc[1]);
  }

  // void drawBarChart(int[] monthCounts) {
  //  int barWidth = 40;
  //  int startX = 50;
  //  int startY = height - 100;
  //  int barGap = 10;
  //  int maxCount = max(monthCounts);

  //  for (int i = 0; i < monthCounts.length; i++) {
  //    float x = startX + i * (barWidth + barGap);
  //    float y = startY - map(monthCounts[i], 0, maxCount, 0, 100);
  //    rect(x, y, barWidth, height - y - 100);
  //  }
  //}

  //void draw()
  //{
  //}
}

//---------------------------------------------------------------------------------------------
// without the conversion of my justDates array.
// In this version justDates consists of the date at one index and null at the rest of the rows.
// looks less clean in the array but does not need the converter and has cleaner code
// both version should work fine


//void getDates(String linesSplit[][])
//{
//  String[] justDates = new String[linesSplit.length/18];
//  justDates[0] = "0";
//  for (int index = 1; index < linesSplit.length; index + 18)
//  {
//    justDates[index] = linesSplit[index][0];
//    println(justDates[index]);
//  }
//  findFlights(justDates, linesSplit);
//}

//void findFlights (String[] justDates, String linesSplit[][])
//{
//  int flightCount = 0;
//  println("This is what was found: ");
//  for (int index = 1; index < justDates.length; index++)
//  {
//    if (justDates[index] == date)
//    {
//      flightCount++;
//      for (rowIndex = index; rowIndex < index+18; rowIndex++)
//      {
//        for (int columnIndex = 0; columnIndex < 18; columnIndex++)
//        {
//          println(linesSplit[rowIndex][columnIndex]);
//        }
//      }
//    }
//  }
//  if (flightCount==0)
//  {
//    println("There are no flights with this date or there has been an error with the date you put in");
//    println("Verify that the date you put in is correct and try again");
//  }
//}
