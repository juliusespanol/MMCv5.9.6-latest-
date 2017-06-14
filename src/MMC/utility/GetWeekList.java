package MMC.utility;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.List;
/*from w ww .  j a v  a  2  s .  com*/
public class GetWeekList {

  public static void main(String[] args) {

    System.out.println();
  }

  public List<LocalDate> weeksInCalendar(YearMonth month,int week) {
    List<LocalDate> firstDaysOfWeeks = new ArrayList<>();
    for (LocalDate day = firstDayOfCalendar(month,week); stillInCalendar(month, day); day = day
        .plusWeeks(1)) {
      firstDaysOfWeeks.add(day);
    }
    return firstDaysOfWeeks;
  }

  private static LocalDate firstDayOfCalendar(YearMonth month,int week) {
    DayOfWeek FIRST_DAY_OF_WEEK = DayOfWeek.of(week);
    return month.atDay(1).with(FIRST_DAY_OF_WEEK);
  }

  private static boolean stillInCalendar(YearMonth yearMonth, LocalDate day) {
    return !day.isAfter(yearMonth.atEndOfMonth());
  }
}