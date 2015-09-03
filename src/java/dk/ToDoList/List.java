package dk.ToDoList;

public class List {
	int id;
	String textToDo;
	Boolean remind;
	String dato;
	int freq;
	int cat;
	
	public List(int id, String textToDo, Boolean remind, String date, int frequncy, int category) {
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
	public String getDato() {return this.dato;}
	public int getFrequency() {return this.freq;}
	public int getCategory() {return this.cat;}
}
