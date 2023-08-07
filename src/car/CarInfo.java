package car;
import java.sql.*;
import java.util.Vector;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Random;
public class CarInfo {
	int site;
	int speed;
	int height;
	int note;
	public CarInfo(int pSite,int pSpeed,int pHeight)
	{
		site=pSite;
		speed=pSpeed;
		height=pHeight;
	}
	static public Vector<Site> getSiteList()//
	{
    	Vector<Site> v=new Vector<Site>();
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
            while(rs.next()){
                v.add(new Site(rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6)));
            }
            con.close();
        }
        catch(Exception e){
        	System.out.println(e);
        }
        return v;
    }
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
    public int getSite(){
    	return site;
    }
    public int getSpeed(){
    	return speed;
    }
    public int getHeight(){
    	return height;
    }
    public int getNote() 
    {
    	return note;
    }
}
