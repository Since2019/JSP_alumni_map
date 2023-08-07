package car;
import java.sql.*;
import java.util.Vector;

public class Students {
	int id;
private String password;
private String name;
private String city;
private String school;
private String note;
private Double longitude;
	
	
	Double latitude;
	Blob photo;
	
	public Students(int pID,String pPassword,String pName,String pCity,String pSchool,String pNote,Double pLong,Double pLat,Blob pPhoto)
	{
		id=pID;
		//password=pPassword;
		name=pName;
		city=pCity;
		school=pSchool;
		note=pNote;
		longitude=pLong;
		latitude=pLat;		
		photo=pPhoto;
	}
	
	static public Vector<Students> getStudentList()//
	{
    	Vector<Students> v=new Vector<Students>();
    	Connection con;
    	PreparedStatement sql; 
    	try{  
    		Class.forName("com.mysql.jdbc.Driver");   
    	}
        catch(Exception e){
        	System.out.println(e);
        } 
        try {  
   	        String uri= "jdbc:mysql://localhost:3306/duser?serverTimezone=UTC";
            con=DriverManager.getConnection(uri,new String("U-NAS"),new String("password"));
            sql=con.prepareStatement("SELECT  * FROM students");
            ResultSet rs=sql.executeQuery();
            //查询后把结果加到v当中，这个v存了一整行的数据库数据
            while(rs.next()){
                v.add(new Students(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getDouble(7),rs.getDouble(8),rs.getBlob(9)));
            }
            con.close();
        }
        catch(Exception e){
        	System.out.println(e);
        }
        makePath(v);
        return v;
    }
	static void makePath(Vector<Students> students) {
		for(int i=0;i<students.size()-1;++i) {
			double min=1000000;
			int index=-1;
			for(int j=i+1;j<students.size();++j) {
				System.out.println(j+":"+getDistance(students.get(i).getLongitude(),students.get(i).getLatitude(),students.get(j).getLongitude(),students.get(j).getLatitude()));
				if(getDistance(students.get(i).getLongitude(),students.get(i).getLatitude(),students.get(j).getLongitude(),students.get(j).getLatitude())<min) {
					min=getDistance(students.get(i).getLongitude(),students.get(i).getLatitude(),students.get(j).getLongitude(),students.get(j).getLatitude());
					index=j;
				}
			}
			System.out.println("closet:"+index);
	    	Students tmp=students.get(i+1);
		    students.set(i+1,students.get(index));
		    students.set(index,tmp);
		}
	}
	/*
    static public Vector<CarInfo> getCarInfo(){
    	DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
    	Vector<CarInfo> res=new Vector<CarInfo>();
    	try  
    	{   
    	    Date d1 = df.parse("2017-2-25 13:31:40");   
    	    Date d2 = new Date();   
    	    long diff = d2.getTime() - d1.getTime();
    	    for(int i=0;i<5;++i){
    	    	Random random = new Random();
    	    	res.add(new CarInfo((int)(diff/1000*(0.08+i*0.02)%10),random.nextInt(110)%(70) + 40,random.nextInt(110)%(10) + 40));
    	    }
    	}   
    	catch (Exception e)   
    	{   
    		
    		System.out.println(e);
    	}  
    	return res;
    }
    */
	static public double getDistance(Double longitude1, Double latitude1, Double longitude2, Double latitude2) {
		/*D = arc cos((sin北纬A×sin北纬B)＋(cos北纬A×cos北纬B×cosAB两地经度差))×地球平均半径 (Shormin) */
		Double c=sin(latitude1)*sin(latitude2)+cos(longitude1-longitude2)*cos(latitude1)*cos(latitude2);
		Double distance=6371.004*arccos(c);	
		return distance;	
	}
	static Double arccos(Double i){
	    return Math.acos(i);
	}

	static Double cos(Double i){
	    return Math.cos(i/180*Math.PI);
	}
	static Double sin(Double i){
	    return Math.sin(i/180*Math.PI);
	}
	//D = arc cos((sin北纬A×sin北纬B)＋(cos北纬A×cos北纬B×cosAB两地经度差))×地球平均半径 (Shormin) 
    public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public  String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Blob getPhoto() {
		return photo;
	}

	public void setPhoto(Blob photo) {
		this.photo = photo;
	}
	
	public String getNote() 
	{
		return note;
	}
	public void setNote(String note) 
	{
		this.note = note;
	}
	static public Students searchByName(Vector<Students> students,String name) {
		for(int i=0;i<students.size();++i) {
			if(students.get(i).getName().equals(name))
				return students.get(i);
		}
		return students.get(0);
	}
}
