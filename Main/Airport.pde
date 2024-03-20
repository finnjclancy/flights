/*
 Within this there will be two subpages that check if the user wants to input
 only the desitnation, only the departure or both.
 */
//final int destAbv = 1;
//final int orgAbv = 2;
final int orgIndex = 3;
final int destIndex = 8;
final int numberOfColoumns = 20;

class Airport {

  int numOfOcc;
  String nameOfAirport;
  ArrayList<Airport> orgPorts = new ArrayList<>();
  ArrayList<Airport> destPorts = new ArrayList<>();
  String flightList[][];
  int highestNumber = 0;

  Airport(String flightList[][])
  {
    this.flightList = flightList;
  }

  Airport(String nameOfAirport)
  {
    this.numOfOcc = 1;
    this.nameOfAirport = nameOfAirport;
  }

  ArrayList findFlight(String airportName, int orgOrDest)
  {
    int runningTotal = 0;
    switch(orgOrDest)
    {
    case 1:
      String destAirport = "";
      for (int rowIndex = 1; rowIndex < flightList.length; rowIndex++)
      {
        //output.println(flightList[rowIndex][orgIndex]);
        if (flightList[rowIndex][orgIndex].equals(airportName))
        {
          destAirport = flightList[rowIndex][destIndex];
          for (int coloumnIndex = 0; coloumnIndex < numberOfColoumns; coloumnIndex++)
          {
            if (flightList[rowIndex][coloumnIndex].equals(""))
            {
              output.println("N/A");
            } else
            {
              output.println(flightList[rowIndex][coloumnIndex]);
            }
          }
          output.println("------------------------------------");

          if (destPorts.isEmpty())
          {
            Airport newAirport = new Airport(destAirport);
            destPorts.add(newAirport);
          } 
          else
          {
            boolean found = false;
            for (int listIndex = 0; listIndex < destPorts.size(); listIndex++)
            {
              Airport tempPort = destPorts.get(listIndex);
              if (tempPort.nameOfAirport.equals(destAirport))
              {
                tempPort.numOfOcc++;
                found = true;
                break;
              }
            }
            if (!found)
            {
              Airport newAirport = new Airport(destAirport);
              destPorts.add(newAirport);
            }
          }
        }
      }
      for (int index = 0; index < destPorts.size(); index++)
      {
        Airport temp = destPorts.get(index);
        println(temp.nameOfAirport + ": " + temp.numOfOcc);
        if (highestNumber < temp.numOfOcc)
        {
          highestNumber = temp.numOfOcc;
        }
        runningTotal += temp.numOfOcc;
      }
      println(runningTotal);
      println(highestNumber);
      return destPorts;

    case 2:
      String orgAirport = "";
      for (int rowIndex = 1; rowIndex < flightList.length; rowIndex++)
      {
        if (flightList[rowIndex][destIndex].equals(airportName))
        {
          orgAirport = flightList[rowIndex][orgIndex];
          for (int coloumnIndex = 0; coloumnIndex < numberOfColoumns; coloumnIndex++)
          {
            if (flightList[rowIndex][coloumnIndex].equals(""))
            {
              output.println("N/A");
            } 
            else
            {
              output.println(flightList[rowIndex][coloumnIndex]);
            }
          }
          output.println("------------------------------------");

          if (orgPorts.isEmpty())
          {
            Airport newAirport = new Airport(orgAirport);
            orgPorts.add(newAirport);
          } 
          else
          {
            boolean found = false;
            for (int listIndex = 0; listIndex < orgPorts.size(); listIndex++)
            {
              Airport tempPort = orgPorts.get(listIndex);
              if (tempPort.nameOfAirport.equals(orgAirport))
              {
                tempPort.numOfOcc++;
                found = true;
                break;
              }
            }
            if (!found)
            {
              Airport newAirport = new Airport(orgAirport);
              orgPorts.add(newAirport);
            }
          }
        }
      }
      for (int index = 0; index < orgPorts.size(); index++)
      {
        Airport temp = orgPorts.get(index);
        println(temp.nameOfAirport + ": " + temp.numOfOcc);
        if (highestNumber < temp.numOfOcc)
        {
          highestNumber = temp.numOfOcc;
        }
        runningTotal += temp.numOfOcc;
      }
      println(runningTotal);
      println(highestNumber);
      return orgPorts;

    default:
      return new ArrayList<Airport>();
    }
  }

  void findFlight(String orgName, String destName)
  {
    for (int rowIndex = 1; rowIndex < flightList.length; rowIndex++)
    {
      //output.println(flightList[rowIndex][orgIndex]);
      if (flightList[rowIndex][orgIndex].equals(orgName))
      {
        if (flightList[rowIndex][destIndex].equals(destName))
        {
          for (int coloumnIndex = 0; coloumnIndex < numberOfColoumns; coloumnIndex++)
          {
            if (flightList[rowIndex][coloumnIndex].equals(""))
            {
              output.println("N/A");
            } 
            else
            {
              output.println(flightList[rowIndex][coloumnIndex]);
            }
          }
          output.println("------------------------------------");
        }
      }
    }
  }

  void drawBarChart(ArrayList<Airport> tempArray)
  {
    float barWidth = 500 / tempArray.size();
    int maxValue = findMaxValue(tempArray);
    highestNumber = ((highestNumber / 10) + 1) * 10;
    println(highestNumber);
    
    line(50, height - 50, 50, 50);
    line(50, height - 50, width - 50, height - 50); 

    for (int index = 0; index < tempArray.size(); index++)
    {
      float barHeight = map(float(tempArray.get(index).numOfOcc), 0, maxValue, 0, 500);
      float x = index * barWidth;
      float y = height - barHeight; // Invert y-coordinate to draw from bottom
      stroke(255,0,0);
      //fill(random(255),random(255),random(255));
      rect(x+50, y-50, barWidth, barHeight);
      fill(255);
      text(tempArray.get(index).nameOfAirport, x+40 + barWidth / 2, height - 20);
      
      // Draw the line
      stroke(255);
      line(10, float(height-40), float(width - 50), float(height-40));
      
      stroke(255);
      line(35, float(height-20), 35, float(40));
  
  // Calculate the angle of the line
  //    float angle = atan2(y2 - y1, x2 - x1);
  
  //// Draw the arrowhead
  //    pushMatrix();
  //    translate(x2, y2);
  //    rotate(angle);
  //    triangle(-arrowSize*0.5, arrowSize, 0, 0, arrowSize*0.5, arrowSize);
  //    popMatrix();
      
    }
  }

  int findMaxValue(ArrayList<Airport> tempArray)
  {
    int maxValue = 0;
    for (int index = 0; index < tempArray.size(); index++)
    {
      Airport temp = new Airport("");
      temp = tempArray.get(index);
      if (temp.numOfOcc > maxValue)
      {
        maxValue = temp.numOfOcc;
      }
    }
    return maxValue;
  }
}
