package car;

public class Site {
    private String name;
    private String school;
    private String city;
    private String note;
    public Site(String pName,String pCity,String pSchool, String pnote)//在这里改顺序
    {
    	name=pName;
    	school=pSchool;
    	city=pCity;
    	note=pnote;
    }
    public String getName(){return name; }
    public String getSchool(){return school;}
    public String getCity(){return city;}
    public String getNote(){return note;}
}
