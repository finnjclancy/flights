// FUNCTION TO RETURN TOTAL LATE FLIGHTS //<>// //<>// //<>//
// FUNCTION TO RETURN DELAYED FLIGHTS PER AIRPORT
// FUNCTION TO APPEND THE DELAY OF EACH FLIGHT
// FUNCTION TO PRINT HOW MANY FLIGHTS WERE DELAYED PER AIRPORT ORDERED
// FUNCTION TO GET UNIQUE VALEUS FROM A COLUMN

import java.util.*;

public static class delays
{

  public static int numberOfDelays(String[][] data)
  {
    int amountOfDelays = 0;

    // LOOP THROUGH EVERYFLIGHT
    for (int flight = 0; flight < data.length; flight++)
    {
      int scheduledTime;
      int departureTime;

      // COLUMN INDEX 13 IS SCHEDULED DEPARTURE
      // COLUMN INDEX 14 IS DEPARTURE TIME
      if (data[flight][13] != null && data[flight][14] != null && data[flight][13] != "" && data[flight][14] != "")
      {
        scheduledTime = Integer.valueOf(data[flight][13]);
        departureTime = Integer.valueOf(data[flight][14]);

        if (scheduledTime < 100)
        {
          scheduledTime += 2400;
        }

        if (departureTime < 100)
        {
          departureTime += 2400;
        }

        if (scheduledTime < departureTime)
        {
          amountOfDelays++;
        }
      }
    }
    return amountOfDelays;
  }

  public static int lateFlightsAtAirport(String data[][], String airport)
  {
    // THIS FUNCTION TAKES THE DATA AND AN AIRPORT AND RETURNS NUMBER OF LATE FLIGHTS
    int numberOfLateFlights = 0;

    for (int flight = 0; flight < data.length; flight++)
    {
      // THIRD COLUMN CONTAINS THE ORIGIN AIRPORT
      if (data[flight][3] != null && data[flight][3].equals(airport) && data[flight][3] != "")
      {
        int timeScheduledToLeave;
        int timeLeft;

        // COLUMN INDEX 13 IS SCHEDULED DEPARTURE && COLUMN INDEX 14 IS DEPARTURE TIME
        if (data[flight][17] != "1" && data[flight][13] != "" && data[flight][14] != "" && data[flight][14] != null)
        {
          timeScheduledToLeave = Integer.valueOf(data[flight][13]);
          timeLeft = Integer.valueOf(data[flight][14]);

          if (timeScheduledToLeave < 100)
          {
            timeScheduledToLeave += 2400;
          }

          if (timeLeft < 100)
          {
            timeLeft += 2400;
          }

          if (timeScheduledToLeave < timeLeft)
          {
            numberOfLateFlights++;
          }
        }
      }
    }
    return numberOfLateFlights;
  }

  // RETURNS ARRAY WITH APPENDED DIFFERENCES
  // 19TH COLUMN OF RETURNED 2D ARRAY CONTAINS HOW LATE THE FLIGHT IS
  public static String[][] differenceInFlights(String[][] data)
  {
    int timeScheduledToLeave;
    int timeLeft;
    int DelayTime[] = new int[data.length]; 
 
    // COLUMN INDEX 13 IS SCHEDULED DEPARTURE && COLUMN INDEX 14 IS DEPARTURE TIME
    for (int flight = 0; flight < data.length; flight++)
    {
      int timeDelayed;
      if (data[flight][17] != "1" && data[flight][13] != "" && data[flight][14] != "" && data[flight][14] != null)
      {
        timeScheduledToLeave = Integer.valueOf(data[flight][13]);
        timeLeft = Integer.valueOf(data[flight][14]);

        if (timeScheduledToLeave < 100)
        {
          timeScheduledToLeave += 2400;
        }

        if (timeLeft < 100)
        {
          timeLeft += 2400;
        }

        if (timeScheduledToLeave < timeLeft)
        {
          timeDelayed = timeLeft - timeScheduledToLeave;
          DelayTime[flight] = timeDelayed;
        }
      }
    }
    
    String appendedArray[][] = new String[data.length][data[1].length + 1];
    
    for(int flight = 0; flight < data.length; flight++)
    {
      for(int detail = 0; detail < data[1].length; detail++)
      {
        appendedArray[flight][detail] = data[flight][detail];
      }
    }
    
    for(int flight = 0; flight < appendedArray.length; flight++)
    {
      appendedArray[flight][appendedArray[1].length - 1] = Integer.toString(DelayTime[flight]);
    }
    
    return appendedArray;
    
  }

  // PRINTS AN ORGANIZED TREE MAP OF HOW MUCH FLIGHTS WERE DELAYED FROM EACH AIRPORT
  public static void lateDepartments(String[][] data)
  {
    String[] uniqueAirports = getUniqueColumnValues(data, 3);
    int[] uniqueAirportsLateDepartures = new int[uniqueAirports.length];

    for (int airport = 0; airport < uniqueAirports.length; airport++)
    {
      String currentAirport = uniqueAirports[airport];
      int lateTimesAtCurrentAirport = lateFlightsAtAirport(data, currentAirport);

      uniqueAirportsLateDepartures[airport] = lateTimesAtCurrentAirport;
    }

    Map<String, Integer> airportLateFlightsMap = new HashMap<>();

    for (int airport = 0; airport < uniqueAirports.length; airport++)
    {
      airportLateFlightsMap.put(uniqueAirports[airport], uniqueAirportsLateDepartures[airport]);
    }
    
    airportLateFlightsMap.remove(null);

    // Create a list of map entries
    List<Map.Entry<String, Integer>> entryList = new ArrayList<>(airportLateFlightsMap.entrySet());

    // Sort the list based on values
    entryList.sort(Map.Entry.comparingByValue());

    // Create a new LinkedHashMap to maintain the insertion order
    LinkedHashMap<String, Integer> sortedMap = new LinkedHashMap<>();
    for (Map.Entry<String, Integer> entry : entryList)
    {
      sortedMap.put(entry.getKey(), entry.getValue());
    }

    // Displaying the sorted map
    System.out.println("How many flights were late per airport:");
    for (Map.Entry<String, Integer> entry : sortedMap.entrySet())
    {
      System.out.println(entry.getKey() + ": " + entry.getValue());
    }
  }


  public static String[] getUniqueColumnValues(String[][] data, int columnIndex)
  {
    Set<String> uniqueValues = new HashSet<>();

    for (String[] row : data)
    {
      if (row.length > columnIndex)
      {
        uniqueValues.add(row[columnIndex]);
      }
    }

    String[] uniqueArray = new String[uniqueValues.size()];
    int index = 0;

    for (String value : uniqueValues)
    {
      uniqueArray[index++] = value;
    }

    return uniqueArray;
  }
}
