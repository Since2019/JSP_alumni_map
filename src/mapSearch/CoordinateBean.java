package mapSearch;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

public class CoordinateBean 
{
	private static Map<String,String> map = null;
	private static String address=null;
	public static final String KEY_1 = "7d9fbeb43e975cd1e9477a7e5d5e192a";
	
	//获取学校名
	public static void setSchoolName(String inpAddress) 
	    {
	    	address=inpAddress;
	    
	    }
	
	//得到经度
	public static Double getSchoolLong()
	{
		 try 
	        {
	            Map<String, String> schoolCo = getGeocoderLatitude(address);//
	            Double sLng=Double.valueOf(schoolCo.get("lng"));

	            return sLng;
	           
	        }
		 catch (Exception e )
		 		{
	        		e.printStackTrace();
	        		return null;
		 		}
	}
	//得到纬度
	public static Double getSchoolLat()
	{
		 try 
	        {
	            Map<String, String> schoolCo = getGeocoderLatitude(address);
	            Double sLat=Double.valueOf(schoolCo.get("lat"));
	            
	            return sLat;
	           
	        }
		 catch (Exception e )
		 		{
	        		e.printStackTrace();
	        		return null;
		 		}
	}
	
	public static Map<String,String> getGeocoderLatitude(String address)//用Map类来进行地址经纬度的存放
	{
        BufferedReader in = null;//不明白
        try {
            //将地址转换成utf-8的16进制
            address = URLEncoder.encode(address, "UTF-8");
            URL tirc = new URL("http://api.map.baidu.com/geocoder?address="+ address +"&output=json&key="+ KEY_1);//API
 
 
            in = new BufferedReader(new InputStreamReader(tirc.openStream(),"UTF-8"));
            String res;
            StringBuilder sb = new StringBuilder("");
            while((res = in.readLine())!=null){
                sb.append(res.trim());
            }
            String str = sb.toString();
            
            if(StringUtils.isNotEmpty(str))
            {
            	//先用lngStart来存储经度数字开始的那个下标
            	//用lngEnd来存储纬度数字开始的那个下标
                int lngStart = str.indexOf("lng\":");
                int lngEnd = str.indexOf(",\"lat");
                int latStart=lngEnd+7;//经度共有7位（含有小数）
                int latEnd = str.indexOf("},\"precise");
                if(lngStart > 0 && lngEnd > 0 && latEnd > 0)
                {
                    String lng = str.substring(lngStart+5,lngEnd);
                    String lat = str.substring(latStart, latEnd);
                    
                    map = new HashMap<String,String>();
                    
                    map.put("lat", lat);
                    map.put("lng", lng);
                    return map;
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
        }
	static public double getDistance(Double longitude1, Double latitude1, Double longitude2, Double latitude2) {
		/*C = sin(MLatA)*sin(MLatB)*cos(MLonA-MLonB) + cos(MLatA)*cos(MLatB)
         Distance = R*Arccos(C)*Pi/180
		 * */
		Double c=Math.sin(latitude1)*Math.sin(latitude2)*Math.cos(longitude1-longitude2)+Math.cos(latitude1)*Math.cos(latitude2);
		Double distance=6371.004*Math.acos(c)*Math.PI/180;	
		return distance;	
	}
	public static void main(String args[])
	{
		setSchoolName("广东广雅中学");
		System.out.println(getSchoolLong());
		System.out.println(getSchoolLat());
		setSchoolName("韶关市政府");
		System.out.println(getSchoolLong());
		System.out.println(getSchoolLat());
		System.out.println(getDistance(125.59090682,35.69443907653395,113.24,23.14));
	}
            
}
