import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author enshuti
 */
public class TodoItem {
    
    String text;
    Date dateCreated;
    Boolean remind = false;
    int frequency;
    int category;

    
    
    @Override
    public String toString() {
        dateCreated = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("ddd-mmm-yyyy HH:mm");
        dateFormat.setTimeZone(TimeZone.getTimeZone("GMT+2"));
        
        return dateFormat.format(dateCreated);
    }
    
}
