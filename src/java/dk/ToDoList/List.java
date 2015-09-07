package dk.ToDoList;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class List {
	int id;
	String textToDo;
	Boolean remind;
	Date dato;
	int freq;
	int cat;
	
	public List(int id, String textToDo, Boolean remind, Date date, int frequncy, int category) {
		this.id = id;
		this.textToDo = textToDo;
		this.remind = remind;
		this.dato = date;
		this.freq = frequncy;
		this.cat = category;
	}
	
	public int getId(){return this.id;}
	public String getTextToDo(){return this.textToDo;}
	public Boolean getRemind() {return this.remind;}
	public Date getDato() {return this.dato;}
	public int getFrequency() {return this.freq;}
	public int getCategory() {return this.cat;}
        
        @Override
        public String toString() {
        dato = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("ddd-mmm-yyyy HH:mm");
        dateFormat.setTimeZone(TimeZone.getTimeZone("GMT+2"));
        
        return dateFormat.format(dato);
    }
}
