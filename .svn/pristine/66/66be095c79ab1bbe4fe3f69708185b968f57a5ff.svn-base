package DBConnect;
import java.sql.Connection;
import java.sql.DriverManager;


public class DBConnect {
public DBConnect() {}
	
	//getConnection 메소드를 만들고 반환값은 connection타입은 con
	public Connection getConnection() {
		String url = "jdbc:oracle:thin:@192.168.0.224:1521:XE";
		String id = "system";
		String pass = "sh73014254";
		
		Connection con = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url,id,pass);
		}catch(Exception e) {
			System.out.println(e);
		}
		return con;
	}


}
